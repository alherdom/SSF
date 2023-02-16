#!/bin/bash
############################################################################
#
# NOMBRE: media.sh
# OBJETIVO:
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=1, 1:ruta
# SALIDAS: 
#
# FECHA:24/01/2023 
# VERSIOBES: 1.0 (codigo inicial)
#
############################################################################

pelis[0]="avatar2"
pelis[1]="harrypotter"
pelis[2]="cars"
pelis[3]="avatar"
pelis[4]="sombras"

echo ""

for i in {0..1000}
do
	echo "La pelicula numero $i es ${pelis[$i]}"
done

pelis[1000]="Endgame"

echo "Los indices son ${!pelis[@]}"


declare -a coches

coches+="Ford Fiesta"
coches+="Toyota Hilux"

echo "Coches: ${coches[@]}"

coches=("Seat Leon" ${coches[@]})
echo "Coches: ${coches[@]}"






