//
module "mt_context" {
  source         = "./modules/btp-mt"

  BTP_SUBACCOUNT = var.BTP_SUBACCOUNT
  BTP_CUSTOM_IDP = var.BTP_CUSTOM_IDP
  BTP_SA_REGION  = var.BTP_SA_REGION
  admin_groups   = var.admin_groups
  subaccount_id  = var.subaccount_id

  TECHED_MT_SUBSCRIPTION = var.TECHED_MT_SUBSCRIPTION
}