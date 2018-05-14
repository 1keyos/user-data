module "file-etcd_client__key" {
  source = "../modules/cloud-config_file"

  path        = "/etc/ssl/etcd/etcd_client.key"
  permissions = "0640"
  owner       = "etcd:core"
  content     = "${var.etcd_client_key}"
}

module "file-etcd_ca__pem" {
  source ="../modules/cloud-config_file" 

  path    = "/etc/ssl/etcd/etcd_ca.pem"
  owner   = "etcd:core"
  content = "${var.etcd_ca_cert}"
}

module "file-etcd_client__pem" {
  source = "../modules/cloud-config_file"

  path    = "/etc/ssl/etcd/etcd_client.pem"
  owner   = "etcd:core"
  content = "${var.etcd_client_cert}"
}

module "file-host-rkt" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bin/host-rkt"
  owner   = "etcd:core"
  content = "${file("${path.module}/files/host-rkt.sh")}"
}
module "file-bootkube" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bootkube/bootkube.sh"
  permissions = "0700"
  owner   = "root:root"
  content = "${file("${path.module}/files/bootkube.sh")}"
}
module "file-loadbootimage" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bin/loadbootimage.sh"
  permissions = "0700"
  owner   = "root:root"
  content = "${file("${path.module}/files/loadbootimage.sh")}"
}
module "file-loadbootrkt" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bin/loadbootrkt.sh"
  permissions = "0700"
  owner   = "root:root"
  content = "${file("${path.module}/files/loadbootrkt.sh")}"
}


