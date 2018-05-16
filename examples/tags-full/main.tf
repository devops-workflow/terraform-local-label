module "labels" {
  source       = "../../"
  name         = "CapMe"
  environment  = "Dev"
  organization = "CorpXyZ"
  attributes   = ["8080"]
  tags         = "${map("Key", "Value")}"
  component    = "Component A"
  monitor      = "Monitor Datadog"
  owner        = "Freddy"
  product      = "Product 1"
  service      = "Service 1"
  team         = "Backend developers"
}
