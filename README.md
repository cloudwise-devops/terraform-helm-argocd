<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.44.1 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.15.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.32.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_my-app-workload-identity"></a> [my-app-workload-identity](#module\_my-app-workload-identity) | terraform-google-modules/kubernetes-engine/google//modules/workload-identity | 30.2.0 |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.storage_access_for_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argo_cd_chart_version"></a> [argo\_cd\_chart\_version](#input\_argo\_cd\_chart\_version) | https://artifacthub.io/packages/helm/argo/argo-cd | `string` | `"7.6.5"` | no |
| <a name="input_argo_cd_domain_name"></a> [argo\_cd\_domain\_name](#input\_argo\_cd\_domain\_name) | n/a | `string` | `"example.com"` | no |
| <a name="input_argo_cd_namespace_name"></a> [argo\_cd\_namespace\_name](#input\_argo\_cd\_namespace\_name) | n/a | `string` | `"argocd"` | no |
| <a name="input_argo_cd_subdomain_name"></a> [argo\_cd\_subdomain\_name](#input\_argo\_cd\_subdomain\_name) | n/a | `string` | `"sub"` | no |
| <a name="input_argocd_ip_whitelist"></a> [argocd\_ip\_whitelist](#input\_argocd\_ip\_whitelist) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `"dev"` | no |
| <a name="input_gce_project"></a> [gce\_project](#input\_gce\_project) | n/a | `string` | `"<your-project>"` | no |
| <a name="input_gce_zone"></a> [gce\_zone](#input\_gce\_zone) | n/a | `string` | `"<your-zone>"` | no |
| <a name="input_github_key"></a> [github\_key](#input\_github\_key) | GitHub key for accessing the repository | `string` | `null` | no |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | Name of your organization as shown in the GitHub URL path | `string` | `"example-org"` | no |
| <a name="input_github_secret"></a> [github\_secret](#input\_github\_secret) | GitHub secret for accessing the repository | `string` | `null` | no |
| <a name="input_gke_cluster_name"></a> [gke\_cluster\_name](#input\_gke\_cluster\_name) | n/a | `string` | `"<your-cluster-name>"` | no |
| <a name="input_google_credentials"></a> [google\_credentials](#input\_google\_credentials) | n/a | `string` | `"/tmp/gcloud_credentials.json"` | no |
| <a name="input_google_region"></a> [google\_region](#input\_google\_region) | n/a | `string` | `"<your-region>"` | no |
| <a name="input_lets_encrypt_issuer_name"></a> [lets\_encrypt\_issuer\_name](#input\_lets\_encrypt\_issuer\_name) | n/a | `string` | `"<your-issuer>"` | no |
| <a name="input_nginx_ingress_class_name"></a> [nginx\_ingress\_class\_name](#input\_nginx\_ingress\_class\_name) | n/a | `string` | `"nginx"` | no |
| <a name="input_storage_project"></a> [storage\_project](#input\_storage\_project) | n/a | `string` | `"<your-storage-project>"` | no |
| <a name="input_web_terminal"></a> [web\_terminal](#input\_web\_terminal) | Whether to enable web terminal on ArgoCD console | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->