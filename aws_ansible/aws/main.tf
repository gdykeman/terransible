provider "aws" {
  region     = "${var.region["primary"]}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region["primary"])}"
  instance_type = "${lookup(var.instance_type, var.region["primary"])}"

  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  # }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}