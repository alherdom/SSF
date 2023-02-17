#!/bin/bash
############################################################################
#
# NOMBRE: ej12-multiplo.sh
# OBJETIVO: Bucle para recorrer argumentos y comprobar si es multiplo de un numero
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: 
# SALIDAS: Se verfica cada argumento si es multiplo
#
# FECHA:24/01/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################
if [ $# -eq 0 ]
then
echo "No se han indicado números para comparar"
exit
fi
read -p "Introduzca el número del que desea buscar sus múltiplos: " multiplo

for i in $@
do
  if [[ $(($i % $multiplo)) == 0 ]]	
  then
      echo "$i SÍ es multiplo de $multiplo"
  else
      echo "$i NO es multiplo de $multiplo"
  fi
done

