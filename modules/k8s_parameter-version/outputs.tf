output "data" {
  value = {
    version = "${lookup(var.vars, "version", var.version)}"
    aci     = "${lookup(var.vars, "aci", var.aci)}"
  }
}
