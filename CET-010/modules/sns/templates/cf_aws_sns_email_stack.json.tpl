{
 "AWSTemplateFormatVersion": "2010-09-09",
  "Resources": {
    "SNSTopic": {
      "Type": "AWS::SNS::Topic",
      "Properties": {
        "TopicName": "${sns_topic_name}",
        "DisplayName": "${sns_display_name}",
         "Subscription" : [ {
            "Endpoint" :  "${sns_subscription_email}",
            "Protocol" : "email"
        } ]
      }
    }
  },
  "Outputs":{
      "snsTopicARN" : {
        "Value" : { "Ref" : "SNSTopic" }
  }
    }
}

