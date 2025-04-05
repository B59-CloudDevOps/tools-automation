variable "tools" {
  default = {
    vault = {
      name          = "vault"
      instance_type = "t3.micro"
      port_no       = 8200
    }
  }
}

variable "zone_id" {
  default = "Z08061862LBZAM174JIHO"
}