echo off
REM *******************************************************
REM NOMBRE: ej07-compara.cmd
REM OBJETIVO: Comparar dos numeros
REM AUTOR: Alejandro Hdez <alejandrohd1@live.com> Javier García <javigh1903@movistar.es>
REM
REM ENTRADAS: 2
REM SALIDAS: 1
REM
REM COMENTARIOS:
REM FECHA: 17/02/2023
REM VERSION: 1.0
REM
REM ********************************************************
title Comparando
if "%1"=="" ( set /p num1="Introduzca el primer numero:" ) else ( set num1=%1 )
if "%2"=="" ( set /p num2="Introduzca el segundo numero: " ) else ( set num2=%2 )

if %num1% GTR %num2% ( echo %num1% es mayor que %num2% )
if %num1% LSS %num2% ( echo %num1% es menor que %num2% )
if %num1% EQU %num2% ( echo %num1% es igual que %num2% )