Resuelve los siguientes apartados en GNU/Linux. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione.
NOTA: Se debe indicar expresamente el uso de sudo (SOLO cuando sea estrictamente necesario).

Muestra todos los servicios de tu sistema
 
Elige 3 servicios de tu sistema y, para cada uno de ellos, indica:
El nombre
Investiga un poco para qué se usa
Si está activo o no
Si está habilitado o no
Si está enmascarado o no
 
Los procesos "comunes" suelen tomar las entradas de periféricos como el teclado (o ratón) y mostrar las salidas y/o errores en pantalla. ¿Los servicios también funcionan así? Si no es así, indica de dónde suelen tomar las entradas (la configuración del servicio, por ejemplo) y dónde suelen mostrar las salidas (información de accesos, errores, etc.).
 
He cambiado la configuración de un servicio, pero por alguna razón parece que el servicio no se ve afectado por los cambios... ¿qué puede estar pasando? ¿qué tengo que hacer?
 
¿Es siempre seguro detener cualquier servicio? ¿Por qué?
¿Es siempre seguro reiniciar cualquier servicio? ¿Por qué?
 
Para un servicio dado, por ejemplo openvpn (o cups o algunos de los que vimos en clase), indica lo que debo hacer para:
Consultar su estado
Consultar su configuración
Detenerlo
Activarlo
Reiniciarlo
Reiniciarlo (sólo si estaba previamente activo)
Recargar su configuración
Recargar su configuración y, si eso falla, reiniciarlo
Recargar su configuración y, si eso falla, reiniciarlo (sólo si estaba previamente activo)
    
Cada servicio puede estar activo/inactivo, habilitado/deshabilitado, enmascarado/desenmascarado...
¿Qué significa cada uno de estos estados?
¿Qué comando se utiliza para saber si un servicio está en cada uno de estos estados?
¿Están esos estados están relacionados? Es decir, sabiendo que un servicio está deshabilitado ¿puede saber si está activo o no? ¿Puede estar un servicio activo si está enmascarado?
Usando un único comando, ¿cómo puedo habilitar un servicio y activarlo a la vez?
¿Y viceversa (deshabilitar y parar un servicio)?
 
¿Qué es lo que tengo que hacer si quiero?:
Parar un proceso que alguien me ha comentado que es un servicio
Evitar que ese proceso aparezca cada vez que arranco el equipo
¿Es suficiente con parar un servicio y no cargarlo en cada arranque para asegurar que ese servicio nunca más se volverá a ejecutar? Si no fuese suficiente, ¿por qué? ¿cómo podría asegurarme que un servicio no se va a poder ejecutar de nuevo?
 
Sobre los niveles de ejecución (runleveles) en GNU/Linux:
¿Para qué se usan y qué implican?
¿Cuántos hay en tu sistema y qué significa cada uno?
¿En qué runlevel te encuentras actualmente?
Si el sistema presenta un error y necesito que se cargue lo mínimo posible, ¿qué runlevel debería usar? ¿Con qué comando puedo pasar a ese runlevel?
 Si mi sistema tiene un error y para solucionarlo necesito tener acceso a Internet, ¿cuál es el runlevel mínimo que tendría que usar?
Si en una emergencia necesito apagar mi sistema, ¿podría hacerlo con runlevels? ¿cómo?
¿Y si necesito reiniciarlo?
 
a) ¿Qué sistema Sistema de inicialización del kernel (init system) estás usando? ¿Cómo lo sabes?
b) Muestra el total de tiempo que tarda en arrancar tu máquina. Generalmente el tiempo total se desglosa en varias etapas, ¿qué significa cada una de estas etapas? ¿Cuál es la que más tarde? ¿y la que menos? ¿por qué crees que esto es así?
c) Muestra lo que tarda en cargarse cada uno de los servicios de tu máquina.