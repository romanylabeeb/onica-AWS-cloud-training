
 region='us-east-2'
 bucketName='cet009-romany'
 appName='romanyApp'
 deployGroupName='romanyDG'
 deployGroupDescription="Deploy romanyApp using cli"
 tagName="6207e4bf11e4c631da5bfd3e8242c1e9"
 appZipFileName="romany-app.zip"
 ec2TagName="AppName"
 codeDeployRoleServiceArn="arn:aws:iam::504727362876:role/RomanyCodeDeployEC2Access"
echo $appName


# aws deploy create-deployment-group \
#     --application-name $appName \
#     --deployment-config-name CodeDeployDefault.OneAtATime \
#     --deployment-group-name $deployGroupName \
#     --ec2-tag-filters Key=ec2TagName,Value=$appName,Type=KEY_AND_VALUE \
#     --service-role-arn $codeDeployRoleServiceArn \
#      --profile rosaber-lab


aws deploy create-deployment \
    --profile rosaber-lab \
    --application-name $appName \
    --deployment-config-name CodeDeployDefault.OneAtATime \
    --deployment-group-name $deployGroupName \
    --description $deployGroupDescription \
    --s3-location bucket=$bucketName,bundleType=zip,eTag=$tagName,key=$appZipFileName 
    

