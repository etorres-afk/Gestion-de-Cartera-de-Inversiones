-- creacion de base de datos
CREATE DATABASE bd_gestion_cartera_inversiones;
GO

-- seleccion de base de datos
USE bd_gestion_cartera_inversiones;
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


ALTER TABLE cliente 
ALTER COLUMN perfil_riesgo VARCHAR(100) NOT NULL;

-- INSERTAR DATOS:

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


ALTER TABLE portafolio 
DROP COLUMN cantidad_activos;

SELECT name 
FROM sys.foreign_keys 
WHERE parent_object_id = OBJECT_ID('portafolio');

ALTER TABLE portafolio 
DROP CONSTRAINT FK__portafoli__clien__5FB337D6;

ALTER TABLE portafolio 
DROP COLUMN activo_id;

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


SELECT * FROM portafolio_activos

INSERT INTO portafolio_activos (portafolio_id, activo_id, cantidad_actual) VALUES
(10, 3, 61.4654),
(12, 4, 86.3240),
(13, 10, 325.3717),
(14, 2, 112.5501),
(15, 7, 47.9142),
(16, 6, 105.0048),
(17, 1, 50.8913),
(18, 9, 75.4869),
(19, 5, 99.6532),
(20, 8, 23.3241),
(21, 1, 60.0045),
(22, 3, 134.2976),
(23, 2, 45.1590),
(24, 10, 87.6652),
(11, 6, 18.3999);

SELECT * FROM portafolio WHERE id IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);

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

SELECT * FROM transaccion

INSERT INTO transaccion (cliente_id, portafolio_activos_id, activo_transado_id, precio_unitario, hora_transaccion, tipo_operacion, cantidad, moneda) VALUES
(3, 3, 3, 316.00, '2025-06-01 12:00:00', 'Compra', 20.0000, 'USD'),
(4, 4, 4, 111.95, '2025-06-01 13:00:00', 'Compra', 30.0000, 'USD'),
(5, 5, 5, 51.80, '2025-06-01 14:00:00', 'Compra', 100.0000, 'USD'),
(6, 6, 6, 101.20, '2025-06-01 15:00:00', 'Compra', 15.0000, 'USD'),
(7, 7, 7, 21.45, '2025-06-01 15:30:00', 'Compra', 50.0000, 'PEN'),
(8, 8, 8, 39.20, '2025-06-01 16:00:00', 'Compra', 25.0000, 'USD'),
(9, 9, 9, 243.00, '2025-06-01 16:30:00', 'Compra', 5.0000, 'USD'),
(10, 10, 1, 336.50, '2025-06-01 17:00:00', 'Compra', 7.0000, 'USD'),
(4, 11, 4, 140.00, '2025-06-02 09:45:00', 'Venta', 5.0000, 'USD'),
(6, 12, 6, 2875.00, '2025-06-02 10:00:00', 'Venta', 3.0000, 'USD'),
(3, 13, 3, 317.50, '2025-06-02 10:15:00', 'Venta', 10.0000, 'USD'),
(4, 14, 4, 113.25, '2025-06-02 10:30:00', 'Venta', 15.0000, 'USD'),
(5, 15, 5, 52.10, '2025-06-02 11:00:00', 'Venta', 50.0000, 'USD');

SELECT * FROM cliente WHERE id IN (1,2,3,4,5,6,7,8,9,10);
SELECT * FROM portafolio_activos WHERE id IN (1,2,3,4,5,6,7,8,9,10);
SELECT * FROM activo WHERE id IN (1,2,3,4,5,6,7,8,9,10);

SELECT id FROM portafolio_activos;




