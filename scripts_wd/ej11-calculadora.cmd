echo off
REM *******************************************************
REM NOMBRE: ej11-calculadora.cmd
REM OBJETIVO: Selecionar los calculos que se desean realizar
REM AUTOR: Alejandro Hdez <alejandrohd1@live.com>
REM
REM ENTRADAS: 2
REM SALIDAS: 7
REM
REM COMENTARIOS:
REM VERSION: 1.0 (2023-01-27)
REM
REM ********************************************************
title Colculando
set num1=%1%
set num2=%2%

if "%num1%" == "" (
	set /p "num1= Introduce el primer numero: "
					)

if not defined num2 (
	set /p "num2= Introduce el segundo numero: "
					)
			
:menu
cls			
echo.
echo Selecione una opcion:
echo.
choice /c:1234567 /n /m "1: Suma, 2: Resta, 3: Multiplicacion, 4: Division, 5: Media, 6: Potencia, 7: Salir"
echo.
if %errorlevel% == 1 goto suma
if %errorlevel% == 2 goto resta
if %errorlevel% == 3 goto multi
if %errorlevel% == 4 goto divi
if %errorlevel% == 5 goto media
if %errorlevel% == 6 goto pot
if %errorlevel% == 7 goto exit

:suma
set/A suma= %num1% + %num2%
echo %num1% + %num2% es igual a %suma%
pause
goto menu
:resta
set/A resta= %num1% - %num2%
echo %num1% - %num2% es igual a %resta%
pause
goto menu
:multi
set/A multi= %num1% * %num2%
echo %num1% * %num2% es igual a %multi%
pause
goto menu
:divi
set/A divi= %num1% / %num2%
echo %num1% / %num2% es igual a %divi%
pause
goto menu
:media
set/A media= (%num1% + %num2%) / 2
echo La media de %num1% y %num2% es igual a %media%
pause
goto menu
:pot
set/A pot=1
for /l %%_ in (1,1,%num2%) do (set /A pot*=%num1%)
echo %num1% elevado a %num2% es igual a %pot%
pause
goto menu
:exit
exit