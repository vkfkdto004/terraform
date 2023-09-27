resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.eks_clusterrole.arn
  version  = 1.24

  vpc_config {
    subnet_ids = concat(
      [aws_subnet.eks_sub_controlplane1.id],
      [aws_subnet.eks_sub_controlplane2.id],
      [aws_subnet.eks_sub_worker1.id],
      [aws_subnet.eks_sub_worker2.id]
    )
    endpoint_private_access = true
    endpoint_public_access  = true
    security_group_ids      = [aws_security_group.team3_sg.id]
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
  ]
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eks_clusterrole" {
  name               = "eks-clusterrole1"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_clusterrole.name
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_clusterrole.name

}

# resource "aws_eks_addon" "eks_coreends" {
#   cluster_name                = aws_eks_cluster.eks_cluster.name
#   addon_name                  = "coredns"
#   addon_version               = "v1.10.1-eksbuild.2"
#   resolve_conflicts_on_create = "OVERWRITE"
# }

resource "aws_eks_addon" "eks_cni" {
  cluster_name                = aws_eks_cluster.eks_cluster.name
  addon_name                  = "vpc-cni"
  addon_version               = "v1.13.2-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"
}

# resource "aws_eks_addon" "eks_proxy" {
#   cluster_name                = aws_eks_cluster.eks_cluster.name
#   addon_name                  = "kube-proxy"
#   addon_version               = "v1.20.7-eksbuild.1"
#   resolve_conflicts_on_create = "OVERWRITE"
# }
