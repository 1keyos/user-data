data "template_file" "node_names" {
  count = "${var.count}"

  template = "etcd$${index}.$${tld}"

  vars = {
    index = "${count.index+1}"
    tld   = "${var.discovery-srv}"
  }
}

data "template_file" "userdata" {
  count = "${var.count}"

  template = "${replace(replace(module.userdata.user-data,
    "node_name", element(data.template_file.node_names.*.rendered, count.index)),
    "private_ipv4", format("%sprivate_ipv4","$")
  )}"
}

module "userdata" {
  source = "git::https://github.com/freeletics-engineering/terraform_k8s_cloud-config.git?ref=custom-keypaths"

  write_files = "${list(
    "${module.file-ca.data}",
    "${module.file-server_cert.data}",
    "${module.file-server_key.data}",
    "${module.file-peer_cert.data}",
    "${module.file-peer_key.data}"
  )}"

  ssh_authorized_keys = ["${var.public_key}"]

  etcd2 = {
    discovery-srv               = "${var.discovery-srv}"
    enabled                     = true
    name                        = "node_name"
    advertise-client-urls       = "https://node_name:2379"
    initial-advertise-peer-urls = "https://private_ipv4:2380"
    listen-client-urls          = "https://private_ipv4:2379,https://127.0.0.1:2379"
    listen-peer-urls            = "https://private_ipv4:2380"
    client-cert-auth            = "true"
    cert-file                   = "${var.etcd2_server_cert-filename}"
    key-file                    = "${var.etcd2_server_key-filename}"
    trusted-ca-file             = "${var.etcd2_ca-filename}"
    peer-client-cert-auth       = "true"
    peer-cert-file              = "${var.etcd2_peer_cert-filename}"
    peer-key-file               = "${var.etcd2_peer_key-filename}"
    peer-trusted-ca-file        = "${var.etcd2_ca-filename}"
  }

  flannel = {
    enabled        = true
    etcd-endpoints = "https://127.0.0.1:2379"
    etcd-cafile    = "${var.etcd2_ca-filename}"
    etcd-certfile  = "${var.etcd2_peer_cert-filename}"
    etcd-keyfile   = "${var.etcd2_peer_key-filename}"
  }

  locksmith = {
    endpoint      = "https://127.0.0.1:2379"
    etcd-cafile   = "${var.etcd2_ca-filename}"
    etcd-certfile = "${var.etcd2_peer_cert-filename}"
    etcd-keyfile  = "${var.etcd2_peer_key-filename}"
  }

  update = {
    reboot-strategy = "${var.reboot_strategy}"
    group           = "stable"
  }

  additional_units = ["${concat(var.additional_units,list(
    "${module.config_sshkeys.data}",
    "${module.service_docker.data}"
  ))}"]
}

module "service_docker" {
  source = "git::https://github.com/freeletics-engineering/terraform_k8s_cloud-config_unit_docker"

  docker-opts = ["${var.docker-opts}"]
}

module "config_sshkeys" {
  source = "git::https://github.com/freeletics-engineering/terraform_k8s_cloud-config_unit_sshkeys"
  vars   = "${var.sshkeys_vars}"
}

# TODO;


# Add convienience script for;


# ```sudo etcdctl --cert-file server.pem --key-file server.key --ca-file ca_cert.pem --discovery-srv etcd.operations.freeletics cluster-health```

