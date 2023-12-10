/*
    ██████╗░███╗░░░███╗██╗░░░░░
    ██╔══██╗████╗░████║██║░░░░░
    ██║░░██║██╔████╔██║██║░░░░░
    ██║░░██║██║╚██╔╝██║██║░░░░░
    ██████╔╝██║░╚═╝░██║███████╗
    ╚═════╝░╚═╝░░░░░╚═╝╚══════╝
*/


/*
 ____  ____    ___     ___  ____ ____   __ ___  ___ __  ____ __  __ ______   ___    __ 
 || \\ || \\  // \\   //   ||    || \\  || ||\\//|| || ||    ||\ || | || |  // \\  (( \
 ||_// ||_// ((   )) ((    ||==  ||  )) || || \/ || || ||==  ||\\||   ||   ((   ))  \\ 
 ||    || \\  \\_//   \\__ ||___ ||_//  || ||    || || ||___ || \||   ||    \\_//  \_))
                                                                                       
*/
---------------------------------------------------------
---------------------------------------------------------
-- Realice un procedimiento almacenado para registrar una 
-- mascota y su brazalete
---------------------------------------------------------
---------------------------------------------------------

CREATE OR ALTER PROCEDURE pro_macota_brazalete
    @id_mascota INT,
    @id_brazalete INT ,
    @id_personal INT
AS
BEGIN 
    IF EXISTS (SELECT * FROM MASCOTA WHERE id_mascota = @id_mascota)
    BEGIN
        IF EXISTS (SELECT * FROM PERSONAL_AYUDA WHERE id_personal = @id_personal)
        BEGIN 
            IF EXISTS (SELECT * from BRAZALETE WHERE id_brazalete = @id_brazalete)
            BEGIN 
                IF EXISTS (SELECT * FROM BRAZALETE_MASCOTA WHERE (id_mascota = @id_mascota and estatus = 'A'))
                    SELECT 'La mascota ya tiene un registro activo' as WARNING
                -- VALIDANDO la mascota no ete registrada ya
                ELSE
                BEGIN
                    IF EXISTS (SELECT * FROM BRAZALETE_MASCOTA WHERE (id_brazalete = @id_brazalete and estatus = 'A'))
                    -- si el brazalete ya li esta usando otra mascota
                        SELECT 'El brazalete ya tiene un registro activo' as WARNING
                    ELSE
                    BEGIN
                        IF EXISTS (SELECT * FROM BRAZALETE_MASCOTA WHERE id_personal = @id_personal)
                        -- si ya esta el personal ayuda con asignaciones verificamos las reglas de integridad
                        BEGIN 
                            DECLARE @MaxAsignaciones int
                            SET @MaxAsignaciones = 5

                            IF ((SELECT COUNT(*) FROM BRAZALETE_MASCOTA 
                                    WHERE (id_personal = @id_personal and estatus = 'A')) < @MaxAsignaciones)
                            -- Si el personal cuida a menos de 5 mascotas seguimos
                            BEGIN 
                                INSERT INTO BRAZALETE_MASCOTA (id_mascota,id_brazalete,id_personal) VALUES
                                    (@id_mascota,@id_brazalete,@id_personal)
                                SELECT 'Registro exitoso' as Resultado
                            END
                            ELSE
                                SELECT 'El personal ya tiene 5 mascotas a su cargo'
                        END
                        ELSE
                        BEGIN
                            INSERT INTO BRAZALETE_MASCOTA (id_mascota,id_brazalete,id_personal) VALUES
                                (@id_mascota,@id_brazalete,@id_personal)
                            SELECT 'Registro exitoso' as Resultado
                        END
                    END
                END 
            END
            ELSE
                SELECT 'id_brazalete no valido' as ERROR
        END
        ELSE
            SELECT 'id_personalAyuda no valido' as ERROR
    END
    ELSE
        SELECT 'id_mascota no valido' as ERROR
END
GO

select id_personal, count(id_brazaleteMascota) from BRAZALETE_MASCOTA
    Where estatus = 'A'
    GROUP BY id_personal

-- marca error porque un encargado no puede estar a cargo de màs de 5 mascotas
EXEC pro_macota_brazalete @id_mascota = 10,@id_brazalete = 9, @id_personal = 31
DBCC CHECKIDENT('BRAZALETE_MASCOTA',RESEED,20)
-- marca error porque id mascota no existe
EXEC pro_macota_brazalete @id_mascota = 100,@id_brazalete = 9, @id_personal = 26
DBCC CHECKIDENT('BRAZALETE_MASCOTA',RESEED,20)
-- marca error porque id BRAZALETE EN REGISTRO ACTIVO
EXEC pro_macota_brazalete @id_mascota = 10,@id_brazalete = 1, @id_personal = 26
DBCC CHECKIDENT('BRAZALETE_MASCOTA',RESEED,20)
-- si ejecuta
EXEC pro_macota_brazalete @id_mascota = 10,@id_brazalete = 9, @id_personal = 26
SELECT * FROM BRAZALETE_MASCOTA

select id_personal, count(id_brazaleteMascota) from BRAZALETE_MASCOTA
    Where estatus = 'A'
    GROUP BY id_personal

---------------------------------------------------------
---------------------------------------------------------
-- Realice un procedimiento almacenado para el actualizar 
-- de las lecturas en los brazaletes
---------------------------------------------------------
---------------------------------------------------------

CREATE OR ALTER PROCEDURE pr_update_brazalte
    @id_brazalete int,
    @comio bit,
    @comida VARCHAR(100),
    @cuantoComio VARCHAR(100),
    @medicamento bit,
    @cuidadoEspecial bit
AS 
BEGIN 
    IF EXISTS (SELECT * FROM BRAZALETE WHERE id_brazalete = @id_brazalete)
    -- si existe el brazalete seguimos
    BEGIN 
        IF EXISTS (SELECT * FROM BRAZALETE_MASCOTA WHERE (id_brazalete = @id_brazalete and estatus = 'A'))
        BEGIN
            UPDATE BRAZALETE
                SET comio = @comio,
                    comida = @comida,
                    cuantoComio = @cuantoComio,
                    medicamento = @medicamento,
                    cuidadoEspecial = @cuidadoEspecial
                WHERE id_brazalete = @id_brazalete

            SELECT 'UPDATED' as MENSAJE
        END   
        ELSE
            SELECT 'id_brazalete no esta en uso' as WARNING
    END
    ELSE
        SELECT 'id_brazalete no valido' as ERROR
END
GO

SELECT * FROM BRAZALETE_MASCOTA 
DELETE FROM BRAZALETE_MASCOTA
    WHERE id_brazaleteMascota = 21
DELETE FROM BRAZALETE_MASCOTA
    WHERE id_brazaleteMascota = 20
DBCC CHECKIDENT('BRAZALETE_MASCOTA',RESEED,19)

-- No actualiza porque el id_brazalete no existe
exec pr_update_brazalte 100, 1, 'Croquetas Pavo', 'Comió 1/4 de plato', 0, 0
DBCC CHECKIDENT('BRAZALETE_MASCOTA',RESEED,19)
-- No actualiza porque el id_brazalete no esta siendo utilizando en brazalete_mascota
exec pr_update_brazalte 9, 1, 'Croquetas Pavo', 'Comió 1/4 de plato', 0, 0
DBCC CHECKIDENT('BRAZALETE_MASCOTA',RESEED,19)
-- si ejecuta
exec pr_update_brazalte 8, 1, 'Croquetas Pavo', 'Comió 1/4 de plato', 0, 0

---------------------------------------------------------
---------------------------------------------------------
-- Realice un procediendo almacenado para registrar una 
-- consulta
---------------------------------------------------------
---------------------------------------------------------
CREATE OR ALTER PROCEDURE pr_consulta
    @diagnostico VARCHAR(255),
    @detallesExaminacion varchar(1000),
    @fechaHora datetime,
    @id_personal int
AS 
BEGIN
    if exists (select * from VETERINARIO where id_personal = @id_personal)
    -- verificamos exista el personal
    BEGIN
        INSERT INTO REPORTE
            VALUES(@diagnostico,@detallesExaminacion,@fechaHora,@id_personal)
        SELECT 'REPORE GENERADO' as RESULTADO
    END
    ELSE
        SELECT 'no exste el id_personal del veterinario' as ERROR
END
GO

SELECT * FROM REPORTE
SELECT * FROM VETERINARIO -- SOLO TENEMOS 15
INSERT INTO REPORTE (diagnostico, detallesExaminacion, fechaHora, id_personal)
VALUES
-- marca error porque no existe el veterinario
   EXEC pr_consulta 'Gato LOCO', 'El gato presenta SINDROMES', '2023-06-20 12:30:00', 20
--  si ejecuta
   EXEC pr_consulta 'Gato LOCO', 'El gato presenta SINDROMES', '2023-06-20 12:30:00', 15

---------------------------------------------------------
---------------------------------------------------------
-- Realice un procedimiento almacenado para el registro y 
-- venta de medicamentos incluyendo la actualización del 
-- stock
---------------------------------------------------------
---------------------------------------------------------
CREATE OR ALTER PROCEDURE pk_add_medicamento
    @id_centro INT,
    @id_medicamento INT,
    @cantidad SMALLINT
AS 
BEGIN 
    IF EXISTS (SELECT * FROM CENTRO_CUIDADO WHERE id_centro = @id_centro)
    -- existe el centro
    BEGIN 
        IF EXISTS (SELECT * FROM MEDICAMENTO WHERE id_medicamento = @id_medicamento)
        -- verificamos exista un medicamento con el id dado
        BEGIN
            DECLARE @nombre VARCHAR(100)
            IF EXISTS (SELECT id_medicamento FROM ALMACEN WHERE (id_centro = @id_centro AND id_medicamento = @id_medicamento))
            -- Actualizamos
            BEGIN 
                DECLARE @cantidad_previa SMALLINT 
                SELECT @nombre = nombre FROM MEDICAMENTO WHERE id_medicamento = @id_medicamento
                SELECT @cantidad_previa = cantidad FROM ALMACEN WHERE (id_centro = @id_centro AND id_medicamento = @id_medicamento)
                SET @cantidad = @cantidad_previa + @cantidad
                UPDATE ALMACEN
                SET cantidad = @cantidad WHERE (id_centro = @id_centro AND id_medicamento = @id_medicamento)
                SELECT 'Update --> ' + @nombre + ': ' + CAST(@cantidad as varchar)
            END
            ELSE
            -- Insertamos
            BEGIN 
                SELECT @nombre = nombre FROM MEDICAMENTO WHERE id_medicamento = @id_medicamento
                INSERT INTO ALMACEN VALUES
                    (@id_centro, @id_medicamento, @cantidad)
                SELECT 'Agregado --> ' + @nombre + ': ' + CAST(@cantidad as varchar)
            END
        END
        ELSE
            SELECT 'id_medicamento no valido' as ERROR
    END
    ELSE
        SELECT 'id_CENTRO no valido' as ERROR
END

SELECT * FROM ALMACEN
select * from CENTRO_CUIDADO -- solo tenemos 7
SELECT * FROM MEDICAMENTO -- SOLO TENEMOS 12
-- agrega porque no existia stock para el centro 5
EXEC pk_add_medicamento 5, 1, 50-- Paracetamol
-- actualiza porque ya existia stock
EXEC pk_add_medicamento 2, 6, 60 -- Loratadina
-- ERROR PORQUE NO TENEMOS MEDICAMENTO CON ESE ID
EXEC pk_add_medicamento 2, 50, 60 -- Loratadina
-- ERROR PORQUE NO TENEMOS CENTRO CON ESE ID
EXEC pk_add_medicamento 100, 5, 60 -- Loratadina

CREATE OR ALTER PROCEDURE pk_quit_medicamento
    @id_reporte INT,
    @id_medicamento INT,
    @dosis VARCHAR(100)
AS 
BEGIN 
    IF EXISTS (SELECT * FROM REPORTE WHERE id_reporte = @id_reporte)
    -- existe el reporte
    BEGIN 
        IF EXISTS (SELECT * FROM MEDICAMENTO WHERE id_medicamento = @id_medicamento)
        -- verificamos exista un medicamento con el id dado
        BEGIN
            -- obtenemos el id_centro del reporte
            DECLARE @id_centro int
            DECLARE @cantidad smallint
            SELECT @id_centro = v.id_centro from VETERINARIO v
                WHERE v.id_personal = (SELECT r.id_personal FROM REPORTE r
                                            WHERE r.id_reporte = @id_reporte)
            DECLARE @nombre VARCHAR(100)
            IF EXISTS (SELECT id_medicamento FROM ALMACEN WHERE (id_centro = @id_centro AND id_medicamento = @id_medicamento))
            -- Actualizamos e insertamos en medicamento_registro (receta)
            BEGIN 
                DECLARE @cantidad_previa SMALLINT 
                SELECT @nombre = nombre FROM MEDICAMENTO WHERE id_medicamento = @id_medicamento
                SELECT @cantidad_previa = cantidad FROM ALMACEN WHERE (id_centro = @id_centro AND id_medicamento = @id_medicamento)
                SET @cantidad = @cantidad_previa - 1
                UPDATE ALMACEN
                    SET cantidad = @cantidad WHERE (id_centro = @id_centro AND id_medicamento = @id_medicamento)
                SELECT 'Update --> ' + @nombre + ': ' + CAST(@cantidad as varchar)

                INSERT INTO REPORTE_MEDICAMENTO VALUES
                    (@id_reporte,@id_medicamento,@dosis)
                SELECT 'receta insertada' as MENSAJE
            END
            ELSE
                SELECT 'No hay en existencia' as MENSAJE
        END
        ELSE
            SELECT 'id_medicamento no valido' as ERROR
    END
    ELSE
        SELECT 'is_reporte no valido' as ERROR
END

SELECT * FROM REPORTE_MEDICAMENTO rm
    INNER JOIN REPORTE r on rm.id_reporte = r.id_reporte
    INNER JOIN VETERINARIO v on r.id_personal = v.id_personal
    Inner JOIN CENTRO_CUIDADO c on v.id_centro = c.id_centro
select * from ALMACEN
SELECT * FROM MEDICAMENTO

-- no debe ejecutarse porque solo tengo 7 reportes
exec pk_quit_medicamento 10, 1, '1 comprimido cada 8 horas'
-- no debe ejecutarse porque solo tengo 12 medicamentos
exec pk_quit_medicamento 7, 1000, 'PRUEBA 2'
-- no debe ejecutarse porque el centro 1 done pertenece la consulta, no tiene ese medicamento
exec pk_quit_medicamento 7, 12, 'PRUEBA 3'
-- si jala
-- actualizamos el stock del centro considerando por cada receta se da una entidad del medicamento (caja, botella, etc)
exec pk_quit_medicamento 5, 1, 'PRUEBA 4'
/*
  ____ __ __ __  __   ___ __   ___   __  __  ____  __ 
 ||    || || ||\ ||  //   ||  // \\  ||\ || ||    (( \
 ||==  || || ||\\|| ((    || ((   )) ||\\|| ||==   \\ 
 ||    \\_// || \||  \\__ ||  \\_//  || \|| ||___ \_))
                                                      
*/

-- Funcion para ver el inventario de medicamentos, con su costo por centro.

CREATE FUNCTION ObtenerDetalleAlmacen()
RETURNS TABLE
AS
RETURN
(
    SELECT A.id_centro, M.nombre AS medicamento, A.cantidad, M.costo
    FROM ALMACEN A
    JOIN MEDICAMENTO M ON A.id_medicamento = M.id_medicamento
    JOIN CENTRO_CUIDADO C ON A.id_centro = C.id_centro
);

SELECT *
FROM dbo.ObtenerDetalleAlmacen();


-- Funcion para reporte de ventas e medicamentos en un periodo de tiempo, incluyendo cantidad y monto total

CREATE FUNCTION ObtenerDetalleMedicamentos()
RETURNS TABLE
AS
RETURN
(
    SELECT M.nombre AS medicamento, COUNT(RM.id_medicamento) AS cantidad, SUM(M.costo) AS monto_total
    FROM MEDICAMENTO M
    INNER JOIN REPORTE_MEDICAMENTO RM ON M.id_medicamento = RM.id_medicamento
    INNER JOIN REPORTE R ON RM.id_reporte = R.id_reporte
    INNER JOIN RECIBO RC ON R.id_reporte = RC.id_reporte
    WHERE R.fechaHora >= '2023-01-01' AND R.fechaHora <= '2023-06-30' 
    GROUP BY M.nombre
);

SELECT * FROM dbo.ObtenerDetalleMedicamentos();


/*
 __ __ __  __  ______  ___   __ 
 || || || (( \ | || | // \\ (( \
 \\ // ||  \\    ||   ||=||  \\ 
  \V/  || \_))   ||   || || \_))
                                
*/

-- 3. Listado de las mascotas y su dueño datos generales, número de días en la guardería, datos generales de ambos. 
-- El reporte se obtiene en un periodo de fechas

CREATE VIEW listadoMascotas AS
SELECT
    M.nombre AS nombre_mascota, M.edad AS edad_mascota, M.sexo AS sexo_mascota, M.rasgosCaracteristicos AS rasgos_mascota,
    U.nombre AS nombre_dueño, U.apellidoPaterno AS apellido_paterno_dueño, U.apellidoMaterno AS apellido_materno_dueño, U.CURP AS curp_dueño,
    U.telefono AS telefono_dueño,
    R.finicio AS fecha_inicio_guarderia, R.ffin AS fecha_fin_guarderia, R.numDias AS numero_dias_guarderia
FROM
    MASCOTA AS M
    INNER JOIN USUARIO_COMUN AS U ON M.id_UsuarioComun = U.id_UsuarioComun
    INNER JOIN RESERVACION_GUARDERIA AS R ON M.id_mascota = R.id_UsuarioComun
--WHERE
    --R.finicio >= '2023-01-01' AND R.ffin <= '2023-12-31'
select * from listadoMascotas



-- 1. Gastos de cada mascota, datos de la mascota, fechas y días de estancia, descripción de gatos y costo.

CREATE VIEW desgloseMascotas AS
SELECT M.nombre AS NombreMascota, M.rasgosCaracteristicos, R.nombreRaza, E.tipo AS Especie,
       RG.finicio, RG.ffin, RG.numDias, RG.total
FROM MASCOTA AS M
JOIN USUARIO_COMUN AS UC ON M.id_UsuarioComun = UC.id_UsuarioComun
JOIN RESERVACION_GUARDERIA AS RG ON UC.id_UsuarioComun = RG.id_UsuarioComun
JOIN BRAZALETE_MASCOTA AS BM ON M.id_mascota = BM.id_mascota
JOIN ESPECIE AS E ON M.id_especie = E.id_especie
JOIN RAZA AS R ON E.id_raza = R.id_raza

select * from desgloseMascotas

-- 2. Listado con datos generales de las consultas , incluyendo veterinario que lo atendió, diagnóstico y medicamento.

CREATE VIEW datosGeneralesConsultas as
SELECT
    R.id_reporte AS NumeroReporte,
    V.cedula AS CedulaVeterinario,
    V.especialidad AS EspecialidadVeterinario,
    R.diagnostico AS Diagnostico,
    M.nombre AS Medicamento
FROM
    REPORTE AS R
    JOIN VETERINARIO AS V ON R.id_personal = V.id_personal
    JOIN REPORTE_MEDICAMENTO AS RM ON R.id_reporte = RM.id_reporte
    JOIN MEDICAMENTO AS M ON RM.id_medicamento = M.id_medicamento

select * from datosGeneralesConsultas


/*
 ______ ____  __   ___    ___   ____ ____   __ 
 | || | || \\ ||  // \\  // \\ ||    || \\ (( \
   ||   ||_// || (( ___ (( ___ ||==  ||_//  \\ 
   ||   || \\ ||  \\_||  \\_|| ||___ || \\ \_))
                                               
*/

--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---                 SUELDO MAYOR A 5000
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

Create or alter trigger tr_verificasueldoI on ENCARGADO
instead of insert 
as 
begin 
if exists(select sueldoBase from inserted)
    BEGIN
        DECLARE @sueldo INT
        Select @sueldo = sueldoBase from inserted
        if(@sueldo < 5000)
        BEGIN
            SELECT 'No se puede poner un sueldo menor a 5000'
        END
        ELSE
        BEGIN
            INSERT INTO ENCARGADO 
            select id_personal, sueldoBase from inserted
            SELECT 'Se ha insertado el encargado :)'
        END
    END
end
go

--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---             VALIDA JERARQUIA TIPOS
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
CREATE OR ALTER TRIGGER tr_jerarquia on PERSONAL
instead of INSERT 
AS 
BEGIN 
        IF EXISTS (select * from PERSONAL
                        WHERE CURP = (select CURP from INSERTED))
        begin
            select 'Ya existe personal con este CURP' 
        end 

        -- ya no se puede seguir con la inserción
        ELSE IF ((SELECT tipo FROM INSERTED) NOT IN ('A','H','G','E','V'))
        BEGIN
            SELECT 'Tipo incorrecto, verifique las restricciones' 
        end
        -- si el tipo es incorrecto n insertamos
        ELSE IF EXISTS (
        SELECT *
        FROM inserted
        WHERE CURP LIKE '%[^A-Za-z0-9]%' or nombre LIKE '%[^A-Za-z0-9]%' or usuario LIKE '%[^A-Za-z0-9]%' 
        or calle LIKE '%[^A-Za-z0-9]%' or colonia LIKE '%[^A-Za-z0-9]%' 
        )
        BEGIN
            Select 'Haz introducido un dato erronéo, revisa bien' as mensaje
            RETURN
        END
        ELSE
        begin
            INSERT INTO PERSONAL
                SELECT tipo, nombre, usuario, contrasena, CURP, calle,
                numero, CP, alcaldia, colonia FROM INSERTED
            SELECT 'Inseción hecha correctamente :)'
        end
END
GO

CREATE OR ALTER TRIGGER tr_jerarquiaU on PERSONAL
instead of UPDATE 
AS 
BEGIN 
        -- ya no se puede seguir con la inserción
        IF ((SELECT tipo FROM INSERTED) NOT IN ('A','H','G','E','V'))
        BEGIN
            SELECT 'Tipo incorrecto, verifique las restricciones' 
        end
        -- si el tipo es incorrecto n insertamos
        ELSE
        begin
            UPDATE PERSONAL SET tipo = (SELECT tipo FROM inserted)
            WHERE id_personal = (select id_personal from inserted)
            SELECT 'Actualizacion hecha correctamente :)'
        end
END
GO

--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---             OFERTAS NO MAYOR A 40 DIAS
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
CREATE OR ALTER TRIGGER tr_ofertas on OFERTAS_FISICOS
instead of INSERT  
AS 
BEGIN 
        -- ya no se puede seguir con la inserción
        IF ((SELECT Ffin FROM INSERTED) - (SELECT Finicio FROM INSERTED)>40)
        BEGIN
            SELECT 'LA OFERTAS NO PUEDES DURAR MAS DE 40 DIAS' 
        end
        -- si el tipo es incorrecto n insertamos
        ELSE
        begin
            insert into OFERTAS_FISICOS 
            SELECT tipo, descripcion, Finicio, Ffin FROM inserted
            SELECT 'OFERTA ESTABLECIDA CORRECTAMENTE'
        end
END
GO

CREATE OR ALTER TRIGGER tr_ofertasU on OFERTAS_FISICOS
instead of UPDATE  
AS 
BEGIN 
        -- ya no se puede seguir con la inserción
        IF ((SELECT Ffin FROM INSERTED) - (SELECT Finicio FROM DELETED)>40)
        BEGIN
            SELECT 'LA OFERTAS NO PUEDES DURAR MAS DE 40 DIAS' 
        end
        -- si el tipo es incorrecto n insertamos
        ELSE
        begin
            UPDATE OFERTAS_FISICOS SET Ffin=(SELECT Ffin FROM INSERTED)
            WHERE id_oferta=(select id_oferta from inserted)
            SELECT 'OFERTA ACTUALIZADA CORRECTAMENTE'
        end
END
GO


--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---             COMISION POR CADA VENTA
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

--CALCULO DE LA COMISION SE HACE DESDE EL CHECK DE LA TABLA
--POR CADA VENTA ACTUALIZA EL SALARIO DEL ENCARGADO

CREATE OR ALTER TRIGGER tr_comision on COMPRA_FISICA
instead of insert  
AS 
BEGIN 
    DECLARE @comision SMALLMONEY
    select @comision = comision from inserted
    UPDATE ENCARGADO
    SET sueldoBase = sueldoBase + @comision
    SELECT 'Se ha insertado la compra, el encargado ha recibido su comision'

END
GO

--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---           ESTANDARES Y NOMENCLATURA
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

CREATE or ALTER TRIGGER tr_nomenclaturaUser 
on USUARIO_COMUN
INSTEAD OF INSERT
AS
BEGIN
   if exists (select  correo from inserted
   where correo like '%@%')
   BEGIN
      INSERT INTO USUARIO_COMUN SELECT nombre, apellidoPaterno, apellidoMaterno, CURP, 
      nombreUsuario, contrasena, genero, telefono, correo, calle, numero, CP, alcaldia, 
      colonia, numeroTarjeta, vigenciaTarjeta
      FROM inserted 
      SELECT 'Se inserta el usuario correctamente' as mensaje
   END
   ELSE
   BEGIN
      SELECT 'Ingresa un correo válido con caracter @' as mensaje
   END
END
GO

--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---             CANCELACION 15%
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

--VALIDADO EN EL CHECK DE LA TABLA

