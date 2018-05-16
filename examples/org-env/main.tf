module "labels" {
  source        = "../../"
  name          = "CapMe"
  environment   = "Dev"
  organization  = "CorpXyZ"
  namespace-env = true
  namespace-org = true
}
