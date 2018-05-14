output "data" {
  value = "${join("\n", list(
    "${module.service.data}",
    "${module.timer.data}"
  ))}"
}
