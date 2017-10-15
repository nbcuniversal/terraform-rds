output "address" {
  value = "${aws_rds_cluster.main.endpoint}"
}

output "security_group_id" {
  value = "${aws_security_group.main.id}"
}
