module "labels" {
  source       = "../../"
  name         = "CapMe"
  environment  = "Dev"
  organization = "CorpXyZ"
  attributes   = ["role", "policy", "use", ""]
}
