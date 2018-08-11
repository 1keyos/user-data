output "data" {
  value = "${module.unit.data}"
}
output "bootkubesh" {
   value = "${data.template_file.bootkubesh.rendered}"
}
output "terraformfile" {
   value = "${data.template_file.terraformfile.rendered}"
}

