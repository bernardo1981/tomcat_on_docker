# Configurar el proveedor de Docker
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

# Crear una imagen de Docker
resource "docker_image" "tomcat" {
  name         = "tomcat:latest"
  keep_locally = false
}

# Crear un contenedor de Docker
resource "docker_container" "tomcat_container" {
  image = docker_image.tomcat.image_id
  name  = "tomcat_server"
  ports {
    internal = 8080
    external = 8080
  }
}