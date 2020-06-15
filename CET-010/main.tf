

module "codeDeployModule" {
  source     = "./modules/codeDeploy"
  region     =      var.region
  bucketName =      var.bucketName
  applicationName = var.applicationName
  sharedCred=       var.sharedCred
  profileName=      var.profileName
}
module "instanceModule" {
  source     = "./modules/ec2"
  region     =      var.region
  applicationName = var.applicationName
  sharedCred=       var.sharedCred
  profileName=      var.profileName
  
}



module "snsModule" {
  source     = "./modules/sns"
  region     =      var.region
  applicationName = var.applicationName
  sharedCred=       var.sharedCred
  profileName=      var.profileName
  
}

module "lambdaModule" {
  source     = "./modules/lambda"
  region     =       var.region
  applicationName =  var.applicationName
  sharedCred =       var.sharedCred
  profileName =      var.profileName
  SNSTopicARN=   module.snsModule.SNSTopicARN
}


module "bucketModule" {
  source     = "./modules/bucket"
  region     =      var.region
  bucketName =      var.bucketName
  applicationName = var.applicationName
  sharedCred=       var.sharedCred
  profileName=      var.profileName
  lambdaARN= module.lambdaModule.lambdaARN
  lambda_function_name = module.lambdaModule.lambda_function_name
}



