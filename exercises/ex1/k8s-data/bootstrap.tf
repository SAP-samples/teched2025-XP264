// k8s_context driven by an auto-generated GHA workflow
//
module "k8s_context" {
//  source    = "github.com/quovadis-btp/btp-automation/btp-context/runtime-context/modules/kyma-runtime/gha"
  source    = "./modules/k8s"

  BTP_SUBACCOUNT        = var.BTP_SUBACCOUNT
  POSTGRES_ALLOW_ACCESS = var.POSTGRES_ALLOW_ACCESS
  kymaruntime_bindings  = var.kymaruntime_bindings  
  runtime_context_workspace = var.runtime_context_workspace

}