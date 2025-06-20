variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "vm_ami" {
    description = "Virtual Machine AWS AMI" 
    default = "ami-06fe666da1b90024e"
}