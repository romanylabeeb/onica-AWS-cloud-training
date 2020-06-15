

 profileName="rosaber-lab"
 appName="codedeployRomanyApp"
 bucketName="revison-cd-romany"
 zipName="phpApp.zip"

aws deploy push \
--application-name $appName \
--source ../phpApp/ \
--s3-location s3://$bucketName/$zipName \
--ignore-hidden-files \
--profile $profileName
