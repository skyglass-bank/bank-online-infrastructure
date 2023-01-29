module "jenkins" {
  source = "./module-jenkins"

  region                 = var.aws_region
  author                 = "skyglass"
  environment            = var.environment
  public_key             = "../../ssh-jenkins.pub"
  hosted_zone_id         = "Z00391621ABLUKSLON5HM"
  domain_name            = "greeta.net"
  jenkins_username       = "admin"
  jenkins_password       = "admin"
  jenkins_credentials_id = "jenkins-slaves"
  ssl_certificate_arn    = var.ssl_certificate_arn
}

module "eks" {
  source = "./module-eks"

  region                 = var.aws_region
  author                 = "skyglass"
  cluster_name           = var.cluster_name
}

module "helm-addons" {
  source                                           = "./module-helm-addons"

  region                                           = var.aws_region
  environment                                      = var.environment
  domain_name                                      = "greeta.net"
  cluster_id                                       = module.eks.cluster_id
  cluster_name                                     = module.eks.cluster_name
  vpc_id                                           = module.eks.vpc_id
  vpc_cidr_block                                   = module.eks.vpc_cidr_block
  vpc_public_subnets                               = module.eks.vpc_public_subnets
  ssl_certificate_arn                              = var.ssl_certificate_arn
}