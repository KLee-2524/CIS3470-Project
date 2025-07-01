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
    default     = "KALI"
}

# us-west-1 Kali Linux AMI: ami-0f36db53af1422a10
# us-west-1 Windows Server 2022 AMI: ami-06fe666da1b90024e
variable "vm_ami" {
    description = "AMI of the VM to deploy"
    type        = string
    default     = ami-0f36db53af1422a10
}