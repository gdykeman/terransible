variable "region" {
    type = "map"
    default {
        "primary" = "us-east-1"
        "secondary" = "us-east-2"
    }

}

variable "aws_access_key" {
    description = "Access Key for AWS"
}

variable "aws_secret_key" {
    description = "Secret Key for AWS"
}

variable "amis" {
    type = "map"
    default = {
        "us-east-1" = "ami-b374d5a5"
        "us-west-2" = "ami-4b32be2b"
    }
}

variable "instance_type" {
    type = "map"
    default = {
        "us-east-1" = "t2.micro"
        "us-west-2" = "t2.micro"
    }
}

