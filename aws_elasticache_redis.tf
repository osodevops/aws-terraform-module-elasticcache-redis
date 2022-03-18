resource "aws_elasticache_subnet_group" "redis_subnet" {
  name       = "${upper(var.environment)}-${upper(var.cache_identifier)}-REDIS-SUBNET-GROUP"
  subnet_ids = data.aws_subnets.private.ids
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = var.replication_group_id
  description                   = var.aws_elasticache_replication_group_description
  automatic_failover_enabled    = var.automatic_failover_enabled
  num_cache_clusters            = var.desired_clusters
  preferred_cache_cluster_azs   = var.preferred_cache_cluster_azs
  node_type                     = var.instance_type
  engine_version                = var.engine_version
  parameter_group_name          = var.parameter_group_name
  subnet_group_name             = aws_elasticache_subnet_group.redis_subnet.name
  security_group_ids            = [aws_security_group.redis_sg.id]
  maintenance_window            = var.maintenance_window
  notification_topic_arn        = aws_sns_topic.redis_sns_topic.arn
  port                          = var.port
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled
  snapshot_retention_limit      = var.snapshot_retention_limit
  snapshot_window               = var.snapshot_window

  lifecycle {
    ignore_changes = [number_cache_clusters]
  }

  tags = merge(
  var.common_tags, {
    Name        = "${upper(var.environment)}-${upper(var.cache_identifier)}-REDIS-REPLICA"
  })

  depends_on                    = [aws_security_group.redis_sg]
}