variable "ami" {
  type        = string
  description = "AMI for the EC2 instance (e.g., Amazon Linux 2)"
}

variable "instance_type" {
  type    = string
  default = "t3a.small"
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name for SSH access"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the instance will be deployed"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID (used for creating the security group)"
}

variable "allowed_ip" {
  type        = string
  description = "CIDR block for allowed IP access (e.g., your public IP in /32 format)"
}

variable "user_data" {
  type        = string
  description = "User data script to install Argo CD and Grafana"
}
