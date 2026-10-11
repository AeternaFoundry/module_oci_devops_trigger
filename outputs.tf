output "devops_triggers_id" {
  description = "Map of id values across all devops_triggers, keyed the same as var.devops_triggers except keys with no id are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "devops_triggers_actions" {
  description = "Map of actions values across all devops_triggers, keyed the same as var.devops_triggers except keys with no actions are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.actions if v.actions != null && length(v.actions) > 0 }
}
output "devops_triggers_compartment_id" {
  description = "Map of compartment_id values across all devops_triggers, keyed the same as var.devops_triggers except keys with no compartment_id are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "devops_triggers_connection_id" {
  description = "Map of connection_id values across all devops_triggers, keyed the same as var.devops_triggers except keys with no connection_id are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.connection_id if v.connection_id != null && length(v.connection_id) > 0 }
}
output "devops_triggers_defined_tags" {
  description = "Map of defined_tags values across all devops_triggers, keyed the same as var.devops_triggers except keys with no defined_tags are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "devops_triggers_description" {
  description = "Map of description values across all devops_triggers, keyed the same as var.devops_triggers except keys with no description are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.description if v.description != null && length(v.description) > 0 }
}
output "devops_triggers_display_name" {
  description = "Map of display_name values across all devops_triggers, keyed the same as var.devops_triggers except keys with no display_name are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "devops_triggers_freeform_tags" {
  description = "Map of freeform_tags values across all devops_triggers, keyed the same as var.devops_triggers except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "devops_triggers_lifecycle_details" {
  description = "Map of lifecycle_details values across all devops_triggers, keyed the same as var.devops_triggers except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "devops_triggers_project_id" {
  description = "Map of project_id values across all devops_triggers, keyed the same as var.devops_triggers except keys with no project_id are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "devops_triggers_repository_id" {
  description = "Map of repository_id values across all devops_triggers, keyed the same as var.devops_triggers except keys with no repository_id are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.repository_id if v.repository_id != null && length(v.repository_id) > 0 }
}
output "devops_triggers_state" {
  description = "Map of state values across all devops_triggers, keyed the same as var.devops_triggers except keys with no state are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.state if v.state != null && length(v.state) > 0 }
}
output "devops_triggers_system_tags" {
  description = "Map of system_tags values across all devops_triggers, keyed the same as var.devops_triggers except keys with no system_tags are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "devops_triggers_time_created" {
  description = "Map of time_created values across all devops_triggers, keyed the same as var.devops_triggers except keys with no time_created are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "devops_triggers_time_updated" {
  description = "Map of time_updated values across all devops_triggers, keyed the same as var.devops_triggers except keys with no time_updated are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}
output "devops_triggers_trigger_source" {
  description = "Map of trigger_source values across all devops_triggers, keyed the same as var.devops_triggers except keys with no trigger_source are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.trigger_source if v.trigger_source != null && length(v.trigger_source) > 0 }
}
output "devops_triggers_trigger_url" {
  description = "Map of trigger_url values across all devops_triggers, keyed the same as var.devops_triggers except keys with no trigger_url are omitted"
  value       = { for k, v in oci_devops_trigger.devops_triggers : k => v.trigger_url if v.trigger_url != null && length(v.trigger_url) > 0 }
}

