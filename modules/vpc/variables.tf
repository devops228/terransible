variable "region" {
  description = "The region of the app"  
  default     = "ap-southeast-2"
}
variable "availability_zone" {
  default = "ap-southeast-2a"
}

variable "environment_tag" {
  description = "Environment tag"
  default = "terransible"
}

variable "cidr_block_range" {
  description = "The CIDR block for the VPC"
  default = "10.0.0.0/16"
}
variable "subnet1_cidr_block_range" {
  description = "The CIDR block for public subnet of VPC"
  default = "10.0.1.0/24"
}
variable "subnet2_cidr_block_range" {
  description = "The CIDR block for private subnet of VPC"
  default = "10.0.2.0/24"
}

variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/id_rsa.pub"
}
