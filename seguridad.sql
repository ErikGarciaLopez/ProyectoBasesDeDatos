use GUARDERIA
go

--Creando login Consulta
CREATE LOGIN usuarioConsulta WITH PASSWORD='1234zaq*', DEFAULT_DATABASE=GUARDERIA, CHECK_EXPIRATION=OFF, 
CHECK_POLICY=OFF
GO
--Creando user Consulta
create user usuarioConsulta for login usuarioConsulta
go
--ROL db_datareader
ALTER ROLE db_datareader ADD MEMBER usuarioConsulta

--Creando login Gestor
CREATE LOGIN usuarioGestor WITH PASSWORD='1234zaq*', DEFAULT_DATABASE=GUARDERIA, CHECK_EXPIRATION=OFF, 
CHECK_POLICY=OFF
GO
--Creando user Gestor
create user usuarioGestor for login usuarioGestor
go
--ROL db_writer
ALTER ROLE db_datawriter ADD MEMBER usuarioGestor


--Creando login Administrador
CREATE LOGIN usuarioAdministrador WITH PASSWORD='1234zaq*', DEFAULT_DATABASE=GUARDERIA, CHECK_EXPIRATION=OFF, 
CHECK_POLICY=OFF
GO
--Creando user Administrador
create user usuarioAdministrador for login usuarioAdministrador
go
--Otorgamos permisos para poder crear y eliminar 
--usuarios a usuarioAdministrador a nivel servidor
ALTER SERVER ROLE securityadmin ADD MEMBER usuarioAdministrador
GO

--Creando login Administrador Chiquito
CREATE LOGIN usuarioAdministradorChiquito WITH PASSWORD='1234zaq*', DEFAULT_DATABASE=GUARDERIA, CHECK_EXPIRATION=OFF, 
CHECK_POLICY=OFF
GO
--Creando user Administrador
create user usuarioAdministradorChiquito for login usuarioAdministradorChiquito
go
--Otorgamos permisos para poder crear y eliminar 
--usuarios a usuarioAdministrador a nivel servidor
ALTER ROLE db_securityadmin ADD MEMBER usuarioAdministradorChiquito
GO

-- Creando el rol Usuario Común
CREATE ROLE usuarioComun
GO


GRANT SELECT ON PRODUCTOS_ONLINE TO usuarioComun
GO
GRANT SELECT ON OFERTAS_O TO usuarioComun
GO

GRANT SELECT ON CANASTA TO usuarioComun
GO
GRANT UPDATE ON CANASTA TO usuarioComun
GO

GRANT INSERT ON MASCOTA TO usuarioComun
GO
GRANT SELECT ON MASCOTA TO usuarioComun
GO
GRANT SELECT ON VITALES TO usuarioComun
GO
GRANT SELECT ON BRAZALETE TO usuarioComun
GO
GRANT SELECT ON TELEFONOS_PERSONAL_AYUDA TO usuarioComun
GO

--Creando el rol Cuidadores
CREATE ROLE cuidador
GO

GRANT UPDATE ON BRAZALETE TO cuidador
GO
GRANT UPDATE ON VITALES TO cuidador
GO

--Creando el rol Cuidador Lider
CREATE ROLE cuidadorLider
GO

GRANT UPDATE ON BRAZALETE TO cuidadorLider
GO
GRANT UPDATE ON VITALES TO cuidadorLider
GO
GRANT UPDATE ON PERSONAL_AYUDA TO cuidadorLider
GO

--Creando el rol Veterinario
CREATE ROLE veterinario
GO


GRANT UPDATE ON REPORTE TO veterinario
GO
GRANT UPDATE ON REPORTE_MEDICAMENTO TO veterinario
GO
GRANT SELECT ON MEDICAMENTO TO veterinario
GO

--Creando el rol ENCARGADO TIENDA
CREATE ROLE encargadoTienda
GO
select * from PRODUCTOS_FISICOS

GRANT UPDATE ON PRODUCTOS_FISICOS TO encargadoTienda
GO
GRANT SELECT ON OFERTAS_FISICOS TO veterinario
GO




