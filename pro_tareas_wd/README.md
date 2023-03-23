Crear un programa batch que muestre un mensaje y la fecha y hora y ejecutar este fichero según lo indicado (se debe añadir la salida en un fichero de texto):

El próximo lunes a las 12:50
Todos los días a las 16:30
Todas las semanas a las 23:00
Todos los meses a las 11:00
Cuando el sistema tenga baja carga
Los lunes, miércoles y viernes a las 20:00
Mañana a las 12:00, y repetir la ejecución 5 veces cada 10 minutos

Crear un programa batch que muestre un mensaje y la fecha y hora y ejecutar este fichero según lo indicado (se debe añadir la salida en un fichero de texto):

El próximo lunes a las 12:50

    schtasks /create /tn test /sc ONCE /d MON /st 12:50 /tr ...

Todos los días a las 16:30

    schtasks /create /tn test /sc DAILY /ST 16:30

Todas las semanas a las 23:00

    schtask /create /tn test /sc WEEKLY /st 23:00
    
Todos los meses a las 11:00

    
Cuando el sistema tenga baja carga

    schtask /create /tn test /sc ONIDLE

Los lunes, miércoles y viernes a las 20:00


    schtask /create /tn test /sc weekly /d MON,WED,FRI /st 20:00

Mañana a las 12:00, y repetir la ejecución 5 veces cada 10 minutos

schtasks /create /tn "Nombre de la tarea" /tr "Ruta completa del archivo que se ejecutará" /sc once /st 12:00 /sd tomorrow /ri 10 /du 00:50:00 