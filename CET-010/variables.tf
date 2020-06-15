#provider access
variable "region" {
  description = "AWS region"
  default     = "us-east-2"
}
variable "sharedCred" {
  default = "C:/Users/roman/.aws/creds"
}
variable "profileName" {
  default = "rosaber-lab"
}
variable "applicationName" {
  description = "AWS code deploy application name"
  default     = "codedeployRomanyApp"
}


#modules variables

variable "instanceKey" {
  default="Egypt-Romany-Ohio-Key"
}
variable "instanceType" {
  default="t2.micro"
}


variable "snsTopicName" {
  default="cetask10-romany-sns"
}
variable "email" {
  default="romany.lab@gmail.com"
}
variable "bucketName" {
  description = "AWS Bucket Name"
  default     = "revison-cd-romany"
}



