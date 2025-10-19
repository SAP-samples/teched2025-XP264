/* discovery logic -- not required

data "btp_globalaccount" "this" {}
data "btp_subaccounts" "all" {}

# look up all available subaccounts of a global acount that have a specific label attached
#
locals {
  label_value_string = "${var.BTP_SUBACCOUNT}-context"
  labels_filter      = "${var.BTP_SUBACCOUNT}-context=${local.label_value_string}"

}
data "btp_subaccounts" "filtered" {
  labels_filter = local.labels_filter
}

output "btp_subaccounts_filtered" {
  value = data.btp_subaccounts.filtered.values 
}

data "btp_subaccount" "context" {

  id = data.btp_subaccounts.filtered.values[0].id
}

*/

//
resource "random_id" "context_id" {
  byte_length = 4
  prefix      = "teched-"
}

locals {
  context_id        = random_id.context_id.hex
  subaccount_domain = lower("${var.BTP_SUBACCOUNT}-mt-${local.context_id}")
  subaccount_name   = lower("${var.BTP_SUBACCOUNT}-mt-${local.context_id}")
  region            = lower("${var.BTP_SA_REGION}")
}

resource "btp_subaccount" "create_subaccount" {

  name        = local.subaccount_name
  subdomain   = local.subaccount_domain
  region      = local.region
  //usage       = "USED_FOR_PRODUCTION"
  description = "${local.subaccount_name} is a consumer tenant subaccount"
  labels      = {
      "${var.BTP_SUBACCOUNT}"         = ["${var.BTP_SA_REGION}", "${var.BTP_CUSTOM_IDP}"],
      "${var.BTP_SUBACCOUNT}-trust"   = ["${var.BTP_CUSTOM_IDP}"],
      "${var.BTP_SUBACCOUNT}-region"  = ["${var.BTP_SA_REGION}"],
      "${var.BTP_SUBACCOUNT}-domain"  = ["${local.subaccount_domain}"],
      "${var.BTP_SUBACCOUNT}-context" = ["${local.context_id}"]          
  } 
}

data "btp_subaccount" "context" {
  id = btp_subaccount.create_subaccount.id
}

output "btp_subaccount_labels" {
  value = jsonencode(data.btp_subaccount.context.labels)
}


# check for all the trust origins on a subaccount level: default (ids), custom and platform
#
data "btp_subaccount_trust_configurations" "all" {
  subaccount_id = data.btp_subaccount.context.id
}

output "btp_subaccount_trust_configurations_all" {
  value = data.btp_subaccount_trust_configurations.all.values
}

/*
> module.runtime_context.all_trust_origins
[
  "anuk8cmfw-platform",
  "sap.custom",
  "sap.default",
]
*/
output "all_trust_origins" {
  value = [ for trust in data.btp_subaccount_trust_configurations.all.values: trust.origin ]
}

locals {
  platform_trust_origin = [ for trust in data.btp_subaccount_trust_configurations.all.values: trust.origin if trust.type == "Platform" ]
}

output "platform_trust_origins" {
  value = local.platform_trust_origin
}


resource "btp_subaccount_role_collection_assignment" "subaccount_platform_idp_groups" {

  depends_on           = [btp_subaccount_trust_configuration.custom_idp]

//  for_each             = length(local.platform_trust_origin) != 0 ? toset( "${var.admin_groups}" ) : toset([])
  for_each             = toset( "${var.admin_groups}" )
  subaccount_id        = data.btp_subaccount.context.id
  role_collection_name = "Subaccount Administrator"
  group_name           = each.value
  origin               = length(local.platform_trust_origin) != 0 ? local.platform_trust_origin[0] : "anuk8cmfw-platform"
}


# Assign users to Role Collection: subaccount emergency_admin (with sap.custom)
#
resource "btp_subaccount_role_collection_assignment" "subaccount_custom_idp_groups" {
  depends_on           = [btp_subaccount_subscription.faas-xp264-mt]

  for_each             = length(var.TECHED_MT_SUBSCRIPTION[*]) != 0 ? toset( "${var.admin_groups}" ) : toset([])
  subaccount_id        = data.btp_subaccount.context.id
  role_collection_name = "faas-xp264-049_hc-faas"
  group_name            = each.value
  origin               = btp_subaccount_trust_configuration.custom_idp.origin
}



locals {
  custom_domain     = var.BTP_CUSTOM_IDP
  identity_provider = local.custom_domain
}

resource "btp_subaccount_trust_configuration" "custom_idp" {

  subaccount_id     = data.btp_subaccount.context.id
  identity_provider = local.identity_provider
  name              = "${local.subaccount_domain}"
  domain            = local.custom_domain

  depends_on        = [btp_subaccount.create_subaccount]

}

# custom identity provider
#
data "btp_subaccount_trust_configuration" "custom_idp" {
  depends_on    = [btp_subaccount_trust_configuration.custom_idp]

  subaccount_id = data.btp_subaccount.context.id
  origin        = btp_subaccount_trust_configuration.custom_idp.origin
}



# look up services offerings available on sapbtp environment in a given subaccount
data "btp_subaccount_service_offerings" "sapbtp" {
  subaccount_id = data.btp_subaccount.context.id
  environment   = "sapbtp"
}


output "sapbtp" {
  value = data.btp_subaccount_service_offerings.sapbtp.values
}


resource "time_sleep" "subscription_propagation" {
  count = length(var.TECHED_MT_SUBSCRIPTION[*]) != 0 ? 1 : 0

  create_duration = "60s"

  triggers = {
    # This sets up a proper dependency on the faas-app-xp264-049-saas subscription association
    
    //subscription = [ for service in data.btp_subaccount_service_offerings.sapbtp.values: service.catalog_name if service.catalog_name == "faas-app-xp264-049-saas" ][0]

    subscription = "faas-app-xp264-049-saas"

  }
}


resource "btp_subaccount_subscription" "faas-xp264-mt" {
  count = length(var.TECHED_MT_SUBSCRIPTION[*]) != 0 ? 1 : 0

  depends_on    = [btp_subaccount_trust_configuration.custom_idp]

  subaccount_id = data.btp_subaccount.context.id
  app_name      = one(time_sleep.subscription_propagation[*].triggers["subscription"]) // "faas-app-xp264-049-saas"
  plan_name     = "default"
  //parameters    = jsonencode({})
  timeouts = {
    create = "25m"
    delete = "15m"
  }  
}


