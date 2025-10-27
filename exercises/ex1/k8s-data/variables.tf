# we're using uppercase variable names, since in some cases (e.g Azure DevOps) the system variables are forced to be uppercase
# TF allows providing variable values as env variables of name name, case sensitive

variable "BTP_GLOBAL_ACCOUNT" {
  type        = string
  description = "Global account name"
}

variable "BTP_BACKEND_URL" {
  type        = string
  description = "BTP CLI backend URL - defaults to live/trial BTP landscapes"
  default     = "https://cli.btp.cloud.sap"
}

variable "BTP_SUBACCOUNT" {
  type        = string
  description = "Subaccount 's runtime context prefix"
}

variable "BTP_CUSTOM_IDP" {
  type        = string
  description = "Platform Custom IAS tenant fully qualified host name"
}

variable "POSTGRES_ALLOW_ACCESS" {
  type        = string
  description = "allow_access IPs and/ir CI/DRs + cluster egress ips"
  default     = "" // defaults to no allow access
}

variable  "runtime_context_workspace" {
  // export TF_VAR_runtime_context_workspace=${{ env.RUNTIME_CONTEXT_WORKSPACE }}
  description = "runtime_context_workspace which maybe different from k8s_context_workspace"
  type        = string  
}

variable "kymaruntime_bindings" {
  type    = string
  default = null //"kymaruntime_bindings" // if null then this variable is optional
}