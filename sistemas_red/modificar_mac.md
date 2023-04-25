<div align="justify">

## GNU/Linux

__Puedes hacer todos los apartados con los comandos vistos en clase: ifconfig, ip, etc.__

__1. La mayoría de equipos disponen de varios adaptadores de red (cable, WiFi, etc.). Muestra todos los adaptadores de red de tu equipo con su dirección MAC asociada, indicando a qué conexión corresponden y la información más relevante de cada adaptador.__

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

__2. Elige un adaptador de red (interfaz) de los listados anteriormente, vamos a cambiar la dirección MAC y hacer otras operaciones. Para ello:__

   1. Muestra y apunta la dirección MAC original.

        ```    
        alejandro10  ~  ifconfig enp0s3
        enp0s3: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
                inet 192.168.31.191  netmask 255.255.255.0  broadcast 192.168.31.255
                inet6 fe80::abd0:3247:bccc:385f  prefixlen 64  scopeid 0x20&lt;link&gt;
                ether 08:00:27:58:5e:99  txqueuelen 1000  (Ethernet)
                RX packets 21736  bytes 25907333 (25.9 MB)
                RX errors 0  dropped 0  overruns 0  frame 0
                TX packets 8754  bytes 3782103 (3.7 MB)
                TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        ```

2.  Desactiva la interfaz a la que le vas a cambiar la MAC (recuerda que para hacer cambios en la configuración de red, primero debes desactivarla).

    ```
    sudo ifconfig enp0s3 down
    
    ```

3. Modifica la MAC. La MAC elegida deberá ser del tipo: AA:BB:CC:DD:EE:FF, donde:

    1. AA:BB:CC: Según el ciclo en el que estés (ASR, DAM o DAW), busca el código HEXADECIMAL de cada letra en una tabla ASCII.

        <br>

        ```
        DAW -> 44:41:57**
        ```

    2. DD:EE:FF: Cada byte es el código hexadecimal ASCII de la primera letra de tu primer nombre, la primera letra de tu apellido y la primera letra de tu segundo apellido.

        <br>
        
        ```
        AHD -> 41:48:44**
        ```

    3. Alumno DAW, Alejandro Hernández Domínguez (AHD)  tendría que poner: DAWAHD en código hexadecimal ASCII:

        <br>
        
        ```
        D:A:W:A:H:D = 44:41:57:41:48:44
        ```

    4. Fíjate que hemos separado la dirección MAC en una primera parte (primeros 3 bytes o 24 bits) y una segunda parte (últimos 3 bytes o 24 bits). ¿Qué tiene de particular cada una de estas partes en las direcciones MAC y por qué se ha hecho así?
        
        <br>
        
        ```
        La dirección MAC está conformada por 48 bits direccion mac agrupados por 6 octetos, donde 3 identifican al fabricante y los otros 3 corresponden al NIC o modelo del dispositivo
        ```

    4. Activa el "modo promiscuo". ¿Qué significa este modo?

        ```
        sudo ifconfig enp0s3 promisc**
        ```

    5. Vuelve a activar esa interfaz de red.
        
        ```
        ifconfig enp0s3 up**
        ```
    
    6. Muestra de nuevo la información asociada a esa interfaz para comprobar que los cambios se han aplicado correctamente, muestra que la MAC ha sido modificada y que la tarjeta está en modo promiscuo.

        <pre><span style="background-color:#0087D7"> alejandro10 </span><span style="background-color:#585858"><font color="#0087D7"></font></span><span style="background-color:#585858"> ~ </span><font color="#585858"></font> ifconfig enp0s3
        enp0s3: flags=4419&lt;UP,BROADCAST,RUNNING,PROMISC,MULTICAST&gt;  mtu 1500
            inet 192.168.31.38  netmask 255.255.255.0  broadcast 192.168.31.255
            inet6 fe80::abd0:3247:bccc:385f  prefixlen 64  scopeid 0x20&lt;link&gt;
            ether 44:41:57:41:48:44  txqueuelen 1000  (Ethernet)
            RX packets 47572  bytes 46926381 (46.9 MB)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 25525  bytes 10229542 (10.2 MB)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0</pre>
 
3. ¿Los cambios hechos en el apartado anterior son temporales o permanentes? Reinicia la máquina virtual y vuelve a mostrar la información de esa interfaz... ¿se siguen mostrando los datos que modificaste o los originales? ¿El adaptador está en "modo promiscuo" o no? ¿Por qué? 

    ```
    Los cambios son temporales, no se mantienen y la configuración de red vuelve a la original.
    ```

    <pre><span style="background-color:#0087D7"> alejandro10 </span><span style="background-color:#585858"><font color="#0087D7"></font></span><span style="background-color:#585858"> ~ </span><font color="#585858"></font> ifconfig enp0s3
    enp0s3: flags=4163&lt;UP,BROADCAST,RUNNING,MULTICAST&gt;  mtu 1500
        inet 192.168.31.191  netmask 255.255.255.0  broadcast 192.168.31.255
        inet6 fe80::abd0:3247:bccc:385f  prefixlen 64  scopeid 0x20&lt;link&gt;
        ether 08:00:27:58:5e:99  txqueuelen 1000  (Ethernet)
        RX packets 5254  bytes 5378979 (5.3 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2281  bytes 970417 (970.4 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0</pre>

## MS Windows

Existen diferentes comandos para mostrar la información de red desde consola (ipconfig, getmac, netsh, etc.). El cambio de MAC, también se puede hacer de diferentes formas:
- Por la interfaz gráfica, modificando las propiedades del adaptador de red.
- Modificando el Registro (NO usar esa forma en esta práctica).
- Por comandos, por ejemplo usando en la PowerShell.
- etc.
En MS Windows, realiza los siguientes pasos:
1. Muestra por comando la información de la red (investiga qué comandos y opciones te interesan para mostrar los detalles). ¿Qué adaptadores de red hay? ¿Qué función tiene cada uno?

    ```
    C:\Windows\system32>ipconfig /all

    Configuración IP de Windows

    Nombre de host. . . . . . . . . : DESKTOP-BBIOHG8
    Sufijo DNS principal  . . . . . :
    Tipo de nodo. . . . . . . . . . : híbrido
    Enrutamiento IP habilitado. . . : no
    Proxy WINS habilitado . . . . . : no

    Adaptador de Ethernet Ethernet:

    Sufijo DNS específico para la conexión. . :
    Descripción . . . . . . . . . . . . . . . : Intel(R) PRO/1000 MT Desktop Adapter
    Dirección física. . . . . . . . . . . . . : 08-00-27-58-5E-99
    DHCP habilitado . . . . . . . . . . . . . : sí
    Configuración automática habilitada . . . : sí
    Vínculo: dirección IPv6 local. . . : fe80::4114:4df:e8a8:790%11(Preferido)
    Dirección IPv4. . . . . . . . . . . . . . : 192.168.31.191(Preferido)
    Máscara de subred . . . . . . . . . . . . : 255.255.255.0
    Concesión obtenida. . . . . . . . . . . . : martes, 25 de abril de 2023 11:47:23
    La concesión expira . . . . . . . . . . . : martes, 25 de abril de 2023 23:47:22
    Puerta de enlace predeterminada . . . . . : 192.168.31.1
    Servidor DHCP . . . . . . . . . . . . . . : 192.168.31.1
    IAID DHCPv6 . . . . . . . . . . . . . . . : 101187623
    DUID de cliente DHCPv6. . . . . . . . . . : 00-01-00-01-2A-FE-D6-EC-08-00-27-58-5E-99
    Servidores DNS. . . . . . . . . . . . . . : 192.168.31.1
    NetBIOS sobre TCP/IP. . . . . . . . . . . : habilitado
    ```

2. Muestra la MAC original y apúntula. ¿Coincide este MAC original de Windows con la original de GNU/Linux? ¿Por qué?
Investiga y cambia la MAC por la interfaz gráfica. Utiliza la misma MAC que en GNU/Linux.
    ```
    Windows y Linux, tienen las misma dirección MAC.
    ```
    <p align="center">
    <img width=310 src="img\Captura0.PNG"><img width=400 src="img\Captura1.PNG">
    </p>

    ```
    C:\Windows\system32>ipconfig /all

    Configuración IP de Windows

    Nombre de host. . . . . . . . . : DESKTOP-BBIOHG8
    Sufijo DNS principal  . . . . . :
    Tipo de nodo. . . . . . . . . . : híbrido
    Enrutamiento IP habilitado. . . : no
    Proxy WINS habilitado . . . . . : no

    Adaptador de Ethernet Ethernet:

    Sufijo DNS específico para la conexión. . :
    Descripción . . . . . . . . . . . . . . . : Intel(R) PRO/1000 MT Desktop Adapter
    Dirección física. . . . . . . . . . . . . : 44-41-57-41-48-44
    DHCP habilitado . . . . . . . . . . . . . : sí
    Configuración automática habilitada . . . : sí
    Vínculo: dirección IPv6 local. . . : fe80::aae:c2b2:5046:7248%11(Preferido)
    Dirección IPv4. . . . . . . . . . . . . . : 192.168.31.38(Preferido)
    Máscara de subred . . . . . . . . . . . . : 255.255.255.0
    Concesión obtenida. . . . . . . . . . . . : martes, 25 de abril de 2023 12:00:31
    La concesión expira . . . . . . . . . . . : miércoles, 26 de abril de 2023 0:00:31
    Puerta de enlace predeterminada . . . . . : 192.168.31.1
    Servidor DHCP . . . . . . . . . . . . . . : 192.168.31.1
    IAID DHCPv6 . . . . . . . . . . . . . . . : 101187623
    DUID de cliente DHCPv6. . . . . . . . . . : 00-01-00-01-2A-FE-D6-EC-08-00-27-58-5E-99
    Servidores DNS. . . . . . . . . . . . . . : 192.168.31.1
    NetBIOS sobre TCP/IP. . . . . . . . . . . : habilitado
    ```
    
3. Investiga y cambia la MAC a través de la PowerShell, utilizando la misma MAC que en GNU/Linux.

    ```
    PS C:\Windows\system32> Get-NetAdapter

    Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
    ----                      --------------------                    ------- ------       ----------             ---------
    Ethernet                  Intel(R) PRO/1000 MT Desktop Adapter         11 Up           08-00-27-58-5E-99         1 Gbps
    ```   

4. Primero lista todos los adaptadores de red y su MAC asociada con el cmdlet:
Get-NetAdapter | select name, macaddress
Luego para cambiar la MAC puedes usar algún cmdlet como:
Set-NetAdapter ...
Set-NetAdapterAdvancedProperty ...

    ```
    PS C:\Windows\system32> Get-NetAdapter

    Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
    ----                      --------------------                    ------- ------       ----------             ---------
    Ethernet                  Intel(R) PRO/1000 MT Desktop Adapter         11 Up           08-00-27-58-5E-99         1 Gbps
    ```
    ```
    PS C:\Windows\system32> set-NetAdapter -name "Ethernet" -MacAddress "44-41-57-41-48-44"

    Confirmar
    ¿Está seguro de que desea realizar esta acción?
    Set-NetAdapter 'Ethernet' -MacAddress 444157414844
    [S] Sí  [O] Sí a todo  [N] No  [T] No a todo  [U] Suspender  [?] Ayuda (el valor predeterminado es "S"): S
    ```

5. Una vez cambiada la MAC, muestra de nuevo la información de la red, para comprobar que la MAC sea la que has modificado.

    ```
    PS C:\Windows\system32> Get-NetAdapter

    Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
    ----                      --------------------                    ------- ------       ----------             ---------
    Ethernet                  Intel(R) PRO/1000 MT Desktop Adapter         11 Up           44-41-57-41-48-44         1 Gbps
    ```

6. ¿Los cambios hechos en el apartado anterior son temporales o permanentes? Reinicia la máquina virtual y vuelve a mostrar la información de esa interfaz... ¿se siguen mostrando los datos que modificaste o los originales? ¿Por qué?

    ```
    C:\Users\Alejandro10>ipconfig /All

    Configuración IP de Windows

    Nombre de host. . . . . . . . . : DESKTOP-BBIOHG8
    Sufijo DNS principal  . . . . . :
    Tipo de nodo. . . . . . . . . . : híbrido
    Enrutamiento IP habilitado. . . : no
    Proxy WINS habilitado . . . . . : no

    Adaptador de Ethernet Ethernet:

    Sufijo DNS específico para la conexión. . :
    Descripción . . . . . . . . . . . . . . . : Intel(R) PRO/1000 MT Desktop Adapter
    Dirección física. . . . . . . . . . . . . : 44-41-57-41-48-44
    DHCP habilitado . . . . . . . . . . . . . : sí
    Configuración automática habilitada . . . : sí
    Vínculo: dirección IPv6 local. . . : fe80::aae:c2b2:5046:7248%11(Preferido)
    Dirección IPv4. . . . . . . . . . . . . . : 192.168.31.38(Preferido)
    Máscara de subred . . . . . . . . . . . . : 255.255.255.0
    Concesión obtenida. . . . . . . . . . . . : martes, 25 de abril de 2023 13:54:13
    La concesión expira . . . . . . . . . . . : miércoles, 26 de abril de 2023 1:54:13
    Puerta de enlace predeterminada . . . . . : 192.168.31.1
    Servidor DHCP . . . . . . . . . . . . . . : 192.168.31.1
    IAID DHCPv6 . . . . . . . . . . . . . . . : 101187623
    DUID de cliente DHCPv6. . . . . . . . . . : 00-01-00-01-2B-D9-73-C4-44-41-57-41-48-44
    Servidores DNS. . . . . . . . . . . . . . : 192.168.31.1
    NetBIOS sobre TCP/IP. . . . . . . . . . . : habilitado
    ```
</div>