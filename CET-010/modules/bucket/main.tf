# create an S3 bucket
resource "aws_s3_bucket" "revisonCodeDeployBucket" {
  bucket = var.bucketName
  region = var.region
  tags = {
    Name    = var.bucketName
    AppName = var.applicationName
  }
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.revisonCodeDeployBucket.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.revisonCodeDeployBucket.bucket
  lambda_function {
    lambda_function_arn = var.lambdaARN
    events              = ["s3:ObjectCreated:*"]
  }
  depends_on = [aws_lambda_permission.allow_bucket]
}