## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backup_retention_period |  | string | `31` | no |
| budget |  | string | - | yes |
| cluster_instance_count |  | string | `1` | no |
| database_master_password |  | string | - | yes |
| database_master_username |  | string | - | yes |
| environment |  | string | - | yes |
| preferred_backup_window |  | string | `02:00-08:00` | no |
| preferred_maintenance_window |  | string | `mon:03:00-mon:09:00` | no |
| publicly_accessible |  | boolean | `false` | no |
| rds_instance_class |  | string | `db.t2.small` | no |
| subnet_ids | Comma delimited list of subnet IDs | string | - | yes |
| vpc_id |  | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| address |  |

