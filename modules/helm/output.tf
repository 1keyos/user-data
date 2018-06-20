output "deployment" {
   value = "${data.template_file.deployment.rendered}"
}
output "service" {
   value = "${data.template_file.service.rendered}"
}
output "tiller_rbac" {
   value = "${data.template_file.tiller_rbac.rendered}"
}

