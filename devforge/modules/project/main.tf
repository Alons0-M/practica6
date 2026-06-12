terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

locals {
  project_dir       = "${var.base_dir}/${var.project_name}"
  gitignore_content = ".env\nnode_modules/\n*.log\n"
}

resource "local_file" "readme" {
  filename = "${local.project_dir}/README.md"
  content  = "# Proyecto: ${var.project_name}\n\nAutor: ${var.author}\nEntorno: ${upper(var.environment)}\n"
}
//Usar ${var.variable} para coger nombres de variables de variables.tf

resource "local_file" "gitignore" {
  filename = "${local.project_dir}/.gitignore"
  content  = local.gitignore_content
}

resource "local_file" "src_keep" {
  filename = "${local.project_dir}/src/.keep"
  content  = ""
}

resource "local_file" "tests_keep" {
  filename = "${local.project_dir}/tests/.keep"
  content  = ""
}

resource "local_file" "docs_index" {
  filename = "${local.project_dir}/docs/index.md"
  content  = "# Documentación de ${var.project_name}\n"
}