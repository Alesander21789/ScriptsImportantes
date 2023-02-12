#!/bin/bash

echo "¿Qué opciones desea usar con el comando mount?"
echo "1) -t <filesystem_type>"
echo "2) -o <options>"
echo "3) -n"
echo "4) -r"
echo "5) -v"
echo "6) -w"
echo "7) --bind"
echo "8) --move"
echo "9) --make-private"
echo "10) --make-slave"

read -p "Ingrese un número para seleccionar la opción deseada: " option

case "$option" in
  1)
    echo "La opción -t especifica el tipo de sistema de archivos que se va a montar."
    echo "Por ejemplo, se puede usar -t ext4 para montar un sistema de archivos ext4."
    ;;
  2)
    echo "La opción -o especifica opciones adicionales para el montaje."
    echo "Por ejemplo, -o rw permite lectura y escritura, -o nosuid desactiva los setuid y setgid bits y -o nodev desactiva los dispositivos especiales."
    ;;
  3)
    echo "La opción -n no monta el sistema de archivos, solo valida la sintaxis y muestra la información del montaje."
    ;;
  4)
    echo "La opción -r monta el sistema de archivos en modo de solo lectura."
    ;;
  5)
    echo "La opción -v es modo verboso, muestra información adicional sobre el proceso de montaje."
    ;;
  6)
    echo "La opción -w monta el sistema de archivos en modo de lectura y escritura."
    ;;
  7)
    echo "La opción --bind monta una parte del sistema de archivos en otro punto en el sistema de archivos."
    ;;
  8)
    echo "La opción --move desmonta un sistema de archivos previamente montado y lo monta en un nuevo punto en el sistema de archivos."
    ;;
  9)
    echo "La opción --make-private hace que el sistema de archivos montado sea privado y no se herede por procesos hijos."
    ;;
  10)
    echo "La opción --make-slave hace que el sistema de archivos montado sea esclavo y no tenga un sistema de archivos raíz propio."
    ;;
  *)
    echo "Opción inválida. Por favor ingrese un número de