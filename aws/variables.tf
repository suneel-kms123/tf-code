#these vaiables can have input from the command line as well 

variable "region" {
    description = "Name of region"
    default = "ap-south-1"
    type = string
}

variable "ami" {
    description = "Name of amazom machine images"
    default = "ami-03f4878755434977f"
    type = string
}

variable "instance_type" {
    description = "type of instance"
    default = "t2.micro"
    type = string
}

variable "db_name" {
    description = "Name of database"
    type = string
}

variable "db_user" {
    description = "database user name"
    type = string
}

variable "db_pass" {
    description = "database password"
    type = string
}