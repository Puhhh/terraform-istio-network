## Module Description:

* Cert Manager or Native Secret is used depending on the configuration. 
* Istio Virtual Service is created.
* Changes are made to Istio Gateway.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.0 |
| <a name="provider_null"></a> [null](#provider\_null) | >= 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.tls-certificate-cluster-issuer](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.tls-certificate-files](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.virtualservice](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [null_resource.patch_gateway](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination-port"></a> [destination-port](#input\_destination-port) | Destination Port | `number` | n/a | yes |
| <a name="input_istio-ingress-gateway-name"></a> [istio-ingress-gateway-name](#input\_istio-ingress-gateway-name) | Istio Ingress Gateway Name | `string` | `"gateway"` | no |
| <a name="input_istio-ingress-gateway-namespace"></a> [istio-ingress-gateway-namespace](#input\_istio-ingress-gateway-namespace) | Istio Ingress Gateway namespace | `string` | `"istio-ingress"` | no |
| <a name="input_selfsigned-cluster-issuer"></a> [selfsigned-cluster-issuer](#input\_selfsigned-cluster-issuer) | Selfsigned Cluster Issuer | `string` | `null` | no |
| <a name="input_server-svc-name"></a> [server-svc-name](#input\_server-svc-name) | Server Service Name | `string` | n/a | yes |
| <a name="input_server-svc-namemespace"></a> [server-svc-namemespace](#input\_server-svc-namemespace) | Server Service Namemespace | `string` | n/a | yes |
| <a name="input_server-url"></a> [server-url](#input\_server-url) | Server URL | `string` | n/a | yes |
| <a name="input_tls-certificate-cluster-issuer"></a> [tls-certificate-cluster-issuer](#input\_tls-certificate-cluster-issuer) | Generate TLS Certificate (Use Cluster Issuer) | `bool` | `false` | no |
| <a name="input_tls-certificate-files"></a> [tls-certificate-files](#input\_tls-certificate-files) | Generate TLS Certificate (Use Files) | `bool` | `false` | no |
| <a name="input_tls-crt"></a> [tls-crt](#input\_tls-crt) | Crt Base64 Encoded | `string` | `null` | no |
| <a name="input_tls-key"></a> [tls-key](#input\_tls-key) | Key Base64 Encoded | `string` | `null` | no |
| <a name="input_tls-name"></a> [tls-name](#input\_tls-name) | Certificate/Secret Name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## How to use

```
module "istio-network" {
  source = "../terraform-istio-network"

  tls-name                        = "demo-app"
  server-url                      = "demo-app.kubernetes.local"
  tls-certificate-cluster-issuer  = true
  selfsigned-cluster-issuer       = "selfsigned-cluster-issuer"
  server-svc-name                 = "demo-app-svc"
  server-svc-namemespace          = "demo-app"
  destination-port                = 80
}
```
```
module "istio-network" {
  source = "../terraform-istio-network"

  tls-name                        = "demo-app"
  server-url                      = "demo-app.kubernetes.local"
  tls-certificate-files           = true
  tls-crt                         = "aksdlksad...dkjsa"
  tls-key                         = "daskjdasj...sdjas"
  server-svc-name                 = "demo-app-svc"
  server-svc-namemespace          = "demo-app"
  destination-port                = 80
}
```