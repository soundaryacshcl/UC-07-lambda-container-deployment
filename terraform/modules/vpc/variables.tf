variable "create_vpc" {
  type        = bool
  default     = true
  description = "Whether to create a new VPC or reuse an existing one"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "Existing VPC ID to reuse if create_vpc is false"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones for subnets"
}

variable "environment" {
  type        = string
  description = "Environment (e.g., dev, staging, prod)"
}
