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

resource "aws_iam_instance_profile" "main" {
  name = "${var.name}-instance-profile"
  role = aws_iam_role.main.name
}

resource "aws_iam_role_policy" "main" {
  name = "inline_policy"
  role = aws_iam_role.main.id


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = var.policy_actions
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}