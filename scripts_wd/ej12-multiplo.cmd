echo off
setlocal EnableDelayedExpansion
REM *******************************************************
REM NOMBRE: ej12-multiplo.cmd
REM OBJETIVO: Mediante un bucle verficar si los argumentos son multiplos
REM AUTOR: Alejandro Hdez <alejandrohd1@live.com> Javier García <javigh1903@movistar.es>
REM
REM ENTRADAS: 1
REM SALIDAS: 
REM
REM COMENTARIOS:
REM FECHA: 17/02/2023
REM VERSION: 1.0
REM
REM ********************************************************

set num_arg=0
for %%i in (%*) do Set /A num_arg+=1

set /p number="Itroduzca un numero: "

echo Discriminando cuales de los siguientes numeros son multiplos de %number%: %*
for %%i in (%*) do (
	set /a discriminante= %%i %% !number!
	if !discriminante! NEQ 0 (
		echo El numero %%i NO es multiplo de !number!
	) else (
		echo El numero %%i ES multiplo de !number!
	)
)