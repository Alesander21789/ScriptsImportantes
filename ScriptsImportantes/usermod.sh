#!/bin/bash

echo "Bienvenido al asistente para modificar usuarios con usermod."

echo "Indique el nombre de usuario a modificar:"
read username

echo "¿Desea cambiar el nombre completo del usuario? (s/n)"
read fullname
if [ "$fullname" == "s" ]; then
  echo "Introduce el nuevo nombre completo del usuario:"
  read fullname_input
  fullname="-c $fullname_input"
else
  fullname=""
fi

echo "¿Desea cambiar la contraseña del usuario? (s/n)"
read password
if [ "$password" == "s" ]; then
  password="-p $(openssl passwd -1)"
else
  password=""
fi

echo "¿Desea cambiar el directorio home del usuario? (s/n)"
read home_dir
if [ "$home_dir" == "s" ]; then
  echo "Introduce el nuevo directorio home para el usuario:"
  read home_dir_input
  home_dir="-d $home_dir_input"
else
  home_dir=""
fi

echo "¿Desea cambiar el grupo principal del usuario? (s/n)"
read addgroup
if [ "$addgroup" == "s" ]; then
  echo "Introduce el nombre del nuevo grupo principal:"
  read groupname
  addgroup="-g $groupname"
else
  addgroup=""
fi

usermod $username $fullname $password $home_dir $addgroup