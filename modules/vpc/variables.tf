variable "vpc_cidr" {}
variable "vpc_name" {}

variable "public_subnet_cidrs" {
  type = list(string)
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidrs" {
  type = list(string)
  description = "List of private subnet CIDR blocks"
}
