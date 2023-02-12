#!/bin/bash

# Comprobar si Git está instalado
if ! [ -x "$(command -v git)" ]; then
  # Instalar Git
  sudo apt-get update
  sudo apt-get install git -y
fi

# Eliminar el repositorio local si ya existe
if [ -d "$1/.git" ]; then
  rm -rf $1/.git
fi

# Solicitar información del usuario
#read -p "Introduce tu correo electrónico: " email
#read -p "Introduce tu nombre de usuario: " name

# Configurar la identidad del usuario globalmente
#git config --global user.email sanderfene21789@gmail.com
#git config --global user.name "alesander"

# Añadir variable de entorno para la carpeta de trabajo segura
#git config --global --add safe.directory $1

# Solicitar la URL del repositorio remoto
read -p "Introduce la URL del repositorio remoto: " repo_url

# Inicializar el repositorio local
cd $1
git init

# Añadir todos los archivos al repositorio
git add .

# Hacer un commit inicial
read -p "Introduce el mensaje de commit inicial: " message
git commit -m "$message"

# Vincular el repositorio local con el remoto
git remote add origin $repo_url

# Subir los cambios al repositorio remoto
read -p "Introduce tu contraseña de GitHub: " -s password
echo "$password" | git push -u origin master