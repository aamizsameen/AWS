variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
}

# variable "subnet_cidr_block_1" {
#   default     = "10.0.1.0/24"
#   description = "description"
# }

# variable "subnet_cidr_block_2" {
#   default     = "10.0.2.0/24"
#   description = "description"
# }

variable "instance_type" {
  default     = "t2.micro"
}

variable "volume_size" {
  default     = 10
}

variable "db_password" {
  type        = string
  description = "Set the password for the database"
  sensitive = true
}

variable "subnet_cidrs_public" {
  description = "Subnet CIDRs for public subnets (length must match configured availability_zones)"
  default = ["10.0.10.0/24", "10.0.20.0/24"]
  type = list(string)
}

variable "availability_zones" {
  description = "AZs in this region to use"
  default = ["ap-south-1a", "ap-south-1b"]
  type = list(string)
}
   