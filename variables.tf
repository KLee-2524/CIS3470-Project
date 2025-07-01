variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "aws_region" {
    description = "AWS region where resources will be deployed" 
    type        = string
    default     = "us-west-1"
}

variable "vm_type" {
    description = "Kind of VM being deployed" 
    type        = string
    default     = "NEVER GONNA GIVE YOU UP"
}