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
  asset_dir = "${var.asset_dir}"
  tag = "${var.tag}"
  etcdip = "${var.discovery_ip}"
  etcdpeersport = "${var.etcdpeersport}"
  etcdport   = "${var.etcdport}"
}
module "service_confd" {
  source = "../modules/unit_confd"
  asset_dir = "${var.asset_dir}"

}

module "service_docker" {
  source = "../modules/unit_docker"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"

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
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"
  asset_dir="${var.asset_dir}"
  api_servers = "${var.api_servers}"
}


module "service_bootkube" {
  source = "../modules/unit_bootkube"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"
  asset_dir="${var.asset_dir}"
}
module "service_render" {
  source = "../modules/unit_render"
etcd_ca_cert="${var.etcd_ca_cert}"
etcd_client_key="${var.etcd_client_key}"
etcd_client_cert="${var.etcd_client_cert}"
count="${var.count}"
discovery-srv="${var.discovery-srv}"
organization="${var.organization}"
ssh_key_algorithm="${var.ssh_key_algorithm}"
public_key="${var.public_key}"
generate_ssh_key="${var.generate_ssh_key}"
reboot_strategy="${var.reboot_strategy}"
additional_units="${var.additional_units}"
k8s-domain="${var.k8s-domain}"
internal_api_hostname="${var.internal_api_hostname}"
out_dir="${var.out_dir}"
cloud-provider="${var.cloud-provider}"
cluster_name="${var.cluster_name}"
vpc_cidr="${var.vpc_cidr}"
registry="${var.registry}"
namespace="${var.namespace}"
tag="${var.tag}"
etcd_servers="${var.etcd_servers}"
ip_etcd_servers="${var.ip_etcd_servers}"
discovery_ip="${var.discovery_ip}"
etcdpeersport="${var.etcdpeersport}"
etcdport="${var.etcdport}"
ha_kube_ip="${var.ha_kube_ip}"
ca_certificate="${var.ca_certificate}"
ca_key_alg="${var.ca_key_alg}"
ca_private_key="${var.ca_private_key}"
asset_dir="${var.asset_dir}"
api_servers="${var.api_servers}"
asset_dir = "${var.asset_dir}"

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
  ha_kube_ip = "${var.ha_kube_ip}"
  cluster_name = "${var.cluster_name}"
  api_servers = ["node1.example.com"]
  etcd_servers = ["node1.example.com"]
  ip_etcd_servers = "${var.ip_etcd_servers}"
  asset_dir = "${var.asset_dir}"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"
  networking = "${var.networking}"

}
module "helm" {
  source = "../modules/helm"
  asset_dir = "${var.asset_dir}"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"


}

module "service_ceph-mds" {
  source = "../modules/unit_ceph-mds"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"

}
module "service_ceph-mgr" {
  source = "../modules/unit_ceph-mgr"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"

}

module "service_ceph-mon" {
  source = "../modules/unit_ceph-mon"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"

}

module "service_ceph-osd" {
  source = "../modules/unit_ceph-osd"
  registry = "${var.registry}"
  namespace = "${var.namespace}"
  tag = "${var.tag}"

}

