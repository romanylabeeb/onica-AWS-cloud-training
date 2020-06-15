{
 "AWSTemplateFormatVersion": "2010-09-09",
  "Resources": {
    "SNSTopic": {
      "Type": "AWS::SNS::Topic",
      "Properties": {
        "TopicName": "${sns_topic_name}",
        "DisplayName": "${sns_topic_name}",
         "Subscription" : [ {
            "Endpoint" :  "${sns_subscription_email}",
            "Protocol" : "email"
        } ]
      }
    }
  },
  "Outputs":{
      "snsTopicARN" : {
        "Export" : {
          "Name" : "SNSTopicARN"
        },
        "Value" : { "Ref" : "SNSTopic" }
  }
    }
}

