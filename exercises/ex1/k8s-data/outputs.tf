
locals {
  k8s_nodes            = module.k8s_context.k8s_nodes
  k8s_zones            = module.k8s_context.k8s_zones
  KymaModules          = module.k8s_context.KymaModules
  sap-btp-operator-cfg = module.k8s_context.sap-btp-operator-config
  cluster_id           = module.k8s_context.cluster_id

  shoot_info           = module.k8s_context.shoot_info
  Ingress_LoadBalancer = module.k8s_context.Ingress_LoadBalancer

  // https://discuss.hashicorp.com/t/extracting-variables-from-workspace-name-in-tfc/55952/4
  //
  workspace_name       = "${terraform.workspace}"
}
  
output "quovadis-btp" {
  description = "quovadis-btp sa secret"
  sensitive   = true
  value       = module.k8s_context.quovadis-btp
}  

/* this requires a resource to be applied....
output "allow_access" {
  value = module.k8s_context.egress_ips
}
*/
 
output "all_k8s" {
  description = "all_k8s_context outputs"
  sensitive = true
  value = { for k, v in module.k8s_context : k => v }
  
}

output "default-sa" {
  description = "default-sa secret"
  sensitive   = true
  value       = module.k8s_context.default-sa
}  

output "kubeconfig-sa" {
  description = "kubeconfig-sa for the default-sa"
  sensitive   = true
  value       = module.k8s_context.kubeconfig-sa
}  


output "k8s_nodes" {
  sensitive = true
  value = local.k8s_nodes
}

output "k8s_zones" {
  value = local.k8s_zones
}

output "cluster_id" {
  value = local.cluster_id
}


output "KymaModules" {
  value = local.KymaModules
}


output "sap-btp-operator-cfg" {
  value = local.sap-btp-operator-cfg
}

output "shoot_info" {
  value = local.shoot_info
}

output "Ingress_LoadBalancer" {
  value = local.Ingress_LoadBalancer
}


# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/all_namespaces
#
data "kubernetes_all_namespaces" "allns" {
}

output "cluster-ns" {
  value = data.kubernetes_all_namespaces.allns.namespaces
}

output "ns-present" {
  value = contains(data.kubernetes_all_namespaces.allns.namespaces, "kube-system")
}

output "kyma_provisioning_info" {
  description = "kyma_provisioning_info"
  sensitive   = true
  value       =  module.k8s_context.kyma_provisioning_info
}

output "all_certificates" {
  value = module.k8s_context.all_certificates
}

output "all_gateways" {
  value = module.k8s_context.all_gateways
}

output "all_dnsentries" {
  value = module.k8s_context.all_dnsentries
}

output "all_dnsproviders" {
  value = module.k8s_context.all_dnsproviders
}
output "OpenIDConnect" {
  value = module.k8s_context.OpenIDConnect
}


############## btp outputs ################################

output "kyma_dashboard_url" {
  value = module.k8s_context.kyma_dashboard_url
}

output "kyma_dashboard_url_qrcode" {
  description = "binary qrcode image format"
  sensitive = true
  value = module.k8s_context.kyma_dashboard_url_qrcode
}

output "kyma_dashboard_url_qrcode_png" {
  value = "terraform output -raw kyma_dashboard_url_qrcode | base64 -d > kyma_dashboard_url_qrcode.png"
}


output "kyma_labels" {
  value = module.k8s_context.kyma_labels
}

output "kyma_labels_qrcode" {
  description = "binary qrcode image format"
  sensitive = true
  value = module.k8s_context.kyma_labels_qrcode
}

output "kyma_labels_qrcode_png" {
  value = "terraform output -raw kyma_labels_qrcode | base64 -d > kyma_labels_qrcode.png"
}


/*
output "kyma_dashboard_url_ascii_qrcode" {
  value = module.k8s_context.kyma_dashboard_url_ascii_qrcode
}

output "kyma_labels_ascii_qrcode" {
  description = "ascii qrcode format"
  sensitive = true
  value = module.k8s_context.kyma_labels_ascii_qrcode
}
output "kyma_parameters_ascii_qrcode" {
  sensitive = true
  value = module.k8s_context.kyma_parameters_ascii_qrcode
}
*/

output "kyma_parameters" {
  //sensitive = true
  value = module.k8s_context.kyma_parameters
}

output "kyma_serviceaccount" {
  description = "kyma_serviceaccount: requires kubectl-view_serviceaccount_kubeconfig plugin"
  value = "kubectl-view_serviceaccount_kubeconfig  default -n quovadis-btp"
}

output "kyma_resource-capacity" {
  description = "kyma_resource-capacity: requires resource-capacity kubectl plugin"
  value = "kubectl resource-capacity"
}
