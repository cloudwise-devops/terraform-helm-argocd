output "argocd_kubernetes_namespace" {
  value = kubernetes_namespace.argocd.metadata.0.name
}

output "argocd_gcp_iam_service_account_email" {
  value = module.my-app-workload-identity[0].gcp_service_account_email
}

output "argocd_gcp_iam_service_account_name" {
  value = module.my-app-workload-identity[0].gcp_service_account_name
}

output "service_acc_name" {
  value = local.enable_workload_identity ? module.my-app-workload-identity[0].k8s_service_account_name : var.service_acc_name
}