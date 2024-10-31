variable "tls-name" {
  description = "Certificate/Secret Name"
  type        = string
}

variable "server-url" {
  description = "Server URL"
  type        = string
}

variable "tls-certificate-cluster-issuer" {
  description = "Generate TLS Certificate (Use Cluster Issuer)"
  type        = bool
  default     = false
}

variable "selfsigned-cluster-issuer" {
  description = "Selfsigned Cluster Issuer"
  type        = string
  default     = null

  validation {
    condition     = !(var.tls-certificate-cluster-issuer && var.selfsigned-cluster-issuer == null)
    error_message = "selfsigned-cluster-issuer must not be null when tls-certificate-cluster-issuer is true."
  }
}

variable "tls-certificate-files" {
  description = "Generate TLS Certificate (Use Files)"
  type        = bool
  default     = false
}

variable "tls-crt" {
  description = "Crt Base64 Encoded"
  type        = string
  default     = null

  validation {
    condition     = !(var.tls-certificate-files && var.tls-crt == null)
    error_message = "tls-crt must not be null when tls-certificate-files is true."
  }
}

variable "tls-key" {
  description = "Key Base64 Encoded"
  type        = string
  sensitive   = true
  default     = null

  validation {
    condition     = !(var.tls-certificate-files && var.tls-key == null)
    error_message = "tls-key must not be null when tls-certificate-files is true."
  }
}

variable "istio-ingress-gateway-namespace" {
  description = "Istio Ingress Gateway namespace"
  type        = string
  default     = "istio-ingress"
}

variable "istio-ingress-gateway-name" {
  description = "Istio Ingress Gateway Name"
  type        = string
  default     = "gateway"
}

variable "server-svc-name" {
  description = "Server Service Name"
  type        = string
}

variable "server-svc-namemespace" {
  description = "Server Service Namemespace"
  type        = string
}

variable "destination-port" {
  description = "Destination Port"
  type        = number
}
