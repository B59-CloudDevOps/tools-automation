resource "aws_iam_role" "main" {
  name = "${var.name}-role"

  assume_role_policy = <<EOF
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "Service": "ec2.amazonaws.com"
                    },
                    "Action": "sts:AssumeRole"
                }
            ]
        }
    EOF

  tags = {
    tag-key = "${var.name}-role"
  }
}