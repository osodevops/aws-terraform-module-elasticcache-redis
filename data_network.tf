data "aws_vpc" "prod" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name_value]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.prod.id]
  }
  tags = {
    Type = var.aws_subnets_tag_type
  }
}