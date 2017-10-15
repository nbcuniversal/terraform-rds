variable "budget" {}

variable "environment" {}

variable "database_master_username" {}

variable "database_master_password" {}

variable "backup_retention_period" {
  default = 31
}

variable "preferred_backup_window" {
  default = "02:00-08:00"
}

variable "preferred_maintenance_window" {
  default = "mon:03:00-mon:09:00"
}

variable "vpc_id" {}

variable "cluster_instance_count" {
  default = 1
}

variable "rds_instance_class" {
  default = "db.t2.small"
}

variable "publicly_accessible" {
  default = false
}

variable "subnet_ids" {
  description = "Comma delimited list of subnet IDs"
}
