resource "oci_devops_trigger" "devops_triggers" {
  for_each = var.devops_triggers

  project_id     = each.value.project_id
  trigger_source = each.value.trigger_source
  connection_id  = each.value.connection_id
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags
  repository_id  = each.value.repository_id

  dynamic "actions" {
    for_each = each.value.actions
    content {
      build_pipeline_id = actions.value.build_pipeline_id
      dynamic "filter" {
        for_each = actions.value.filter != null ? [actions.value.filter] : []
        content {
          events = filter.value.events
          dynamic "exclude" {
            for_each = filter.value.exclude != null ? [filter.value.exclude] : []
            content {
              dynamic "file_filter" {
                for_each = exclude.value.file_filter != null ? [exclude.value.file_filter] : []
                content {
                  file_paths = file_filter.value.file_paths
                }
              }
            }
          }
          dynamic "include" {
            for_each = filter.value.include != null ? [filter.value.include] : []
            content {
              base_ref = include.value.base_ref
              dynamic "file_filter" {
                for_each = include.value.file_filter != null ? [include.value.file_filter] : []
                content {
                  file_paths = file_filter.value.file_paths
                }
              }
              head_ref        = include.value.head_ref
              repository_name = include.value.repository_name
            }
          }
          trigger_source = filter.value.trigger_source
        }
      }
      type = actions.value.type
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

