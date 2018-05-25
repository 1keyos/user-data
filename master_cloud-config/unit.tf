module "service_discovery" {
  source = "../modules/unit_discovery"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"
}

module "service_etcd" {
  source = "../modules/unit_etcd"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"
}

module "service_docker" {
  source = "../modules/unit_docker"
}
module "service_etcd-member" {
  source = "../modules/unit_etcd-member"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"
  etcd_servers = "${var.etcd_servers}"
  ip_etcd_servers = "${var.ip_etcd_servers}"

}

module "service_kubelet" {
  source = "../modules/unit_kubelet"
  cluster-domain = "${var.k8s-domain}"
}


module "service_bootkube" {
  source = "../modules/unit_bootkube"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"
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

