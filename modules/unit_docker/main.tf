data "template_file" "docker-opts" {
  template = "$${string}"

  vars {
    string = "${join(" ", concat(
        list(
          "--log-driver=${var.log-driver}",
          "--log-opt max-size=50m",
          "--log-opt max-file=5",
          "-s chainfs",
          "--storage-opt chainfs.volume_driver=btrfs"
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
