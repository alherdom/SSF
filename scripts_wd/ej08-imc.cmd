echo off
REM *******************************************************
REM NOMBRE: ej08-imc.cmd
REM OBJETIVO: Calcular en indice de masa corporal
REM AUTOR: Alejandro Hdez <alejandrohd1@live.com>
REM
REM ENTRADAS: 2
REM SALIDAS: 1
REM
REM COMENTARIOS:
REM VERSION: 1.0 (2023-01-27)
REM
REM ********************************************************
title Comparando
set peso=%1%
set altura=%2%

if "%peso%" == "" (
	set /p "peso= Introduzca el peso: "
					)

if not defined altura (
	set /p "altura= Introduzca la altura: "
					)

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