variable "key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
}

variable "allowed_ip" {
  description = "Your public IP in CIDR notation (e.g., 203.0.113.45/32)"
  type        = string
}
