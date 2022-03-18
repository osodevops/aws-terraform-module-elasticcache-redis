environment                                   = "P"
desired_clusters                              = "2"
cache_identifier                              = "storage"
automatic_failover_enabled                    = true
instance_type                                 = "cache.t2.small"
engine_version                                = "6.x"
parameter_group_name                          = ""
vpc_name_value                                = "example-prod"
aws_subnets_tag_type                          = "Private*"
replication_group_id                          = "redistorage"
aws_elasticache_replication_group_description = "replication group for the redis cluster."
preferred_cache_cluster_azs                   = ["eu-west-2a", "eu-west-2b"]
maintenance_window                            = "sun:03:00-sun:04:00"

common_tags = {
  Environment                         = "PROD"
  CostCode                            = "Redis"
  TF_State                            = "s3_bucket"
  Tool                                = "Terraform"
}