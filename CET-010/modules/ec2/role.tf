# A- Create a service role for ec2 

resource "aws_iam_role" "instance_profile_role" {
  name = var.instanceProfileRole

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      Name= var.instanceProfileRole
      AppName= var.applicationName
  }
}
# B- Create EC2 Instance Profile
resource "aws_iam_instance_profile" "instance_profile" {
  name = var.instanceProfile
  role = aws_iam_role.instance_profile_role.name
}
# C- Adding IAM Policies

resource "aws_iam_role_policy" "instance_policy" {
  name = var.instanceIAMPolicy
  role = aws_iam_role.instance_profile_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}