terraform {
  required_version = ">= 1.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.0"
    }
  }
}

provider "kubernetes" {
  config_path    = var.kubeconfig-path
  config_context = var.kube-context
}

provider "helm" {
  kubernetes {
    config_path    = var.kubeconfig-path
    config_context = var.kube-context
  }
}
