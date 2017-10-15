resource "aws_rds_cluster" "main" {
  cluster_identifier           = "${lower(var.budget)}-${lower(var.environment)}-aurora"
  master_username              = "${var.database_master_username}"
  master_password              = "${var.database_master_password}"
  backup_retention_period      = "${var.backup_retention_period}"
  preferred_backup_window      = "02:00-03:00"
  preferred_maintenance_window = "wed:03:00-wed:04:00"
  db_subnet_group              = "${aws_db_subnet_group.main.name}"
  final_snapshot_identifier    = "${uuid()}"

  vpc_security_ids = [
    "${split(",", var.vpc_security_group_ids)}",
  ]

  lifecycle {
    create_before_destroy = true

    ignore_changes = [
      "final_snapshot_identifier",
    ]
  }

  tags {
    Budget      = "${var.budget}"
    Environment = "${var.environment}"
  }
}

resource "aws_rds_cluster_instance" "instance" {
  count                = "${var.cluster_instance_count}"
  identifier           = "${lower(var.budget)}-${lower(var.environment)}-${count.index}"
  cluster_identifier   = "${aws_rds_cluster.main.id}"
  instance_class       = "${var.rds_instance_class}"
  db_subnet_group_name = "${aws_db_subnet_group.main.name}"
  publicly_accessible  = "${var.publicly_accessible}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Budget      = "${var.budget}"
    Environment = "${var.environment}"
    RdsCluster  = "${aws_rds_cluster.main.id}"
  }
}

resource "aws_db_subnet_group" "main" {
  subnet_ids = [
    "${split(",", var.subnet_ids)}",
  ]

  tags {
    Budget      = "${var.budget}"
    Environment = "${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
