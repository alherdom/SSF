#!/bin/bash
############################################################################
#
# NOMBRE: ej19-calcula_cambio.sh
# OBJETIVO: Uso de array para calcular el cambio en un proceso de venta
# AUTOR: Javier García <javigh1903@movistar.es> Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: 
# SALIDAS: Cuantos billetes de cada tipo hay que devolver
# 
# FECHA: 17/02/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################
if [ $# -eq 0 ]
then
    echo "Se debe indicar el precio del artículo."
    exit
fi
precio=$1
billetes=(500 200 100 50 20 10 5 2 1)

read -p "Introduzca la cantidad pagada: " pagado
if [ $pagado -lt $precio ]
then
    echo "Cantidad insuficiente."
    exit
fi

resto=$(( pagado - precio ))
echo "Se ha comprado un producto de $precio€ con $pagado€."
echo "El cambio son $resto€, debe entregar:"
for billete in ${billetes[@]}
do
    cantidad=$(( resto / billete ))
    resto=$(( resto % billete ))
    if [ $cantidad -ne 0 ]
    then
        echo "$cantidad billete(s) de $billete€"
    fi
done