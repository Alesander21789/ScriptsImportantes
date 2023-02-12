#!/bin/bash

# Función para mostrar el menú de opciones
show_menu() {
  clear
  echo "Menú de opciones de fdisk:"
  echo "1) Mostrar información de particiones"
  echo "2) Montar una partición"
  echo "3) Desmontar una partición"
  echo "4) Crear una nueva tabla de particiones"
  echo "5) Modificar una partición existente"
  echo "6) Eliminar una partición"
  echo "7) Redimensionar una partición"
  echo "8) Verificar el estado de una partición"
  echo "9) Formatear una partición"
  echo "10) Salir del script"
}

# Función para mostrar la información de las particiones
show_partition_info() {
  echo "Información de particiones:"
  fdisk -l
}

# Función para montar una partición
mount_partition() {
  echo "Montar una partición:"
  read -p "Ingrese la ruta de la partición (ej. /dev/sda1): " partition
  read -p "Ingrese la ruta del punto de montaje (ej. /mnt/data): " mount_point
  mount $partition $mount_point
}

# Función para desmontar una partición
umount_partition() {
  echo "Desmontar una partición:"
  read -p "Ingrese la ruta del punto de montaje (ej. /mnt/data): " mount_point
  umount $mount_point
}

# Función para crear una nueva tabla de particiones
create_partition_table() {
  echo "Crear una nueva tabla de particiones:"
  read -p "Ingrese la ruta del dispositivo (e.g. /dev/sda): " device
  fdisk $device
}

# Función para modificar una partición existente
modify_existing_partition() {
  echo "Modificar una partición existente:"
  read -p "Ingrese la ruta de la partición (ej. /dev/sda1): " partition
  fdisk $partition
}

# Función para eliminar una partición
delete_partition() {
  echo "Eliminar una partición:"
  read -p "Ingrese la ruta de la partición (ej. /dev/sda1): " partition
  fdisk $partition
}

# Función para redimensionar una partición
resize_partition() {
  echo "Redimensionar una partición:"
  read -p "Ingrese la ruta de la partición (ej. /dev/sda1): " partition
  echo "Nota: para redimensionar una partición, es necesario tener instalado el paquete 'parted'"
  echo "Ejecute el siguiente comando para instalarlo: sudo apt-get install parted"
  parted $partition
}

# Función para verificar el estado de una partición
check_partition_status() {
  echo "Verificar el estado de una partición:"
  read -p "Ingrese la ruta de la partición (e.g. /dev/sda1): " partition
  echo "Ejecute el siguiente comando para verificar el estado de la partición: sudo fsck $partition"
  fsck $partition
}

# Función para formatear una partición
format_partition() {
  echo "Formatear una partición:"
  read -p "Ingrese la ruta de la partición (e.g. /dev/sda1): " partition
  echo "Ejecute el siguiente comando para formatear la partición: sudo mkfs.<filesystem_type> $partition"
  echo "Reemplace <filesystem_type> con el tipo de sistema de archivos que desea utilizar (e.g. ext4, ntfs, etc.)"
  mkfs.<filesystem_type> $partition
}

# Función para ver información detallada de una partición
ver_informacion_particion () {
  echo "Introduce el dispositivo de la partición (por ejemplo, /dev/sda):"
  read dispositivo

  echo "Introduce el número de la partición (por ejemplo, 1):"
  read numero_particion

  # Usamos "lsblk" para ver información detallada de la partición
  lsblk $dispositivo$numero_particion -o NAME,SIZE,FSTYPE,MOUNTPOINT
}

# Función para verificar la integridad de una partición
verificar_integridad_particion () {
  echo "Introduce el dispositivo de la partición (por ejemplo, /dev/sda):"
  read dispositivo

  echo "Introduce el número de la partición (por ejemplo, 1):"
  read numero_particion

  # Usamos "fsck" para verificar la integridad de la partición
  sudo fsck $dispositivo$numero_particion
}
# Función para verificar y reparar errores en una partición
verificar_reparar_errores_particion () {
  echo "Introduce el dispositivo de la partición (por ejemplo, /dev/sda):"
  read dispositivo

  echo "Introduce el número de la partición (por ejemplo, 1):"
  read numero_particion

  # Usamos "fsck" para verificar y reparar errores en la partición
  sudo fsck -y $dispositivo$numero_particion
}
# Función para verificar el espacio libre en una partición
verificar_espacio_libre_particion () {
  echo "Introduce el dispositivo de la partición (por ejemplo, /dev/sda):"
  read dispositivo

  echo "Introduce el número de la partición (por ejemplo, 1):"
  read numero_particion

  # Usamos "df" para verificar el espacio libre en la partición
  sudo df -h $dispositivo$numero_particion
}

# Función para crear una partición primaria o extendida
crear_particion () {
  echo "Introduce el dispositivo de la partición (por ejemplo, /dev/sda):"
  read dispositivo

  # Iniciamos fdisk para crear la partición
  sudo fdisk $dispositivo

  echo "Presiona 'n' para crear una nueva partición, luego elige 'p' para partición primaria o 'e' para partición extendida."
  echo "Siguiendo las instrucciones que se muestran en pantalla, introduce los valores de inicio y tamaño de la partición."
  echo "Finalmente, presiona 'w' para escribir los cambios en el disco y salir de fdisk."
  echo "Recuerda que debes tener precaución al crear particiones ya que esto puede provocar pérdida de datos."
}

# Función para convertir una partición primaria en extendida o viceversa
convertir_particion () {
  echo "Introduce el dispositivo de la partición (por ejemplo, /dev/sda):"
  read dispositivo

  # Iniciamos fdisk para convertir la partición
  sudo fdisk $dispositivo

  echo "Presiona 't' para cambiar el tipo de partición."
  echo "Elige el número de la partición que deseas convertir."
  echo "Introduce el código correspondiente al tipo de partición que deseas convertir, por ejemplo '5' para partición extendida o '83' para partición primaria Linux."
  echo "Finalmente, presiona 'w' para escribir los cambios en el disco y salir de fdisk."
  echo "Recuerda que debes tener precaución al convertir particiones ya que esto puede provocar pérdida de datos."
}







# Menú principal
while true; do
  echo "------------------------------"
  echo "Menu de opciones para fdisk"
  echo "------------------------------"
  echo "1) Mostrar información de particiones"
  echo "2) Montar una partición"
  echo "3) Desmontar una partición"
  echo "4) Crear una nueva tabla de particiones"
  echo "5) Modificar una partición existente"
  echo "6) Eliminar una partición"
  echo "7) Redimensionar una partición"
  echo "8) Verificar el estado de una partición"
  echo "9) Formatear una partición"
  echo "16) Salir del script"
  echo "10) Ver información detallada de una partición"
echo "11) Verificar la integridad de una partición"
echo "12) Verificar y reparar errores en una partición"
echo "13) Verificar el espacio libre en una partición"
echo "14) Crear una partición primaria o extendida"
echo "15) Convertir una partición primaria en extendida o viceversa"
  read -p "Seleccione una opción [1-16]: " option
  case $option in
    1) show_partition_info;;
    2) mount_partition;;
    3) umount_partition;;
    4) create_partition_table;;
    5) modify_existing_partition;;
    6) delete_partition;;
    7) resize_partition;;
    8) check_partition_status;;
    9) format_partition;;
    10) ver_informacion_particion ;;
  11) verificar_integridad_particion ;;
  12) verificar_reparar_errores ;;
  13) verificar_espacio_libre ;;
  14) crear_particion_primaria_extendida ;;
  15) convertir_particion_primaria_extendida ;;
    
    16) break;;
    *)



