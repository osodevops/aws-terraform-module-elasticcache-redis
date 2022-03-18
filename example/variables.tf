
variable "region" {
  type        = string
  description = "The default aws region"
  default     = "eu-west-2"
}

variable "environment" {
  type        = string
  description = "Environment descriptor."
}

variable "port" {
  default = 6379
  type    = number
}

variable "cache_identifier" {
  description = "Name of cluster"
}

variable "parameter_group_name" {
  default = "default.redis6.0"
}

variable "maintenance_window" {}

variable "desired_clusters" {
  default = "1"
}

variable "instance_type" {
  default = "cache.t2.micro"
}

variable "engine_version" {
  default = "6.x"
}

variable "automatic_failover_enabled" {
  default = false
}

variable "alarm_cpu_threshold" {
  default = "75"
}

variable "alarm_memory_threshold" {
  # 10MB
  default = "10000000"
}

variable "common_tags" {
  type        = map(string)
  description = "Implements the common tags scheme"
}

variable "vpc_name_value" {
  type        = string
  description = "The value of the name tag on the vpc. This is so that the data item can find the correct vpc."
}

variable "aws_subnets_tag_type" {
  type        = string
  description = "The tag type value. This is so that the private subnets within the vpc can be found."
}

variable "replication_group_id" {
  type        = string
  description = "The group id for the replication group."
}

variable "aws_elasticache_replication_group_description" {
  type        = string
  description = "The descrption for the replication group."
}

variable "preferred_cache_cluster_azs" {
  type = list(string)
  description = "The regions to deploy the nodes in."
  default = [""]
}

variable "at_rest_encryption_enabled" {
  type        = bool
  description = "Enable encryption at test."
  default     = true
}

variable "transit_encryption_enabled" {
  type        = bool
  description = "Enable transit encryption at test."
  default     = true
}

variable "snapshot_retention_limit" {
  type        = number
  description = "The snapshot retention period."
  default     = 7
}

variable "snapshot_window" {
  type        = string
  description = "The snapshot time."
  default     = "01:00-02:00"
}
