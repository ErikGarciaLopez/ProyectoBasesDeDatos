use GUARDERIA 
go

----------------------------------------------------------------
-- GUARDERIA----------------------------------------------------
----------------------------------------------------------------
-- 1. El tipo de mascota que más se deja en la guardería para su cuidado (tipo y cantidad).

SELECT E.tipo AS tipo_mascota, COUNT(*) AS cantidad
FROM MASCOTA AS M
JOIN ESPECIE AS E ON M.id_especie = E.id_especie
GROUP BY E.tipo
ORDER BY cantidad DESC

-- 2. En qué época del año se deja un mayor número de mascotas en la guardería
SELECT MONTH(finicio) AS Mes,
       COUNT(*) AS NumeroMascotas
FROM RESERVACION_GUARDERIA
WHERE YEAR(finicio) = YEAR(GETDATE()) -- Filtrar por el año actual
GROUP BY MONTH(finicio)
ORDER BY NumeroMascotas DESC;



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



-- 4. Enfermedades más frecuentes (5), total de animales con dicha enfermedad
-- ordenados de mayor a menor

select * from REPORTE

SELECT TOP 5 diagnostico, COUNT(*) AS total_animales
FROM REPORTE
GROUP BY diagnostico
ORDER BY total_animales DESC;

----------------------------------------------------
-- Veterinaria--------------------------------------
----------------------------------------------------

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


-- 3. Inventario de medicamentos, con su costo por centro.

SELECT A.id_centro, M.nombre AS medicamento, A.cantidad, M.costo
FROM ALMACEN A
JOIN MEDICAMENTO M ON A.id_medicamento = M.id_medicamento
JOIN CENTRO_CUIDADO C ON A.id_centro = C.id_centro;


-- 4. Enfermedades más frecuentes, por centro, ordenadas de mayor a menor

SELECT C.nombre AS centro, R.diagnostico AS enfermedad, COUNT(*) AS frecuencia
FROM CENTRO_CUIDADO AS C
JOIN PERSONAL AS P ON C.id_personal = P.id_personal
JOIN VETERINARIO AS V ON P.id_personal = V.id_personal
JOIN REPORTE AS R ON V.id_personal = R.id_personal
GROUP BY C.nombre, R.diagnostico
ORDER BY frecuencia DESC;

-- 5. Reporte de ventas e medicamentos en un periodo de tiempo, incluyendo cantidad y monto total

SELECT M.nombre AS medicamento, COUNT(RM.id_medicamento) AS cantidad, SUM(M.costo) AS monto_total
FROM MEDICAMENTO M
INNER JOIN REPORTE_MEDICAMENTO RM ON M.id_medicamento = RM.id_medicamento
INNER JOIN REPORTE R ON RM.id_reporte = R.id_reporte
INNER JOIN RECIBO RC ON R.id_reporte = RC.id_reporte
WHERE R.fechaHora >= '2023-01-01' AND R.fechaHora <= '2023-06-30' 
GROUP BY M.nombre


----------------------------------------------------
-- Ventas-------------------------------------------
----------------------------------------------------


-- 1. El centro con mayor número de ventas en un periodo de tiempo. (Separar las ventas en línea de las ventas físicas de cada estado).
-- 2. Los artículos más vendidos y los menos vendidos por categoría.

-- Mas
SELECT p.id_producto, p.stock, p.precio, p.descripcion, c.categoria
FROM (
    SELECT po.id_producto, po.stock, po.precio, po.descripcion, c.id_categoria, 
           ROW_NUMBER() OVER (PARTITION BY c.id_categoria ORDER BY po.stock DESC) AS ranking
    FROM PRODUCTOS_ONLINE po
    INNER JOIN CATEGORIA c ON po.id_categoria = c.id_categoria
) p
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
WHERE p.ranking = 1;

-- Menos
SELECT p.id_producto, p.stock, p.precio, p.descripcion, c.categoria
FROM (
    SELECT po.id_producto, po.stock, po.precio, po.descripcion, c.id_categoria, 
           ROW_NUMBER() OVER (PARTITION BY c.id_categoria ORDER BY po.stock ASC) AS ranking
    FROM PRODUCTOS_ONLINE po
    INNER JOIN CATEGORIA c ON po.id_categoria = c.id_categoria
) p
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
WHERE p.ranking = 1;


-- ROW_NUMBER(): Asigna un número de fila a cada registro dentro de cada partición.
-- OVER: Especifica cómo se deben dividir las filas en particiones.
-- PARTITION BY c.id_categoria: Define la partición por la columna id_categoria. Esto significa que los registros se dividirán en grupos separados según su categoría.

-- 3. Época en la que más se vende. Época del año y monto total


-- 4. Los 5 empleados con mayor comisión, este reporte se obtiene de manera mensual

SELECT TOP 5 p.nombre, cf.comision
FROM PERSONAL p
INNER JOIN COMPRA_FISICA cf ON p.id_personal = cf.id_personal
ORDER BY cf.comision DESC;

-- 5. Inventario de las tiendas de cada tienda

SELECT CC.nombre AS nombre_centro, PF.id_producto, PF.costo, PF.stock
FROM CENTRO_CUIDADO CC
JOIN CUENTA C ON CC.id_centro = C.id_centro
JOIN PRODUCTOS_FISICOS PF ON C.id_producto = PF.id_producto
order by CC.id_centro





select * from sys.tables
select * from sys.procedures
select * from sys.views
select * from sys.indexes
select * from INFORMATION_SCHEMA.CHECK_CONSTRAINTS





