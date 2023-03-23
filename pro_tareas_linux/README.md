**Resuelve los siguientes apartados. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione:**

1. Guardar en un fichero llamado "cargaNextMonday.txt" situado en el HOME la carga del sistema el próximo lunes a las 2:00 am.
```
at 02:00 next monday <<< "uptime > ~/cargaNextMonday.txt 2> carga.err"
```
Algunas opciones útiles de at son:

- Mostrar todas las tareas programadas: atq     (o también: at -l)
- Mostrar los detalles de la tarea con ID X: at -c X (al principio se muestran todas las variables que se almacenan, y al final el comando a ejecutar)
- Borrar una tarea con ID X: atrm X (o también: at -r X  o bien  at -d X)
- Más información sobre at: man at

2. Guardar en un fichero llamado "cargaAllMondays.txt" situado en el HOME la carga del sistema TODOS los lunes a las 2:00 am.
```
crontab -e
```
```
0 2 * * 1 uptime >> ~/cargaAllMondays.txt
```
3. Guardar en un fichero llamado "carga30min.txt" situado en el HOME la carga del sistema cada 30 minutos de forma indefinida.
```
crontab -e
```
```
*/30 * * * * uptime >> ~/carga30min.txt
```
4. Borrar todos los ficheros más antiguos de 30 días a las 3 de la mañana todos los días 10, 20 y 30 de cada mes.
```
crontab -e
```
```
0 3 */10-20-30 * * find ~/ -type f -mtime +30 -detele
```
5. Realizar los siguientes pasos (crea un script con nombre "miscript.sh" en tu HOME que simplemente imprima la fecha en el formato: "Ahora mismo son las HH:MM del día DD/MM/YYYY"). En cada tarea haz que la salida se añada a un fichero llamado "datos_fecha.txt" localizado en tu HOME.

    1. Ejecutar el script "~/miscript.sh" en 12 horas a partir de ahora.
    2. Ejecutar el script "~/miscript.sh" a las horas en punto de 8:00 a 12:00 (ambas inclusive) los fines de semana de febrero a abril (ambos inclusive)
    3. Ejecutar el script "~/miscript.sh" justo en una semana a partir de ahora.
    4. Ejecutar el script "~/miscript.sh" cada 4 horas durante los diez primeros días de cada mes.
    5. Ejecutar el script "~/miscript.sh" sólo cuando la carga baje de 1.5
    6. Mostrar que las ejecuciones están programadas y esperando para ejecutarse
    7. Eliminar/comentar todas las ejecuciones programadas