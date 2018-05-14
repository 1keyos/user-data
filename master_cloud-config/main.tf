data "template_file" "userdata_name" {
  count = "${var.count}"

  template = "master$${index}.$${tld}"

  vars = {
    index = "${count.index+1}"
    tld   = "${var.discovery-srv}"
  }
}

data "template_file" "userdata" {
  count = "${var.count}"

  template = "${replace(module.userdata.user-data,
    "node_name", element(data.template_file.userdata_name.*.rendered, count.index)
  )}"
}

data "template_file" "flannel_config" {
  template = "${file("${path.module}/files/flannel_config.json")}"

  vars = {
    vpc_cidr       = "${var.vpc_cidr}"
    cloud-provider = "${var.cloud-provider}"
  }
}
resource "tls_private_key" "default" {
  count     = "${var.generate_ssh_key == "true" ? 1 : 0}"
  algorithm = "${var.ssh_key_algorithm}"
}
locals {
  test = "${tls_private_key.default.public_key_openssh}"
}

#var.public_key = "${tls_private_key.default.public_key_openssh}"

module "userdata" {
  source = "../modules/cloud-config"

  write_files = "${list(
    "${module.file-host-rkt.data}",
    "${module.file-etcd_ca__pem.data}",
    "${module.file-etcd_client__key.data}",
    "${module.file-etcd_client__pem.data}",
    "${module.file-bootkube.data}",
    "${module.file-loadbootimage.data}",
    "${module.file-loadbootrkt.data}"

  )}"
 # ssh_authorized_keys = ["${local.test}"]


 ssh_authorized_keys =  ["${var.public_key == "" ? tls_private_key.default.public_key_openssh : var.public_key}"]

  etcd2 = {
    enabled        = false
    mask           = true

    proxy                = "on"
    discovery-srv        = "${var.discovery-srv}"
    listen-client-urls   = "http://localhost:2379"
    peer-key-file        = "/etc/ssl/etcd/etcd_client.key"
    peer-trusted-ca-file = "/etc/ssl/etcd/etcd_ca.pem"
    peer-cert-file       = "/etc/ssl/etcd/etcd_client.pem"
  }

  flannel = {
    enabled        = true
    etcd-endpoints = "http://localhost:2379"

    # TODO: Parametrise this JSON
    config = "${data.template_file.flannel_config.rendered}"
  }

  locksmith = {
    endpoint = "http://localhost:2379"
  }

  update = {
    reboot-strategy = "${var.reboot_strategy}"
    group           = "stable"
  }

  additional_units = ["${concat(var.additional_units,list(
    "${module.service_etcd-member.data}",
    "${module.config_sshkeys.data}",
    "${module.service_docker.data}",
    "${module.service_kubelet.data}",
    "${module.service_bootkube.data}",
    "${module.service_settimezone.data}",
    "${module.service_loadbootimage.data}",
    "${module.service_loadbootrkt.data}",
    "${module.service_setup-network-environment.data}"
  ))}"]
}

module "service_docker" {
  source = "../modules/unit_docker"
}
module "service_etcd-member" {
  source = "../modules/unit_etcd-member"
}

module "service_kubelet" {
  source = "../modules/unit_kubelet"
  cluster-domain = "${var.k8s-domain}"
}


module "service_bootkube" {
  source = "../modules/unit_bootkube"
}

module "service_settimezone" {
  source = "../modules/unit_settimezone"
}
module "service_loadbootimage" {
  source = "../modules/unit_loadbootimage"
}
module "service_loadbootrkt" {
  source = "../modules/unit_loadbootrkt"
}

module "service_setup-network-environment" {
  source = "../modules/unit_setup-network-environment"
}

module "config_sshkeys" {
  source = "../modules/unit_sshkeys"
}

module "bootkube" {
  source = "../modules/bootkube"

  cluster_name = "${var.cluster_name}"
  api_servers = ["node1.example.com"]
  etcd_servers = ["node1.example.com"]
  asset_dir = "${var.out_dir}/mycluster"
}
