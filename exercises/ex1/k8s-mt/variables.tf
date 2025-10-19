# we're using uppercase variable names, since in some cases (e.g Azure DevOps) the system variables are forced to be uppercase
# TF allows providing variable values as env variables of name name, case sensitive

variable "BTP_GLOBAL_ACCOUNT" {
  type        = string
  description = "Global account subdomain id"
}

variable "BTP_BACKEND_URL" {
  type        = string
  description = "BTP CLI backend URL - defaults to live/trial BTP landscapes"
  default     = "https://cli.btp.cloud.sap"
}

variable "BTP_SUBACCOUNT" {
  type        = string
  description = "Consumer subaccount prefix"
}

variable "BTP_SA_REGION" {
  type        = string
  description = "consumer tenant (subaccount) region. Must the same as the provider's region"
  default     = "eu20"
}

variable "BTP_CUSTOM_IDP" {
  type        = string
  description = "Platform Custom IAS tenant fully qualified host name"
}


variable "admin_groups" {
  type        = list(string)
  description = "Defines the platform IDP groups to be added to each subaccount as administrators."
  default     = ["GitHub", "XP264_INST","XP264","CLS_admin"]
}

variable "TECHED_MT_SUBSCRIPTION" {
  type        = string
  description = "TECHED_MT_SUBSCRIPTION: set it to any value if you need to create a new subscription"
  default     = "TECHED_MT_SUBSCRIPTION"  //null
}


variable "subaccount_id" {
  type        = string
  description = "subaccount_id"
  default     = "" // create a new subaccount
}