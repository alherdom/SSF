## Ejercicio C (MS Windows)
1. Mostrar el PID, nombre y prioridad de todos los procesos del sistema.
- tasklist
2. Mostrar el PID, nombre y prioridad de todos los procesos del sistema que empiecen por la letra "c".
- tasklist /fi "IMAGENAME eq c*"
3. Lanza varias instancias del "Bloc de notas" (notepad.exe) y muestra todos sus PIDs.

4. Muestra todos los procesos que consuman más de 50MB de memoria



5. Muestra solo los procesos que estén ejecutándose (estado RUNNING)

- tasklist /fi "STATUS eq running"

6. Muestra todos los procesos que llevan consumidos más de 10 segundos de tiempo de CPU y tienen más de 10MB en memoria



7. Finaliza de forma inmediata todos los blocs de notas (lanza varias veces el programa si no lo habías hecho antes).

- Terminar todos los procesos que se llamen "notepad.exe": taskkill  /fi "IMAGENAME eq notepad.exe" o también taskkill /IM notepad.exe

8. Lanza una calculadora, obtén su PID y finaliza su ejecución usando su PID.

- Terminar el proceso con PID 1234 y todos los procesos iniciados por él (añadir /t): taskkill /t /PID 1234

9. Ejecuta una calculadora con la prioridad mínima y otro con la prioridad máxima.

- Cómo indicar una prioridad en el momento de ejecutar una aplicación, por ejemplo el notepad (las prioridades se indican con: /low, /BelowNormal, /normal, /AboveNormal, /high, /RealTime):

- start "" /AboveNormal notepad.exe
- start "" /Normal notepad.exe

10. Modifica la prioridad de las dos calculadoras del ejercicio anterior y ponla en "Normal".

- Por PID, por ejemplo el 1234: wmic process where processid="1234" CALL setpriority "Above normal"
- Por nombre, por ejemplo todos los notepad: wmic process where name="notepad.exe" CALL setpriority "Normal"