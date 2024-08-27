terraform {
  backend "s3" {
    bucket = "terraform-project-automation"
    key    = "sahil-terraform-backup/terraform.tfstate"
    region = "us-east-1"
  }
}
