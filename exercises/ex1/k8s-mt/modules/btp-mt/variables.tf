variable "BTP_SUBACCOUNT" {
  type        = string
  description = "consumer tenant (subaccount) name prefix"
}

variable "BTP_SA_REGION" {
  type        = string
  description = "consumer tenant (subaccount) region. Must the same as the provider's region"
}

variable "BTP_CUSTOM_IDP" {
  type        = string
  description = "Platform Custom IAS tenant fully qualified host name (w/o the schema)"
}

variable "admin_groups" {
  type        = list(string)
  description = "Defines the platform IDP groups to be added to each subaccount as administrators."
}

variable "TECHED_MT_SUBSCRIPTION" {
  type        = string
  description = "TECHED_MT_SUBSCRIPTION"
  //default     = null
}


variable "subaccount_id" {
  type        = string
  description = "subaccount_id"
}