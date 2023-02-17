#!/bin/bash
############################################################################
#
# NOMBRE: ej18-arrays.sh
# OBJETIVO: Generar array a partir de argumentos
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: 
# SALIDAS: Salida de array datos con las características marcadas
# y MIN, MAX y MEDIA de los datos del nuevo array.
# FECHA:24/01/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################
argumentos=("$@")
declare -a datos
echo "Se han recibido $# argumentos: ${argumentos[@]}"
# Constructor del array datos:
for argumento in ${argumentos[@]}
do
  if [[ $(($argumento % 2)) == 0 ]] && [[ argumento -ge 0 ]]
  then
      datos=("$argumento" "${datos[@]}")
      echo "$argumento se inserta por el PRINCIPIO porque es PAR"
  elif [[ $(($argumento % 2)) == 1 ]] && [[ argumento -ge 0 ]]
  then
      datos+=("$argumento")
      echo "$argumento se inserta por el FINAL porque es IMPAR"
  else
      echo "Se ignora el valor $argumento por ser negativo"
  fi
done
echo "Array construido (${#datos[@]} elementos): ${datos[@]}"
# Calculo de MIN, MAX y MEDIA:
sum=0
max=$datos[0]
min=$datos[0]
for dato in ${datos[@]}
do
  sum=$(($sum+$dato))
  if [[ $dato < $min  ]]
  then
      min=$dato
  elif [[ $dato > $max  ]]
      max=$dato
  fi
done
# Echo por pantalla de los resultados finales:
media=$(bc <<< "scale=2; $sum / ${#datos[@]}")
echo "MIN:$min, MAX:$max, MEDIA:$media"
