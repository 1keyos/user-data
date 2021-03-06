variable "hostname" {
  default = ""
}

output "hostname" {
  value = "${var.hostname}"
}

data "template_file" "hostname" {
  template = "${file("${path.module}/templates/hostname.yml")}"

  vars {
    hostname = "${var.hostname}"
  }
}
