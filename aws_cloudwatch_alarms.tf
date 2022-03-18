resource "aws_sns_topic" "redis_sns_topic" {
  name = "${var.environment}-REDIS-AZ-SNS-TOPIC"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_cloudwatch_metric_alarm" "cache_cpu" {
  count = var.desired_clusters
  alarm_name          = "${var.environment}-${var.cache_identifier}-CACHE-${count.index + 1}-CPUUTILIZATION"
  alarm_description   = "Redis cluster CPU utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ElastiCache"
  period              = "300"
  statistic           = "Average"

  threshold = var.alarm_cpu_threshold

  dimensions = {
    CacheClusterId = "${aws_elasticache_replication_group.redis.id}-${count.index + 1}"
  }

  alarm_actions = [aws_sns_topic.redis_sns_topic.arn]
}

resource "aws_cloudwatch_metric_alarm" "cache_memory" {
  count = var.desired_clusters
  alarm_name          = "${var.environment}-${var.cache_identifier}-CACHE-${count.index + 1}-FREEABLEMEMORY"
  alarm_description   = "Redis cluster freeable memory"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "FreeableMemory"
  namespace           = "AWS/ElastiCache"
  period              = "60"
  statistic           = "Average"

  threshold = var.alarm_memory_threshold

  dimensions = {
    CacheClusterId = "${aws_elasticache_replication_group.redis.id}-${count.index + 1}"
  }

  alarm_actions = [aws_sns_topic.redis_sns_topic.arn]
}