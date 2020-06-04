

 profileName="rosaber-lab"
 appName="romanyApp"
 bucketName="cet009-romany"
 zipName="romany-app.zip"

aws deploy push \
--application-name $appName \
--source ../phpApp/ \
--s3-location s3://$bucketName/$zipName \
--ignore-hidden-files \
--profile $profileName
