resource "aws_s3_bucket" "lambda_s3" {
  bucket = lower("${var.lambda.name}lambda")
}

resource "aws_s3_object" "lambda_s3_object" {
  bucket = aws_s3_bucket.lambda_s3.id
  key    = "${var.lambda.name}__lambda.zip"
  source = data.archive_file.lambda.output_path
}