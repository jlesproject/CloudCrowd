resource "aws_iam_user_group_membership" "example1" {
  user = aws_iam_user.user1.name

  groups = [
    aws_iam_group.group1.name
  ]
}

resource "aws_iam_user_group_membership" "example2" {
  user = aws_iam_user.user2.name

  groups = [
    aws_iam_group.group2.name,
  ]
}

resource "aws_iam_user_group_membership" "example3" {
  user = aws_iam_user.user3.name

  groups = [
    aws_iam_group.group3.name,
  ]
}

resource "aws_iam_user_group_membership" "example4" {
  user = aws_iam_user.user4.name

  groups = [
    aws_iam_group.group4.name,
  ]
}

resource "aws_iam_user" "user1" {
  name = "user1"
}

resource "aws_iam_user" "user2" {
  name = "user2"
}

resource "aws_iam_user" "user3" {
  name = "user3"
}

resource "aws_iam_user" "user4" {
  name = "user4"
}

resource "aws_iam_group" "group1" {
  name = "group1"
}

resource "aws_iam_group" "group2" {
  name = "group2"
}

resource "aws_iam_group" "group3" {
  name = "group3"
}

resource "aws_iam_group" "group4" {
  name = "group4"
}

resource "aws_iam_group_policy" "my_admin_policy" {
  name  = "my_admin_policy"
  group = aws_iam_group.group1.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
        "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
      },
    ]
  })
}

resource "aws_iam_group_policy" "my_developer_policy" {
  name  = "my_developer_policy"
  group = aws_iam_group.group2.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "elasticloadbalancing:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "cloudwatch:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": [
                        "autoscaling.amazonaws.com",
                        "ec2scheduled.amazonaws.com",
                        "elasticloadbalancing.amazonaws.com",
                        "spot.amazonaws.com",
                        "spotfleet.amazonaws.com",
                        "transitgateway.amazonaws.com"
                    ]
                }
            }
        }
    ]
  })
}

resource "aws_iam_group_policy" "my_prod_policy" {
  name  = "my_prod_policy"
  group = aws_iam_group.group3.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:Describe*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "elasticloadbalancing:Describe*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:ListMetrics",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:Describe*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:Describe*",
            "Resource": "*"
        }
    ]
})
}


resource "aws_iam_group_policy" "my_test_policy" {
  name  = "my_test_policy"
  group = aws_iam_group.group4.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iam:GenerateCredentialReport",
                "iam:GenerateServiceLastAccessedDetails",
                "iam:Get*",
                "iam:List*",
                "iam:SimulateCustomPolicy",
                "iam:SimulatePrincipalPolicy"
            ],
            "Resource": "*"
        }
    ]
})
}



