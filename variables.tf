variable "ssmincidents_replication_sets" {
  description = <<EOT
Map of ssmincidents_replication_sets, attributes below
Optional:
    - tags
    - tags_all
    - region (block):
        - kms_key_arn (optional)
        - name (required)
    - regions (block):
        - kms_key_arn (optional)
        - name (required)
EOT

  type = map(object({
    tags     = optional(map(string))
    tags_all = optional(map(string))
    region = optional(list(object({
      kms_key_arn = optional(string)
      name        = string
    })))
    regions = optional(list(object({
      kms_key_arn = optional(string)
      name        = string
    })))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

