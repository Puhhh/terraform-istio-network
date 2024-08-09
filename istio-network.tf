resource "kubernetes_manifest" "tls-certificate-cluster-issuer" {
  count = var.tls-certificate-cluster-issuer == true ? 1 : 0

  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Certificate"
    "metadata" = {
      "name"      = "${var.tls-name}-tls"
      "namespace" = var.istio-ingress-gateway-namespace
    }
    "spec" = {
      "commonName" = var.server-url
      "dnsNames" = [
        var.server-url,
      ]
      "issuerRef" = {
        "kind" = "ClusterIssuer"
        "name" = var.selfsigned-cluster-issuer
      }
      "secretName" = "${var.tls-name}-tls"
    }
  }
}

resource "kubernetes_manifest" "tls-certificate-files" {
  count = var.tls-certificate-files == true ? 1 : 0

  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Secret"
    "metadata" = {
      "name"      = "${var.tls-name}-tls"
      "namespace" = var.istio-ingress-gateway-namespace
    }
    "type" = "kubernetes.io/tls"
    "data" = {
      "tls.crt" = var.tls-crt
      "tls.key" = var.tls-key
    }
  }
}

resource "kubernetes_manifest" "virtualservice" {

  manifest = {
    "apiVersion" = "networking.istio.io/v1"
    "kind"       = "VirtualService"
    "metadata" = {
      "name"      = var.server-svc-name
      "namespace" = var.server-svc-namemespace
    }
    "spec" = {
      "gateways" = [
        "${var.istio-ingress-gateway-namespace}/${var.istio-ingress-gateway-name}",
      ]
      "hosts" = [
        var.server-url,
      ]
      "http" = [
        {
          "match" = [
            {
              "uri" = {
                "prefix" = "/"
              }
            },
          ]
          "route" = [
            {
              "destination" = {
                "host" = "${var.server-svc-name}.${var.server-svc-namemespace}.svc.cluster.local"
                "port" = {
                  "number" = var.destination-port
                }
              }
            },
          ]
        },
      ]
    }
  }
}

locals {
  patch_command = <<-EOT
  kubectl patch gateways.networking.istio.io ${var.istio-ingress-gateway-name} -n ${var.istio-ingress-gateway-namespace} --type='json' -p='[{"op": "add", "path": "/spec/servers/-", "value": {
    "hosts": ["${var.server-url}"], 
    "port": {
      "name": "${var.tls-name}", 
      "number": 443, 
      "protocol": "HTTPS"
    }, 
    "tls": {
      "credentialName": "${var.tls-name}-tls", 
      "mode": "SIMPLE"
    }
    }}]'
  EOT
}

resource "null_resource" "patch_gateway" {
  provisioner "local-exec" {
    command = local.patch_command
  }
}
