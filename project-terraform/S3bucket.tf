resource "aws_s3_bucket" "example" {
  bucket = "saheed-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
