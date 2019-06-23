config {
  terraform_version = "0.12.2"
  deep_check = true

  ignore_module = {
    "devops-workflow/boolean/local" = true
  }
}
