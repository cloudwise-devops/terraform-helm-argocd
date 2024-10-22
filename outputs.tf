output "argocd_kubernetes_namespace" {
  value = kubernetes_namespace.argocd.metadata.0.name
}

output "argocd_gcp_iam_service_account_email" {
  value = module.my-app-workload-identity.gcp_service_account_email
}

output "argocd_gcp_iam_service_account_name" {
  value = module.my-app-workload-identity.gcp_service_account_name
}