
resource "kubernetes_namespace" "migration" {
  metadata {
    name = "migration"
    labels = {
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }

  lifecycle {
    prevent_destroy = false
    ignore_changes = all
  }
}

resource "kubernetes_namespace" "velero" {
  depends_on = [
    kubernetes_namespace.migration
  ]
  metadata {
    name = "velero"
    labels = {
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }

  lifecycle {
    prevent_destroy = false
    ignore_changes = all
  }
}

resource "kubernetes_secret" "velero_cloud_credentials" {
  depends_on = [
    kubernetes_namespace.velero
  ]
  metadata {
    name      = "cloud-credentials"
    namespace = "velero"
  }

  data = {
    cloud = <<-EOF
[default]
aws_access_key_id=${var.aws_access_key_id}
aws_secret_access_key=${var.aws_secret_access_key}
EOF
  }

  type = "Opaque"
}
