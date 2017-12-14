
module "labels" {
  source        = "../"
  name          = "CapMe"
  environment   = "Dev"
  organization  = "CorpXyZ"
}

/*
module "labels-disabled" {
  source        = "../"
  name          = "CapMe"
  environment   = "Dev"
  organization  = "CorpXyZ"
  enabled       = false
}
*/

module "labels-env" {
  source        = "../"
  name          = "CapMe"
  environment   = "Dev"
  organization  = "CorpXyZ"
  namespace-env = true
  namespace-org = false
}
module "labels-org" {
  source        = "../"
  name          = "CapMe"
  environment   = "Dev"
  organization  = "CorpXyZ"
  namespace-env = false
  namespace-org = true
}
module "labels-org-env" {
  source        = "../"
  name          = "Application"
  environment   = "Environment"
  organization  = "Organization"
  namespace-env = true
  namespace-org = true
}
