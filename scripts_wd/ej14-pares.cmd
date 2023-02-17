@echo off
setlocal EnableDelayedExpansion
(setlocal && cls && echo.)
REM *******************************************************
REM NOMBRE: ej14-pares.cmd
REM OBJETIVO: Mediante bucles imprimir pares
REM AUTOR: Alejandro Hdez <alejandrohd1@live.com>
REM
REM ENTRADAS: 2
REM SALIDAS: 
REM
REM COMENTARIOS:
REM VERSION: 1.0 (2023-01-27)
REM
REM ********************************************************
set num1=%1%
set num2=%2%

if "%num1%" == "" (
	set /p "num1= Introduzca el primer numero: "
					)

if "%num2%" == "" (
	set /p "num2= Introduzca el primer numero: "
					)

if %num1% gtr %num2% (
	for /L %%i in (%num1%,-1,%num2%) do (
	set /a par=%%i %%2
	if "!par!"=="0" (echo %%i es par y su cuadrado es %%i * %%i)
	)
	) else (
	if %num1% lss %num2% (
	for /L %%i in (%num1%,1,%num2%) do (
	set /a par=%%i %%2
	if "!par!"=="0" (echo %%i es par y su cuadrado es %%i * %%i)
	)
	) else (
	echo %num1% y %num2% son iguales )	
     	  )


(pause && endlocal)