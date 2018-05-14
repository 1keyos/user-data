data "template_file" "drop-ins" {
  template = "${file("${path.module}/templates/drop-ins.yml")}"

  vars = {
   # DOCKER_OPTS = "${data.template_file.docker-opts.rendered}"
  }
}

module "unit" {
  source = "../unit"

  name     = "etcd-member"
  enabled  = "${var.enabled}"
  drop-ins = "${data.template_file.drop-ins.rendered}"
}
