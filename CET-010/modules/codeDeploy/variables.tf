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


variable "bucketName" {
}

#modules variables

variable "codeDeploy-romany-role" {
  default="codedeploy-service-role-romany"
}


variable "codeDeploymentGroup" {
  description = "AWS code deployment group name"
  default     = "applicationDG"
}
variable "snsTopicName" {
  default="cetask10-romany-sns"
}
variable "email" {
  default="romany.lab@gmail.com"
}




