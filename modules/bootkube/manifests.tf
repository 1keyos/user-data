# Self-hosted Kubernetes bootstrap-manifests
resource "template_dir" "bootstrap-manifests" {
  source_dir      = "${path.module}/resources/bootstrap-manifests"
  destination_dir = "${var.asset_dir}/bootstrap-manifests"

  vars {
    registry = "${var.registry}"
    namespace = "${var.namespace}"
    tag = "${var.tag}"
   # endpoints = "${var.endpoints}"
    kube_system = "${var.kube_system}"
    api_port  = "${var.api_port}"
    endpoints    = "${join(",", formatlist("https://%s:${var.etcdport}", var.ip_etcd_servers))}"
    token_id = "${var.token_id}"
    token_secret = "${var.token_secret}"
    cloud_provider = "${var.cloud_provider}"
    pod_cidr       = "${var.pod_cidr}"
    service_cidr   = "${var.service_cidr}"
    trusted_certs_dir = "${var.trusted_certs_dir}"
  }
}

# Self-hosted Kubernetes manifests
resource "template_dir" "manifests" {
  source_dir      = "${path.module}/resources/manifests"
  destination_dir = "${var.asset_dir}/manifests"

  vars {
      registry = "${var.registry}"
      namespace = "${var.namespace}"
      tag = "${var.tag}"
    cluster_name = "${var.cluster_name}"
    kube_system = "${var.kube_system}"
    ha_kube_ip   = "${var.ha_kube_ip}"
    api_port  ="${var.api_port}"
    endpoints = "${var.endpoints}"
    token_id = "${var.token_id}"
    token_secret = "${var.token_secret}"
    endpoints = "${join(",", formatlist("https://%s:${var.etcdport}", var.ip_etcd_servers))}"
 
    cloud_provider        = "${var.cloud_provider}"
    pod_cidr              = "${var.pod_cidr}"
    service_cidr          = "${var.service_cidr}"
    cluster_domain_suffix = "${var.cluster_domain_suffix}"
    kube_dns_service_ip   = "${cidrhost(var.service_cidr, 10)}"
    trusted_certs_dir     = "${var.trusted_certs_dir}"
    ca_cert            = "${base64encode(var.ca_certificate == "" ? join(" ", tls_self_signed_cert.kube-ca.*.cert_pem) : var.ca_certificate)}"
    apiserver_key      = "${base64encode(tls_private_key.apiserver.private_key_pem)}"
    apiserver_cert     = "${base64encode(tls_locally_signed_cert.apiserver.cert_pem)}"
    serviceaccount_pub = "${base64encode(tls_private_key.service-account.public_key_pem)}"
    serviceaccount_key = "${base64encode(tls_private_key.service-account.private_key_pem)}"

    etcd_ca_cert     = "${base64encode(tls_self_signed_cert.etcd-ca.cert_pem)}"
    etcd_client_cert = "${base64encode(tls_locally_signed_cert.client.cert_pem)}"
    etcd_client_key  = "${base64encode(tls_private_key.client.private_key_pem)}"
 }
}
