output "data" {
  value = {
    enabled                     = "${lookup(var.vars, "enabled", var.enabled)}"
    name                        = "${lookup(var.vars, "name", var.name)}"
    data-dir                    = "${lookup(var.vars, "data-dir", var.data-dir)}"
    snapshot-count              = "${lookup(var.vars, "snapshot-count", var.snapshot-count)}"
    heartbeat-interval          = "${lookup(var.vars, "heartbeat-interval", var.heartbeat-interval)}"
    election-timeout            = "${lookup(var.vars, "election-timeout", var.election-timeout)}"
    listen-peer-urls            = "${lookup(var.vars, "listen-peer-urls", var.listen-peer-urls)}"
    listen-client-urls          = "${lookup(var.vars, "listen-client-urls", var.listen-client-urls)}"
    max-snapshots               = "${lookup(var.vars, "max-snapshots", var.max-snapshots)}"
    max-wals                    = "${lookup(var.vars, "max-wals", var.max-wals)}"
    cors                        = "${lookup(var.vars, "cors", var.cors)}"
    initial-advertise-peer-urls = "${lookup(var.vars, "initial-advertise-peer-urls", var.initial-advertise-peer-urls)}"
    initial-cluster             = "${lookup(var.vars, "initial-cluster", var.initial-cluster)}"
    initial-cluster-state       = "${lookup(var.vars, "initial-cluster-state", var.initial-cluster-state)}"
    initial-cluster-token       = "${lookup(var.vars, "initial-cluster-token", var.initial-cluster-token)}"
    advertise-client-urls       = "${lookup(var.vars, "advertise-client-urls", var.advertise-client-urls)}"
    discovery                   = "${lookup(var.vars, "discovery", var.discovery)}"
    discovery-srv               = "${lookup(var.vars, "discovery-srv", var.discovery-srv)}"
    discovery-fallback          = "${lookup(var.vars, "discovery-fallback", var.discovery-fallback)}"
    discovery-proxy             = "${lookup(var.vars, "discovery-proxy", var.discovery-proxy)}"
    proxy                       = "${lookup(var.vars, "proxy", var.proxy)}"
    proxy-failure-wait          = "${lookup(var.vars, "proxy-failure-wait", var.proxy-failure-wait)}"
    proxy-refresh-interval      = "${lookup(var.vars, "proxy-refresh-interval", var.proxy-refresh-interval)}"
    proxy-dial-timeout          = "${lookup(var.vars, "proxy-dial-timeout", var.proxy-dial-timeout)}"
    proxy-write-timeout         = "${lookup(var.vars, "proxy-write-timeout", var.proxy-write-timeout)}"
    proxy-read-timeout          = "${lookup(var.vars, "proxy-read-timeout", var.proxy-read-timeout)}"
    cert-file                   = "${lookup(var.vars, "cert-file", var.cert-file)}"
    key-file                    = "${lookup(var.vars, "key-file", var.key-file)}"
    client-cert-auth            = "${lookup(var.vars, "client-cert-auth", var.client-cert-auth)}"
    trusted-ca-file             = "${lookup(var.vars, "trusted-ca-file", var.trusted-ca-file)}"
    peer-cert-file              = "${lookup(var.vars, "peer-cert-file", var.peer-cert-file)}"
    peer-key-file               = "${lookup(var.vars, "peer-key-file", var.peer-key-file)}"
    peer-client-cert-auth       = "${lookup(var.vars, "peer-client-cert-auth", var.peer-client-cert-auth)}"
    peer-trusted-ca-file        = "${lookup(var.vars, "peer-trusted-ca-file", var.peer-trusted-ca-file)}"
    debug                       = "${lookup(var.vars, "debug", var.debug)}"
    log-package-levels          = "${lookup(var.vars, "log-package-levels", var.log-package-levels)}"
  }
}
