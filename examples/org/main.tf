module "labels" {
  source        = "../../"
  name          = "CapMe"
  environment   = "Dev"
  organization  = "CorpXyZ"
  namespace-env = false
  namespace-org = true
}
