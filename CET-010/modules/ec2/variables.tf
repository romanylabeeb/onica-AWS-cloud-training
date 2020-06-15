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

#modules variables
variable "AMIID" {
  default="ami-026dea5602e368e96"
}

variable "instanceKey" {
  default="Egypt-Romany-Ohio-Key"
}
variable "instanceType" {
  default="t2.micro"
}
variable "instanceSG" {
  default="sg-0e43aba37f90f3721"
}
variable "instanceName" {
  default= "Egypt-EC2-Romany"
}



variable "instanceProfileRole" {
  default="codedeploy-instance-romany-role"
}
variable "instanceProfile" {
  default="codedeploy-instance-romany-profile"
}
variable "instanceIAMPolicy" {
  default="instance-iam-policy-romany"
}




