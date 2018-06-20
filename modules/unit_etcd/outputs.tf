output "data" {
  value = "${module.unit.data}"
}
output "etcdstart" {
   value = "${data.template_file.etcdstart.rendered}"
}
output "updateendpoints" {
   value = "${data.template_file.updateendpoints.rendered}"
}

output "endpoints" {
   value = "${data.template_file.endpoints.rendered}"
}
output "endpointstmpl" {
   value = "${data.template_file.endpointstmpl.rendered}"
}
output "endpointstoml" {
   value = "${data.template_file.endpointstoml.rendered}"
}



