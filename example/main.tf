module "redis" {
    source = "../"
    environment                                   = var.environment
    desired_clusters                              = var.desired_clusters
    cache_identifier                              = var.cache_identifier
    automatic_failover_enabled                    = var.automatic_failover_enabled
    instance_type                                 = var.instance_type
    engine_version                                = var.engine_version
    parameter_group_name                          = var.parameter_group_name
    vpc_name_value                                = var.vpc_name_value
    aws_subnets_tag_type                          = var.aws_subnets_tag_type
    replication_group_id                          = var.replication_group_id
    aws_elasticache_replication_group_description = var.aws_elasticache_replication_group_description
    preferred_cache_cluster_azs                   = var.preferred_cache_cluster_azs
    maintenance_window                            = var.maintenance_window

    common_tags = var.common_tags
}