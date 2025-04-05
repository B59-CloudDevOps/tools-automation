resource "aws_instance" "main" {

  ami                    = data.aws_ami.main.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]
  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type             = "persistent"
    }
  }

  tags = {
    Name = var.name
  }
}

resource "null_resource" "main" {
  depends_on = [aws_route53_record.main] # This ensure, provisioner will only be exectued post dns_record creation
  triggers = {
    timestamp = timestamp() # Forces execution on every apply
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.main.private_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 10",
      "echo runs playbook"
      #   "ansible-pull -U https://github.com/B59-CloudDevOps/learn-ansible.git -e env=${var.env} -e component=${var.name} expense-pull.yaml"
    ]
  }
}
