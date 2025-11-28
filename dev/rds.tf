

module "rds" {
  source  = "cloudposse/rds-cluster/aws"
  version = "1.7.0"

  name                 = "rds-${var.tag_env}"
  engine               = "aurora-mysql"
  engine_mode          = "provisioned"
  cluster_family       = "aurora-mysql5.7"
  cluster_size         = 1
  cluster_type         = "regional"
  admin_user           = random_password.rds_admin_username.result
  admin_password       = random_password.rds_password.result
  db_name              = random_password.rds_db_name.result
  db_port              = 3306
  vpc_id               = module.vpc.vpc_id
  subnets              = module.vpc.database_subnets
  enable_http_endpoint = true

  scaling_configuration = [
    {
      auto_pause               = true
      max_capacity             = 16
      min_capacity             = 1
      seconds_until_auto_pause = 300
      timeout_action           = "ForceApplyCapacityChange"
    }
  ]
  tags = {
    Name = "${var.tag_env}-rds"
  }
}