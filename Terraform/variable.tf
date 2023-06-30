variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default     = "10.0.1.0/24"
  description = "description"
}

variable "instance_type" {
  default     = "t2.micro"
}

variable "volume_size" {
  default     = 10
}

variable "vpc_availability_zones" {
  type = list(string)
  default = ["ap-south-1a", "ap-south-1b","ap-south-1c"]
}


