variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "xxxxx"
}

variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN and Vault cluster."
  type        = string
  default     = "xxx"
}

variable "region" {
  description = "The region of the HCP HVN and Vault cluster."
  type        = string
  default     = "xx-xxxx-x"
}

variable "cidr_block" {
  description = "The CIDR block for HVN and default will be 172.25.16.0/20 if not defined."
  type        = string
  default     = "x.x.x.x/x"
}

variable "cluster_id" {
  description = "The unique ID of the HCP Vault cluster."
  type        = string
  default     = "xxxxxx"
}

variable "tier" {
  description = "Tier of the HCP Vault cluster. Valid options for tiers."
  type        = string
  default     = "xxx"
}