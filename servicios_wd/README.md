<div align=justify>

 ## Hoja de ejercicios de Servicios y Demonios
 
 ### MS Windows

1) Usando la consola (cmd), elige dos o tres servicio no primordiales de Windows (como los relacionados con Xbox, teléfono, módem, etc.) y usa comandos de consola para obtener datos de este servicio y de su estado actual. Prueba a detenerlo, iniciarlo, pausarlo, reanudarlo, etc. Déjalo en su estado inicial.
- sc query
- sc qc fax


2) Escoge alguno de los servicios del apartado anterior y cambia su modo de inicio (de automático a manual o viceversa, inicio diferido, etc.). Déjalo luego en su estado inicial.
- sc config fax start=auto
- sc qc fax

3) Repite los ejercicios anteriores anterior usando PowerShell
- Get-Service -Name se*
Status   Name               DisplayName
------   ----               -----------
Running  seclogon           Secondary Logon
Running  SENS               System Event Notification
Stopped  ServiceLayer       ServiceLayer

- Get-Service -DisplayName se*

Status   Name               DisplayName
------   ----               -----------
Running  lanmanserver       Server
Running  SamSs              Security Accounts Manager
Running  seclogon           Secondary Logon
Stopped  ServiceLayer       ServiceLayer
Running  wscsvc             Security Center

- Get-Service -DisplayName ServiceLayer, Server

Status   Name               DisplayName
------   ----               -----------
Running  lanmanserver       Server
Stopped  ServiceLayer       ServiceLayer

</div>