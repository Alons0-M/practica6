/* output "rutas_proyectos" {
  value = [
    module.backend.project_path,
    module.frontend.project_path
  ]
} */

output "all_project_paths" {
  description = "Rutas de todos los proyectos generados"
  value = {
    for name, project in module.projects : name => project.project_path
  }
}