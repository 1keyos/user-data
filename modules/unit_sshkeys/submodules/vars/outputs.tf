output "data" {
  value = {
    authorized-keys = "${lookup(var.vars, "authorized-keys", var.authorized-keys)}"
    sync-minutes    = "${lookup(var.vars, "sync-minutes", var.sync-minutes)}"
  }
}
