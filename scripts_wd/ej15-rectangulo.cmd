echo off
REM *******************************************************
REM NOMBRE: ej15-rectangulo.cmd
REM OBJETIVO: Mediante bucles pintar un rectangulo
REM AUTOR: Alejandro Hdez <alejandrohd1@live.com>
REM
REM ENTRADAS: 1
REM SALIDAS: 
REM
REM COMENTARIOS:
REM VERSION: 1.0 (2023-01-27)
REM
REM ********************************************************
set base=%1%
set altura=%2%

if "%base%"=="" (
	set base=7
)

if "%altura%"=="" (
    set altura=4
)
				)
set/A area= %base% * %altura%
echo Vamos a pintar un rectangulo de base: %base%, altura: %altura%, area: %area%
										
for /L %%j in (1,1,%altura%) do (
	for /L %%i in (2,1,%base%) do (
		set/p="#" <NUL
									)
		echo #
		)