variable "update" {
  type = "map"

  default = {
    reboot-strategy = "best-effort"
    group           = "stable"
    server          = ""
  }
}

output "update_reboot-strategy" {
  value = "${var.update["reboot-strategy"]}"
}

output "update_group" {
  value = "${var.update["group"]}"
}

output "update_server" {
  value = "${lookup(var.update, "server", "")}"
}

data "template_file" "update" {
  template = "${file("${path.module}/templates/update.yml")}"

  vars {
    reboot-strategy = "${var.update["reboot-strategy"]}"
    group           = "${var.update["group"]}"
    server          = "${lookup(var.update, "server", "")}"
  }
}
