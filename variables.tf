variable "devops_triggers" {
  description = <<EOT
Map of devops_triggers, attributes below
Required:
    - project_id
    - trigger_source
    - actions (block):
        - build_pipeline_id (required)
        - filter (optional, block):
            - events (optional)
            - exclude (optional, block):
                - file_filter (optional, block):
                    - file_paths (optional)
            - include (optional, block):
                - base_ref (optional)
                - file_filter (optional, block):
                    - file_paths (optional)
                - head_ref (optional)
                - repository_name (optional)
            - trigger_source (required)
        - type (required)
Optional:
    - connection_id
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - repository_id
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    project_id     = string
    trigger_source = string
    connection_id  = optional(string)
    defined_tags   = optional(map(string))
    description    = optional(string)
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    repository_id  = optional(string)
    actions = list(object({
      build_pipeline_id = string
      filter = optional(object({
        events = optional(list(string))
        exclude = optional(object({
          file_filter = optional(object({
            file_paths = optional(list(string))
          }))
        }))
        include = optional(object({
          base_ref = optional(string)
          file_filter = optional(object({
            file_paths = optional(list(string))
          }))
          head_ref        = optional(string)
          repository_name = optional(string)
        }))
        trigger_source = string
      }))
      type = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.devops_triggers : (
        length(v.actions) >= 1
      )
    ])
    error_message = "Each actions list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.devops_triggers : (
        alltrue([for item in v.actions : (contains([for v in ["TRIGGER_BUILD_PIPELINE"] : lower(v)], lower(item.type)))])
      )
    ])
    error_message = "must be one of: \"TRIGGER_BUILD_PIPELINE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.devops_triggers : (
        alltrue([for item in v.actions : (item.filter == null || (contains([for v in ["BITBUCKET_CLOUD", "BITBUCKET_SERVER", "DEVOPS_CODE_REPOSITORY", "GITHUB", "GITLAB", "GITLAB_SERVER", "VBS"] : lower(v)], lower(item.filter.trigger_source))))])
      )
    ])
    error_message = "must be one of: \"BITBUCKET_CLOUD\", \"BITBUCKET_SERVER\", \"DEVOPS_CODE_REPOSITORY\", \"GITHUB\", \"GITLAB\", \"GITLAB_SERVER\", \"VBS\""
  }
  validation {
    condition = alltrue([
      for k, v in var.devops_triggers : (
        contains([for v in ["BITBUCKET_CLOUD", "BITBUCKET_SERVER", "DEVOPS_CODE_REPOSITORY", "GITHUB", "GITLAB", "GITLAB_SERVER", "VBS"] : lower(v)], lower(v.trigger_source))
      )
    ])
    error_message = "must be one of: \"BITBUCKET_CLOUD\", \"BITBUCKET_SERVER\", \"DEVOPS_CODE_REPOSITORY\", \"GITHUB\", \"GITLAB\", \"GITLAB_SERVER\", \"VBS\""
  }
}

