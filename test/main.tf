
module "labels" {
  source        = "../"
  name          = "CapMe"
  environment   = "Dev"
  organization  = "CorpXyZ"
  namespace-org = true
  #attributes    = ["role", "policy", "use", ""]
  attributes    = ["8080"]
  tags          = "${map("Key", "Value")}"
}

/*
module "labels-tags" {
  source        = "../"
  name          = "CapMe"
  environment   = "Dev"
  organization  = "CorpXyZ"
  attributes    = ["role", "policy", "use", ""]
  tags          = "${map("Key", "Value")}"
}

/* Need to fix outputs for when resources don't exist
module "labels-disabled" {
  source        = "../"
  name          = "CapMe"
  environment   = "Dev"
  organization  = "CorpXyZ"
  enabled       = false
}
/*

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
*/
