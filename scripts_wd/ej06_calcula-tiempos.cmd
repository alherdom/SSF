echo off
REM *******************************************************
REM NOMBRE: ej06-calcula_tiempos.cmd
REM OBJETIVO: Cantidad de DIAS HORAS y MINUTOS en determinados segundos
REM AUTOR: Alejandro Hdez <alejandrohd1@live.com>
REM
REM ENTRADAS: 1
REM SALIDAS: 4
REM
REM COMENTARIOS:
REM VERSION: 1.0 (2023-01-27)
REM
REM ********************************************************
title calcula_tiempos

set/A dias = %1 / 86400
set/A rest_dias = %1 - (%dias% * 86400)
set/A horas = %rest_dias% / 3600
set/A rest_horas = %rest_dias% %% 3600
set/A minutos = %rest_horas% / 60
set/A segundos = %rest_horas% %% 60

echo %1 segundos son %dias% dias, %horas% horas, %minutos% minutos y %segundos% segundos.
