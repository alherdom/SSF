#!/bin/bash
############################################################################
#
# NOMBRE: ej15-rectangulo.sh
# OBJETIVO: Uso de bucles para pintar un rectángulo en la terminal
# AUTOR: Javier García <javigh1903@movistar.es> Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: 
# SALIDAS: Pintado del rectángulo con la altura y base correspondiente
#
# FECHA:24/01/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################
if [ $# -eq 1 ]
  then
  altura=4
  echo "No existe altura, se establce altura = $altura"
elif [ $# -eq 0 ]
  then
  base=7
  altura=4
  echo "No existen argumentos, se establece base = $base y altura = $altura"
else
  base=$1
  altura=$2
fi

echo "Vamos a pintar un rectángulo de base: $base, altura: $altura, area: $((base * altura))"
for ((j=0;j<$altura;j++))
do
  for ((i=1;i<$base;i++))
  do
	echo -n "#"
  done
  echo "#"
done

