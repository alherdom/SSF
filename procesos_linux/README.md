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

