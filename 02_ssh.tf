resource "aws_key_pair" "wskim_ssh" {
    key_name = "wskim"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYSCeu5uoh3Jas8ZFG25d5gV5rFN3PNxPSjmDWTbZCq+2EHiPCl1ZXYU92VZxhrYF1Uj30d5a35bOjDKAT8NFkLeUikcTYfLa+uDzyDoW+tf8Li11xaP/qcLzyictEE7eNAhktdhzlIzbh+xtSsVVlYXbS6+8+qABH3Ul95gqfeksrxae6RPNHYy3ueadnI6UZGt4arfdhKz7XU2q4znEFSQFC4+yvw0YIxcQ6qfeBSW8NPkpivHlfk+9uQqVFKYgEA3lr10P12QGSQoRP6B+ATVpkJtEg0Qa1zS0l41X8luqGDPLYy7F7qSKreg5naOkH2f0z6HoyhUP3rFIe4/U24Ypnu4e6CntrGwPLtBMj/ATYRZ0iWGt38U9TKMdFxalLViXxfqoxhS746osr+xMsnUz3pqeLkS+eUAZC5x8zTPVqy4CbrkiiWgn3UDcDffFNYV1hjD9tooK11wxZE6CDBzc3Ko2XQwzbV6LjvrfymWHWoxN251IajeIqFqdBEbc="
}

resource "aws_key_pair" "wskim1_ssh" {
  key_name = "wskim1"
  public_key = file("../../users/kimwo/.ssh/wskim.pub")
}