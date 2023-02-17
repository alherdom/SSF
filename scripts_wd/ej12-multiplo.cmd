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

set /p "valor= Introduce un valor: "

for %%f in (%*) do @echo %%f
