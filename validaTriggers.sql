/*
SCRIPT PARA LA VALIDACION DE TRIGGERS
*/

--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---                 SUELDO MAYOR A 5000
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


--$$$$$$$$$$$$$$$   VERIFICACION    $$$$$$$$$
-- ERROR SUELDO MENOR A 5000
BEGIN TRAN
select 'Marca error sueldo menor a 3000' as mensaje
INSERT INTO ENCARGADO 
VALUES (1,3000)
ROLLBACK

--SIN ERROR SUELDO MAYOR A 5000
BEGIN TRAN
select 'No marca error sueldo mayor a 5000' as mensaje
INSERT INTO ENCARGADO 
VALUES (1,8000)
ROLLBACK


--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---             VALIDA JERARQUIA TIPOS
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


-- $$$$$$$$$$$      PRUEBAS         $$$$$$$$$ 
-- no nos permite porque ya existe ese CURP
select 'Marca error curp existente' as mensaje
INSERT INTO PERSONAL (tipo, nombre, usuario, contrasena, CURP, calle, numero, CP, alcaldia, colonia)
VALUES
    ('V', 'Juanita Sánchez', 'juanitasanchez', '987654', 'ASDFG987654ZXCVBNM', 'Calle21', 'Numero21', 10021, 'Álvaro Obregón', 'San Ángel')
--No permite porque no existe ese tipo
select 'Marca error tipo S no valido' as mensaje
INSERT INTO PERSONAL (tipo, nombre, usuario, contrasena, CURP, calle, numero, CP, alcaldia, colonia)
VALUES
    ('S', 'Juanita Sánchez', 'juanitasanchez', '987654', 'ASDMMM87654ZXCVBNM', 'Calle21', 'Numero21', 10021, 'Álvaro Obregón', 'San Ángel')


--ERRRO TIPO S NO EXISTE
select 'Marca error tipo S no valido' as mensaje
UPDATE PERSONAL
SET tipo = 'S' where id_personal= 4
--SI DEJA HACER EL CAMBIO
BEGIN TRAN
select 'no error tipo valido' as mensaje
UPDATE PERSONAL
SET CURP = 'H' where id_personal= 4
ROLLBACK


--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---             OFERTAS NO MAYOR A 40 DIAS
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


--$$$$$$        PRUEBAS             $$$$$$$
--ERROR OFERTA DURA MÁS DE 40 DIAS
BEGIN TRAN
select 'Marca erroroferta mas de 40' as mensaje
INSERT INTO OFERTAS_FISICOS (tipo, descripcion, Finicio, Ffin)
VALUES 
    ('N', 'Descuento del 20% en collares y correas para perros', '2023-06-13', '2023-10-23')
ROLLBACK 

--NO HAY ERROR OFERTA NO DURA MAS DE 40
BEGIN TRAN
select 'no marca error oferta menos de 40' as mensaje
INSERT INTO OFERTAS_FISICOS (tipo, descripcion, Finicio, Ffin)
VALUES 
    ('N', 'Descuento del 20% en collares y correas para perros', '2023-06-13', '2023-7-23')
ROLLBACK 

--ERROR LA OFERTA DURARÁ MÁS DE 40 DÍAS
BEGIN TRAN
select 'Marca error si actualiza oferta mas de 40' as mensaje
UPDATE OFERTAS_FISICOS 
SET Ffin = '2023-10-23'
WHERE id_oferta=1
ROLLBACK

--SIN EERROR LA OFERTA NO DURA MÁS DE 40 DÍAS
BEGIN TRAN
select 'no marca error oferta no dura mas de 40' as mensaje
UPDATE OFERTAS_FISICOS 
SET Ffin = '2023-07-21'
WHERE id_oferta=1
ROLLBACK



--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---             COMISION POR CADA VENTA
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

--CALCULO DE LA COMISION SE HACE DESDE EL CHECK DE LA TABLA
--POR CADA VENTA ACTUALIZA EL SALARIO DEL ENCARGADO


--$$$$$$        PRUEBAS             $$$$$$$
-- Al insertar una venta al encargado id = 16, se actualiza su sueldo base
BEGIN TRAN
select 'Venta para encargado 16 -> modifica sueldo' as mensaje
select * from ENCARGADO where id_personal=16
INSERT INTO COMPRA_FISICA (total, id_personal, id_desgloseVenta)
    VALUES (1000, 16, 10)
select * from ENCARGADO where id_personal=16
ROLLBACK


--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---           ESTANDARES Y NOMENCLATURA
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$



--ERROR PORQUE EL RFC TIENE CARACTER ESPECIAL TRIGGER JERARQUIA
select 'Marca error caracter invalido en curp' as mensaje
BEGIN TRAN
INSERT INTO PERSONAL (tipo, nombre, usuario, contrasena, CURP, calle, numero, CP, alcaldia, colonia)
VALUES
    ('V', 'Juanita Sánchez', 'juanitasanchez', '987654', 'ASDFG98%654ZXCVBNM', 'Calle21', 'Numero21', 10021, 'Álvaro Obregón', 'San Ángel')
ROLLBACK
--ERROR PORQUE EL CORREO ES INVALIDO
BEGIN TRAN
select 'Marca error correo invalido' as mensaje
INSERT INTO USUARIO_COMUN (nombre, apellidoPaterno, apellidoMaterno, CURP, nombreUsuario, contrasena,
     genero, telefono, correo, calle, numero, CP, alcaldia, colonia, numeroTarjeta, vigenciaTarjeta)
VALUES
('Carlos', 'Pérez', 'Magnum', 'MEHH890123HDFRNR01', 'carlos', 'contraseña1', 'masculino', '55555555', 
'carlospgmail.com', 'Calle 1', '10', 12345, 'Benito Juárez', 'Nápoles', '1234567890123456', '2024-01-01')
ROLLBACK

--NO HAY ERROR CORREO VALIDO
BEGIN TRAN
select 'Sin error' as mensaje
INSERT INTO USUARIO_COMUN (nombre, apellidoPaterno, apellidoMaterno, CURP, nombreUsuario, contrasena,
     genero, telefono, correo, calle, numero, CP, alcaldia, colonia, numeroTarjeta, vigenciaTarjeta)
VALUES
('Carlos', 'Pérez', 'Magnum', 'MEHH890123HDFRNR01', 'carlos', 'contraseña1', 'masculino', '55555555', 
'carlosp@gmail.com', 'Calle 1', '10', 12345, 'Benito Juárez', 'Nápoles', '1234567890123456', '2024-01-01')
ROLLBACK
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
---             CANCELACION 15%
--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

--VALIDADO EN EL CHECK DE LA TABLA
