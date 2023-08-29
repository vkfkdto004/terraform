resource "aws_key_pair" "wskim_ssh" {
    key_name = "wskim"
    public_key = "ssh-rsa <ssh_key>"

resource "aws_key_pair" "wskim1_ssh" {
  key_name = "wskim1"
  public_key = file("../../users/kimwo/.ssh/wskim.pub")
}
