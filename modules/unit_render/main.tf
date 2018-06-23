data "template_file" "content" {
  template = "${file("${path.module}/templates/content")}"

  vars = {
   asset_dir  = "${var.asset_dir}"

  }
}
data  "template_file" "bootkubesh" {
  template = "${file("${path.module}/templates/render.sh")}"

  vars = {
   asset_dir  = "${var.asset_dir}"
   IMAGE = "${var.registry}/${var.namespace}/render:${var.tag}"
  }
}
data  "template_file" "terraformfile" {
  template = "${file("${path.module}/templates/terraform.tfvars")}"

  vars = {
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
k8s-domain="${var.k8s-domain}"
internal_api_hostname="${var.internal_api_hostname}"
out_dir="${var.out_dir}"
cloud-provider="${var.cloud-provider}"
cluster_name="${var.cluster_name}"
vpc_cidr="${var.vpc_cidr}"
registry="${var.registry}"
namespace="${var.namespace}"
tag="${var.tag}"
etcd_servers = "${join("\",\"",var.etcd_servers)}"
ip_etcd_servers = "${join("\",\"",var.ip_etcd_servers)}"
discovery_ip="${var.discovery_ip}"
etcdpeersport="${var.etcdpeersport}"
etcdport="${var.etcdport}"
ha_kube_ip="${var.ha_kube_ip}"
ca_certificate="${var.ca_certificate}"
ca_key_alg="${var.ca_key_alg}"
ca_private_key="${var.ca_private_key}"
asset_dir="${var.asset_dir}"
api_servers = "${join("\",\"",var.api_servers)}"

  }
}

module "unit" {
  source = "../unit"

  name    = "render"
  enabled = "${var.enabled}"
  content = "${data.template_file.content.rendered}"
}
