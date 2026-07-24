

variable "name" {
  description = "The name of the service/ingress"
  type        = string
  default     = "velero-ui"
}

variable "namespace" {
  description = "Namespace where the ingress and service are deployed"
  type        = string
  default     = "velero-ui"
}

variable "host" {
  description = "Hostname for ingress"
  type        = string
  default     = "migration.appflex.io"
}

variable "service_port" {
  description = "Port of the backend service"
  type        = number
  default     = "3000"
}
