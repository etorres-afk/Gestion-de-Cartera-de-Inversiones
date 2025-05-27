TEMA ELEGIDO: GESTION DE CARTERA DE INVERSIONES

CASO PROPUESTO:

📘 Contexto general
Las empresas del sector financiero, como sociedades administradoras de fondos, agentes de bolsa o bancos de inversión, ofrecen a sus clientes la posibilidad de invertir su dinero en productos financieros como acciones, bonos, fondos mutuos o ETFs.
Cada cliente puede tener uno o más portafolios de inversión, los cuales agrupan transacciones realizadas con diferentes activos. Cada compra o venta tiene un precio, y a lo largo del tiempo estos activos cambian de valor en el mercado. La rentabilidad que obtiene el cliente depende del precio de compra, el precio de venta y la variación de los precios de mercado.

🎯 Objetivo del proyecto
Diseñar una base de datos relacional que permita:
Registrar la información de clientes, portafolios y activos financieros.
Almacenar transacciones de compra y venta.
Llevar un historial de precios de los activos.
Calcular o consultar el rendimiento histórico de los portafolios.
Esta base de datos podría usarse en una app de inversiones, para reportes internos o para alimentar dashboards financieros.

🧱 Modelo de datos propuesto:

1. Cliente
Representa a la persona que invierte.
Atributo	          Tipo de dato	        Descripción
cliente_id	        INT (PK)	            Identificador único del cliente.
nombre_completo	    VARCHAR(100)        	Nombre completo.
correo            	VARCHAR(100)	        Correo electrónico.
telefono	          VARCHAR(20)	          Número de contacto.
fecha_registro	    DATE                	Fecha en que se registró.
perfil_riesgo      	ENUM                	Clasificación del cliente según su tolerancia al riesgo: 'conservador', 'moderado', 'agresivo'.

2. Portafolio
Representa una agrupación de inversiones hechas por el cliente.
Atributo	          Tipo de dato         	Descripción
portafolio_id	      INT (PK)	            ID único del portafolio.
cliente_id	        INT (FK)	            ID del cliente propietario.
nombre	            VARCHAR(100)	        Nombre del portafolio (ej. "Ahorro 2025").
fecha_creacion	    DATE	                Fecha de inicio del portafolio.
objetivo_inversion	TEXT	                Motivo o meta del portafolio (ej. "Jubilación").

3. Activo
Representa un instrumento financiero en el que se puede invertir.
Atributo          	Tipo de dato	        Descripción
activo_id	          INT (PK)	            Identificador del activo.
nombre	            VARCHAR(100)	        Nombre del activo (ej. "Apple Inc.").
tipo_activo	        ENUM	                'acción', 'bono', 'ETF', 'fondo'.
sector	            VARCHAR(50)          	Sector económico del activo.
riesgo_estimado	    DECIMAL(4,2)        	Nivel de riesgo entre 0.00 y 1.00.

4. Transacción
Registra cada compra o venta de un activo dentro de un portafolio.
Atributo	          Tipo de dato	        Descripción
transaccion_id    	INT (PK)            	ID único.
portafolio_id      	INT (FK)	            ID del portafolio.
activo_id	          INT (FK)	            ID del activo.
fecha	              DATE	                Fecha de la transacción.
tipo_operacion	    ENUM	                'compra' o 'venta'.
cantidad	          DECIMAL(10,2)        	Cantidad de unidades.
precio_unitario	    DECIMAL(10,2)	        Precio por unidad. Este es el precio de compra o venta.
moneda            	VARCHAR(10)	          Moneda usada (ej. "USD", "PEN").

5. PrecioActivo
Guarda el precio de cierre del activo en cada fecha del mercado.
Atributo	          Tipo de dato	        Descripción
activo_id	          INT (FK)	            ID del activo.
fecha	DATE          (PK compuesta)      	Fecha del precio.
precio_cierre	      DECIMAL(10,4)        	Precio de mercado al cierre de ese día.

![Gestión de Cartera de Inversiones](https://github.com/user-attachments/assets/7def8db8-facc-4621-8aaf-a53783d301c8)


##MODELO LOGICO GESTION DE INVERSIONES

![image](https://github.com/user-attachments/assets/e50de188-f24f-4f03-bd84-42a706330767)

