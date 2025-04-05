resource "aws_instance" "main" {

  ami                    = data.aws_ami.main.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]

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
      #   "ansible-pull -U https://github.com/B59-CloudDevOps/learn-ansible.git -e env=${var.env} -e component=${var.name} expense-pull.yaml"
    ]
  }
}

resource "aws_security_group" "main" {
  name        = "${var.name}-${var.env}-sg"
  description = "Allow All inbound traffic"

  ingress {
    description = "Allows SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allows App Access"
    from_port   = var.port_no
    to_port     = var.port_no
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-sg"
  }
}

resource "aws_route53_record" "main" {
  zone_id = var.zone_id
  name    = "${var.name}.clouding-app.shop"
  type    = "A"
  ttl     = 10
  records = [aws_instance.main.private_ip]
}

