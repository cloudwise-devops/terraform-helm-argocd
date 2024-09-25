
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.argo_cd_namespace_name
    labels = {
      "name"                         = var.argo_cd_namespace_name
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }
}

resource "helm_release" "argocd" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argo_cd_chart_version
  namespace  = kubernetes_namespace.argocd.metadata.0.name
  values = [
    templatefile("${path.module}/templates/argocd.yaml.tpl",
      {
        ingress_class         = var.nginx_ingress_class_name
        lets_encrypt_issuer   = var.lets_encrypt_issuer_name
        domain                = var.argo_cd_domain_name
        subdomain             = var.argo_cd_subdomain_name
        allowed_ip_to_connect = var.argocd_ip_whitelist
        service_acc_name      = module.my-app-workload-identity.k8s_service_account_name
        samlOrgSecret         = var.github_secret
        samlOrgClientId       = var.github_key
        github_org            = var.github_org
      }
    )
  ]
  set {
    name  = "global.image.tag"
    value = var.argo_cd_image_global_version
  }
}

resource "google_project_iam_member" "storage_access_for_sa" {
  project = var.storage_project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${module.my-app-workload-identity.gcp_service_account_email}"
}

module "my-app-workload-identity" {
  source                          = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  version                         = "30.2.0"
  use_existing_gcp_sa             = false
  name                            = "${var.argo_cd_namespace_name}-${var.env}"
  project_id                      = var.gce_project
  use_existing_k8s_sa             = false
  namespace                       = kubernetes_namespace.argocd.metadata.0.name
  automount_service_account_token = true
}