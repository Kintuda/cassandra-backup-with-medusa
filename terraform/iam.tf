data "aws_iam_policy_document" "cassandra_backup_policy" {
  statement {
    sid    = "VisualEditor0"
    effect = "Allow"

    resources = [
      "${aws_s3_bucket.this.arn}/*",
      "${aws_s3_bucket.this.arn}"
    ]

    actions = [
      "s3:GetLifecycleConfiguration",
      "s3:GetBucketTagging",
      "s3:GetInventoryConfiguration",
      "s3:PutAccelerateConfiguration",
      "s3:DeleteObjectVersion",
      "s3:GetObjectVersionTagging",
      "s3:ListBucketVersions",
      "s3:RestoreObject",
      "s3:ListBucket",
      "s3:GetAccelerateConfiguration",
      "s3:GetBucketPolicy",
      "s3:ReplicateObject",
      "s3:GetObjectVersionTorrent",
      "s3:GetObjectAcl",
      "s3:GetEncryptionConfiguration",
      "s3:GetBucketObjectLockConfiguration",
      "s3:AbortMultipartUpload",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectTagging",
      "s3:GetMetricsConfiguration",
      "s3:DeleteObject",
      "s3:GetBucketPublicAccessBlock",
      "s3:GetBucketPolicyStatus",
      "s3:ListBucketMultipartUploads",
      "s3:GetObjectRetention",
      "s3:GetBucketWebsite",
      "s3:PutReplicationConfiguration",
      "s3:PutObjectLegalHold",
      "s3:GetBucketVersioning",
      "s3:GetBucketAcl",
      "s3:GetObjectLegalHold",
      "s3:GetReplicationConfiguration",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectTorrent",
      "s3:PutObjectRetention",
      "s3:GetAnalyticsConfiguration",
      "s3:PutBucketObjectLockConfiguration",
      "s3:GetObjectVersionForReplication",
      "s3:GetBucketLocation",
      "s3:ReplicateDelete",
      "s3:GetObjectVersion",
    ]
  }

  statement {
    sid       = "VisualEditor1"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:GetAccountPublicAccessBlock",
      "s3:HeadBucket",
    ]
  }
}