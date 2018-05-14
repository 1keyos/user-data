data "template_file" "service" {
  template = "${file("${path.module}/templates/service")}"

  vars = {
    authorized-keys = "${module._vars.data["authorized-keys"]}"
  }
}

data "template_file" "timer" {
  template = "${file("${path.module}/templates/timer")}"

  vars = {
    sync-minutes = "${module._vars.data["sync-minutes"]}"
  }
}
