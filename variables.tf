variable "tools" {
  default = {
    vault = {
      name           = "vault"
      instance_type  = "t3.micro"
      port_no        = 8200
      policy_actions = ["ec2:DescribeAvailabilityZones"]
    }
    prometheus = {
      name           = "prometheus"
      instance_type  = "t3.small"
      port_no        = 9090
      policy_actions = ["ec2:DescribeInstances", "ec2:DescribeAvailabilityZones"]
    }
    grafana = {
      name           = "grafana"
      instance_type  = "t3.micro"
      port_no        = 3000
      policy_actions = [""]
    }
  }
}

variable "zone_id" {
  default = "Z08061862LBZAM174JIHO"
}