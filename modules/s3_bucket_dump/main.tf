resource "aws_s3_bucket" "this" {
  bucket = var.name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = var.name
  }
}
