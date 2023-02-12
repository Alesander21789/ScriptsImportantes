#!/bin/bash

echo "Bienvenido al asistente para crear usuarios con useradd."

echo "Indique el nombre de usuario a crear:"
read username

echo "¿Desea especificar el nombre completo del usuario? (s/n)"
read fullname
if [ "$fullname" == "s" ]; then
  echo "Introduce el nombre completo del usuario:"
  read fullname_input
  fullname="-c $fullname_input"
else
  fullname=""
fi

echo "¿Desea establecer una contraseña para el usuario? (s/n)"
read password
if [ "$password" == "s" ]; then
  password="-p $(openssl passwd -1)"
else
  password=""
fi

echo "¿Desea establecer un directorio home personalizado para el usuario? (s/n)"
read home_dir
if [ "$home_dir" == "s" ]; then
  echo "Introduce el directorio home personalizado para el usuario:"
  read home_dir_input
  home_dir="-d $home_dir_input"
else
  home_dir="-m"
fi

echo "¿Desea agregar el usuario a un grupo existente? (s/n)"
read addgroup
if [ "$addgroup" == "s" ]; then
  echo "Introduce el nombre del grupo:"
  read groupname
  addgroup="-g $groupname"
else
  addgroup=""
fi

useradd $username $fullname $password $home_dir $addgroup