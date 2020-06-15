output "SNSTopicARN" {
  value = aws_cloudformation_stack.SNSTopic.outputs["SNSTopic"]
}