echo off
REM *******************************************************
REM NOMBRE: ej07-compara.cmd
REM OBJETIVO: Comparar dos numeros
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
set num1=%1%
set num2=%2%

if "%num1%" == "" (
	set /p "num1= Introduzca el primer numero: "
					)

if not defined num2 (
	set /p "num2= Introduzca el segundo numero: "
					)

if %num1% gtr %num2% (
	echo %num1% es mayor que %num2%
	) else (
	if %num1% lss %num2% (
	echo %num2% es mayor que %num1%
	) else (
	echo %num1% y %num2% son iguales )	
     	  )
	
