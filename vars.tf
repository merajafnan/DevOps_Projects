variable AWS_REGION {
  default = "us-east-1"
}
variable AMIS {
  type = map
  default = {
    us-east-1 = "ami-08d4ac5b634553e16"
    us-east-2 = "ami-03e57de632660544c"
  }
}
variable PRIV_KEY_PATH {
  default = "eereeda-terraform-key"
}
variable PUB_KEY_PATH {
  default = "eereeda-terraform-key.pub"
}
variable USERNAME {
  default = "ubuntu"
}
variable MYIP {
  default = "183.83.39.124/32"
}

variable rmquser {
  default = "rabbit"
}
variable rmqpass {
  default = "eereeda@terraform12345"
}

variable dbuser {
  default = "admin"
}
variable dbpass {
  default = "admin123"
}
variable dbname {
  default = "accounts"
}

variable instance_count {
  default = "1"
}

variable VPC_NAME {
  default = "eereeda-VPC"
}

variable Zone1 {
  default = "us-east-1a"
}
variable Zone2 {
  default = "us-east-1b"
}
variable Zone3 {
  default = "us-east-1c"
}

variable VpcCIDR {
  default = "172.21.0.0/16"
}

variable PubSub1CIDR {
  default = "172.21.1.0/24"
}
variable PubSub2CIDR {
  default = "172.21.2.0/24"
}
variable PubSub3CIDR {
  default = "172.21.3.0/24"
}

variable privSub1CIDR {
  default = "172.21.4.0/24"
}
variable privSub2CIDR {
  default = "172.21.5.0/24"
}
variable privSub3CIDR {
  default = "172.21.6.0/24"
}



