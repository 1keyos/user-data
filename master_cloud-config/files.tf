module "file-etcd_client__key" {
  source = "../modules/cloud-config_file"

  path        = "/etc/ssl/etcd/etcd_client.key"
  permissions = "0640"
  owner       = "root:root"
  content     = "${module.service_etcd-member.etcd_client_key}"
}

module "file-etcd_ca__pem" {
  source ="../modules/cloud-config_file" 

  path    = "/etc/ssl/etcd/etcd_ca.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_client_ca_crt}"
}

module "file-etcd_client__pem" {
  source = "../modules/cloud-config_file"

  path    = "/etc/ssl/etcd/etcd_client.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_client_crt}"
}
module "file-etcd_server__key" {
  source = "../modules/cloud-config_file"

  path        = "/etc/ssl/etcd/etcd_server.key"
  permissions = "0640"
  owner       = "root:root"
  content     = "${module.service_etcd-member.etcd_server_key}"
}

module "file-etcd_server_ca__pem" {
  source ="../modules/cloud-config_file"

  path    = "/etc/ssl/etcd/etcd_server_ca.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_server_ca_crt}"

}

module "file-etcd_server__pem" {
  source = "../modules/cloud-config_file"

  path    = "/etc/ssl/etcd/etcd_server.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_server_crt}"
}
module "file-etcd_peer__key" {
  source = "../modules/cloud-config_file"

  path        = "/etc/ssl/etcd/etcd_peer.key"
  permissions = "0640"
  owner       = "root:root"
  content = "${module.service_etcd-member.etcd_peer_key}"

}

module "file-etcd_peer_ca__pem" {
  source ="../modules/cloud-config_file"

  path    = "/etc/ssl/etcd/etcd_peer_ca.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_peer_ca_crt}"

}

module "file-etcd_peer__pem" {
  source = "../modules/cloud-config_file"

  path    = "/etc/ssl/etcd/etcd_peer.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_peer_crt}"

}


module "file-host-rkt" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bin/host-rkt"
  owner   = "root:root"
  content = "${file("${path.module}/files/host-rkt.sh")}"
}
module "file-bootkube" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bootkube/bootkube.sh"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_bootkube.bootkubesh}"
}
module "file-etcd" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bin/etcd-start"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_etcd.etcdstart}"
}
module "file-discovery" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bin/discovery-start"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_discovery.etcdstart}"
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

module "auth_conf" {
  source = "../modules/cloud-config_file"

  path    = "/etc/harbor/auth.conf"
  permissions = "0700"
  owner   = "root:root"
  content = "${file("${path.module}/files/auth.conf")}"
}
module "roles_conf" {
  source = "../modules/cloud-config_file"

  path    = "/etc/harbor/roles.conf"
  permissions = "0700"
  owner   = "root:root"
  content = "${file("${path.module}/files/roles.conf")}"
}

module "node_conf" {
  source = "../modules/cloud-config_file"

  path    = "/etc/harbor/node.conf"
  permissions = "0700"
  owner   = "root:root"
  content = "${file("${path.module}/files/node.conf")}"
}

module "harbor_auth_conf" {
  source = "../modules/cloud-config_file"

  path    = "/etc/harbor/harbor-auth.conf"
  permissions = "0700"
  owner   = "root:root"
  content = "${file("${path.module}/files/harbor-auth.conf")}"
}

module "images_conf" {
  source = "../modules/cloud-config_file"

  path    = "/etc/harbor/images.conf"
  permissions = "0700"
  owner   = "root:root"
  content = "${file("${path.module}/files/images.conf")}"
}

module "network_conf" {
  source = "../modules/cloud-config_file"

  path    = "/etc/harbor/network.conf"
  permissions = "0700"
  owner   = "root:root"
  content = "${file("${path.module}/files/network.conf")}"
}


