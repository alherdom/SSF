1. ¿Por qué MS Windows distingue entre usuarios/grupos locales y globales?

- ...

2. Muestra todos los usuarios locales de tu máquina virtual. ¿Cuál es la función de cada usuario?

```
net users
```

3. Muestra información detallada del usuario que estás usando ahora mismo. ¿Qué significa cada línea? ¿A qué grupos perteneces?

```
net user nombre
```

4. Muestra todos los grupos locales de tu máquina virtual. ¿Qué función tiene cada grupo (busca unos cuantos)?

```
net localgroup
```

5. Muestra información detallada del grupo "Usuarios". ¿Quién pertenece a este grupo? Repite la operación para el grupo de "Administradores"

```
net localgroup Usuarios
```

```
net localgroup Administradores
```

6. Crea un usuario test01 SIN indicar contraseña

```
net user test01 /add
```

7. Crea un usuario test02 indicando la contraseña en el propio comando

```
net user test02 test02 /add
```

8. Crea un usuario test03 y solicita que se indique la contraseña por teclado, sin mostrarla

```
net user test03 * /add
```

9. Prueba a abrir sesión con los usuarios creados. ¿Puedes acceder con todos? Si no puedes acceder con alguno(s), indica cuál es el problema y soluciónalo.

- ...

10. ¿A qué grupo(s) local(es) pertenecen los usuarios creados?

- Usuarios

11. Crea un grupo local llamado Informática. Añade los tres usuarios anteriores a ese grupo y muestra la lista de usuarios del grupo para ver que así es.

```
net localgroup Infromatica /add
```

```
net localgroup Infromatica test01 tes02 test03 /add
```

```
net localgroup Informatica
```

12. Haz que test03 sea administrador.

```
net localgroup Administradores test03 /add
```

13. Haz que la cuenta de test01 caduque al final de 2023 y que tenga que cambiar la contraseña la próxima vez que inicie sesión.

```
net user test01 /logonpasswordchg:yes
```

```
net user test01 /expires:{fecha}
```

14. Desactiva al usuario test02.

```
net user test02 /active:no
```

15. Haz que el usuario test03 NO pueda cambiar su contraseña, y que esta NO sea obligatoria.

```
net user test01 /passwordchg:no
```

```
net user test01 /passwordreq:no
```

16. Prueba a iniciar de nuevo sesión con cada usuario... ¿qué sucede?

- ...

17. Indica el nombre completo del usuario test01 (invéntate uno) y añade comentarios a su cuenta.

```
net user test01 /fullname:nombre_completo
```

```
net user test01 /command:comentario
```

18. Elimina al usuario test03 del grupo local de "Informática".

```
net localgroup Informatica test03 /delete
```

19. Muestra la configuración global de las cuentas (longitud mínima de las contraseñas, duración, bloqueos, etc.).

```
net accounts
```

20. Modifica la configuración global para que todas las contraseñas tengan una longitud mínima de 6 caracteres, se tengan que cambiar cada mes y no se puedan usar las últimas 3 contraseñas).

```
net accounts /minpwlen:6
```

```
net accounts /minpwlen:6
```

```
net accounts /maxpwage:30
```

```
net accounts /maxpwage:30
```

```
net accounts /uniquepw:3
```

21. Elimina el grupo local de "Informática". Muestra todos los grupos locales para asegurate de que está eliminado.

```
net localgroup Informatica /delete
```

22. Elimina todos los usuarios creados en estos ejercicios. Muestra todos los usuarios locales para asegurarte de que han sido eliminados.

```
net user test01 test02 test03 /del
```
