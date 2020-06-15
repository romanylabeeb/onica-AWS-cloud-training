
resource "aws_iam_role" "iam_for_lambda" {
  name = var.iam_for_lambda
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "policy" {
  name   = "SNS_CodeDeploy_policy"
  path   = "/"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
            "Action": "codedeploy:*",
            "Effect": "Allow",
            "Resource": "*"
        }, {
            "Action": "sns:*",
            "Effect": "Allow",
            "Resource": "*"
        }
  ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "attachlmabdaexerole" {
   role      = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  count = length(var.lambda_policy_arn)
  policy_arn = var.lambda_policy_arn[count.index]
  role       = aws_iam_role.iam_for_lambda.name

}