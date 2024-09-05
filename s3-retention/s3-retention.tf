# Copyright 2024 Hewlett Packard Enterprise Development LP
resource "aws_s3_bucket_lifecycle_configuration" "s3_retention" {

  bucket = module.core_infra.fluentoperator_aws_s3_bucket_name
  
  rule {
    id     = "lifecycle-rule"
    status = "Enabled"

    filter {
      prefix = ""
    }

    transition {
      days          = 2
      storage_class = "GLACIER"
    }

    expiration {
      days = 4
    }

  }
}