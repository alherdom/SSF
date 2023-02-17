@echo off
setlocal enableDelayedExpansion
REM *******************************************************
REM NOMBRE: ej19-calcula_cambio.cmd
REM OBJETIVO: Mediante bucles pintar un rectangulo
REM AUTOR: Alejandro Hdez <alejandrohd1@live.com> Javier García <javigh1903@movistar.es>
REM
REM ENTRADAS: 2
REM SALIDAS: 
REM
REM COMENTARIOS:
REM FECHA: 17/02/2023
REM VERSION: 1.0
REM
REM ********************************************************

if "%1"=="" ( 
	echo "Se debe indicar el precio del articulo."
	exit /b 
)
set precio=%1
set billetes=500 200 100 50 20 10 5 2 1
set /p pagado="Introduzca la cantidad pagada: "

if %pagado% LSS %precio% (
	echo "Cantidad insuficiente."
	exit /b
)

set /a resto= %pagado% - %precio%

echo "Se ha comprado un producto de %precio% euros con %pagado% euros."
echo "El cambio son %resto% euros, debe entregar:"
(for %%b in (%billetes%) do (
	set /a cantidad=!resto! / %%b
	set /a resto=!resto! %% %%b
	if !cantidad! NEQ 0 ( echo "!cantidad! billete(s) de %%b euros" )
))