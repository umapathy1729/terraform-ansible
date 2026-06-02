# resource "aws_iam_role" "eks_role" {
#   name = "eks-cluster-role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Effect    = "Allow"
#       Principal = { Service = "eks.amazonaws.com" }
#       Action    = "sts:AssumeRole"
#     }]
#   })
# }

# resource "aws_iam_role_policy_attachment" "eks_policy" {
#   role       = aws_iam_role.eks_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
# }

# # EKS Cluster
# resource "aws_eks_cluster" "main" {
#   name     = var.cluster_name
#   role_arn = aws_iam_role.eks_role.arn
#
#   vpc_config {
#     subnet_ids = data.aws_subnets.default.ids
#   }
#
#   depends_on = [
#     aws_iam_role_policy_attachment.eks_policy
#   ]
# }

# # Node Role
# resource "aws_iam_role" "node_role" {
#   name = "eks-node-role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Effect    = "Allow"
#       Principal = { Service = "ec2.amazonaws.com" }
#       Action    = "sts:AssumeRole"
#     }]
#   })
# }

# resource "aws_iam_role_policy_attachment" "node_1" {
#   role       = aws_iam_role.node_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
# }

# resource "aws_iam_role_policy_attachment" "node_2" {
#   role       = aws_iam_role.node_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
# }

# resource "aws_iam_role_policy_attachment" "node_3" {
#   role       = aws_iam_role.node_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
# }

# # Worker Nodes
# resource "aws_eks_node_group" "workers" {
#   cluster_name    = aws_eks_cluster.main.name
#   node_group_name = "workers"
#   node_role_arn   = aws_iam_role.node_role.arn
#   subnet_ids      = data.aws_subnets.default.ids
#   instance_types  = [var.node_instance_type]
#
#   scaling_config {
#     desired_size = 2
#     max_size     = 3
#     min_size     = 1
#   }
#
#   depends_on = [
#     aws_iam_role_policy_attachment.node_1,
#     aws_iam_role_policy_attachment.node_2,
#     aws_iam_role_policy_attachment.node_3,
#   ]
# }




# outputs.tf
#-----------


#output "jenkins_ip" {
# value = aws_instance.jenkins.public_ip
#}

#output "devops_tools_ip" {
# value = aws_instance.devops_tools.public_ip
#}

#output "s3_bucket" {
# value = aws_s3_bucket.app_bucket.bucket
#}

#output "cloudfront_url" {
# value = aws_cloudfront_distribution.cdn.domain_name
#}

#output "eks_endpoint" {
# value = aws_eks_cluster.main.endpoint
#}

#output "eks_cluster_name" {
#  value = aws_eks_cluster.main.name
#}














