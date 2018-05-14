module "_vars" {
  source = "./submodules/vars"
  vars   = "${var.vars}"
}

module "service" {
  source = "../unit"

  name    = "sshkeys"
  type    = "service"
  content = "${data.template_file.service.rendered}"
}

module "timer" {
  source = "../unit"

  name    = "sshkeys"
  type    = "timer"
  content = "${data.template_file.timer.rendered}"
}
