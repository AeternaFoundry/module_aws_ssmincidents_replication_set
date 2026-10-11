resource "aws_ssmincidents_replication_set" "ssmincidents_replication_sets" {
  for_each = var.ssmincidents_replication_sets

  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "region" {
    for_each = each.value.region != null ? each.value.region : []
    content {
      kms_key_arn = region.value.kms_key_arn
      name        = region.value.name
    }
  }

  dynamic "regions" {
    for_each = each.value.regions != null ? each.value.regions : []
    content {
      kms_key_arn = regions.value.kms_key_arn
      name        = regions.value.name
    }
  }
}

