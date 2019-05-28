provider "aws" {
  region     = "${var.region["primary"]}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}
resource "aws_instance" "terransible" {
  ami           = "${lookup(var.amis, var.region["primary"])}"
  instance_type = "${lookup(var.instance_type, var.region["primary"])}"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.terransible.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}

terraform {
  backend "s3" {
    ##Partial Configuration##
  }
}