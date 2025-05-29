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
perfil_riesgo VARCHAR NOT NULL,
)

SELECT*FROM cliente
