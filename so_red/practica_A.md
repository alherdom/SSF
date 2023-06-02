<div align="justify">

## Práctica A: Configuración Red - Curso 2022/23
### Práctica A1. Configuración IP estática (GNU/Linux)


Vamos a preparar la máquina virtual con Linux Mint para convertirla en un pequeño servidor web de testeo (IMPORTANTE!! Recuerda que hemos instalado la versión Desktop de Linux Mint, por lo que NO es nada recomendable utilizarla para un servidor en producción).

La primera parte de la práctica es la configuración básica de la máquina virtual, donde de forma guiada iremos viendo los diferentes pasos para convertir nuestro sistema en un servidor. Ten en cuenta que las explicaciones estarán basadas en un equipo que tenga instalado GNU/Linux con Linux Mint. En otras distribuciones GNU/Linux, aunque el proceso en general será bastante similar, puede que los comandos requeridos sean diferentes.

También ten en cuenta que ya tienes unos considerables conocimientos sobre administración de sistemas operativos, así que, aunque esto es una guía "paso por paso", hay operaciones obvias que no se indican porque se supone que sabrás resolverlas sin problemas, como acceder a directorios, crear y modificar ficheros, cuándo se debe o no usar sudo, cómo instalar y gestionar paquetes, servicios, etc.

Por último, pero no menos importante, para poder configurar la máquina virtual, vas a tener que modificar ficheros de configuración del sistema. Ten mucho cuidado, porque cualquier error puede hacer que la máquina virtual no funcione correctamente. Es una buena práctica hacer copias de los ficheros de configuración que vas a modificar antes de cambiarlos, verificar varias veces que los cambios introducidos son los correctos antes de guardar el fichero, COMENTAR qué es lo que hemos cambiado (y dejar comentado el estado original), tener copias de respaldo de la máquina virtual, etc. Una ventaja añadida de hacer copias de los ficheros de configuración antes de modificarlos, es que usando comandos como diff, podrás ver luego las diferencias entre ambos y saber qué cosas has cambiado. Sin embargo, ten cuidado dónde realizas la copia de estos ficheros, ya que los directorios de configuración suelen tener usos especiales, por lo que si almacenas copias de seguridad allí, se pueden producir errores.



### EMPECEMOS...

Como hemos visto en clase, la IP de un servidor debería ser estática, para que todos los clientes sepan dónde encontrar el servidor (existen soluciones para servidores con IP dinámica, pero suele requerir servicios de terceros, como el ddns). Normalmente también querremos una IP pública para nuestro servidor para poder acceder a él desde cualquier lugar, pero en este caso, como es un servidor interno de testeo, le daremos una IP estática privada para poder acceder a él desde (y sólo desde) nuestra red privada.

##### PRIMER PASO

- El primer paso será ver cuál es nuestra configuración de red para elegir la IP de nuestro servidor. Para ello, obtén la configuración de red de tu máquina REAL. Esta configuración es la que vamos a usar como base para la máquina virtual.

- Debes averiguar una serie de valores sobre la configuración de red. Puedes usar comandos genéricos como nmcli dev show, nm-tool, etc. o bien otros específicos como ifconfig, ip a, ip r, route -n, etc. (algunos funcionarán y otros no, depende de los que tengas instalado en cada sistema).

- Con estos comandos busca y anota información básica sobre la configuración de tu máquina real: IP, máscara, Gateway (Pasarela), DNS, etc. También puedes conseguir información sobre las interfaces de red y su tipo (ethernet, wifi, etc), MAC, CIDR, velocidad, MTU, etc.

````
C:\Users\Alejandro Hdez Dguez>ipconfig

Configuración IP de Windows


Adaptador de Ethernet Ethernet 3:

   Estado de los medios. . . . . . . . . . . : medios desconectados
   Sufijo DNS específico para la conexión. . :

Adaptador de Ethernet VirtualBox Host-Only Network:

   Sufijo DNS específico para la conexión. . :
   Vínculo: dirección IPv6 local. . . : fe80::943c:761f:8763:59ca%19
   Dirección IPv4. . . . . . . . . . . . . . : 192.168.56.1
   Máscara de subred . . . . . . . . . . . . : 255.255.255.0
   Puerta de enlace predeterminada . . . . . :

Adaptador de LAN inalámbrica Conexión de área local* 1:

   Estado de los medios. . . . . . . . . . . : medios desconectados
   Sufijo DNS específico para la conexión. . :

Adaptador de LAN inalámbrica Conexión de área local* 2:

   Estado de los medios. . . . . . . . . . . : medios desconectados
   Sufijo DNS específico para la conexión. . :

Adaptador de Ethernet Ethernet 2:

   Estado de los medios. . . . . . . . . . . : medios desconectados
   Sufijo DNS específico para la conexión. . :

Adaptador de LAN inalámbrica Wi-Fi:

   Sufijo DNS específico para la conexión. . :
   Vínculo: dirección IPv6 local. . . : fe80::6da3:c454:4f93:3e76%10
   Dirección IPv4. . . . . . . . . . . . . . : 192.168.31.215
   Máscara de subred . . . . . . . . . . . . : 255.255.255.0
   Puerta de enlace predeterminada . . . . . : 192.168.31.1

Adaptador de Ethernet Conexión de red Bluetooth:

   Estado de los medios. . . . . . . . . . . : medios desconectados
   Sufijo DNS específico para la conexión. . :
````

##### SEGUNDO PASO

- Ahora conéctate a tu máquina virtual y mira la configuración de red. ¿Se trata de una IP que está o no en la misma red? Confirma que, salvo la IP, comparten la misma configuración: máscara, gateway, etc.

- Si no es así, consulta la configuración de red de VirtualBox y confirma que en el adaptador de red de tu máquina virtual, estés conectado a un ADAPTADOR PUENTE. Si estás en NAT o en otro tipo de adaptador, cambia a "Adaptador puente" (puedes hacerlo con la máquina virtual encendida, la configuración se actualiza a los pocos segundos, no hace falta reiniciar). Reflexiona sobre los diferentes adaptadores puente de la máquina virtual y qué significa cada uno, tienes más información en el aula virtual.

````
 alejandro10  ~  127  ifconfig
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.31.191  netmask 255.255.255.0  broadcast 192.168.31.255
        inet6 fe80::abd0:3247:bccc:385f  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:58:5e:99  txqueuelen 1000  (Ethernet)
        RX packets 2717  bytes 1914126 (1.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1174  bytes 113019 (113.0 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Bucle local)
        RX packets 375  bytes 35014 (35.0 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 375  bytes 35014 (35.0 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
````

##### TERCER PASO

- ¿Qué tipo de IP tienes en la máquina virtual: pública o privada, estática o dinámica? ¿Cómo lo sabes?

- Si tienes una IP dinámica, puedes probar a liberar la IP asignada y volver a solicitar otra IP, con los siguientes comandos (usaremos dhclient, que nos permite realizar algunas operaciones relacionadas con DHCP):

#### Liberamos nuestra IP dinámica (-r: release, liberar)
```
dhclient -r
```

#### Volvemos a solicitar una nueva IP dinámica
```
dhclient
```

- Después de cada comando, utiliza ifconfig o ip a  para comprobar qué IP tienes. La IP asignada antes y después de usar estos comandos, ¿es distinta o la misma que tenías antes? ¿Por qué? ¿Quién está asignando estas IPs?
 

- Si tienes una IP estática, lo más probable es que la IP se haya asignado mediante alguna interfaz gráfica, como la de NetworkManager que usamos cuando empezamos a usar la máquina. Puedes comprobar la configuración accediendo a esta interfaz y viendo las propiedades o detalles de la conexión, o también puedes ver los datos que se han guardado en el fichero de configuración (por ejemplo, busca el nombre de tu conexión en el directorio: /etc/NetworkManager/system-connections/

NOTA: si teniendo una IP estática ejecutaste los comandos del 3a, verás que ha pasado algo raro, ¡tu adaptador de red tiene ahora DOS IPs!!!! (lo puedes ver con ip a, ya que ifconfig no lo muestra por defecto). ¿Cómo es esto posible? Fíjate que una de ellas es "secundaria", averigua para qué se usa esto. Puedes "eliminar" (liberar) esta segunda IP usando: dhclient -r.

##### CUARTO PASO

- Ahora vamos a proceder a asignar una IP estática a tu máquina virtual, pero lo haremos a través de comandos (NO usaremos la interfaz gráfica ya que en el caso de un servidor real, muy probablemente no esté disponible). La IP que vamos a asignar va a ser LA MISMA QUE TU MÁQUINA REAL, PERO ACABADA EN .150 (si algún número de tu IP es 99, ¡¡avisa al profe antes de seguir!!). Antes de asignar esta IP, comprueba que no está siendo usada por ningún equipo. Por ejemplo, haz un ping a la IP y avisa al profe si recibes respuesta.

- Por cierto, ¿recuerdas cuáles son los parámetros mínimos que necesitamos para configurar la red de nuestro equipo? Busca información sobre ellos, porque los vas a necesitar pronto.

- Para asignar una IP estática por comandos, podemos usar lo siguiente, donde debes sustituir <...> por los valores (obviamente, SIN los símbolos < y > ;):

```
ifconfig <interfaz> <IP> netmask <máscara>
route add default gw <pasarela>
```

- Por ejemplo, en tu casa probablemente te funcione una configuración similar a:
ifconfig eth0 192.168.0.150 netmask 255.255.255.0
route add default gw 192.168.0.1

- Sin embargo, existe un problema al usar estos comandos, y es que los cambios son TEMPORALES, esta configuración solo estará activa mientras el equipo esté encendido, y se perderán cuando la máquina se apague o se reinicie (por este motivo, NO utilices los anteriores comandos).

- Para evitar este problema, tenemos que hacer los cambios PERMANENTES. Como hemos visto, una de las principales características de GNU/Linux, es que la configuración se escribe en ficheros de texto plano dentro del directorio /etc, por lo que únicamente tenemos que saber qué fichero es y poner nuestra configuración allí.

- En nuestro caso, el fichero es /etc/network/interfaces. Si nos fijamos, tiene sentido: dentro del directorio global con toda la configuración del sistema (/etc), nos vamos a la parte de red (network) e indicamos la configuración dentro del fichero de interfaces de red. De hecho, aunque no seas plenamente consciente, ya has trabajado con interfaces, al usar comandos que empiezan por if... (if es la abreviación de interface, por ejemplo ifconfig = configuración de la interface. Si en la línea de comandos escribes if y pulsas tabulador dos veces, se listarán algunos de los comandos para trabajar con interfaces, en esta práctica usaremos algunos de ellos).

- Si mostramos el contenido del fichero /etc/network/interfaces (SIN modificarlo), descubriremos rápidamente dos cosas:

    - La primera es que para poner comentarios se usa # (no te cortes, usa todos los comentarios que quieras para anotar lo que estás haciendo! ;)
    - La segunda es que realmente la configuración está vacía, sólo hay una línea que pone:
    source /etc/network/interfaces.d/*
    Ya hemos visto el comando "source", que, por decirlo de alguna manera, lo que hace es "procesar" la configuración que está escrita en un fichero. Realmente lo que se está haciendo con esta línea es procesar las configuraciones que estén en todos los ficheros del directorio /etc/network/interfaces.d/* (te suena esa .d, ¿verdad? ;)

    - Esto es una práctica muy habitual en GNU/Linux, y, de hecho, es una "buena práctica", y consiste en que, en general y siempre que el sistema lo permita, NO tocamos el fichero principal de configuración, sino que escribimos todas las configuraciones que necesitemos en ficheros separados en el directorio indicado, y todas esas configuraciones luego se procesarán.
    
    - Esto nos da la ventaja que podemos tratar configuraciones diferentes de forma independiente, y evitamos que al cambiar una configuración podamos hacer cambios en otras configuraciones por error, ya que cada configuración se guarda en un fichero independiente.

    - De este modo, para nuestro caso, vamos a crear un fichero dentro de /etc/network/interfaces.d/ con un nombre identificativo (por ejemplo, llama al fichero static_ip) donde escribiremos nuestra configuración para obtener una IP fija. Esta configuración tiene que tener una sintaxis concreta, y necesitamos indicarle cuál es la interfaz que deseamos modificar, que la nueva IP es fija y luego le indicaremos los parámetros de esta IP.

- La sintaxis es la siguiente (recuerda que tienes que cambiar los parámetros <...> por los valores correctos que ya debes haber obtenido en los pasos anteriores):

#### Primero pedimos que configure automáticamente la interfaz
```
auto <interfaz>
    # Ahora le indicamos que va a ser una interfaz (iface) con IP (inet) estática (static)
    iface <interfaz> inet static
    # Le indicamos la dirección IP (address)
    address <IP>
    # Le indicamos la máscara de red (netmask)  
    netmask <máscara>
    # Le indicamos la pasarela (gateway)
    gateway <pasarela>
```

- Esta es la configuración más básica, pero el fichero de interfaces es muy versátil y existen muchísimas más cosas que se le podrían configurar, como la ID de red (network), la dirección de broadcasting (broadcast), la MAC (hwaddress), los servidores DNS (dns-nameservers), redes virtuales (vlan-raw-devices) y un larguísimo etcétera.

- Sin embargo, con la configuración indicada debería ser suficiente para nuestro caso, ya que los otros valores que necesita o bien los obtiene de la autoconfiguración, o bien los puede inferir a partir de los datos que le hemos dado (la ID de red y la dirección de broadcasting la puede calcular a partir de la IP y la máscara, por ejemplo).

- Tienes más información si consultas el manual (man interfaces) o bien en la documentación online y/o múltiples blog y tutoriales sobre cómo configurar usando interfaces.

##### QUINTO PASO

- Una vez que hayas cambiado el fichero de interfaces. Cierra y comprueba si ya el sistema tiene la nueva IP que las indicado de forma estática... ¿Sigues viendo la antigua y no ha cambiado nada?? ¿Cómo puede ser eso?? Ahhhhh, espera, quizá tenga algo que ver el .d en el nombre del directorio de configuración... ¿Qué puede estar pasando? Ahora recuerdas cuando vimos que, en general, al cambiar la configuración de un demonio está no se cargaba directamente. ¿Qué es lo que había que hacer? Puedes realizar estas operación con los comandos que ya sabes si conoces el nombre del demonio, o también usar los siguientes comandos:

```
    ifdown <interfaz>
    ifup <interfaz>
```

- Ahora comprueba la nueva IP, ¿es la que habías indicado en la configuración? ¿Qué es lo que ha sucedido?

NOTA: Quizá te dé algunos avisos o errores al ejecutar los comandos, por ahora sólo léelos e intenta averiguar qué te está queriendo decir.

##### SEXTO PASO

- Ahora que ya deberíamos tener la nueva IP, comprueba si todo va bien, si puedes navegar por Internet, hacer ping www.google.com, etc. ¿Está todo correcto o hay algún problema?

- Aunque va a depender de cada configuración, es muy probable que "no tengas Internet" (comentario típico de los usuarios ;). Sin embargo, prueba el siguiente comando:

```
ping 142.250.200.132
```

- Esa IP corresponde a uno de los servidores de Google, pero... ¿cómo es posible que el ping esté funcionando y los servidores de Google me envíen respuestas si "no tienes internet"? Pues la realidad es que sí que "tienes Internet", estás conectado a la red y hay tráfico, pero hay un servicio que está teniendo problemas, y es el de DNS (por eso en el paso anterior te dio algunos avisos y/o errores). ¿Recuerdas qué hacía este servicio? Pues eso es el causante de no funcionen las URLs para acceder a equipos remotos, pero sí las IPs.

- Bueno, vamos a solucionar el problema de los DNS, para ello sólo tienes que indicar qué servidores DNS quieres usar (normalmente se indica un servidor DNS primario y alguno secundario, por si falla el principal). Puedes utilizar los que tenía tu máquina real, o poner unos genéricos (por ejemplo es muy común usar los servidores DNS públicos ofrecidos por google https://developers.google.com/speed/public-dns/, que tienen IP: 8.8.8.8 y 8.8.4.4).

- Para indicar los servidores DNS, se utiliza el fichero de configuración /etc/resolv.conf
Edita este fichero, ten cuidado, es un fichero del sistema, así que NO toques nada de lo que está escrito, simplemente añade al final:
```
nameserver 8.8.8.8
nameserver 8.8.4.4
```
- Guarda los cambios y... voilà !! Ya "vuelves a tener Internet" ;) Comprueba que ya sí puedes navegar por la red, y que tanto comandos como ping o nslookup te funcionan (por cierto, ¿para qué sirve nslookup?):
```
ping www.google.com
nslookup www.google.com
```

- Por ahora parece que todo va bien, pero la solución realizada en el apartado anterior es temporal, porque el fichero /etc/resolv.conf es un fichero dinámico que se crea cada vez que se inicializan las interfaces, por lo que cuando reinicies el equipo, o simplemente cuando bajes y subas la interfaz (ifdown e ifup), el fichero /etc/resolv.conf volverá a generarse con la configuración original y otra vez estarás "sin internet". Prueba para que veas que sucede así.

- Por este motivo, y para evitar tener que poner a mano los servidores DNS cada vez que reiniciemos la máquina o la interfaz, necesitamos que los cambios sean permanentes. Para ello, necesitarás instalar un paquete llamado: resolvconf
IMPORTANTE: antes de proceder a instalar el software, sincroniza tu lista local de paquetes con los repositorios.

- Este paquete corresponde a un demonio con ese mismo nombre (resolvconf). Una vez instalado el demonio, comprueba que está iniciado y habilitado.

- Después de realizar los pasos anteriores, sólo tienes que añadir los servidores DNS en el directorio de configuración del demonio (/etc/resolvconf/resolv.conf.d). Allí verás varios ficheros, uno llamado head (donde va la cabecera del fichero /etc/resolv.conf, todo lo que indiques ahí se colocará AL PRINCIPIO de /etc/resolv.conf), y otro fichero llamado tail (donde va la "cola" o parte final del fichero, lo que escribas ahí se pondrá AL FINAL de /etc/resolv.conf). Edita este último fichero tail y añade los servidores DNS de Google:
```
nameserver 8.8.8.8
nameserver 8.8.4.4
```
- Ahora reinicia la interfaz (ifdown e ifup), o bien reinicia la máquina, y verás que el fichero /etc/resolv.conf ya incluye los servidores DNS de forma permanente, por lo que deberías poder trabajar sin problemas.

- Para finalizar, reinicia la máquina y comprueba que todo es correcto, que sólo tienes una IP y es la que asignaste estáticamente, que la máscara, broadcast y pasarela son los correctos, que puedes navegar por internet sin problemas, etc. También puedes pedirle a algún compañero que haga ping a tu nueva IP estática, para ver si está funcionando correctamente. Envía un mensaje a través del aula virtual al profe indicando tu IP estática, para poder darla de alta en el sistema de corrección... ¡Eso es todo! ;)

### Práctica A2. Configuración IP (Windows)

- Usando PowerShell, cambia la IP de la máquina virtual de Windows con la misma configuración que la vista en la práctica A1 (misma IP estática, máscara, gateway, etc). Puedes seguir este tutorial o algún otro similar: https://techexpert.tips/es/powershell-es/powershell-configurar-una-direccion-ip-estatica/

Nota: Ten en cuenta que el parámetro PrefixLength es el equivalente al CIDR. Por ejemplo, -PrefixLength 24 equivale a CIDR /24 o máscara 255.255.255.0. Elige el valor de PrefixLength correcto cuando vayas a indicar la configuración de la IP estática.

- Una vez cambiada la IP, comprueba que todo es correcto (IP estática permanente, máscara, pasarela y DNS correctos, etc.). Avisa al profe cuando hayas acabado para revisar y marcar esta tarea como realizada.

### Práctica A3. Conexión TCP/IP
- Instala la aplicación WireShark en tu máquina GNU/Linux y luego ejecútala como superusuario para mostrar cómo se inicia y finaliza una conexión TCP.

</div>