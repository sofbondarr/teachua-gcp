variable "vpc_id" {
  description = "ID VPC for Security Groups"
  type        = string
}

variable "allowed_cidrs" {
  description = "CIDR-blocks that have access to ports"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instances" {
  description = "List of EC2 machines with their settings and ports"
  type = list(object({
    name          = string
    ami           = string
    instance_type = string
    subnet_id     = string
    ports         = list(number)
    key_name      = string
  }))
}
