// 2 security groups
// - Application Load Balancer
// - EC2 Instances

resource "aws_security_group" "ec2" {
  name = replace(local.name, "rtype", "ec2-sg")
  description = "security group for ec2 instances"
  vpc_id = aws_default_vpc.main.id
  tags = merge(
        {Name = replace(local.name, "rtype", "ec2-sg")},
        local.common_tags
    )

   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

   }

   dynamic "ingress" {
    for_each = var.ec2_ports
    iterator = dynamic
    content {
        from_port = dynamic.value.port
        to_port = dynamic.value.port
        protocol = dynamic.value.protocol
        security_groups = [ aws_security_group.alb.id ]

      }
    }
}

// application load balancer 

resource "aws_security_group" "alb" {
  name = replace(local.name, "rtype", "alb-sg")
  description = "security group for alb instances"
  vpc_id = aws_default_vpc.main.id
  tags = merge(
        {Name = replace(local.name, "rtype", "alb-sg")},
        local.common_tags
    )

   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

   }

   dynamic "ingress" {
    for_each = var.alb_ports
    iterator = dynamic
    content {
        from_port = dynamic.value.port
        to_port = dynamic.value.port
        protocol = dynamic.value.protocol
        cidr_blocks = ["0.0.0.0/0"]

      }
    }
}