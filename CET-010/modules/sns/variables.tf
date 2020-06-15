#provider access

variable "region" {
  description = "AWS region"
 
}
variable "sharedCred" {

}
variable "profileName" {

}

#codeDeploy application name

variable "applicationName" {

}
variable "Email" {
 
   default= "romany.lab@gmail.com"
 }
 
 variable "sns_subscription_protocol" {
   type = string
   default = "email"
   description = "SNS subscription protocal"
 }
 
 variable "sns_topic_name" {
   type = string
   description = "SNS topic name"
    default= "taskRomanySns"
 }
 
 variable "sns_topic_display_name" {
   type = string
   description = "SNS topic display name"
   default = "Lambda-sns-topic-Romany-name"
 }
variable "snsStackName" {
    default = "romany-sns-Stack"
}


