
variable "kubeconfig_path" {
  type        = string
  description = "Path to kubeconfig for the target cluster"
  default     = "~/.kube/config"
}

variable "charts_path" {
  default     = "./charts"
  description = "The charts full path"
}

variable "namespace" {
  type        = string
  default     = "weaviate"
  description = "Kubernetes namespace where Weaviate is deployed"
}

variable "api_keys" {
  type        = list(string)
  default     = ["dev-key-123"]
  description = "List of API keys for Weaviate authentication"
}
