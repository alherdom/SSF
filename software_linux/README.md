## Comandos Gestión de Software GNU/Linux
- Sincroniza tu lista de software local con la de los repositorios oficiales.
sudo apt update
sudo apt upgrade
- Lista todo el software que está en los repositorios oficiales, ¿cuántos paquetes hay?
- apt list | wc -l
- 77336
- Lista todo el software que tienes instalado en tu sistema, ¿cuántos paquetes tienes?
- apt list --installed | wc -l
- 2146
- Lista todo el software que puede ser actualizado en tu sistema, ¿cuántos son?
apt list --upgradable | wc -l
- 1
- Muestra todos los repositorios que usa tu sistema para gestionar el software... ¿son todos oficiales? ¿hay alguno de empresas externas? ¿y PPA?
- nano /etc/apt/sources.list
- #deb cdrom:[Linux Mint 21 _Vanessa_ - Release amd64 20220726]/ jammy main
- Lista todos los repositorios que tienes en tu sistema. Al listarlos aparecerán etiquetas como jammy, vanessa, main, universe, multiverse, restricted, security, backports... ¿qué significan?
- apt list
- Main, repositorio principal mantenido por Canonical.
- Universe, repositorio mantenido por la comunidad.
- Restricted, mantenido por Canonical, todo el software restringido, solo tendra actualizaciones - o soluciones cuando los creadores lo consideren.
- Multivers... 
- Al listar todos los paquetes, verás etiquetas como i386, amd64, beta, rc, etc.). Identifica 7 de estas etiquetas y explica su significado.
- i386: hace referencias a versiones de 32 bits.
- amd64: hace referencias versiones de 64 bits.
- beta: versión de prueba, no se ha testeado lo suficiente, tendrá fallos.
- RC: Release Candidate, candidato a ser publicado, ha pasado todos los test.
- LTS: Long Term Support, versión final con soporte de larga duración.
- arm64, aarch64: procesadores ARM (RISC) de 64 bits
- deprecated: software obsoleto
- En GNU/Linux hay una pequeña aplicación llamada "galletas de la fortuna" (fortune cookies) que muestra un mensaje al iniciar una shell. - Búscala e instálala en tu sistema.
sudo aptitude install fortune-mod
fortune
Generosity and perfection are your everlasting goals.
- Instala varios paquetes que te puedan ser útiles: reproductores multimedia, navegadores, juegos, etc. Antes de instalarlos, muestra información sobre los mismos, qué dependencias tienen, qué versión se va a instalar, etc.
apt search notepad
apt show notepadqq
apt install notepadqq
- De la lista de software a actualizar, elige un paquete y actualiza sólo ese paquete.
sudo apt --upgradable
sudo apt install --only-upgrade [nombre-paquete]
- Actualiza todos los paquetes del sistema.
sudo apt-get update
sudo apt-get upgrade
- Reinstala algún paquete de los que hayas instalado en estos ejercicios.
sudo apt-get reinstall [nombre-paquete]
- Elimina algún paquete de los instalados en estos ejercicios, pero dejando su configuración.
sudo apt-get remove [nombre-paquete]
- Elimina totalmente algún paquete de los instalados en estos ejercicios.
sudo apt-get remove [nombre-paquete]
sudo apt-get purge [nombre-paquete]
- Instala el navegador Google Chrome, o MS Teams, o Skype... ¿cómo lo has hecho? ¿por qué?
Descargo en linea el paquete de chrome para debina y 64 bits usando "wget -c"
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome64.deb
Descomprimo el paquete
sudo dpkg -i chrome64.deb
- Investiga cómo podemos indicar durante la instalación si queremos añadir o no los paquetes recomendados, los sugeridos y/o las mejoras.
- Busca alguna empresa (de reconocido prestigio) que tenga su software en repositorios y añade ese repositorio. ¿Puedes ver todos los paquetes del nuevo repositorio nada más añadirlo o necesitas hacer alguna operación previa? ¿Cuál y por qué? Instala alguno de sus paquetes.
- Busca algún usuario (de reconocido prestigio) que tenga software en repositorios personales y añade ese repositorio. ¿Puedes ver todos los paquetes del nuevo repositorio nada más añadirlo o necesitas hacer alguna operación previa? ¿Cuál y por qué? Instala alguno de sus paquetes.
- Elimina el software instalado a través de repositorios externos en los ejercicios anteriores, y elimina también esos repositorios externos.
- Elimina todos los paquetes del sistema que se instalaron como dependencias y ya no son necesarios.

## FHS en GNU/Linux
- ¿Qué hace el siguiente comando?: ls -l /
 listará todos los archivos situados en la raíz /
- Después de ejecutar el comando anterior, explica para qué se utiliza cada directorio de los que aparecen en la salida
bin: archivos binarios.
boot: arranque del sistema.
C: disco.
cdrom: reservado para el lector cdrom.

- ¿Por qué tenemos tres directorios aparentemente iguales? Explica para qué se usa cada uno de ellos: /bin, /usr/bin y /usr/local/bin
- ¿Por qué tenemos varios directorios aparentemente iguales? Explica para qué se usa cada uno de ellos: /lib, /lib32, etc.
- Al instalar un software, gran parte de él va a uno de los siguientes directorios, ¿para qué se usa cada uno? /usr, /usr/local y /opt
