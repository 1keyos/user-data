module "file-kube-ca-key" {
  source ="../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/ca.key"
  owner   = "root:root"
  content = "${module.service_kubelet.kube-ca-key}"
}
module "file-kube-ca-crt" {
  source ="../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/ca.crt"
  owner   = "root:root"
  content = "${module.service_kubelet.kube-ca-crt}"
}
module "file-apiserver-key" {
  source ="../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/apiserver.key"
  owner   = "root:root"
  content = "${module.service_kubelet.apiserver-key}"
}

module "file-apiserver-crt" {
  source ="../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/apiserver.crt"
  owner   = "root:root"
  content = "${module.service_kubelet.apiserver-crt}"
}
module "file-service-account-key" {
  source ="../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/service-account.key"
  owner   = "root:root"
  content = "${module.service_kubelet.service-account-key}"
}
module "file-service-account-crt" {
  source ="../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/service-account.pub"
  owner   = "root:root"
  content = "${module.service_kubelet.service-account-crt}"
}
module "file-kubelet-crt" {
  source ="../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/kubelet.crt"
  owner   = "root:root"
  content = "${module.service_kubelet.kubelet-crt}"
}
module "file-kubelet-key" {
  source ="../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/kubelet.key"
  owner   = "root:root"
  content = "${module.service_kubelet.kubelet-key}"
}
module "file-kubeconfig" {
  source ="../modules/cloud-config_file"

  path    = "/etc/kubernetes/kubeconfig"
  owner   = "root:root"
  content = "${module.bootkube.masterkubeconfig}"
}


module "file-kube_ca__pem" {
  source ="../modules/cloud-config_file"

  path    = "/etc/kubernetes/ca.crt"
  owner   = "root:root"
  content = "${module.bootkube.file_ca_cert}"
}

module "file-etcd_client__key" {
  source = "../modules/cloud-config_file"

  path        = "${var.asset_dir}/tls/etcd_client.key"
  permissions = "0644"
  owner       = "root:root"
  content     = "${module.service_etcd-member.etcd_client_key}"
}

module "file-etcd_ca__pem" {
  source ="../modules/cloud-config_file" 

  path    = "${var.asset_dir}/tls/etcd_ca.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_client_ca_crt}"
}

module "file-etcd_client__pem" {
  source = "../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/etcd_client.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_client_crt}"
}
module "file-etcd_server__key" {
  source = "../modules/cloud-config_file"

  path        = "${var.asset_dir}/tls/etcd/etcd_server.key"
  permissions = "0644"
  owner       = "root:root"
  content     = "${module.service_etcd-member.etcd_server_key}"
}

module "file-etcd_server_ca__pem" {
  source ="../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/etcd/etcd_server_ca.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_server_ca_crt}"

}

module "file-etcd_server__pem" {
  source = "../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/etcd/etcd_server.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_server_crt}"
}
module "file-etcd_peer__key" {
  source = "../modules/cloud-config_file"

  path        = "${var.asset_dir}/tls/etcd/etcd_peer.key"
  permissions = "0644"
  owner       = "root:root"
  content = "${module.service_etcd-member.etcd_peer_key}"

}

module "file-etcd_peer_ca__pem" {
  source ="../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/etcd/etcd_peer_ca.pem"
  owner   = "root:root"
  content = "${module.service_etcd-member.etcd_peer_ca_crt}"

}

module "file-etcd_peer__pem" {
  source = "../modules/cloud-config_file"

  path    = "${var.asset_dir}/tls/etcd/etcd_peer.pem"
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
module "file-render" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bootkube/render.sh"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_render.bootkubesh}"
}
module "file-helm" {
  source = "../modules/cloud-config_file"

  path    = "/opt/helm/helm.sh"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_helm.helmsh}"
}

module "file-terraform" {
  source = "../modules/cloud-config_file"

  path    = "/${var.asset_dir}/terraform.tfvars"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_render.terraformfile}"
}

module "file-etcd" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bin/etcd-start"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_etcd.etcdstart}"
}
module "file-updateendpoints" {
  source = "../modules/cloud-config_file"

  path    = "/opt/bin/updateendpoints"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_etcd.updateendpoints}"
}

module "file-endpointstoml" {
  source = "../modules/cloud-config_file"

  path    = "/etc/confd/conf.d/endpoints.toml"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_etcd.endpointstoml}"

}
module "file-endpointstmpl" {
  source = "../modules/cloud-config_file"

  path    = "/etc/confd/templates/endpoints.tmpl"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_etcd.endpointstmpl}"
}

module "file-endpoints" {
  source = "../modules/cloud-config_file"

  path    = "/etc/endpoints.conf"
  permissions = "0700"
  owner   = "root:root"
  content = "${module.service_etcd.endpoints}"
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


