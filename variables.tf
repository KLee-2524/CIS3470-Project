#variable "instance_type" {
#  description = "Type of EC2 instance to provision"
#  default     = "t3.nano"
#}

variable "os_prefix" {
    description = "Prefix each resource name with this description"
    type    = string
    default = "KALI"
}