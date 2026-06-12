terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

/*
module "backend" {
  source       = "./modules/project"
  project_name = "backend-api"
  author       = "Tu Nombre"
  environment  = "dev"
  base_dir     = "${path.module}/output"
}

module "frontend" {
  source       = "./modules/project"
  project_name = "frontend-app"
  author       = "Tu Nombre"
  environment  = "dev"
  base_dir     = "${path.module}/output"
} */

module "projects" {
  source   = "./modules/project"
  for_each = var.projects

  project_name = each.key
  author       = each.value.author
  environment  = each.value.environment
  base_dir     = "${path.module}/output"
}