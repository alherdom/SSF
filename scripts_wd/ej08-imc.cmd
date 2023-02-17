echo off
REM *******************************************************
REM NOMBRE: ej08-imc.cmd
REM OBJETIVO: Calcular en indice de masa corporal
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
if "%1"=="" (
	echo "Se deben indicar la altura y el peso"
	exit /b
)
if "%2"=="" (
	echo "Se deben indicar la altura y el peso"
	exit /b
)

set peso=%1
set altura=%2

set/A imc = (%peso% * 10000)  /  (%altura% * %altura%)
echo Su indice de masa corporal es: %imc%

if %imc% lss 16 (
   echo Delgadez severa.
) else if %imc% lss 17 (
   echo Delgadez moderada.
)  else if %imc% lss 19 (
   echo Delgadez leve.
)  else if %imc% lss 25 (
   echo Normal.
)  else if %imc% lss 30 (
   echo Preobesidad.
)  else (
   echo Obesidad.
)