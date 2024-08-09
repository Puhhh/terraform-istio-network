# Module Description:

* Certificate or Secret is created depending on the configuration. 
* Istio Virtual Service is created.
* Changes are made to Istio Gateway.

# How to use

```
module "istio-network" {
  source = "../terraform-istio-network"

  tls-name                        = "demo-app"
  server-url                      = "demo-app.kubernetes.local"
  tls-certificate-cluster-issuer  = true
  selfsigned-cluster-issuer       = "selfsigned-cluster-issuer"
  istio-ingress-gateway-namespace = "istio-ingress"
  istio-ingress-gateway-name      = "gateway"
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
  istio-ingress-gateway-namespace = "istio-ingress"
  istio-ingress-gateway-name      = "gateway"
  server-svc-name                 = "demo-app-svc"
  server-svc-namemespace          = "demo-app"
  destination-port                = 80
}
```