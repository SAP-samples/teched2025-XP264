variable "BTP_SUBACCOUNT" {
  type        = string
  description = "Subaccount name"
}

variable "POSTGRES_ALLOW_ACCESS" {
  type        = string
  description = "allow_access IPs and/ir CI/DRs + cluster egress ips, must be defined in the root module"
  //default     = "" // defaults to no allow access
}

variable  "runtime_context_workspace" {
  description = "runtime_context_workspace"
  type        = string
}

variable "kymaruntime_bindings" {
  type    = string
  description = "kymaruntime_bindings: if null then this variable is optional"
}