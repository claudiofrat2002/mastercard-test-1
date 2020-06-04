terraform {
  backend "s3" {
  # settings defined in backend/{env}.conf
  }
}

provider "aws" {
  region = "${var.region}"
}
