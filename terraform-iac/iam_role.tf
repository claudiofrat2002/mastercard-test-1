# Role and instance profile for ec2 instances and lambdas

# Role policy you might want to change
# Avoid */* permissions please.
resource "aws_iam_role_policy" "role_policy" {
  name = "${var.project}-${var.environment}_policy"
  role = "${aws_iam_role.role.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
EOF
}

# Role to attach instance profile to
resource "aws_iam_role" "role" {
  name = "${var.project}-${var.environment}-ec2role"
  path = "/"

# Trust relationtip. This is not the role policy.
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com",
          "lambda.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# EC2 Instance profile is attached to instances
resource "aws_iam_instance_profile" "instance_profile" {
  name  = "${aws_iam_role.role.name}"
  role = "${aws_iam_role.role.name}"
}
