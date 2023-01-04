# child terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}
locals {
  parent_common_json = jsondecode(file(find_in_parent_folders("common.json")))
}
inputs = {
  application_name = "cooker" # this is going to be passed to terraform and will be available as a var in terraform
}
terraform {
  before_hook "before_hook" {
    commands     = ["plan"]
    execute      = ["echo", local.parent_common_json.plan_message, path_relative_to_include()]
  }
}
generate "provider" {
  path = "terragrunt_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
// This file was generated with terragrunt and will be overwritten with terragrunt
provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::0123456789:role/terragrunt"
  }
}
EOF
}