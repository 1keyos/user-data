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
    "${module.file-kubeconfig.data}",
    "${module.file-etcd.data}",
    "${module.file-updateendpoints.data}",
    "${module.file-endpointstoml.data}",
    "${module.file-endpointstmpl.data}",
    "${module.file-endpoints.data}",
    "${module.file-discovery.data}",
    "${module.file-bootkube.data}",
    "${module.file-render.data}",
    "${module.file-helm.data}",
    "${module.file-terraform.data}",
    "${module.file-loadbootimage.data}",
    "${module.file-loadbootrkt.data}",
    "${module.auth_conf.data}",
    "${module.harbor_auth_conf.data}",
    "${module.images_conf.data}",
    "${module.network_conf.data}",
    "${module.node_conf.data}",
    "${module.roles_conf.data}"
  )}"
 # ssh_authorized_keys = ["${local.test}"]


 ssh_authorized_keys =  ["${var.public_key == "" ? tls_private_key.default.public_key_openssh : var.public_key}"]

  etcd2 = {
#    enabled        = false
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
    "${module.service_etcd.data}",
    "${module.service_confd.data}",
    "${module.service_discovery.data}",
    "${module.config_sshkeys.data}",
    "${module.service_docker.data}",
    "${module.service_kubelet.data}",
    "${module.service_bootkube.data}",
    "${module.service_render.data}",
    "${module.service_helm.data}",
    "${module.service_settimezone.data}",
    "${module.service_loadbootimage.data}",
    "${module.service_loadbootrkt.data}",
    "${module.service_setup-network-environment.data}"
  ))}"]
}

