variable "tag" {
    type = "string"
}

variable "subnet_id" {
    type = "string"
}

variable "vpc_security_group_id" {
    type = "string"
}

variable "key_pair_name" {
  type = "string"
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  default     = false
}
