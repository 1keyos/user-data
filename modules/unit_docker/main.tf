data "template_file" "docker-opts" {
  template = "$${string}"

  vars {
    string = "${join(" ", concat(
        list(
          "--log-opt max-size=50m",
          "--insecure-registry ${var.registry}",
          "--log-opt max-file=5"
        ),
        "${var.docker-opts}"
    ))}"
  }
}

data "template_file" "drop-ins" {
  template = "${file("${path.module}/templates/drop-ins.yml")}"

  vars = {
    DOCKER_OPTS = "${data.template_file.docker-opts.rendered}"
  }
}

module "unit" {
  source = "../unit"

  name     = "docker"
  enabled  = "${var.enabled}"
  drop-ins = "${data.template_file.drop-ins.rendered}"
}
