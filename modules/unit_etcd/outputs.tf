output "data" {
  value = "${module.unit.data}"
}
output "etcdstart" {
   value = "${data.template_file.etcdstart.rendered}"
}
