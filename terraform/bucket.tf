resource "aws_s3_bucket" "this" {
  bucket = var.name

  lifecycle {
    prevent_destroy = true
  }

  tags = var.additional_tags
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    sid    = "AllowSSLRequestsOnly"
    effect = "Deny"

    resources = [
      "${aws_s3_bucket.this.arn}/*",
      "${aws_s3_bucket.this.arn}",
    ]

    actions = ["s3:*"]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_policy" "ssl_policy" {
  bucket = aws_s3_bucket.this.id

  policy = data.aws_iam_policy_document.s3_policy.json

  lifecycle {
    ignore_changes = [policy]
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [
    aws_s3_bucket.this
  ]
}
