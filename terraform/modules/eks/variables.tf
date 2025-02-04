variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type    = string
  default = "1.24"
}

variable "cluster_role_arn" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 2
}

variable "instance_type" {
  type    = string
  default = "t3a.small"
}

variable "disk_size" {
  type    = number
  default = 20
}
