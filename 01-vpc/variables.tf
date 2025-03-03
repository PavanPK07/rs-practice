variable "cidr_block"{
    type = string
    default = "10.0.0.0/16"
}

variable "common_tags"{
    type = map
    default = {}
}

variable "vpc_tags"{
    type = map
    default = {}
}

variable "igw_tags"{
    type = map
    default = {}
}

variable "project_name"{
    default = "Roboshop"
}

variable "enviroment"{
    default = "dev"
}

variable "public_subnets_cidr" {
  type = list
  validation {
    condition = length(var.public_subnets_cidr) == 2
    error_message = "Please give 2 public valid subnet CIDR"
  }
}


variable "public_subnet_tags"{
    type = map
    default = {}
}