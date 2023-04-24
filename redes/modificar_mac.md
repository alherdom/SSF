<div align="justify">

# GNU/Linux

Puedes hacer todos los apartados con los comandos vistos en clase: ifconfig, ip, etc.

1. La mayoría de equipos disponen de varios adaptadores de red (cable, WiFi, etc.). Muestra todos los adaptadores de red de tu equipo con su dirección MAC asociada, indicando a qué conexión corresponden y la información más relevante de cada adaptador.

<pre><span style="background-color:#0087D7">alejandro10 </span><span style="background-color:#585858"><font color="#0087D7"></font></span><span style="background-color:#585858"> ~ </span><font color="#585858"></font> ifconfig
enp0s3: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet 192.168.31.191  netmask 255.255.255.0  broadcast 192.168.31.255
        inet6 fe80::abd0:3247:bccc:385f  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether 08:00:27:58:5e:99  txqueuelen 1000  (Ethernet)
        RX packets 331  bytes 48215 (48.2 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 197  bytes 25808 (25.8 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73&lt;UP,LOOPBACK,RUNNING&gt;  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10&lt;host&gt;
        loop  txqueuelen 1000  (Bucle local)
        RX packets 59  bytes 7112 (7.1 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 59  bytes 7112 (7.1 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0</pre>

2. Elige un adaptador de red (interfaz) de los listados anteriormente, vamos a cambiar la dirección MAC y hacer otras operaciones. Para ello:

    1. Muestra y apunta la dirección MAC original.

    <pre><span style="background-color:#0087D7"> alejandro10 </span><span style="background-color:#585858"><font color="#0087D7"></font></span><span style="background-color:#585858"> ~ </span><font color="#585858"></font> ifconfig enp0s3
    enp0s3: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet 192.168.31.191  netmask 255.255.255.0  broadcast 192.168.31.255
        inet6 fe80::abd0:3247:bccc:385f  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether 08:00:27:58:5e:99  txqueuelen 1000  (Ethernet)
        RX packets 21736  bytes 25907333 (25.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 8754  bytes 3782103 (3.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0</pre>

    2.  Desactiva la interfaz a la que le vas a cambiar la MAC (recuerda que para hacer cambios en la configuración de red, primero debes desactivarla).
    <div align="center">

    **ifconfig enp0s3 down**
    </div>

    3. Modifica la MAC. La MAC elegida deberá ser del tipo: AA:BB:CC:DD:EE:FF, donde:
        1. AA:BB:CC: Según el ciclo en el que estés (ASR, DAM o DAW), busca el código HEXADECIMAL de cada letra en una tabla ASCII.
        <div align="center">

        **DAW -> 44:41:57**
        </div>
        2. DD:EE:FF: Cada byte es el código hexadecimal ASCII de la primera letra de tu primer nombre, la primera letra de tu apellido y la primera letra de tu segundo apellido.
        <div align="center">

        **AHD -> 41:48:44**
        </div>
        3. Alumno DAW, Alejandro Hernández Domínguez (AHD)  tendría que poner: DAWAHD en código hexadecimal ASCII:
        <div align="center">

        **D: A: W: A: H: D**
        **44:41:57:41:48:44**
        </div>
        4. Fíjate que hemos separado la dirección MAC en una primera parte (primeros 3 bytes o 24 bits) y una segunda parte (últimos 3 bytes o 24 bits). ¿Qué tiene de particular cada una de estas partes en las direcciones MAC y por qué se ha hecho así?

        <p>

        __La dirección MAC está conformada por 48 bits direccion mac agrupados por 6 octetos, donde 3 identifican al fabricante y los otros 3 corresponden al NIC o modelo del dispositivo__
        </p>

    4. Activa el "modo promiscuo". ¿Qué significa este modo?
    5. Vuelve a activar esa interfaz de red.
    <div align="center">

    **ifconfig enp0s3 up**
    </div>
    6. Muestra de nuevo la información asociada a esa interfaz para comprobar que los cambios se han aplicado correctamente, muestra que la MAC ha sido modificada y que la tarjeta está en modo promiscuo.
 
3. ¿Los cambios hechos en el apartado anterior son temporales o permanentes? Reinicia la máquina virtual y vuelve a mostrar la información de esa interfaz... ¿se siguen mostrando los datos que modificaste o los originales? ¿El adaptador está en "modo promiscuo" o no? ¿Por qué? 

</div>