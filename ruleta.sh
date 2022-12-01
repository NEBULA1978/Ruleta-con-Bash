#!/bin/bash

function controlC(){
    # Parametro -epara que me aplique los saltos de linea
    echo -e "\n\n[!] Saliendo...\n"
  # Codigo de estado no exitoso
    exit 1  
}

# controlC
# Para capturr el atajo de teclado que acabo de escribir y redirijirlo a la funcion controlC
trap controlC INT

# Si no ccomento se ejecuta despues de 10 segundos
# sleep 10

#///////////////////////////////////////////
#///////////////////////////////////////////

function helpPanel(){
  echo -e "\n[!] Ayuda\n"
  exit 1
}


while getopts "m:t:h" arg; do
  case $arg in
    m) money=$OPTARG;;
    t) technique=$OPTARG;;
    # Cuando falle la opcion vamos a la  funcion panel de ayuda
    h) helpPanel;;
  
  esac
done

if [ $money ] && [ $technique ]; then
  echo "Voy a jugar con $money dinero usando la tecnica $technique"
else
# Llamamos al panel de ayuda si me equivo al introducir parametros
  helpPanel
fi