
variable "project_name" {
    type = string
    default = "App"
}
variable "env" {
    type = string
    default = "Dev"
}

variable "vpc_id" {
    type = string
    description = "The VPC Name"
    default = ""
}