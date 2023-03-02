## Ejercicio A (GNU/Linux)
1. Muestre	todos	los	procesos	del	sistema:
- ps
- ps -f
- ps u
- ps -ax
2. Muestre	los	procesos	del	usuario	root
- ps - u root
3. Ejecute	el	comando	Firefox y	desde	otra	terminal,	compruebe	el	estado	del	proceso	
creado	¿cuál	es?
- pgrep firefox
- ps "pid"
- estado Sl+
4. En	la	terminal	que	ejecutó el	firefox,	pulse	la	combinación	de	teclas	Ctrl+Z	¿qué	
ocurre?
- En la mayoría de los programas, se envía una señal de terminación utilizando las teclas Ctrl-C, para poder enviar un trabajo a dormir utilizaremos otra combinación de teclas Ctrl-Z. Hay que tener en cuenta que
no es lo mismo un trabajo en segundo plano que uno que es enviado a dormir.
Un trabajo en segundo plano sigue ejecutándose, en cambio uno que se envía
a dormir queda esperando en el lugar donde estaba hasta que sea despertado
5. Vuelva	a	comprobar	el	estado	del	proceso	¿cuál	es?
6. En	la	terminal	que	ejecutó	el	Firefox	ejecute	el	comando	fg	¿qué	ocurre?
- Pasa el proceso a "Primer Plano". fg - first ground.
7. Vuelva	a	comprobar	el	estado	del	proceso	¿cuál	es?
8. Cierre	el	navegador	y	ejecute	el	comando:	firefox	& ¿qué	ocurre?
- firefox &
- Se ejecuta firefox pero en segundo plano.
9. Indique	el	comando	que	me	permita	ver	la	información	del	proceso generado	en	el	
ejercicio	8.
- jobs
- ps "pid"
- pgrep firefox
10. Envía	una	señal	de	parada	(usando	kill)	para	el	proceso	generado	en	el	ejercicio	8.
- kill "pid"
11. Ejecute	el	comando:	firefox	&	y	cierra	la	terminal	donde	ejecutaste	el	comando	¿qué	
ocurre	con	el	navegador?
- Se cierran ambas ejecuciones, terminal y firefox.
12. Defina	un	comando	que	permita	ejecutar	el	navegador	Firefox	aunque	se	cierre	la
terminal.
- Si ya lo hemos ejecutado, antes de cerrar el terminal, haz Ctrl+z en el terminal y ejecuta el siguiente comando:
- disown -h %1
- bg 1
- Si queremos ejecutarlo y evitar el cierre:
- nohup "comando" &
13. Con	respecto	a	la	información	de	un	proceso	¿qué	diferencia	hay	entre	prioridad	y	
nice?	¿qué	significa	un	valor	negativo?
- Valor de nice es un espacio de usuario y la prioridad PR es el proceso real de la prioridad que el uso por el kernel de linux. En linux el sistema de prioridades de 0 a 139 en la cual 0 a 99 en tiempo real y de 100 a 139 para los usuarios. buen rango de valores es de -20 a +19 donde -20 es más alto, por defecto 0 y +19 es el más bajo. relación entre el valor de nice y la prioridad es :
- PR = 20 + NI

Ejercicio B (GNU/Linux)
Resuelve los siguientes apartados. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione:

1. Ejecutar el comando ps aux e indicar qué significa cada columna. ¿Qué estados puede tener un proceso y qué significa cada uno? (si se tienen dudas, usar man ps o ps --help)
2. Ejecutar el comando uptime. ¿Qué significa cada uno de los datos que muestra y qué información puedo obtener de ellos?
3. ¿Un sistema con 8 cores tiene una carga de 5.3, a qué porcentaje aproximado de rendimiento está funcionando este equipo?
4. a) Obtener el PID del proceso que más % CPU esté usando en ese momento
4. b) Obtener el PID del proceso que más % MEM esté usando en ese momento
5. ¿Qué información me muestra el comando jobs? ¿Qué significan los símbolos + y - que aparecen en la lista?
6. Al ejecutar el comando jobs veo que, por ejemplo, el elemento [3] de la lista está en estado stopped (Detenido, Terminado, Terminated o similar), ¿qué significa esto? ¿cómo puedo hacer que pase a ejecutarse en segundo plano?
7. He lanzado un comando xeyes que ya se está ejecutando en primer plano, indicar qué tendría que hacer para pasarlo a ejecutar en segundo plano (y que siga ejecutándose)
8. Lanzar el comando xeyes en segundo plano, y luego volver a pasarlo a primer plano.
9. ¿Cómo puedo hacer que el comando xeyes se siga ejecutando aunque se cierre la shell en la que se ejecutó si aún no lo he lanzado?
10. ¿Cómo puedo hacer que el comando xeyes se siga ejecutando aunque se cierre la shell en la que se ejecutó si ya se está ejecutando?
11. Como usuario tienes que lanzar el comando xeyes con la mínima prioridad posible, ¿qué comando utilizarías? ¿qué valor le asignarías y cuánta es la prioridad efectiva final? ¿por qué? ¿qué pasaría en el caso inverso, que quisiera asignarle la máxima prioridad posible antes de lanzarlo?
12. Repetir el ejercicio anterior, pero sobre el comando xeyes que ya se está ejecutando (indicar qué comando hay que utilizar para modificar la prioridad de un proceso que ya está en ejecución, y qué valores máximos y mínimos se pueden asignar)
