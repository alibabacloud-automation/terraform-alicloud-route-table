
variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to which the route table belongs."
  nullable    = false
}

variable "description" {
  type        = string
  description = "The description of the route table."
  default     = null
}

variable "route_table_name" {
  type        = string
  description = "The display name of the route table. If not specified, the value of `name` will be used."
  default     = null
}

variable "associate_type" {
  type        = string
  description = "The type of cloud resource that is bindable to the route table. Valid values: `VSwitch`, `Gateway`."
  default     = "VSwitch"
}

variable "route_propagation_enable" {
  type        = bool
  description = "Whether to enable route propagation for the route table."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the route table."
  default     = null
}

variable "route_entries" {
  type = map(object({
    destination_cidrblock = string
    nexthop_type          = string
    nexthop_id            = optional(string)
    name                  = optional(string)
    description           = optional(string)
  }))
  description = "A map of route entries to create in the route table. Each entry includes destination CIDR block, next hop type, and optional next hop ID, name, and description."
  default     = {}
}

variable "vswitch_ids" {
  type        = map(string)
  description = "A map of VSwitch IDs to associate with the route table."
  default     = {}
}
