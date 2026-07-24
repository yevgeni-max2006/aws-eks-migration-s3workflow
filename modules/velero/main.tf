
resource "helm_release" "velero" {
  name             = "velero"
  namespace        = "velero"
  repository       = "https://vmware-tanzu.github.io/helm-charts"
  chart            = "velero"
  version          = "6.7.0"
  create_namespace = true

  set {
    name  = "upgradeCRDs"
    value = "false"
  }

  values = [<<EOF
configuration:
  backupStorageLocation:
    - name: default
      provider: aws
      bucket: payplus-velero
      config:
        region: eu-west-1
        s3ForcePathStyle: "false"

  volumeSnapshotLocation:
    - name: default
      provider: aws
      config:
        region: eu-west-1


credentials:
  useSecret: true
  existingSecret: cloud-credentials


initContainers:
  - name: velero-plugin-for-aws
    image: velero/velero-plugin-for-aws:v1.8.0
    volumeMounts:
      - mountPath: /target
        name: plugins

deployNodeAgent: true

metrics:
  enabled: true
EOF
  ]
}
