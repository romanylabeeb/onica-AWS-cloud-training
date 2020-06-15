
resource "aws_cloudformation_stack" "SNSTopic" {
  name = "RomanyTopic"
  parameters = {
    SNSTopicName = "${var.sns_topic_name}"
    Email          = "${var.Email}"
  }

  template_body = <<STACK
Parameters:
  SNSTopicName :
    Type: String
  Email :
    Type: String  
Resources:
  SNSTopic : 
    Type: AWS::SNS::Topic
    Properties: 
      DisplayName: !Ref SNSTopicName
      TopicName: !Ref SNSTopicName
  SNSSubscription :
    Type: AWS::SNS::Subscription
    Properties: 
      Endpoint: !Ref Email
      Protocol: email
      TopicArn: !Ref 'SNSTopic'
Outputs:
  SNSTopic: 
    Description: Arn for SNS 
    Export:
      Name: SNSTopicARN
    Value: !Ref SNSTopic  
  
  STACK

}