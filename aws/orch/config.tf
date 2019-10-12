terraform {
  backend "s3" {
    bucket = "codejamninja-terraform"
    key    = "orch.codejam.ninja/orch"
    region = "us-west-2"
  }
}
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "codejamninja-terraform"
    key    = "orch.codejam.ninja/orch"
    region = "us-west-2"
  }
}
provider "aws" {
  region = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
}
variable "region" {
  type    = "string"
  default = "us-west-2"
}
variable "name" {
  type    = "string"
  default = "_orch"
}
variable "domain" {
  type    = "string"
  default = "codejam.ninja"
}
variable "volume_size" {
  type    = "string"
  default = "40"
}
variable "instance_type" {
  type    = "string"
  default = "t2.medium"
}
variable "rancher_version" {
  type    = "string"
  default = "latest"
}
variable "docker_version" {
  type    = "string"
  default = "18.09.4-ce"
}
variable "ami" {
  type    = "string"
  default = "ami-0d554a1dd1d4ed527"
}