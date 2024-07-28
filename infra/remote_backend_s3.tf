terraform {
  backend "s3" {
    bucket = "devops-1-proj-bucket"
    key    = "devops-project-1/terraform.tfstate"
    region = "eu-central-1"
  }
}
