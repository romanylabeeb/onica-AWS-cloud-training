#Install CodeDeploy agent on your EC2 instance:
#!/bin/bash
sudo yum update -y
sudo yum install ruby -y
sudo yum install wget 
cd /home/ec2-user
wget https://aws-codedeploy-us-east-2.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status


#Create your application.zip and load it into CodeDeploy:

 region='us-east-2'
 bucketName='cet009-romany'
 appName='romanyApp'
 deployGroupName='romanyDG'
 deployGroupDescription="Deploy romanyApp using cli"
 tagName="6207e4bf11e4c631da5bfd3e8242c1e9"
 appZipFileName="romany-app.zip"
 profileName="rosaber-lab"

 #create code deploy application
aws deploy create-application --application-name romanyApp --profile $profileName
#create s3 bukcet
aws s3api  create-bucket --bucket cet009-romany --region $region  --profile $profileName

