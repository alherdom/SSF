#!/bin/bash

if [ $# -lt 2 ] ; then
echo 'Error 100'
exit 100
else
limit_CPU=$1
limit_Mem=$2
fi

if ! [[ $1 -ge 0 ]] || ! [[ $2 -ge 0 ]] ; then
echo 'Error 200'
exit 200
fi

if ! [ $2 -le 100 ] ; then
echo 'Error 150'
exit 150
fi

PID_Proceso_CPU=$(ps -eo pid --sort=-%cpu h | head -n 1)
PID_Proceso_MEM=$(ps -eo pid --sort=-%mem h | head -n 1)

CPU_load=$(ps -eo %cpu --sort=-%cpu h | head -n 1)
MEM_load=$(ps -eo %mem --sort=-%mem h | head -n 1)


if [ $CPU_load -gt $limit_CPU ] ; then
echo "La carga $CPU_load esta por debajo del limite $limit_CPU"
fi 
