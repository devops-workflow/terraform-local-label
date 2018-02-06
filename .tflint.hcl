config {
  terraform_version = "0.11.2"
  deep_check = true

  ignore_module = {
    "devops-workflow/boolean/local" = true
  }
}
