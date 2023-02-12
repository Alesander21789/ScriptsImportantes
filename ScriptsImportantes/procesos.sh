#!/bin/bash

PS3="Elija un proceso para detener: "

select process in $(ps -ef | awk '{print $8}' | sort | uniq)
do
  if [ -n "$process" ]; then
    read -p "¿Está seguro de que desea detener el proceso $process? (y/n) " confirmation
    if [ "$confirmation" = "y" ]; then
      kill $(pgrep $process)
      echo "El proceso $process ha sido detenido."
      break
    else
      break
    fi
  else
    echo "No se ha seleccionado un proceso válido."
    break
  fi
done