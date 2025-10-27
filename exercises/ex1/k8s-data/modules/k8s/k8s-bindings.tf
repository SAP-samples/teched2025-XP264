# look up cis service binding by name
#
data "btp_subaccount_service_binding" "cis-local-binding" {
  subaccount_id = data.btp_subaccount.context.id
  name          = "cis-local-binding"
}


locals {
  cis-secret = jsondecode(data.btp_subaccount_service_binding.cis-local-binding.credentials)
}

resource "local_sensitive_file" "cis-secret" {
  content = jsonencode({
    clientid     = local.cis-secret.uaa.clientid
    clientsecret = local.cis-secret.uaa.clientsecret  
    url          = "${local.cis-secret.uaa.url}/oauth/token"
  })
  filename = "cis-secret.json"
}

output "cis-credentials" {
   value = nonsensitive(local.cis-secret)  
}

data "http" "cis_service_token" {
  url = "${local.cis-secret.uaa.url}/oauth/token"
  method = "POST"
  request_headers = {
    Content-Type  = "application/x-www-form-urlencoded"
  }  
  request_body = "grant_type=client_credentials&client_id=${local.cis-secret.uaa.clientid}&client_secret=${local.cis-secret.uaa.clientsecret}&response_type=token"

  depends_on = [ data.btp_subaccount_service_binding.cis-local-binding ] 
}

output "cis_service_token" {
  value = jsondecode(data.http.cis_service_token.response_body)
}

locals {
  cis_access_token = jsondecode(data.http.cis_service_token.response_body).access_token
}

data "http" "kymaruntime_environment" {
  depends_on = [ 
       data.http.cis_service_token
  ]

  url = "${local.cis-secret.endpoints.provisioning_service_url}/provisioning/v1/environments"
  method = "GET"
  request_headers = {
    Authorization = "Bearer ${local.cis_access_token}"
    Content-Type  = "application/json"
  }   
}


output "kymaruntime_environment" {
  depends_on = [data.http.kymaruntime_environment]
  
  value = jsondecode(data.http.kymaruntime_environment.response_body)
}

data "jq_query" "kymaruntime_environment" {
   depends_on = [data.http.kymaruntime_environment]

   data = data.http.kymaruntime_environment.response_body
   query = ".environmentInstances[] | select(.serviceName == \"kymaruntime\") | .id"
}

locals {
  kymaruntime_environment_id = try(jsondecode(data.jq_query.kymaruntime_environment.result), "B1111111-1111-4AF3-9CA2-111111111111")
}


output "kymaruntime_environment_id" {
  value = local.kymaruntime_environment_id
}


data "http" "kymaruntime_bindings" {
  count    = length(var.kymaruntime_bindings[*])

  provider = http-full

  url = "${local.cis-secret.endpoints.provisioning_service_url}/provisioning/v1/environments/${local.kymaruntime_environment_id}/bindings"
  method = "PUT"
  request_headers = {
    Authorization = "Bearer ${local.cis_access_token}"
    Accept        = "application/json"
    content-type  = "application/json"
  } 

  request_body = jsonencode({
    "parameters": {
      "expiration_seconds": 900 //7200
    } 
  })  


  lifecycle {
    postcondition {
      condition     = contains([202], self.status_code)
      error_message = self.response_body // "operation failed"
    }
  }

  depends_on = [
       data.jq_query.kymaruntime_environment
  ]
}

# https://github.com/hashicorp/terraform-provider-http/pull/114#issuecomment-1144999897
#
resource "terraform_data" "kymaruntime_bindings" {
  count    = length(var.kymaruntime_bindings[*])

  depends_on = [ data.http.kymaruntime_bindings ]

  triggers_replace = {
    always_run = "${timestamp()}"
  }

  input = one(data.http.kymaruntime_bindings[*].response_body)

  lifecycle {
    precondition {
      condition     = contains([202], one(data.http.kymaruntime_bindings[*].status_code) )
      error_message = one(data.http.kymaruntime_bindings[*].response_body)
    }
  }
}


# https://stackoverflow.com/questions/70848503/is-it-possible-to-recover-from-an-error-returned-by-a-data-source
#
locals {
  //kymaruntime_bindings = one(data.http.kymaruntime_bindings[*].response_body)
  kymaruntime_bindings = try(one(terraform_data.kymaruntime_bindings[*].output), null)
}

output "kymaruntime_bindings" {
  
  value = local.kymaruntime_bindings != null ? jsondecode(local.kymaruntime_bindings) : {}
}

output "kymaruntime_kubeconfig" {
  
  value = local.kymaruntime_bindings != null ? jsondecode(local.kymaruntime_bindings).credentials.kubeconfig : ""
}