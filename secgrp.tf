resource "aws_security_group" "eereeda-bean-elb-sg" {
  name        = "eereeda-bean-elb-sg"
  description = "Security Group for Bean-ELB"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "eereeda-bastion-sg" {
  name        = "eereeda-bastion-sg"
  description = "Security Group for Bastion Host"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "eereeda-prod-sg" {
  name        = "eereeda-prod-sg"
  description = "Security Group for Beanstalk Instances"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    security_groups = [aws_security_group.eereeda-bastion-sg.id]
  }
}

resource "aws_security_group" "eereeda-backend-sg" {
  name        = "eereeda-backend-sg"
  description = "Security Group for RDS, ActiveMQ, Elastic Cache"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = [aws_security_group.eereeda-prod-sg.id]
  }
}

resource "aws_security_group_rule" "sec_group_allow_itself" {
  from_port                = 0
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eereeda-backend-sg.id
  source_security_group_id = aws_security_group.eereeda-backend-sg.id
  to_port                  = 65535
  type                     = "ingress"
}