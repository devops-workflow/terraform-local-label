module "labels" {
  source       = "../../"
  name         = "CapMe"
  environment  = "Dev"
  organization = "CorpXyZ"
  attributes   = ["8080"]
  tags         = "${map("Key", "Value")}"
}
