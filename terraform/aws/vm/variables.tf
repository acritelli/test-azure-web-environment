variable "aws_region" {
  type        = string
  description = "AWS region to launch servers."
}

variable "admin_user" {
  type        = string
  description = "Username for admin user"
}

variable "admin_key_public" {
  type        = string
  description = "Public SSH key of admin user"
}

variable "access_key" {
  type        = string
  description = "Access key for AWS"
}

variable "secret_key" {
  type        = string
  description = "Secret key for AWS"
}

variable "instance_type" {
  type        = string
  description = "Instance flavor type for EC2"
}

variable "security_group_id" {
  type        = string
  description = "ID of security group for instance"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to deploy instance into"
}
