-- creacion de base de datos
CREATE DATABASE bd_gestion_cartera_inversiones_3;
GO

-- seleccion de base de datos
USE bd_gestion_cartera_inversiones_3;
GO

-- insertamos tabla independiente "cliente"

CREATE TABLE cliente (
id INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
correo VARCHAR (100) NOT NULL,
telefono VARCHAR(100) NOT NULL,
fecha_registro DATE NOT NULL,
perfil_riesgo VARCHAR(100) NOT NULL,
);

-- insertamos tabla independiente "activo"

CREATE TABLE activo(
id INT IDENTITY(1,1) PRIMARY KEY,
tipo_activo VARCHAR(100) NOT NULL,
ticker VARCHAR(100) NOT NULL,
sector VARCHAR(100) NOT NULL,
riesgo_estimado DECIMAL(8,4) NOT NULL,
);

-- insertamos tabla "portafolio"

CREATE TABLE portafolio (
id INT IDENTITY(1,1) PRIMARY KEY,
cliente_id INT NOT NULL,
nombre_portafolio VARCHAR(150) NOT NULL,
fecha_creacion DATE NOT NULL,
objetivo_inversion VARCHAR(200) NOT NULL,
FOREIGN KEY (cliente_id) REFERENCES cliente(id),
);

-- insertamos tabla "portafolio_activos"
CREATE TABLE portafolio_activos(
id INT IDENTITY(1,1) PRIMARY KEY,
portafolio_id INT NOT NULL,
activo_id INT NOT NULL,
cantidad_actual DECIMAL(10,4) NOT NULL,
FOREIGN KEY (portafolio_id) REFERENCES portafolio(id),
FOREIGN KEY (activo_id) REFERENCES activo(id),
)

-- insertamos tabla "precio_activo"

CREATE TABLE precio_activo(
id INT IDENTITY(1,1) PRIMARY KEY,
activo_id INT NOT NULL,
fecha DATETIME NOT NULL,
precio_apertura DECIMAL(10,4) NOT NULL,
precio_cierre DECIMAL(10,4) NOT NULL,
precio_actual DECIMAL(10,4) NOT NULL,
FOREIGN KEY (activo_id) REFERENCES activo(id)
);

-- insertamos tabla "transaccion"

CREATE TABLE transaccion(
cliente_id INT NOT NULL,
id INT IDENTITY(1,1) PRIMARY KEY,
portafolio_activos_id INT NOT NULL,
activo_transado_id INT NOT NULL,
precio_unitario DECIMAL(10,4) NOT NULL,
hora_transaccion DATETIME NOT NULL,
tipo_operacion VARCHAR(100) NOT NULL,
cantidad DECIMAL(10,4) NOT NULL,
moneda VARCHAR(100) NOT NULL,
FOREIGN KEY (cliente_id) REFERENCES cliente(id),
FOREIGN KEY (portafolio_activos_id) REFERENCES portafolio_activos(id),
FOREIGN KEY (activo_transado_id) REFERENCES activo(id)
);


-- INSERTAR DATOS:

-- Insertamos datos de los clientes

SELECT * FROM cliente

INSERT INTO cliente (nombre, correo, telefono, fecha_registro, perfil_riesgo) 
VALUES
('Kevin Powell', 'kevin.powell@mail.com', '912345678', '2024-12-12', 'agresivo'),
('Jennifer Snyder', 'jennifer.snyder@mail.com', '913456789', '2023-06-20', 'aoderado'),
('Jeffrey Schaefer', 'jeffrey.schaefer@mail.com', '914567890', '2024-08-15', 'Conservador'),
('Ana Torres', 'ana.torres@mail.com', '915678901', '2022-11-02', 'Moderado'),
('Luis Fernández', 'luis.fernandez@mail.com', '916789012', '2024-01-10', 'Agresivo'),
('Claudia Rivas', 'claudia.rivas@mail.com', '917890123', '2023-03-05', 'Conservador'),
('Carlos Vela', 'carlos.vela@mail.com', '918901234', '2024-04-22', 'Moderado'),
('Elena Suárez', 'elena.suarez@mail.com', '919012345', '2022-07-18', 'Agresivo'),
('Martín Ruiz', 'martin.ruiz@mail.com', '920123456', '2023-09-09', 'Moderado'),
('Rosa Delgado', 'rosa.delgado@mail.com', '921234567', '2024-05-30', 'Conservador');


-- Insertamos datos de activos

SELECT * FROM activo

INSERT INTO activo (tipo_activo, ticker, sector, riesgo_estimado) VALUES
('Acción', 'AAPL', 'Tecnología', 0.1805),
('Acción', 'TSLA', 'Automotriz', 0.2952),
('ETF', 'VOO', 'Financiero', 0.1023),
('Bonos', 'BND', 'Gubernamental', 0.0451),
('Acción', 'AMZN', 'Retail', 0.2308),
('ETF', 'ARKK', 'Innovación', 0.3217),
('Acción', 'MSFT', 'Tecnología', 0.1650),
('Bonos', 'TIP', 'Inflación', 0.0532),
('ETF', 'SPY', 'Diversificado', 0.0987),
('Acción', 'GOOGL', 'Tecnología', 0.1924);


-- Insertamos datos del portafolio

SELECT * FROM portafolio

INSERT INTO portafolio (cliente_id, nombre_portafolio, fecha_creacion, objetivo_inversion) VALUES
(1, 'Portafolio 1', '2023-07-24', 'Jubilación'),
(7, 'Portafolio 2', '2024-04-06', 'Educación'),
(8, 'Portafolio 3', '2024-04-04', 'Educación'),
(5, 'Portafolio 4', '2024-08-29', 'Corto plazo'),
(2, 'Portafolio 5', '2024-10-24', 'Jubilación'),
(3, 'Portafolio 6', '2024-01-18', 'Vivienda'),
(10, 'Portafolio 7', '2023-09-30', 'Corto plazo'),
(4, 'Portafolio 8', '2024-06-12', 'Fondo de emergencia'),
(6, 'Portafolio 9', '2024-03-22', 'Largo plazo'),
(9, 'Portafolio 10', '2024-12-05', 'Fondo universitario'),
(8, 'Portafolio 11', '2023-08-15', 'Viajes'),
(3, 'Portafolio 12', '2024-02-28', 'Educación'),
(7, 'Portafolio 13', '2024-05-07', 'Negocio propio'),
(6, 'Portafolio 14', '2024-11-20', 'Jubilación'),
(10, 'Portafolio 15', '2023-06-18', 'Fondo de emergencia');

-- Insertamos datos de portafolio_activos

SELECT * FROM portafolio_activos

INSERT INTO portafolio_activos (portafolio_id, activo_id, cantidad_actual) VALUES
(1, 3, 61.4654),
(2, 4, 86.3240),
(3, 10, 325.3717),
(4, 2, 112.5501),
(5, 7, 47.9142),
(6, 6, 105.0048),
(7, 1, 50.8913),
(8, 9, 75.4869),
(9, 5, 99.6532),
(10, 8, 23.3241),
(11, 1, 60.0045),
(12, 3, 134.2976),
(13, 2, 45.1590),
(14, 10, 87.6652),
(15, 6, 18.3999);

-- Insertamos datos de precio_activo

SELECT * FROM precio_activo

INSERT INTO precio_activo (activo_id, fecha, precio_apertura, precio_cierre, precio_actual) VALUES
(1, '2025-06-01 09:30:00', 135.50, 137.80, 138.00),
(2, '2025-06-01 09:30:00', 2800.00, 2855.50, 2858.00),
(3, '2025-06-01 09:30:00', 320.00, 315.25, 316.00),
(4, '2025-06-01 09:30:00', 110.10, 112.00, 111.95),
(5, '2025-06-01 09:30:00', 50.00, 51.75, 51.80),
(6, '2025-06-01 09:30:00', 102.00, 101.50, 101.20),
(7, '2025-06-01 09:30:00', 22.00, 21.50, 21.45),
(8, '2025-06-01 09:30:00', 38.25, 39.00, 39.20),
(9, '2025-06-01 09:30:00', 240.00, 242.00, 243.00),
(10, '2025-06-01 09:30:00', 330.00, 335.00, 336.50),
(1, '2025-06-02 09:30:00', 138.00, 139.50, 140.00),
(2, '2025-06-02 09:30:00', 2858.00, 2880.00, 2875.00),
(3, '2025-06-02 09:30:00', 316.00, 317.00, 317.50),
(4, '2025-06-02 09:30:00', 111.95, 113.00, 113.25),
(5, '2025-06-02 09:30:00', 51.80, 52.00, 52.10);

-- insertamos datos de transaccion

SELECT * FROM transaccion

INSERT INTO transaccion (cliente_id, portafolio_activos_id, activo_transado_id, precio_unitario, hora_transaccion, tipo_operacion, cantidad, moneda) VALUES
(3, 7, 3, 316.00, '2025-06-01 12:00:00', 'Compra', 20.0000, 'USD'),
(4, 8, 4, 111.95, '2025-06-01 13:00:00', 'Compra', 30.0000, 'USD'),
(5, 9, 5, 51.80, '2025-06-01 14:00:00', 'Compra', 100.0000, 'USD'),
(6, 10, 6, 101.20, '2025-06-01 15:00:00', 'Compra', 15.0000, 'USD'),
(7, 11, 7, 21.45, '2025-06-01 15:30:00', 'Compra', 50.0000, 'PEN'),
(8, 12, 8, 39.20, '2025-06-01 16:00:00', 'Compra', 25.0000, 'USD'),
(9, 13, 9, 243.00, '2025-06-01 16:30:00', 'Compra', 5.0000, 'USD'),
(10, 14, 1, 336.50, '2025-06-01 17:00:00', 'Compra', 7.0000, 'USD'),
(4, 15, 4, 140.00, '2025-06-02 09:45:00', 'Venta', 5.0000, 'USD'),
(6, 16, 6, 2875.00, '2025-06-02 10:00:00', 'Venta', 3.0000, 'USD'),
(3, 17, 3, 317.50, '2025-06-02 10:15:00', 'Venta', 10.0000, 'USD'),
(4, 18, 4, 113.25, '2025-06-02 10:30:00', 'Venta', 15.0000, 'USD'),
(5, 19, 5, 52.10, '2025-06-02 11:00:00', 'Venta', 50.0000, 'USD');


-- CONSULTAS

-- Consulta1: 
-- Listar todos los clientes con perfil de riesgo "Agresivo" junto con los nombres de sus portafolios y la fecha de creación, ordenados por fecha de registro del cliente.
SELECT c.nombre AS cliente, c.perfil_riesgo, p.nombre_portafolio, p.fecha_creacion
FROM cliente c
JOIN portafolio p ON c.id = p.cliente_id
WHERE c.perfil_riesgo = 'Agresivo'
ORDER BY c.fecha_registro;

-- Consulta2:
--Mostrar los 5 activos con mayor volumen de transacciones (suma de cantidades compradas y vendidas), indicando el tipo de activo y su sector.
SELECT TOP 5 a.ticker, a.tipo_activo, a.sector, 
       SUM(t.cantidad) AS volumen_transado
FROM transaccion t
JOIN activo a ON t.activo_transado_id = a.id
GROUP BY a.ticker, a.tipo_activo, a.sector
ORDER BY volumen_transado DESC;

-- Consulta3:
--Mostrar el monto total transado (precio_unitario * cantidad) agrupado por tipo de operación (Compra/Venta) y moneda, ordenado por monto descendente.
SELECT tipo_operacion, moneda,
       SUM(precio_unitario * cantidad) AS monto_total
FROM transaccion
GROUP BY tipo_operacion, moneda
ORDER BY monto_total DESC;

-- Consulta4:
-- Listar los 3 clientes con mayor diversificación de activos (medida por la cantidad de distintos tipos de activos en sus portafolios), mostrando su nombre, perfil de riesgo y cantidad de tipos de activos distintos.
SELECT TOP 3 c.nombre, c.perfil_riesgo, 
       COUNT(DISTINCT a.tipo_activo) AS tipos_activos_distintos
FROM cliente c
JOIN portafolio p ON c.id = p.cliente_id
JOIN portafolio_activos pa ON p.id = pa.portafolio_id
JOIN activo a ON pa.activo_id = a.id
GROUP BY c.id, c.nombre, c.perfil_riesgo
ORDER BY tipos_activos_distintos DESC;

-- Consulta5:
--Mostrar todos los clientes con sus respectivos portafolios, incluyendo el objetivo de inversión de cada uno.
SELECT c.nombre AS cliente, 
       p.nombre_portafolio, 
       p.objetivo_inversion
FROM cliente c
JOIN portafolio p ON c.id = p.cliente_id
ORDER BY c.nombre;

-- Consulta6:
-- Listar los 5 activos con mayor riesgo estimado, mostrando su ticker, tipo y sector.
SELECT TOP 5 ticker, tipo_activo, sector, riesgo_estimado
FROM activo
ORDER BY riesgo_estimado DESC;

-- Consulta7:
-- Mostrar cuántos activos hay de cada tipo (Acción, ETF, Bonos) en toda la base de datos.
SELECT tipo_activo, 
       COUNT(*) AS cantidad
FROM activo
GROUP BY tipo_activo
ORDER BY cantidad DESC;

-- Consulta8:
-- 


