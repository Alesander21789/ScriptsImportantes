#!/bin/bash

echo "Bienvenido al asistente para crear usuarios con adduser."

echo "Indique el nombre de usuario a crear:"
read username

echo "¿Desea especificar el nombre completo del usuario? (s/n)"
read fullname
if [ "$fullname" == "s" ]; then
  echo "Introduce el nombre completo del usuario:"
  read fullname_input
  fullname="--gecos $fullname_input"
else
  fullname=""
fi

echo "¿Desea establecer una contraseña para el usuario? (s/n)"
read password
if [ "$password" == "s" ]; then
  password="--password $(openssl passwd -1)"
else
  password=""
fi

echo "¿Desea agregar el usuario a un grupo existente? (s/n)"
read addgroup
if [ "$addgroup" == "s" ]; then
  echo "Introduce el nombre del grupo:"
  read groupname