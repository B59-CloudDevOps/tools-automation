variable "tools" {
  default = {
    vault = {
      name          = "vault"
      instance_type = "t3.micro"
      port_no = {
        vault = 8200
      }
      policy_actions = ["ec2:DescribeAvailabilityZones"]
    }
    prometheus = {
      name          = "prometheus"
      instance_type = "t3.small"
      port_no = {
        prometheus = 9090
      }
      policy_actions = ["ec2:DescribeInstances", "ec2:DescribeAvailabilityZones"]
    }
    grafana = {
      name          = "grafana"
      instance_type = "t3.micro"
      port_no = {
        grafana = 3000
      }
      policy_actions = ["ec2:DescribeInstances"]
    }
    elk = {
      name          = "elk"
      instance_type = "r7a.xlarge"
      port_no = {
        kibana   = 80
        logstash = 5044
      }
      policy_actions = ["ec2:DescribeInstances"]
    }
    sonarqube = {
      name          = "sonarqube"
      instance_type = "t3.medium"
      port_no = {
        sonarqube = 8081
      }
      policy_actions = ["ec2:DescribeInstances"]
    }
  }
}

variable "zone_id" {
  default = "Z08061862LBZAM174JIHO"
}