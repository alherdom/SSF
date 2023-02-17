echo off
REM *******************************************************
REM NOMBRE: ej05-calcula_segundos.cmd
REM OBJETIVO: Cantidad de segundos en DIAS HORAS y MINUTOS
REM AUTOR: Alejandro Hdez <alejandrohd1@live.com> Javier García <javigh1903@movistar.es>
REM
REM ENTRADAS: 4
REM SALIDAS: 1
REM
REM COMENTARIOS:
REM FECHA: 17/02/2023
REM VERSION: 1.0
REM
REM ********************************************************
title Calculando Segundos
set/A dias_seg = %1 * 86400 
set/A horas_seg =%2 * 3600
set/A min_seg = %3 * 60

set/A total_seg = %dias_seg% + %horas_seg% + %min_seg% + %4
echo %1 dias, %2 horas, %3 minutos y %4 segundos son %total_seg% segundos.
