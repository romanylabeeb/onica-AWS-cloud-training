
resource "aws_instance" "main" {
  ami                  = var.AMIID
  instance_type        = var.instanceType
  key_name             = var.instanceKey
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  user_data            = file("${path.module}/scripts/install.sh")
  vpc_security_group_ids = [
    var.instanceSG
  ]

  tags = {
    Name    = var.instanceName
    AppName = var.applicationName
  }


}
