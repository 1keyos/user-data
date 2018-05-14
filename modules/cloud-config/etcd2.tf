# etcd2 Configuration
variable "etcd2" {
  type    = "map"
  default = {}
}

module "_etcd2" {
  source = "./submodules/etcd2"
  vars   = "${var.etcd2}"
}

output "enable_etcd2" {
  value = "${module._etcd2.data["enabled"]}"
}

output "etcd2_name" {
  value = "${module._etcd2.data["name"]}"
}

output "etcd2_data-dir" {
  value = "${module._etcd2.data["data-dir"]}"
}

output "etcd2_snapshot-count" {
  value = "${module._etcd2.data["snapshot-count"]}"
}

output "etcd2_heartbeat-interval" {
  value = "${module._etcd2.data["heartbeat-interval"]}"
}

output "etcd2_election-timeout" {
  value = "${module._etcd2.data["election-timeout"]}"
}

output "etcd2_listen-peer-urls" {
  value = "${module._etcd2.data["listen-peer-urls"]}"
}

output "etcd2_listen-client-urls" {
  value = "${module._etcd2.data["listen-client-urls"]}"
}

output "etcd2_max-snapshots" {
  value = "${module._etcd2.data["max-snapshots"]}"
}

output "etcd2_max-wals" {
  value = "${module._etcd2.data["max-wals"]}"
}

output "etcd2_cors" {
  value = "${module._etcd2.data["cors"]}"
}

output "etcd2_initial-advertise-peer-urls" {
  value = "${module._etcd2.data["initial-advertise-peer-urls"]}"
}

output "etcd2_initial-cluster" {
  value = "${module._etcd2.data["initial-cluster"]}"
}

output "etcd2_initial-cluster-state" {
  value = "${module._etcd2.data["initial-cluster-state"]}"
}

output "etcd2_initial-cluster-token" {
  value = "${module._etcd2.data["initial-cluster-token"]}"
}

output "etcd2_advertise-client-urls" {
  value = "${module._etcd2.data["advertise-client-urls"]}"
}

output "etcd2_discovery" {
  value = "${module._etcd2.data["discovery"]}"
}

output "etcd2_discovery-srv" {
  value = "${module._etcd2.data["discovery-srv"]}"
}

output "etcd2_discovery-fallback" {
  value = "${module._etcd2.data["discovery-fallback"]}"
}

output "etcd2_discovery-proxy" {
  value = "${module._etcd2.data["discovery-proxy"]}"
}

output "etcd2_proxy" {
  value = "${module._etcd2.data["proxy"]}"
}

output "etcd2_proxy-failure-wait" {
  value = "${module._etcd2.data["proxy-failure-wait"]}"
}

output "etcd2_proxy-refresh-interval" {
  value = "${module._etcd2.data["proxy-refresh-interval"]}"
}

output "etcd2_proxy-dial-timeout" {
  value = "${module._etcd2.data["proxy-dial-timeout"]}"
}

output "etcd2_proxy-write-timeout" {
  value = "${module._etcd2.data["proxy-write-timeout"]}"
}

output "etcd2_proxy-read-timeout" {
  value = "${module._etcd2.data["proxy-read-timeout"]}"
}

output "etcd2_cert-file" {
  value = "${module._etcd2.data["cert-file"]}"
}

output "etcd2_key-file" {
  value = "${module._etcd2.data["key-file"]}"
}

output "etcd2_client-cert-auth" {
  value = "${module._etcd2.data["client-cert-auth"]}"
}

output "etcd2_trusted-ca-file" {
  value = "${module._etcd2.data["trusted-ca-file"]}"
}

output "etcd2_peer-cert-file" {
  value = "${module._etcd2.data["peer-cert-file"]}"
}

output "etcd2_peer-key-file" {
  value = "${module._etcd2.data["peer-key-file"]}"
}

output "etcd2_peer-client-cert-auth" {
  value = "${module._etcd2.data["peer-client-cert-auth"]}"
}

output "etcd2_peer-trusted-ca-file" {
  value = "${module._etcd2.data["peer-trusted-ca-file"]}"
}

output "etcd2_debug" {
  value = "${module._etcd2.data["debug"]}"
}

output "etcd2_log-package-levels" {
  value = "${module._etcd2.data["log-package-levels"]}"
}

data "template_file" "etcd2_environment" {
  template = "${file("${path.module}/templates/etcd2-environment.yml")}"

  vars {
    cert-file       = "${module._etcd2.data["cert-file"]}"
    key-file        = "${module._etcd2.data["key-file"]}"
    trusted-ca-file = "${module._etcd2.data["trusted-ca-file"]}"
  }
}

// Unit file for etcd2
module "etcd2_unit" {
  source = "../unit"

  name     = "etcd2"
  enabled  = "${module._etcd2.data["enabled"]}"
  drop-ins = "${data.template_file.etcd2_environment.rendered}"
}

data "template_file" "etcd2" {
  template = "${file("${path.module}/templates/etcd2.yml")}"

  vars {
    name                        = "${module._etcd2.data["name"]}"
    data-dir                    = "${module._etcd2.data["data-dir"]}"
    snapshot-count              = "${module._etcd2.data["snapshot-count"]}"
    heartbeat-interval          = "${module._etcd2.data["heartbeat-interval"]}"
    election-timeout            = "${module._etcd2.data["election-timeout"]}"
    listen-peer-urls            = "${module._etcd2.data["listen-peer-urls"]}"
    listen-client-urls          = "${module._etcd2.data["listen-client-urls"]}"
    max-snapshots               = "${module._etcd2.data["max-snapshots"]}"
    max-wals                    = "${module._etcd2.data["max-wals"]}"
    cors                        = "${module._etcd2.data["cors"]}"
    initial-advertise-peer-urls = "${module._etcd2.data["initial-advertise-peer-urls"]}"
    initial-cluster             = "${module._etcd2.data["initial-cluster"]}"
    initial-cluster-state       = "${module._etcd2.data["initial-cluster-state"]}"
    initial-cluster-token       = "${module._etcd2.data["initial-cluster-token"]}"
    advertise-client-urls       = "${module._etcd2.data["advertise-client-urls"]}"
    discovery                   = "${module._etcd2.data["discovery"]}"
    discovery-srv               = "${module._etcd2.data["discovery-srv"]}"
    discovery-fallback          = "${module._etcd2.data["discovery-fallback"]}"
    discovery-proxy             = "${module._etcd2.data["discovery-proxy"]}"
    proxy                       = "${module._etcd2.data["proxy"]}"
    proxy-failure-wait          = "${module._etcd2.data["proxy-failure-wait"]}"
    proxy-refresh-interval      = "${module._etcd2.data["proxy-refresh-interval"]}"
    proxy-dial-timeout          = "${module._etcd2.data["proxy-dial-timeout"]}"
    proxy-write-timeout         = "${module._etcd2.data["proxy-write-timeout"]}"
    proxy-read-timeout          = "${module._etcd2.data["proxy-read-timeout"]}"
    cert-file                   = "${module._etcd2.data["cert-file"]}"
    key-file                    = "${module._etcd2.data["key-file"]}"
    client-cert-auth            = "${module._etcd2.data["client-cert-auth"]}"
    trusted-ca-file             = "${module._etcd2.data["trusted-ca-file"]}"
    peer-cert-file              = "${module._etcd2.data["peer-cert-file"]}"
    peer-key-file               = "${module._etcd2.data["peer-key-file"]}"
    peer-client-cert-auth       = "${module._etcd2.data["peer-client-cert-auth"]}"
    peer-trusted-ca-file        = "${module._etcd2.data["peer-trusted-ca-file"]}"
    debug                       = "${module._etcd2.data["debug"]}"
    log-package-levels          = "${module._etcd2.data["log-package-levels"]}"
  }
}
