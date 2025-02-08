resource "aws_s3_bucket" "test_bucket" {
  bucket = "test-bucket-leedonggyu-10"
  tags = {
    Name = "test-bucket-leedonggyu-10"
  }
}
