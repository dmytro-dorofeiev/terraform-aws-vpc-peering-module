variable "owner_profile" {
  description = "AWS Profile"
}

variable "owner_region" {
  description = "AWS region for owner vpc"
  default     = "eu-west-1"
}
variable "accepter_region" {
  description = "AWS region for accepter vpc"
  default     = "eu-west-1"
}

variable "accepter_profile" {
  description = "AWS Profile"
}

variable "owner_vpc_id" {
  description = "Owner VPC Id"
}

variable "accepter_vpc_id" {
  description = "Accepter VPC Id"
}

variable "accepter_route_names" {
  description = "Accepter subnet names that should be routed"
  type        = set(string)
}

variable "owner_route_names" {
  description = "Owner subnet names that should be routed"
  type        = set(string)
}
