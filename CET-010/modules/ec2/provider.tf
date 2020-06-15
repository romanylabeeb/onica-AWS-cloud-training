

provider "aws" {
 // alias      = "my_aws_account"
  region     = var.region
  shared_credentials_file = var.sharedCred
  profile                 = var.profileName 
}
