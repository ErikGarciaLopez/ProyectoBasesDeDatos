--DBCC CHECKIDENT('PERSONAL',RESEED,0)
--------------------------------------
--------------------------------------
--- PERSONAL
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
-- Registros de tipo 'V' (19 registros)
INSERT INTO PERSONAL (tipo, nombre, usuario, contrasena, CURP, calle, numero, CP, alcaldia, colonia)
VALUES
    ('V', 'Juanita Sánchez', 'juanitasanchez', '987654', 'ASDFG987654ZXCVBNM', 'Calle21', 'Numero21', 10021, 'Álvaro Obregón', 'San Ángel'),
    ('V', 'Roberto Torres', 'robertotorres', '987654', 'ASDFG987654ZXCVBNM', 'Calle22', 'Numero22', 10022, 'Benito Juárez', 'Del Valle'),
    ('V', 'Patricia Ramírez', 'patriciaramirez', '987654', 'ASDFG987654ZXCVBNM', 'Calle23', 'Numero23', 10023, 'Cuautitlán Izcalli', 'Centro'),
    ('V', 'Daniel García', 'danielgarcia', '987654', 'ASDFG987654ZXCVBNM', 'Calle24', 'Numero24', 10024, 'Ecatepec', 'San Cristóbal Centro'),
    ('V', 'Silvia López', 'silvialopez', '987654', 'ASDFG987654ZXCVBNM', 'Calle25', 'Numero25', 10025, 'Toluca', 'Santa Ana Tlapaltitlán'),
    ('V', 'Rodrigo Martínez', 'rodrigomartinez', '987654', 'ASDFG987654ZXCVBNM', 'Calle26', 'Numero26', 10026, 'Naucalpan de Juárez', 'Satélite'),
    ('V', 'María Fernández', 'mariafernandez', '987654', 'ASDFG987654ZXCVBNM', 'Calle27', 'Numero27', 10027, 'Tlalnepantla de Baz', 'Lomas Verdes'),
    ('V', 'Jorge Sánchez', 'jorgesanchez', '987654', 'ASDFG987654ZXCVBNM', 'Calle28', 'Numero28', 10028, 'Coacalco de Berriozábal', 'San Lorenzo Tetlixtac'),
    ('V', 'Sara Rodríguez', 'sararodriguez', '987654', 'ASDFG987654ZXCVBNM', 'Calle29', 'Numero29', 10029, 'Texcoco', 'Santa Cruz de Arriba'),
    ('V', 'Fernanda González', 'fernandagonzalez', '987654', 'ASDFG987654ZXCVBNM', 'Calle30', 'Numero30', 10030, 'Metepec', 'San Miguel Totocuitlapilco'),
    ('V', 'Adrián Gómez', 'adriangomez', '987654', 'ASDFG987654ZXCVBNM', 'Calle31', 'Numero31', 10031, 'Nezahualcóyotl', 'Vicente Villada'),
    ('V', 'Laura Castro', 'lauracastro', '987654', 'ASDFG987654ZXCVBNM', 'Calle32', 'Numero32', 10032, 'Chalco', 'San Gregorio Cuautzingo'),
    ('V', 'Ricardo Herrera', 'ricardoherrera', '987654', 'ASDFG987654ZXCVBNM', 'Calle33', 'Numero33', 10033, 'Cuautitlán', 'Centro'),
    ('V', 'Diana Ramírez', 'dianaramirez', '987654', 'ASDFG987654ZXCVBNM', 'Calle34', 'Numero34', 10034, 'Atizapán de Zaragoza', 'Lomas de Atizapán'),
    ('V', 'Gabriel Martínez', 'gabrielmartinez', '987654', 'ASDFG987654ZXCVBNM', 'Calle35', 'Numero35', 10035, 'Tultitlán', 'Centro'),
    ('E', 'Carlos Martínez', 'empleado1', '987654', 'ASDFG987654ZXCVBNM', 'Calle36', 'Numero36', 10036, 'Álvaro Obregón', 'Colonia Roma'),
    ('E', 'Ana Rodríguez', 'empleado2', '987654', 'ASDFG987654ZXCVBNM', 'Calle37', 'Numero37', 10037, 'Benito Juárez', 'Colonia Del Valle'),
    ('E', 'Miguel Herrera', 'empleado3', '987654', 'ASDFG987654ZXCVBNM', 'Calle38', 'Numero38', 10038, 'Coyoacán', 'Colonia Coyoacán'),
    ('E', 'Isabel Gómez', 'empleado4', '987654', 'ASDFG987654ZXCVBNM', 'Calle39', 'Numero39', 10039, 'Cuauhtémoc', 'Colonia Condesa'),
    ('E', 'Javier López', 'empleado5', '987654', 'ASDFG987654ZXCVBNM', 'Calle40', 'Numero40', 10040, 'Gustavo A. Madero', 'Colonia Lindavista'),
    ('E', 'Martha Pérez', 'empleado6', '987654', 'ASDFG987654ZXCVBNM', 'Calle41', 'Numero41', 10041, 'Miguel Hidalgo', 'Colonia Polanco'),
    ('E', 'Roberto García', 'empleado7', '987654', 'ASDFG987654ZXCVBNM', 'Calle42', 'Numero42', 10042, 'Tlalpan', 'Colonia Pedregal'),
    ('H', 'Juan Pérez', 'juanperez', '987654', 'ASDFG987654ZXCVBNM', 'Calle43', 'Numero43', 10043, 'Iztapalapa', 'Colonia Leyes de Reforma'),
    ('H', 'María García', 'mariagarcia', '987654', 'ASDFG987654ZXCVBNM', 'Calle44', 'Numero44', 10044, 'Azcapotzalco', 'Colonia San Álvaro'),
    ('H', 'Pedro López', 'pedrolopez', '987654', 'ASDFG987654ZXCVBNM', 'Calle45', 'Numero45', 10045, 'Xochimilco', 'Colonia Nativitas'),
    ('H', 'Ana Martínez', 'anamartinez', '987654', 'ASDFG987654ZXCVBNM', 'Calle46', 'Numero46', 10046, 'Venustiano Carranza', 'Colonia Jardín Balbuena'),
    ('H', 'Luisa Torres', 'luisatorres', '987654', 'ASDFG987654ZXCVBNM', 'Calle47', 'Numero47', 10047, 'Milpa Alta', 'Colonia San Francisco Tlalnepantla'),
    ('H', 'Carlos Ramírez', 'carlosramirez', '987654', 'ASDFG987654ZXCVBNM', 'Calle48', 'Numero48', 10048, 'Tláhuac', 'Colonia Del Mar'),
    ('H', 'Laura Sánchez', 'laurasanchez', '987654', 'ASDFG987654ZXCVBNM', 'Calle49', 'Numero49', 10049, 'Cuajimalpa de Morelos', 'Colonia Cuajimalpa'),
    ('H', 'José Rodríguez', 'joserodriguez', '987654', 'ASDFG987654ZXCVBNM', 'Calle50', 'Numero50', 10050, 'Magdalena Contreras', 'Colonia San Jerónimo Lídice'),
    ('H', 'Sofía Morales', 'sofiamorales', '987654', 'ASDFG987654ZXCVBNM', 'Calle51', 'Numero51', 10051, 'Tlalpan', 'Colonia Fuentes del Pedregal'),
    ('H', 'Fernando González', 'fernandogonzalez', '987654', 'ASDFG987654ZXCVBNM', 'Calle52', 'Numero52', 10052, 'Iztacalco', 'Colonia Agrícola Oriental'),
    ('A', 'Elena Sánchez', 'esanchez', '987654', 'ASDFG987654ZXCVBNM', 'Calle53', 'Numero53', 10053, 'Tlalpan', 'Colonia Parques del Pedregal'),
    ('A', 'Roberto Rodríguez', 'rrodriguez', '987654', 'ASDFG987654ZXCVBNM', 'Calle54', 'Numero54', 10054, 'Magdalena Contreras', 'Colonia Las Águilas'),
    ('A', 'Adriana Torres', 'atorres', '987654', 'ASDFG987654ZXCVBNM', 'Calle55', 'Numero55', 10055, 'Álvaro Obregón', 'Colonia Santa Fe'),
    ('A', 'Mauricio Ríos', 'mrios', '987654', 'ASDFG987654ZXCVBNM', 'Calle56', 'Numero56', 10056, 'Miguel Hidalgo', 'Colonia Polanco'),
    ('G', 'Alejandra Ramírez', 'aramirez', '987654', 'ASDFG987654ZXCVBNM', 'Calle57', 'Numero57', 10057, 'Benito Juárez', 'Colonia Del Valle'),
    ('G', 'Felipe Herrera', 'fherrera', '987654', 'ASDFG987654ZXCVBNM', 'Calle58', 'Numero58', 10058, 'Cuauhtémoc', 'Colonia Roma'),
    ('G', 'Verónica Vargas', 'vvargas', '987654', 'ASDFG987654ZXCVBNM', 'Calle59', 'Numero59', 10059, 'Gustavo A. Madero', 'Colonia Lindavista'),
    ('G', 'Julio López', 'jlopez', '987654', 'ASDFG987654ZXCVBNM', 'Calle60', 'Numero60', 10060, 'Coyoacán', 'Colonia Del Carmen'),
    ('A', 'Luisa Gómez', 'lgomez', '987654', 'ASDFG987654ZXCVBNM', 'Calle57', 'Numero57', 10057, 'Benito Juárez', 'Colonia Del Valle'),
    ('A', 'Carlos López', 'clopez', '987654', 'ASDFG987654ZXCVBNM', 'Calle58', 'Numero58', 10058, 'Cuauhtémoc', 'Colonia Roma'),
    ('A', 'Ana Ramírez', 'aramirez', '987654', 'ASDFG987654ZXCVBNM', 'Calle59', 'Numero59', 10059, 'Gustavo A. Madero', 'Colonia Lindavista');

    SELECT * FROM PERSONAL
    SELECT count(*) FROM PERSONAL
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

--------------------------------------
--------------------------------------
--- ENCARGADO
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
    INSERT INTO ENCARGADO
        SELECT id_personal, 5000 from PERSONAL
        WHERE tipo = 'E'
    SELECT * from ENCARGADO
    SELECT count(*) from ENCARGADO
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

--------------------------------------
--------------------------------------
--- GERENTE
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
    INSERT INTO GERENTE
        SELECT id_personal from PERSONAL
        WHERE tipo = 'G'
    SELECT * from GERENTE
    SELECT count(*) from GERENTE
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

--------------------------------------
--------------------------------------
--- CENTRO
--------------------------------------
--------------------------------------
-- SELECT id_personal from PERSONAL
--     WHERE tipo = 'G' -- 37,38,39,40
-- SELECT id_personal from PERSONAL
--     WHERE tipo = 'E' -- 16,17,18,19,20,21,22
BEGIN TRANSACTION
INSERT INTO CENTRO_CUIDADO (id_oficinaRegional, colonia, alcaldia, CP, numero, nombre, calle, id_personal,id_encargado)
VALUES
    (NULL, 'Colonia1', 'Alcaldia1', 10001, 'Numero1', 'Centro1', 'Calle1', 37,16),
    (1, 'Colonia2', 'Alcaldia2', 10002, 'Numero2', 'Centro2', 'Calle2', NULL,17),
    (NULL, 'Colonia3', 'Alcaldia3', 10003, 'Numero3', 'Centro3', 'Calle3', 40,18),
    (3, 'Colonia4', 'Alcaldia4', 10004, 'Numero4', 'Centro4', 'Calle4', NULL,18),
    (5, 'Colonia5', 'Alcaldia5', 10005, 'Numero5', 'Centro5', 'Calle5', NULL,20),
    (NULL, 'Colonia6', 'Alcaldia6', 10006, 'Numero6', 'Centro6', 'Calle6', 38,21),
    (NULL, 'Colonia7', 'Alcaldia7', 10007, 'Numero7', 'Centro7', 'Calle7', 39,22);
    SELECT * FROM CENTRO_CUIDADO
    SELECT count(*) FROM CENTRO_CUIDADO
--ROLLBACK TRANSACTION
COMMIT TRANSACTION


--------------------------------------
--------------------------------------
--- PERSONAL AYUDA
--------------------------------------
--------------------------------------
-- SELECT id_personal from PERSONAL
--     WHERE tipo = 'H' -- 23,24,25,26,27,28,29,30,31,32
-- select * from CENTRO_CUIDADO -- 1,...,7
BEGIN TRANSACTION
    INSERT INTO PERSONAL_AYUDA (id_personal,edad,tipoMascota,id_centro)
        VALUES(23,25,'G',1),
              (24,32,'P',2),
              (25,28,'G',3),
              (26,40,'P',4),
              (27,38,'G',5),
              (28,23,'P',6),
              (29,41,'P',7),
              (30,21,'G',1),
              (31,29,'P',2),
              (32,30,'G',3)

    SELECT count(*) FROM PERSONAL_AYUDA
    SELECT * FROM PERSONAL_AYUDA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- VETERINARIO
--------------------------------------
--------------------------------------
-- SELECT id_personal from PERSONAL
--     WHERE tipo = 'V' --1,...,15
-- select * from CENTRO_CUIDADO -- 1,..,7
BEGIN TRANSACTION
INSERT INTO VETERINARIO (id_personal, cedula, especialidad, id_centro)
VALUES
    (1, 'CED001', 'Dermatología', 1),
    (2, 'CED002', 'Oftalmología', 2),
    (3, 'CED003', 'Ortopedia', 3),
    (4, 'CED004', 'Cardiología', 4),
    (5, 'CED005', 'Endocrinología', 5),
    (6, 'CED006', 'Odontología', 6),
    (7, 'CED007', 'Neurología', 7),
    (8, 'CED008', 'Radiología', 1),
    (9, 'CED009', 'Anestesiología', 2),
    (10, 'CED010', 'Patología', 3),
    (11, 'CED011', 'Gastroenterología', 4),
    (12, 'CED012', 'Urología', 5),
    (13, 'CED013', 'Hematología', 6),
    (14, 'CED014', 'Nutrición', 7),
    (15, 'CED015', 'Oncología', 7);
    SELECT * FROM VETERINARIO
    SELECT COUNT(*) FROM VETERINARIO
--ROLLBACK TRANSACTION
COMMIT TRANSACTION


--------------------------------------
--------------------------------------
--- ADMINISTRATIVOS
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
    INSERT INTO ADMINISTRATIVO
        SELECT id_personal, NULL from PERSONAL
        WHERE tipo = 'A'
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

UPDATE ADMINISTRATIVO
    SET id_centro = 1 where id_personal = 33
UPDATE ADMINISTRATIVO
    SET id_centro = 2 where id_personal = 34
UPDATE ADMINISTRATIVO
    SET id_centro = 3 where id_personal = 35
UPDATE ADMINISTRATIVO
    SET id_centro = 4 where id_personal = 36
UPDATE ADMINISTRATIVO
    SET id_centro = 5 where id_personal = 41
UPDATE ADMINISTRATIVO
    SET id_centro = 6 where id_personal = 42
UPDATE ADMINISTRATIVO
    SET id_centro = 7 where id_personal = 43
    SELECT * from ADMINISTRATIVO
    SELECT COUNT(*) from ADMINISTRATIVO

-----------------------————————————————————————————————————————————————————————————————————————————————————————
-----------------------————————————————————————————————————————————————————————————————————————————————————————
--------------------------------------
--------------------------------------
--- USUARIO COMUN
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO USUARIO_COMUN (nombre, apellidoPaterno, apellidoMaterno, CURP, nombreUsuario, contrasena, genero, telefono, correo, calle, numero, CP, alcaldia, colonia, numeroTarjeta, vigenciaTarjeta)
VALUES
('Juan', 'Pérez', 'García', 'PEJG890123HDFRNR01', 'juanperez', 'contraseña1', 'masculino', '55555555', 'juanperez@gmail.com', 'Calle 1', '10', 12345, 'Benito Juárez', 'Nápoles', '1234567890123456', '2024-01-01'),
('María', 'González', 'Hernández', 'GOHM890123MDFRRA02', 'mariagonzalez', 'contraseña2', 'femenino', '55555556', 'mariagonzalez@gmail.com', 'Calle 2', '20', 23456, 'Cuauhtémoc', 'Condesa', '2345678901234567', '2025-02-01'),
('Pedro', 'López', 'Sánchez', 'LOSP900123HDFRDR03', 'pedrolopez', 'contraseña3', 'masculino', '55555557', 'pedrolopez@gmail.com', 'Calle 3', '30', 34567, 'Miguel Hidalgo', 'Polanco', '3456789012345678', '2026-03-01'),
('Ana', 'Martínez', 'Gómez', 'MAGO890123MDFRMA04', 'anamartinez', 'contraseña4', 'femenino', '55555558', 'anamartinez@gmail.com', 'Calle 4', '40', 45678, 'Coyoacán', 'Del Carmen', '4567890123456789', '2027-04-01'),
('Jorge', 'Hernández', 'Flores', 'HEFJ870123HDFRJR05', 'jorgehernandez', 'contraseña5', 'masculino', '55555559', 'jorgehernandez@gmail.com', 'Calle 5', '50', 56789, 'Iztapalapa', 'Santa Martha', '5678901234567890', '2028-05-01'),
('Fernanda', 'Díaz', 'Ramírez', 'DIRF910123MDFRNN06', 'fernandadiaz', 'contraseña6', 'femenino', '55555560', 'fernandadiaz@gmail.com', 'Calle 6', '60', 67890, 'Alvaro Obregón', 'San Angel', '6789012345678901', '2029-06-01'),
('Ricardo', 'García', 'Martínez', 'GAMR840123HDFRRC07', 'ricardogarcia', 'contraseña7', 'masculino', '55555561', 'ricardogarcia@gmail.com', 'Calle 7', '70', 78901, 'Azcapotzalco', 'Clavería', '7890123456789012', '2030-07-01'),
('Laura', 'Sánchez', 'López', 'SALL900123MDFRLA08', 'laurasanchez', 'contraseña8', 'femenino', '55555562', 'laurasanchez@gmail.com', 'Calle 8', '80', 89012, 'Gustavo A. Madero', 'Lindavista', '8901234567890123', '2031-08-01'),
('Alejandro', 'Pérez', 'González', 'PEGJ750123HDFRNL09', 'alejandroperez', 'contraseña9', 'masculino', '55555563', 'alejandroperez@gmail.com', 'Calle 9', '90', 90123, 'Iztacalco', 'Agrícola Oriental', '9012345678901234', '2032-09-01'),
('Mariana', 'Hernández', 'Martínez', 'HEMM800123MDFRNR10', 'marianahernandez', 'contraseña10', 'femenino', '55555564', 'marianahernandez@gmail.com', 'Calle 10', '100', 12340, 'Venustiano Carranza', 'Morelos', '0123456789012345', '2033-10-01'),
('José', 'González', 'Pérez', 'GOPJ880123HDFRNS11', 'josegonzalez', 'contraseña11', 'masculino', '55555565', 'josegonzalez@gmail.com', 'Calle 11', '110', 23451, 'Tlalpan', 'San Pedro Mártir', '1234567890123456', '2034-11-01'),
('Sofía', 'López', 'García', 'LOGS920123MDFRFS12', 'sofialopez', 'contraseña12', 'femenino', '55555566', 'sofialopez@gmail.com', 'Calle 12', '120', 34562, 'Xochimilco', 'Barrio 18', '2345678901234567', '2035-12-01');
select * from USUARIO_COMUN
select count(*) from USUARIO_COMUN
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- CATEGORIA 
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO CATEGORIA (categoria)
VALUES 
    ('Alimentos y Snacks'),
    ('Juguetes y Entretenimiento'),
    ('Camas y Descanso'),
    ('Higiene y Cuidado');
select * from CATEGORIA
select count(*) from CATEGORIA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

--------------------------------------
--------------------------------------
--- PRODUCTO ONLINE
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO PRODUCTOS_ONLINE (stock, precio, descripcion, id_categoria)
VALUES 
    (10, 9.99, 'Alimento seco para perros, 1 kg', 1),
    (20, 5.99, 'Snacks de pollo para gatos, 100 g', 1),
	(18, 12.99, 'Collar ajustable para perros, color rojo', 1),
	(14, 16.99, 'Alimento húmedo para perros, pack de 6 unidades', 1),
	(10, 6.99, 'Snacks naturales para perros, sin aditivos ni conservantes', 1),
    (5, 14.99, 'Pelota de tenis para perros, tamaño mediano', 2),
    (15, 7.99, 'Rascador de cartón para gatos, diseño moderno', 2),
	(9, 8.99, 'Juguete con catnip para gatos, forma de ratón', 2),
	(7, 11.99, 'Juguete interactivo para gatos, con plumas y luces', 2),
	(5, 9.99, 'Ratón de juguete con plumas para gatos, colores surtidos', 2),
    (8, 29.99, 'Cama ortopédica para perros mayores, tamaño grande', 3),
    (12, 19.99, 'Cuna suave para gatos, colores variados', 3),
	(6, 39.99, 'Cama redonda para perros y gatos, tamaño pequeño', 3),
	(3, 54.99, 'Cama elevada para perros, resistente al agua', 3),
	(3, 29.99, 'Hamaca para gatos, fácil de montar en ventanas', 3),
    (30, 3.99, 'Champú para perros, aroma a coco', 4),
    (25, 6.99, 'Arena absorbente para gatos, control de olores', 4),
    (20, 4.99, 'Cepillo para perros y gatos, de cerdas suaves', 4),
    (22, 9.99, 'Cepillo de dientes para perros y gatos, de doble cabezal', 4),
    (15, 8.99, 'Cepillo deshedding para perros y gatos, para eliminar el pelo suelto', 4);
select * from PRODUCTOS_ONLINE
select count(*) from PRODUCTOS_ONLINE
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- OFERTAS
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO OFERTAS_O (tipo, descripcion, Finicio, Ffin)
VALUES
    ('N', 'Oferta especial: 20% de descuento en alimentos secos para perros', '2023-06-06', '2023-07-06'),
    ('L', 'Liquidación: Últimas unidades de juguetes para gatos', '2023-06-08', '2023-06-15'),
    ('N', 'Promoción: Compra 2 camas para perros y obtén un descuento del 15%', '2023-06-12', '2023-07-12'),
    ('N', 'Oferta relámpago: Snacks para gatos al 50% de descuento', '2023-06-15', '2023-06-16'),
    ('L', 'Gran liquidación: Todos los productos de higiene con descuentos increíbles', '2023-06-18', '2023-06-25'),
    ('N', 'Oferta destacada: Collares y correas para perros con envío gratis', '2023-06-20', '2023-07-20'),
    ('L', 'Remate final: Precios bajos en camas y cojines para gatos', '2023-06-22', '2023-06-29'),
    ('N', 'Promoción especial: Compra 3 juguetes para perros y lleva el cuarto gratis', '2023-06-25', '2023-07-25');
select * from OFERTAS_O
select count(*) from OFERTAS_O
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- RELACIÓN MUCHOS A MUCHOS (CONTARÁ)
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO CONTARA (id_producto, id_oferta)
VALUES
    (1, 1),
    (2, 3),
    (5, 2),
    (8, 4),
    (10, 5);
select * from CONTARA
select count(*) from CONTARA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- CANASTA
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO CANASTA (fecha, tarifaEnvio, total, tarifaCancelacion, id_UsuarioComun)
VALUES
    ('10:00:00.0000000', 100.00, 150.00, 22.50, 3),
    ('12:30:00.0000000', 100.00, 250.00, 37.50, 8),
    ('15:45:00.0000000', 100.00, 180.00, 27.00, 5),
    ('17:20:00.0000000', 100.00, 320.00, 48.00, 10),
    ('20:15:00.0000000', 100.00, 200.00, 30.00, 2);
select * from CANASTA
select count(*) from CANASTA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

--------------------------------------
--------------------------------------
--- CANASTA PRODUCTO
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO CANASTA_PRODUCTO (id_canasta, id_producto, num_Uni_Compra)
VALUES
	(1, 1, 2),
	(1, 3, 1),
	(2, 2, 3),
	(2, 4, 2),
	(2, 5, 1),
	(3, 1, 1),
	(3, 4, 4),
	(4, 3, 2),
	(4, 5, 3),
	(5, 2, 1),
	(5, 3, 1),
	(5, 5, 2);
select * from CANASTA_PRODUCTO
select count(*) from CANASTA_PRODUCTO
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- PRODUCTOS FISICOS
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO PRODUCTOS_FISICOS (costo, stock)
VALUES 
    (29.99, 10),
    (19.99, 5),
    (39.99, 20),
    (9.99, 15),
    (14.99, 8),
    (24.99, 30),
    (12.99, 12),
    (34.99, 7),
    (8.99, 18),
    (17.99, 3);
select * from PRODUCTOS_FISICOS
select count(*) from PRODUCTOS_FISICOS
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- OFERTAS FISICOS
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO OFERTAS_FISICOS (tipo, descripcion, Finicio, Ffin)
VALUES 
    ('N', 'Descuento del 20% en collares y correas para perros', '2023-06-13', '2023-07-23'),
    ('L', 'Oferta 3x2 en productos de higiene para gatos', '2023-06-14', '2023-07-24'),
    ('N', 'Promoción: Compra una cama para perros y llévate una manta gratis', '2023-06-15', '2023-07-25'),
    ('L', 'Descuento del 10% en juguetes interactivos para gatos', '2023-06-16', '2023-07-26'),
    ('N', 'Oferta especial: Compra un producto de salud para perros y recibe un regalo sorpresa', '2023-06-17', '2023-07-27'),
    ('L', 'Envío gratis en todos los productos físicos para gatos', '2023-06-18', '2023-07-28'),
    ('N', 'Descuento del 15% en camas ortopédicas para perros mayores', '2023-06-19', '2023-07-29');
select * from OFERTAS_FISICOS
select count(*) from OFERTAS_FISICOS
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- OFERTA RODUCTOSFISICOS
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO OFERTA_PRODUCTOSFISICOS (id_producto, id_oferta)
VALUES
    (1, 1),
    (3, 2),
    (6, 3),
    (9, 4),
    (10, 5);
select * from OFERTA_PRODUCTOSFISICOS
select count(*) from OFERTA_PRODUCTOSFISICOS
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- RAZA
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO RAZA (nombreRaza)
VALUES ('Golden Retriever'),
       ('Siamese'),
       ('Labrador Retriever'),
       ('Persian'),
       ('Bulldog'),
       ('Maine Coon'),
       ('Beagle'),
       ('Sphynx'),
       ('Poodle'),
       ('Ragdoll'),
       ('German Shepherd'),
       ('British Shorthair'),
       ('French Bulldog'),
       ('Scottish Fold'),
       ('Chihuahua');
select * from RAZA
select count(*) from RAZA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- ESPECIE
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO ESPECIE (tipo, id_raza)
VALUES 
	('P', 1), -- Golden Retriever (Perro)
	('G', 2), -- Siamese (Gato)
	('P', 3), -- Labrador Retriever (Perro)
	('G', 3), -- Labrador Retriever (Gato)
	('P', 5), -- Bulldog (Perro)
	('G', 4), -- Persian (Gato)
	('P', 6), -- Maine Coon (Perro)
	('G', 6), -- Maine Coon (Gato)
	('P', 8), -- Poodle (Perro)
	('G', 7); -- Beagle (Gato)
select * from ESPECIE
select count(*) from ESPECIE
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- MASCOTA
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO MASCOTA (nombre, sexo, edad, rasgosCaracteristicos, id_especie, id_UsuarioComun)
VALUES 
	('Max', 'M', 3, 'Juguetón y cariñoso', 1, 1),
	('Luna', 'F', 2, 'Curiosa y tranquila', 2, 2),
	('Rocky', 'M', 5, 'Energético y protector', 1, 3),
	('Coco', 'M', 4, 'Amigable y leal', 3, 4),
	('Bella', 'F', 1, 'Juguetona y cariñosa', 2, 5),
	('Charlie', 'M', 2, 'Aventurero y obediente', 4, 6),
	('Lola', 'F', 3, 'Sociable y juguetona', 6, 7),
	('Simba', 'M', 4, 'Curioso y valiente', 5, 8),
	('Mia', 'F', 2, 'Cariñosa y tranquila', 7, 9),
	('Rocky', 'M', 1, 'Divertido y activo', 4, 10);
SELECT * FROM MASCOTA
SELECT count(*) FROM MASCOTA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- BRAZALETE
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO BRAZALETE (comio, comida, cuantoComio, medicamento, cuidadoEspecial)
VALUES (1, 'Croquetas', 'Comió todo el plato', 0, 1),
(1, 'Lata de atún', 'Comió la mitad', 0, 0),
(0, 'Pollo cocido', 'No comió nada', 1, 1),
(1, 'Pienso seco', 'Comió una porción', 0, 0),
(1, 'Filete de salmón', 'Comió todo', 1, 0),
(0, 'Comida enlatada', 'No comió nada', 0, 1),
(1, 'Pavo asado', 'Comió la mitad', 1, 0),
(1, 'Pollo a la parrilla', 'Comió todo', 0, 0),
(1, 'Hamburguesa', 'Comió una porción', 1, 1),
(0, 'Vegetales hervidos', 'No comió nada', 0, 0);
select * from BRAZALETE
select count(*) from BRAZALETE
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

--------------------------------------
--------------------------------------
--- VITALES
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO VITALES (ritmoCardiaco, temperatura, nivelOxigeno, fechaHora, id_brazalete)
VALUES (80, 37.5, 98.5, '2023-06-06 08:00:00', 1),
(72, 36.9, 97.8, '2023-06-06 09:15:00', 2),
(90, 38.2, 98.9, '2023-06-06 10:30:00', 3),
(76, 37.1, 97.2, '2023-06-06 11:45:00', 4),
(85, 37.8, 98.3, '2023-06-06 13:00:00', 5),
(78, 37.2, 97.5, '2023-06-06 14:15:00', 6),
(95, 38.5, 99.1, '2023-06-06 15:30:00', 7),
(82, 37.6, 98.0, '2023-06-06 16:45:00', 8),
(88, 38.0, 98.7, '2023-06-06 18:00:00', 9),
(70, 36.7, 97.9, '2023-06-06 19:15:00', 10);
select * from VITALES
select count(*) from VITALES
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- MEDICAMENTO
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO MEDICAMENTO (nombre, costo)
VALUES 
	('Paracetamol', 10.50),
	('Ibuprofeno', 12.75),
	('Amoxicilina', 15.20),
	('Omeprazol', 8.90),
	('Dipirona', 9.50),
	('Loratadina', 7.80),
	('Cetirizina', 11.30),
	('Aspirina', 6.50),
	('Metformina', 13.40),
	('Atorvastatina', 18.60),
	('Insulina', 21.80),
	('Dexametasona', 14.90);
select * from MEDICAMENTO
select count(*) from MEDICAMENTO
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

-----------------------————————————————————————————————————————————————————————————————————————————————————————
-----------------------————————————————————————————————————————————————————————————————————————————————————————
--------------------------------------
--------------------------------------
--- TELEFONOS PERSONAL AYUDA
--------------------------------------
--------------------------------------
-- SELECT *from PERSONAL_AYUDA

BEGIN TRANSACTION
INSERT INTO TELEFONOS_PERSONAL_AYUDA (id_personal, numTelefono)
VALUES
    (23, '555-111-1111'),
    (24, '555-222-2222'),
    (25, '555-333-3333'),
    (26, '555-444-4444'),
    (27, '555-555-5555'),
    (28, '555-666-6666'),
    (29, '555-777-7777'),
    (30, '555-888-8888'),
    (31, '555-999-9999'),
    (32, '555-000-0000');
    select * from TELEFONOS_PERSONAL_AYUDA
    select count(*) from TELEFONOS_PERSONAL_AYUDA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION


--------------------------------------
--------------------------------------
---BRAZALETE MASCOTA
--------------------------------------
--------------------------------------
-- exec sp_help[BRAZALETE_MASCOTA]
-- select * from MASCOTA
-- SELECT * FROM BRAZALETE
-- select * from PERSONAL_AYUDA
DBCC CHECKIDENT('BRAZALETE_MASCOTA',reseed,0)
BEGIN TRANSACTION
    INSERT INTO BRAZALETE_MASCOTA (id_mascota, id_personal, id_brazalete, estatus)
    VALUES
        ( 1, 23, 1,'I'),
        ( 2, 23, 2,'I'),
        ( 3, 24, 3,'I'),
        ( 4, 23, 4,'I'),
        ( 5, 23, 5,'I'),
        ( 6, 23, 6,'I'),
        ( 7, 24, 7,'I'),
        ( 8, 25, 8,'I'),
        ( 9, 32, 9,'I'),
        ( 10,31, 10,'I'),
        ( 1, 31, 1,'A'),
        ( 2, 31, 2,'A'),
        ( 3, 31, 3,'A'),
        ( 4, 25, 4,'A'),
        ( 5, 28, 5,'A'),
        ( 6, 31, 6,'A'),
        ( 7, 31, 7,'A'),
        ( 8, 26, 8,'A'),
        ( 9, 24, 9,'I'),
        ( 9, 26, 10,'A');
        select * from BRAZALETE_MASCOTA
        select count(*) from BRAZALETE_MASCOTA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
DELETE FROM BRAZALETE_MASCOTA
--------------------------------------
--------------------------------------
---RESERVACION_GUARDERIA
--------------------------------------
--------------------------------------
-- exec sp_help[RESERVACION_GUARDERIA]
-- SELECT * FROM USUARIO_COMUN --12 USUARIOS
-- SELECT * FROM CENTRO_CUIDADO -- 7
BEGIN TRANSACTION
    INSERT INTO RESERVACION_GUARDERIA (finicio, ffin, costoXDia, id_centro, id_UsuarioComun)
    VALUES
        ('2023-06-01', '2023-06-03', 100, 1, 1),
        ('2023-06-02', '2023-06-05', 150, 2, 2),
        ('2023-06-03', '2023-06-06', 120, 1, 3),
        ('2023-06-04', '2023-06-07', 110, 3, 4),
        ('2023-06-05', '2023-06-08', 130, 2, 5),
        ('2023-06-06', '2023-06-09', 140, 4, 6),
        ('2023-06-07', '2023-06-10', 125, 5, 7),
        ('2023-06-08', '2023-06-11', 135, 2, 8),
        ('2023-06-09', '2023-06-12', 105, 4, 9),
        ('2023-06-10', '2023-06-13', 115, 3, 10),
        ('2023-06-11', '2023-06-14', 145, 6, 11),
        ('2023-06-12', '2023-06-15', 125, 7, 12),
        ('2023-06-13', '2023-06-16', 135, 2, 1),
        ('2023-06-14', '2023-06-17', 130, 7, 2),
        ('2023-06-15', '2023-06-18', 140, 7, 3),
        ('2023-06-16', '2023-06-19', 120, 2, 4),
        ('2023-06-17', '2023-06-20', 110, 6, 5),
        ('2023-06-18', '2023-06-21', 150, 5, 5),
        ('2023-06-19', '2023-06-22', 125, 2, 7),
        ('2023-06-20', '2023-06-23', 130, 4, 8);
        SELECT * FROM RESERVACION_GUARDERIA
        SELECT count(*) FROM RESERVACION_GUARDERIA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION


--------------------------------------
--------------------------------------
---  CUENTA
--------------------------------------
--------------------------------------
--exec sp_help[CUENTA]
--SELECT * FROM CENTRO_CUIDADO -- 7 centros
--SELECT * FROM PRODUCTOS_FISICOS -- 10 productos
BEGIN TRANSACTION
    INSERT INTO CUENTA (id_centro, id_producto)
    VALUES
        (1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (5, 5),
        (6, 6),
        (7, 7),
        (1, 8),
        (5, 9),
        (7, 10);
        SELECT * FROM CUENTA
        SELECT count(*) FROM CUENTA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

--------------------------------------
--------------------------------------
--- DESGLOSE VENTA
--------------------------------------
--------------------------------------
--exec sp_help[DESGLOSE_VENTA]
BEGIN TRANSACTION
    INSERT INTO DESGLOSE_VENTA (num_Unidades, montoParcial, id_centro, id_producto)
    VALUES
        (5, 500.00, 1, 1),
        (3, 300.00, 2, 2),
        (2, 200.00, 3, 3),
        (4, 400.00, 4, 4),
        (6, 600.00, 5, 5),
        (1, 100.00, 6, 6),
        (7, 700.00, 7, 7),
        (9, 900.00, 1, 8),
        (8, 800.00, 5, 9),
        (10, 1000.00, 7, 10);  
        SELECT * FROM DESGLOSE_VENTA
        SELECT count(*) FROM DESGLOSE_VENTA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

--------------------------------------
--------------------------------------
--- COMPRA FISICA
--------------------------------------
--------------------------------------
--exec sp_help[COMPRA_FISICA]
--SELECT * FROM DESGLOSE_VENTA -- Hay máximo 10
--SELECT * FROM ENCARGADO -- del 16 al 22

BEGIN TRANSACTION
    INSERT INTO COMPRA_FISICA (total, id_personal, id_desgloseVenta)
    VALUES
        (1000, 16, 1),
        (1500, 17, 2),
        (500, 18, 3),
        (800, 19, 4),
        (2000, 20, 5),
        (300, 21, 6),
        (600, 22, 7),
        (1200, 16, 8),
        (2600, 22, 9),
        (900, 17, 10),
        (400, 19, 1),
        (200, 20, 2),
        (700, 21, 3),
        (1100, 17, 4);
        SELECT * FROM COMPRA_FISICA
        SELECT count(*) FROM COMPRA_FISICA
--ROLLBACK TRANSACTION
COMMIT TRANSACTION

-----------------------————————————————————————————————————————————————————————————————————————————————————————
-----------------------————————————————————————————————————————————————————————————————————————————————————————


--------------------------------------
--------------------------------------
--- REPORTE
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO REPORTE (diagnostico, detallesExaminacion, fechaHora, id_personal)
VALUES
    ('Gato con fiebre', 'El gato presenta fiebre alta y falta de apetito.', '2023-06-01 10:30:00', 1),
    ('Perro con fractura', 'El perro tiene una fractura en la pata trasera derecha.', '2023-06-02 15:45:00', 2),
    ('Gato con problemas urinarios', 'El gato muestra dificultad para orinar y se lame constantemente.', '2023-06-03 11:20:00', 3),
    ('Perro con infección en el oído', 'El perro presenta secreción y mal olor en el oído derecho.', '2023-06-04 14:10:00', 4),
    ('Gato con vómitos', 'El gato ha vomitado varias veces en las últimas horas.', '2023-06-05 09:55:00', 5),
    ('Perro con picadura de insecto', 'El perro tiene una reacción alérgica a una picadura de insecto en el hocico.', '2023-06-06 13:00:00', 6),
    ('Gato con herida en la pata', 'El gato tiene una herida profunda en la pata delantera izquierda.', '2023-06-06 16:30:00', 7);
    SELECT * FROM REPORTE
    SELECT count(*) FROM REPORTE
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- REPORTE MEDICAMENTO
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO REPORTE_MEDICAMENTO (id_reporte, id_medicamento, dosis)
VALUES
    (1, 1, '1 comprimido cada 8 horas'),
    (2, 3, '1 cápsula cada 12 horas'),
    (3, 2, '2 tabletas al día'),
    (4, 4, '5 gotas en el oído afectado cada 6 horas'),
    (5, 6, '1 tableta al día'),
    (6, 5, '1 inyección intravenosa cada 24 horas'),
    (7, 8, '1 tableta cada 6 horas');
    SELECT * FROM REPORTE
    SELECT count(*) FROM REPORTE
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- RECIBO
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO RECIBO (costoTotal, tratamiento, examinacion, id_reporte, id_UsuarioComun)
VALUES
    (150.00, 100.00, 'Vacunación', 1, 1),
    (500.00, 300.00, 'Radiografía', 2, 2),
    (200.00, 150.00, 'Desparasitación', 3, 3),
    (1000.00, 800.00, 'Limpieza dental', 4, 4),
    (250.00, 200.00, 'Análisis de sangre', 5, 5),
    (80.00, 50.00, 'Corte de uñas', 6, 6),
    (300.00, 250.00, 'Baño y cepillado', 7, 7);
    SELECT * FROM RECIBO
    SELECT count(*) FROM RECIBO
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- ALMACEN
--------------------------------------
--------------------------------------
BEGIN TRANSACTION
INSERT INTO ALMACEN (id_centro, id_medicamento, cantidad)
VALUES
    (1, 1, 50), -- Paracetamol
    (1, 2, 30), -- Ibuprofeno
    (1, 3, 40), -- Amoxicilina
    (1, 4, 25), -- Omeprazol
    (1, 5, 20), -- Dipirona
    (2, 6, 35), -- Loratadina
    (2, 3, 25), -- Loratadina***
    (2, 7, 45), -- Cetirizina
    (2, 8, 60), -- Aspirina
    (2, 9, 55), -- Metformina
    (3, 10, 15), -- Atorvastatina
    (3, 2, 5), -- Atorvastatina**
    (3, 11, 10), -- Insulina
    (3, 12, 5), -- Dexametasona
    (4, 4, 35), -- Dexametasona**
    (5, 6, 35), -- Dexametasona**
    (6, 5, 55), -- Dexametasona**
    (7, 8, 20); -- Dipirona**
    SELECT * FROM ALMACEN
    SELECT count(*) FROM ALMACEN
--ROLLBACK TRANSACTION
COMMIT TRANSACTION
--------------------------------------
--------------------------------------
--- AÑADE
--------------------------------------
--------------------------------------

BEGIN TRANSACTION
INSERT INTO AÑADE (id_personal, id_producto, nombreProducto, cantidad)
VALUES
    (33, 1, 'Alimento seco para perros, 1 kg', 5),
    (33, 2, 'Snacks de pollo para gatos, 100 g', 10),
    (34, 3, 'Collar ajustable para perros, color rojo', 3),
    (34, 4, 'Alimento húmedo para perros, pack de 6 unidades', 8),
    (35, 5, 'Snacks naturales para perros', 4),
    (35, 6, 'Pelota de tenis para perros, tamaño mediano', 2),
    (36, 7, 'Rascador de cartón para gatos, diseño moderno', 5),
    (36, 8, 'Juguete con catnip para gatos, forma de ratón', 3),
    (41, 9, 'Juguete interactivo para gatos, con plumas y luces', 2),
    (41, 10, 'Ratón de juguete con plumas para gatoS', 1),
    (42, 11, 'Cama ortopédica para perros mayores, tamaño grande', 3),
    (42, 12, 'Cuna suave para gatos, colores variados', 5),
    (43, 13, 'Cama redonda para perros y gatos, tamaño pequeño', 2),
    (43, 14, 'Cama elevada para perros, resistente al agua', 1),
    (33, 15, 'Hamaca para gatos, fácil de montar en ventanas', 2),
    (33, 16, 'Champú para perros, aroma a coco', 6),
    (34, 17, 'Arena absorbente para gatos, control de olores', 4),
    (34, 18, 'Cepillo para perros y gatos, de cerdas suaves', 3),
    (35, 19, 'Cepillo de dientes para perros y gatos', 2),
    (35, 20, 'Cepillo deshedding para perros y gatos', 5);
    SELECT * FROM AÑADE
    SELECT count(*) FROM AÑADE
--ROLLBACK TRANSACTION
COMMIT TRANSACTION