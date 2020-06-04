# Global
variable region      { default = "eu-west-1"}
variable project     { default = "hello-world-test" }
variable environment {}
variable aws_account {}

variable description    { default = "Managed by Terraform" }

#rds
variable vpc_id             {}
variable "ebs_subnet_ids" { }
variable "cidr_block" {
  type    = "list"
}