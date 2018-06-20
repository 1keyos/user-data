output "data" {
  value = "${module.unit.data}"
}
output "kubeconfig" {
  value = "${data.template_file.kubeconfig.rendered}"
}

