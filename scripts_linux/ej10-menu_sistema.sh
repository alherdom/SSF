#!/bin/bash
############################################################################
#
# NOMBRE: ej10-menu_sistema.sh
# OBJETIVO: Uso de menu para ejecutar una serie de comandos
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=1, 1:ruta
# SALIDAS: Comando selecionado
#
# FECHA:24/01/2023 
# VERSIOBES: 1.0 (codigo inicial)
#
############################################################################

PS3="Selecionar la opción: "
opciones=("porlibre" "tamlibre" "usuario" "maquina" "usuarios" "espacio" "salir")

select opcion in "${opciones[@]}"
do
case $opcion in
         porlibre) echo $(df -h)
         ;;        
         tamlibre) echo "El resultado  $num1 - $num2 es $((num1 - num2))"
         ;;
         usuario) echo "El resultado  $num1 / $num2 es $((num1 / num2))"
         ;;
         maquina)  echo "El resultado  $num1 * $num2 es $((num1 * num2))"
         ;;
         usuarios) echo "El resultado $num1 % $num2 es $((num1 % num2))"
         ;;
         espacio) echo "El resultado $num1 ** $num2 es $((num1 ** num2))"
         ;;
         salir) break
         ;;
         *) echo "Error, selecione una opcion correcta"
esac
done
fi

