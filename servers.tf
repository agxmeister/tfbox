resource "aws_instance" "test-ec2-instance" {
  ami = "ami-0f409bcea498f272d"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.root.key_name}"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
  subnet_id = "${aws_subnet.subnet-uno.id}"
}

resource "aws_key_pair" "root" {
  key_name = "root-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
