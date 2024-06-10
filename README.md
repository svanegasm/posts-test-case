# BlogApp

Este proyecto es una aplicación web de ejemplo construida con Ruby on Rails y PostgreSQL. Utiliza Docker para facilitar la configuración y la ejecución.

## Requisitos

- Docker
- Docker Compose

## Configuración y Ejecución

### Paso 1: Clonar el repositorio

```sh
git clone https://github.com/tu-usuario/blogapp.git
cd blogapp
```

### Paso 2: Construir la imagen de Docker
Construye la imagen de Docker para el servicio blogapp-web.

```sh
docker-compose build
```

### Paso 3: Ejecutar las migraciones de la base de datos

```sh
docker-compose run blogapp-web rails db:create db:migrate
```

### Paso 4: Iniciar la aplicación

```sh
docker-compose up -d
```

### Opcionales
##### Para aplicar alguna actualización en el Gemfile:
```sh
docker-compose run blogapp-web bundle install
```
##### Para acceder al Bash:
```sh
docker exec -it app_name /bin/bash
```
##### Puedes consultar app_name con el siguiente comando (aunque por defecto, debería ser: blogapp_blogapp-web_1):
```sh
docker ps
```

#### Para usar pry-rails con Docker:
Cuando ya hayas ejecutado `docker-compose up -d`, ubica el `binding.pry` donde desees revisar el código.
Luego, identificar el Container donde está corriendo el proyecto usando el comando `docker ps`.

Ejecuta el siguiente código:
```sh
docker attach ID_DEL_CONTENEDOR (Ej: 75cde1ab8133)
```
El cual se encarga de mostrar los logs en la consola donde te encuentres presente y parar el proceso donde hayas puesto el `binding.pry`.