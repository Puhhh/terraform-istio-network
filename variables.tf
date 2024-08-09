variable "tls-name" {
  description = "Certificate/Secret Name"
  type        = string
  default     = null
}

variable "server-url" {
  description = "Server URL"
  type        = string
  default     = null
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
}

variable "tls-key" {
  description = "Key Base64 Encoded"
  type        = string
  default     = null
}

variable "istio-ingress-gateway-namespace" {
  description = "Istio Ingress Gateway namespace"
  type        = string
  default     = null
}

variable "istio-ingress-gateway-name" {
  description = "Istio Ingress Gateway Name"
  type        = string
  default     = null
}

variable "server-svc-name" {
  description = "Server Service Name"
  type        = string
  default     = null
}

variable "server-svc-namemespace" {
  description = "Server Service Namemespace"
  type        = string
  default     = null
}

variable "destination-port" {
  description = "Destination Port"
  type        = number
  default     = null
}
