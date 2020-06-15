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
variable "SNSTopicARN" {

}


#modules variables
variable "iam_for_lambda" {
  default= "iam_for_lambda_romany"
}
variable "lambda_function_name" {
default= "codedeploy_cet_romany_lambda"
}
variable "lambda_zip_file" {
  default = "lambda.zip"
}

variable "lambda_policy_arn" {
   type        = list(string)
  default = [
        "arn:aws:iam::aws:policy/service-role/AWSLambdaRole",
         "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
         "arn:aws:iam::aws:policy/AWSCodeDeployDeployerAccess"      
    ]
}

variable "deploymentGroupName" {
  default = "applicationDG"
}
