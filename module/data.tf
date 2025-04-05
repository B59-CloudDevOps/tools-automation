data "aws_ami" "main" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name = "b59-learning-ami-with-ansible"
  }
}

data "aws_route53_zone" "main" {
  name         = "clouding-app.shop"
  private_zone = false
}