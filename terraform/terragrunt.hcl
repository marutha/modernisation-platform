# parent terragrunt.hcl
locals {
  child_var_file = "${get_terragrunt_dir()}/terragrunt_vars.hcl" # reading terragrunt variables from terragrunt_vars.hcl in a child directory
  vars = read_terragrunt_config(local.child_var_file)
  aws_region = "eu-west-2"
  parent_common_yaml = yamldecode(file("${get_parent_terragrunt_dir()}/common.yml")) # reading terragrunt variables from common.yml in a parent directory
}
remote_state {
  backend = "s3"
  generate = {
    path      = "terragrunt_backend.tf"
    #if_exists = "skip"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "modernisation-platform-terraform-state"
    acl    = "bucket-owner-full-control"
    encrypt        = true
    key = "terraform.tfstate"
    //workspace_key_prefix = "${path_relative_to_include()}"
    workspace_key_prefix = local.vars.locals.prefix # prefix variable from terragrunt_vars.hcl in a child directory
    region         = local.aws_region # aws_region variable defined as a local in this terragrunt configuration
    dynamodb_table = local.parent_common_yaml.dynamodb_table # dynamodb_table variable from common.yml in a parent directory
  }
}
terraform {
  extra_arguments "common_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh"
    ]

    arguments = [
      "-var-file=${get_parent_terragrunt_dir()}/common.tfvars" # passing common variables as a var-file when running terragrunt (which runs terraform) commnand into terraform
    ]
  }
}