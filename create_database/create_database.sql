-- creacion de base de datos
CREATE DATABASE bd_gestion_cartera_inversiones;
GO

-- seleccion de base de datos
USE bd_gestion_cartera_inversiones;
GO

CREATE TABLE cliente (
id INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
correo VARCHAR (100) NOT NULL,
telefono VARCHAR(100) NOT NULL,
fecha_registro DATE NOT NULL,
perfil_riesgo VARCHAR(100) NOT NULL,
);

CREATE TABLE activo(
id INT IDENTITY(1,1) PRIMARY KEY,
tipo_activo VARCHAR(100) NOT NULL,
ticker VARCHAR(100) NOT NULL,
sector VARCHAR(100) NOT NULL,
riesgo_estimado DECIMAL(8,4) NOT NULL,
);

CREATE TABLE portafolio (
id INT IDENTITY(1,1) PRIMARY KEY,
cliente_id INT NOT NULL,
nombre_portafolio VARCHAR(150) NOT NULL,
fecha_creacion DATE NOT NULL,
objetivo_inversion VARCHAR(200) NOT NULL,
activo_id INT NOT NULL,
cantidad_activos DECIMAL(10,2) NOT NULL,
FOREIGN KEY (cliente_id) REFERENCES cliente(id),
FOREIGN KEY (activo_id) REFERENCES activo(id)
);

CREATE TABLE precio_activo(
id INT IDENTITY(1,1) PRIMARY KEY,
activo_id INT NOT NULL,
fecha DATETIME NOT NULL,
precio_apertura DECIMAL(10,4) NOT NULL,
precio_cierre DECIMAL(10,4) NOT NULL,
precio_actual DECIMAL(10,4),
FOREIGN KEY (activo_id) REFERENCES activo(id)
);

CREATE TABLE transaccion(
cliente_id INT NOT NULL,
id INT IDENTITY(1,1) PRIMARY KEY,
portafolio_id INT NOT NULL,
activo_id INT NOT NULL,
hora_transaccion DATETIME NOT NULL,
tipo_operacion VARCHAR(100) NOT NULL,
cantidad DECIMAL(10,4) NOT NULL,
precio_unitario DECIMAL(10,4) NOT NULL,
moneda VARCHAR(100) NOT NULL,
FOREIGN KEY (cliente_id) REFERENCES cliente(id),
FOREIGN KEY (portafolio_id) REFERENCES portafolio(id),
FOREIGN KEY (activo_id) REFERENCES activo(id),
);



