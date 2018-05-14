module "file-ca" {
  source = "git::https://github.com/freeletics-engineering/terraform_k8s_cloud-config_file"

  path    = "${var.etcd2_ca-filename}"
  owner   = "etcd:core"
  content = "${var.etcd2_ca-content}"
}

module "file-server_cert" {
  source = "git::https://github.com/freeletics-engineering/terraform_k8s_cloud-config_file"

  path    = "${var.etcd2_server_cert-filename}"
  owner   = "etcd:core"
  content = "${var.etcd2_server_cert-content}"
}

module "file-server_key" {
  source = "git::https://github.com/freeletics-engineering/terraform_k8s_cloud-config_file"

  permissions = "0600"
  path        = "${var.etcd2_server_key-filename}"
  owner       = "etcd:core"
  content     = "${var.etcd2_server_key-content}"
}

module "file-peer_cert" {
  source = "git::https://github.com/freeletics-engineering/terraform_k8s_cloud-config_file"

  path    = "${var.etcd2_peer_cert-filename}"
  owner   = "etcd:core"
  content = "${var.etcd2_peer_cert-content}"
}

module "file-peer_key" {
  source = "git::https://github.com/freeletics-engineering/terraform_k8s_cloud-config_file"

  permissions = "0600"
  path        = "${var.etcd2_peer_key-filename}"
  owner       = "etcd:core"
  content     = "${var.etcd2_peer_key-content}"
}
