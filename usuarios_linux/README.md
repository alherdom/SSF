Resuelve los siguientes apartados en la máquina virtual de GNU/Linux. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione:

1. Muestra todos los usuarios de tu máquina virtual. ¿Dónde está esa información? ¿Qué datos guarda el sistema sobre sus usuarios y cómo se organizan?
```
cat /etc/passwd
```
2. ¿Por qué hay tantos usuarios? De todos ellos, ¿cuáles realmente pueden abrir una consola de comandos? ¿cuáles podrían inciar una sesión con una contraseña válida? ¿Cómo sabes estos datos? ¿Por qué crees que es así?
3. Fíjate en el UID de los usuarios. ¿Ves alguna diferencia entre los usuarios con UID < 1000 y los que tiene un UID >= 1000? ¿Por qué es así?
4. Muestra todos los grupos de tu máquina virtual. ¿Dónde está esa información? ¿Qué datos guarda el sistema sobre sus grupos y cómo se organizan?
5. ¿Por qué hay tantos grupos? Intenta buscar información sobre qué funciones tienen los diferentes grupos de tu sistema, en los apuntes hay un enlace con algo de información.
6. ¿Cómo comprobarías si un usuario existe ya en el sistema? ¿Y un grupo?
7. Crea el usuario "test01" de forma que su home sea /home/test01 (se deben copiar la configuración básica de /etc/skel) y su shell sea /bin/bash.
8. Intenta abrir una sesión como "test01" una vez creado... ¿puedes? ¿Por qué? ¿Cómo lo arreglarías?
9. El usuario "test01", ¿qué grupo principal tiene? Cámbialo para que sea su grupo principal sea "tests".-
10. Borra el grupo principal antiguo de test01, ¿puedes eliminarlo? ¿Por qué?
11. Borra el grupo "tests", ¿puedes eliminarlo? ¿Por qué?
12. Asigna algunos grupos secundarios a "test01". Indica para qué sirve cada uno de los grupos creados
13. Asigna algunos grupos más secundarios a "test01", SIN borrar los que ya tenía
14. Elimina algunos grupos secundarios del usuario test01
15. Bloquea al usuario test01. Luego intenta abrir una sesión... ¿puedes? ¿Por qué?
16. Desbloquea al usuario test01. ¿Se ha perdido algo de su información?
17. Cambia la información de test01 indicando su nombre completo, oficina, teléfono, etc.
18. Cambia la shell de test01 a una que no permita ejecutar comandos
19. Vuelve a dejarle a test01 su shell original
20. Añade restricciones al usuario test01 de forma que tenga que cambiar la contraseña cada 15 días y que le avisen 3 días antes, dándole 2 días de margen para poder cambiar una contraseña caducada sin que se bloquee su cuenta. Además, la cuenta quedará deshabilitada el 30 de junio.
21. Elimina el usuario test01 con todo el contenido en su espacio personal. Ten en cuenta que test01 podría seguir conectado.
22. ¿Qué pasaría si test01 siguiera conectado en el momento que se elimina su cuenta? ¿Podría seguir usando el equipo con normalidad? ¿Cómo harías para cerrar inmediatamente todos sus procesos que estuvieran aún en ejecución?