
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