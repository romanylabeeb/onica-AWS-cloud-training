Parameters:
  sns_topic_name :
    Type: String
  sns_subscription_email :
    Type: String  
Resources:
  SNSTopic : 
    Type: AWS::SNS::Topic
    Properties: 
      DisplayName: !Ref sns_topic_name
      TopicName: !Ref sns_topic_name
  SNSSubscription :
    Type: AWS::SNS::Subscription
    Properties: 
      Endpoint: !Ref sns_subscription_email
      Protocol: email
      TopicArn: !Ref 'SNSTopic'
Outputs:
  SNSTopic: 
    Description: Arn for SNS 
    Export:
      Name: SNSTopicARN
    Value: !Ref SNSTopic 