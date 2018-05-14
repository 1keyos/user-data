output "user_data" {
  value = ["${data.template_file.userdata.*.rendered}"]
}
resource "local_file" "user_ddata" {
    content     = "${data.template_file.userdata.rendered}"
    filename = "${var.out_dir}/var/lib/coreos-install/user_data"
}
