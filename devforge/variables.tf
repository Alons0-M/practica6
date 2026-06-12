/* variable "project_name" {
  type        = string
  description = "Nombre del proyecto"
  default     = "my-project"
}

variable "author" {
  type        = string
  description = "Autor o autora del proyecto"
}

variable "environment" {
  type        = string
  description = "Entorno de despliegue"
  default     = "dev"
}

variable "base_dir" {
  type        = string
  description = "Directorio base donde crear el proyecto"
} */

variable "projects" {
  description = "Mapa de proyectos a generar"
  type = map(object({
    author      = string
    environment = string
  }))
  default = {
    "backend-api" = {
      author      = "Tu Nombre"
      environment = "dev"
    }
    "frontend-app" = {
      author      = "Tu Nombre"
      environment = "prod"
    }
    "data-pipeline" = {
      author      = "Otro Autor"
      environment = "test"
    }
  }
}