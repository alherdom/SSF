<div align=justify>

 ## Hoja de ejercicios de Servicios y Demonios
 
#### Resuelve los siguientes apartados en GNU/Linux. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione. NOTA: Se debe indicar expresamente el uso de sudo (SOLO cuando sea estrictamente necesario).

1. Muestra todos los servicios de tu sistema
- $ service --status-all
2.  Elige 3 servicios de tu sistema y, para cada uno de ellos, indica:
- Nombre
- Investiga un poco para qué se usa
- Si está activo o no
- Si está habilitado o no
- Si está enmascarado o no
 
3. Los procesos "comunes" suelen tomar las entradas de periféricos como el teclado (o ratón) y mostrar las salidas y/o errores en pantalla. ¿Los servicios también funcionan así?
 
 - NO.
 
 4. Si no es así, indica de dónde suelen tomar las entradas (la configuración del servicio, por ejemplo) y dónde suelen mostrar las salidas (información de accesos, errores, etc.).
 
 - La comunicación se realiza mediante otras aplicaciones de tipo "cliente" que el usuario ejecuta "a demanda" para recoger los datos y luego ser enviados a los servicios (por ejemplo, la aplicación at con el demonio atd). Para comunicar errores o mensajes, se basan en ficheros de registros (logs, normalmente localizados en /var/log), o bien en otros servicios especializados en registros (como syslogd en GNU/Linux), etc.
 
5. He cambiado la configuración de un servicio, pero por alguna razón parece que el servicio no se ve afectado por los cambios... ¿qué puede estar pasando? ¿qué tengo que hacer?

 - Recargar el servicio si este lo permite para iniciarlo con la nueva configuracion, o reiniciarlo si esto no es posible.
 - $ systemctl reload-or-restart "servicio"
 - $ systemctl try-reload-or-restart "servicio"
 
 6. ¿Es siempre seguro detener cualquier servicio? ¿Por qué? ¿Es siempre seguro reiniciar cualquier servicio? ¿Por qué?
 
 - No. Los servicios suelen llevar a cabo tareas especiales y básicas del sistema operativo (como por ejemplo las relacionadas con el control del hardware), muchas de ellas críticas sin las que el equipo no podría funcionar correctamente. Por ejemplo, el servicio de red, de energía, de sonido, de impresión, de ejecución programada de tareas, de interrupciones, etc. 
 
7. Para un servicio dado, por ejemplo openvpn (o cups o algunos de los que vimos en clase), indica lo que debo hacer para:
8. Consultar su estado
- $ systemctl status cups
9. Consultar su configuración
- $ systemctl show cups
10. Detenerlo
- $ systemctl stop cups
11. Activarlo
- $ systemctl start cups
12. Reiniciarlo
- $ systemctl restart cups
13. Reiniciarlo (sólo si estaba previamente activo)
- $ systemctl try-restart cups
14. Recargar su configuración
- $ systemctl reload cups
15. Recargar su configuración y, si eso falla, reiniciarlo
- $ systemctl reload-or-restart cups
16. Recargar su configuración y, si eso falla, reiniciarlo (sólo si estaba previamente activo)
- $ systemctl try-reload-or-restart cups

17. Cada servicio puede estar activo/inactivo, habilitado/deshabilitado, enmascarado/desenmascarado...
18. ¿Qué significa cada uno de estos estados?
- Servicio activo: servicio iniciado, está en funcionamiento. Los servicios inactivos no están en ejecución.
- Servicio habilitado (enabled): Servicio que será iniciado durante el arranque (si está deshabilitado -disabled- NO se iniciará durante el arranque. Esto es totalmente independiente de si el servicio está activo o inactivo.
- Servicio enmascarado (masked): Los servicios a los que se les haya hecho un mask, NO podrán iniciarse mientras estén enmascarados. Esto previene que un servicio pueda ser iniciado por otro.

19. ¿Qué comando se utiliza para saber si un servicio está en cada uno de estos estados?
- $ systemctl is-active cups
- $ systemctl is-enabled cups 
20. ¿Están esos estados están relacionados? Es decir, sabiendo que un servicio está deshabilitado ¿puede saber si está activo o no? ¿Puede estar un servicio activo si está enmascarado?
21. Usando un único comando, ¿cómo puedo habilitar un servicio y activarlo a la vez? ¿Y viceversa (deshabilitar y parar un servicio)?
 - $ systemctl enable --now
22. ¿Qué es lo que tengo que hacer si quiero?:
23. Parar un proceso que alguien me ha comentado que es un servicio.
- $ systemctl stop cups
24. Evitar que ese proceso aparezca cada vez que arranco el equipo
- $ systemctl disable cups
25. ¿Es suficiente con parar un servicio y no cargarlo en cada arranque para asegurar que ese servicio nunca más se volverá a ejecutar?
- No.
26. Si no fuese suficiente, ¿por qué? ¿cómo podría asegurarme que un servicio no se va a poder ejecutar de nuevo?
- Faltaria recargar la nueva configuración del servicio, para ello ejecutar el comando "reload" si el servicio lo permite esta no supondrá ningún impacto sobre el uso del servicio, en caso de no ser así habrá que reiniciarlo, esto si supondría impacto sobre el uso del servicio.
- $ try-reload-or-restart

27. Sobre los niveles de ejecución (runleveles) en GNU/Linux:
28. ¿Para qué se usan y qué implican?
- Los niveles de ejecución indican el modo de operación en el que está el equipo, que va desde el nivel 0 que corresponde con el apagado, hasta el nivel 6 del reinicio. Según el nivel de ejecución que se encuentra la máquina, se montarán o no algunas unidades de disco, se activarán o no algunos servicios, etc. En general, los niveles de ejecución son los siguientes en la mayoría de distribuciones:

- runlevel 0: Apagado o cierre del equipo.
- runlevel 1: Monosuario (sólo se permite el usuario root), no se configura la red, no hay entorno gráfico (se trabaja a nivel de terminal) ni se arrancan demonios, etc. Es utilizado como modo de emergencia (modo recuperación) para solucionar problemas.
- runlevel 2: Multiusuario, pero sin soporte de red ni entorno gráfico.
- runlevel 3: Multiusiario con soporte de red, pero sin entorno gráfico.
- runlevel 4: Aunque es similar al 3, no suele estar en uso, sino que se reserva para propósitos especiales.
- runlevel 5: Multiusuario con soporte de red y entorno gráfico, es el modo normal de uso.
- runlevel 6: Reinicio del equipo.
29. ¿Cuántos hay en tu sistema y qué significa cada uno?
30. ¿En qué runlevel te encuentras actualmente?
 - $ runlevel (también se puede usar el comando "who -r")
 - N 5
31. Si el sistema presenta un error y necesito que se cargue lo mínimo posible, ¿qué runlevel debería usar? ¿Con qué comando puedo pasar a ese runlevel?
 - systemctl isolate runlevel1.target (runlevel 1 monousuario, sin red, sin entorno, sin demonios)
32. Si mi sistema tiene un error y para solucionarlo necesito tener acceso a Internet, ¿cuál es el runlevel mínimo que tendría que usar?
 - systemctl isolate runlevel3.target (runlevel 3 multiusuario, con red, sin entorno gráfico)
33. Si en una emergencia necesito apagar mi sistema, ¿podría hacerlo con runlevels? ¿cómo?
¿Y si necesito reiniciarlo?
 - systemctl isolate runlevel0.target (runlevel 0 apagado o cierre del equipo)
 - systemctl isolate runlevel6.target (runlevel 6 reinicio del equipo)
 
34. ¿Qué sistema de inicialización del kernel (init system) estás usando? ¿Cómo lo sabes?
 - $ ps -p1 | grep "init\|upstar\|systemdd"
 - 1 ?     00:00:02 systemd
35. Muestra el total de tiempo que tarda en arrancar tu máquina. Generalmente el tiempo total se desglosa en varias etapas, ¿qué significa cada una de estas etapas? ¿Cuál es la que más tarde? ¿y la que menos? ¿por qué crees que esto es así?
 
36. Muestra lo que tarda en cargarse cada uno de los servicios de tu máquina.
 - $ systemd-analyze blame (consumo de tiempo de cada servicio durante el arranque)
 </di>
