#!/bin/bash

echo "Bienvenido al asistente para crear usuarios con useradd."

echo "Introduce el nombre de usuario:"
read username

echo "Introduce el nombre completo del usuario:"
read fullname

echo "Introduce la contraseña para el usuario:"
read -s password

echo "Introduce el directorio home para el usuario:"
read home_dir

echo "Introduce el nombre del grupo principal para el usuario:"
read groupname

useradd -m -c "$fullname" -d "$home_dir" -g "$groupname" -p "$password" $username