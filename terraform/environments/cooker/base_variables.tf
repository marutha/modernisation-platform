variable "networking" {

  type = list(any)

}
# this is going to be read from the common.tfvars in the parent directory and set in providers.tf in the child directory
variable region {
  description = "AWS region where the resources will be located"
}
# this is going to be read from the terragrunt.hcl in the child directory as an input
variable application_name {
  description = "Name of the application"
}