@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set "pia=C:\Program Files\Private Internet Access\piactl.exe"

rem Obtener las regiones disponibles y almacenarlas en una lista
set contador=0
for /f "tokens=*" %%a in ('cmd /c "%pia%" get regions') do (
    set /a contador+=1
    set "linea[!contador!]=%%a"
)

rem Generar un número aleatorio entre 1 y el número de elementos en el array
set /a random_index=%RANDOM%%%contador + 1

rem Seleccionar el elemento aleatorio del array
set seleccionada=!linea[%random_index%]!

echo La región seleccionada aleatoriamente es: !seleccionada!

rem Habilitar el modo background
"%pia%" background enable

rem Desconectar si ya está conectado
"%pia%" disconnect

"%pia%" set region "!seleccionada!"

"%pia%" connect
pause