#!/bin/bash
############################################################################
#
# NOMBRE: ej19-calcula_cambio.sh
# OBJETIVO: Uso de array para calcular el cambio en un proceso de venta
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: 
# SALIDAS: Salida del cambio correspondiente
# 
# FECHA:24/01/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################
billetes=(500 200 100 50 20 10 5 2 1)
precio=$1

if [ $# -lt 1 ]
   then
       echo "No se ha introducido el precio del artículo"
       exit 1
fi

read -p "Indique el dinero pagado: " pago
echo "Se ha comprado un artículo de $precio euros y ha pagado $pago euros"
cambio_total=$((pago - precio))
echo "El cambio son $cambio_total euros, debe entregar:"

for billete in ${billetes[@]}
do
  if [[ $billete -le $cambio_total ]]
  then
      while [[ $cambio_total -ge $billete  ]]
      do
        cantidad=1
      	cambio_total=$((cambio_total-billete))
      	echo "$cantidad billete(s) de $billete euro(s)"
      done
  fi
done

