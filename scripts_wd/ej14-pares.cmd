echo off
REM *******************************************************
REM NOMBRE: ej12-multiplo.cmd
REM OBJETIVO: Mediante un bucle verficar si los argumentos son multiplos
REM AUTOR: Alejandro Hdez <alejandrohd1@live.com>
REM
REM ENTRADAS: 1
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

if not defined num2 (
	set /p "num2= Introduzca el segundo numero: "
					)
					
for /L %%i in (%num1%,1,%num2%) do (
set /a par=%%i %%2
if "!par!"=="0" (echo %%i es par y su cuadrado es)
)