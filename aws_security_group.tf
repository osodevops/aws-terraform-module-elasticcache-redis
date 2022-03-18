resource "aws_security_group" "redis_sg" {
  description   = "Security group that allows all cache traffic from allow ips"
  name          = "${upper(var.environment)}-REDIS-ING-SG"
  vpc_id        = data.aws_vpc.prod.id

  tags = merge(
  var.common_tags, {
    "Name" = "${upper(var.environment)}-REDIS-INT-SG"
  })
}

resource "aws_security_group_rule" "redis_sg_ingress_ssh" {
  type              = "ingress"
  from_port         = "6379"
  to_port           = "6379"
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.prod.cidr_block]
  security_group_id = aws_security_group.redis_sg.id
}

resource "aws_security_group_rule" "bastion_sg_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.redis_sg.id
}
