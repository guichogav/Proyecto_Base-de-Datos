CREATE DATABASE IF NOT EXISTS patinesdb;

USE PatinesDB;

CREATE TABLE Clientes
(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    email VARCHAR (100) UNIQUE NOT NULL,
    telefono VARCHAR (15),
    direccion TEXT,
    fecha_registro DATETIME
);

CREATE TABLE Empleados
(
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    puesto VARCHAR (50),
    salario DECIMAL (10, 2),
    fecha_contratacion DATETIME
);

CREATE TABLE Proveedores
(
    id_proveedor INT
    AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR (100) NOT NULL,
    contacto VARCHAR (50),
    telefono VARCHAR (15),
    email VARCHAR (100),
    direccion TEXT
);

CREATE TABLE Materiales
(
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    descripcion TEXT,
    stock INT DEFAULT 0,
    precio_unitario DECIMAL (10, 2) NOT NULL,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores (id_proveedor)
);

CREATE TABLE Patines
(
    id_patines INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    tipo ENUM ('en línea', 'cuatro ruedas', 'artístico', 'hockey') NOT NULL,
    precio DECIMAL (10, 2) NOT NULL,
    descripcion TEXT,
    stock INT DEFAULT 0
);

CREATE TABLE PedidoClientes
(
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_empleado INT,
    fecha_pedido DATETIME,
    estado ENUM ('pendiente', 'procesado', 'enviado', 'entregado') DEFAULT 'pendiente',
    total DECIMAL (10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados (id_empleado)
);

CREATE TABLE DetallePedidoClientes
(
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_patines INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL (10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PedidoClientes (id_pedido),
    FOREIGN KEY (id_patines) REFERENCES Patines (id_patines)
);

CREATE TABLE PedidosProveedores
(
    id_pedido INT
    AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    fecha_pedido DATETIME,
    estado ENUM ('pendiente', 'recibido', 'cancelado') DEFAULT 'pendiente',
    total DECIMAL (10, 2),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores (id_proveedor)
);

CREATE TABLE Inventario
(
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_material INT,
    cantidad INT NOT NULL,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_material) REFERENCES Materiales (id_material)
);

CREATE TABLE DetallePedidosProveedores
(
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_material INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL (10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PedidosProveedores (id_pedido),
    FOREIGN KEY (id_material) REFERENCES Materiales (id_material)
);

CREATE TABLE Produccion
(
    id_produccion INT AUTO_INCREMENT PRIMARY KEY,
    id_patines INT,
    id_empleado INT,
    cantidad INT NOT NULL,
    fecha_produccion DATETIME,
    FOREIGN KEY (id_patines) REFERENCES Patines (id_patines),
    FOREIGN KEY (id_empleado) REFERENCES Empleados (id_empleado)
);

CREATE TABLE Ventas
(
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    fecha_venta DATETIME,
    total DECIMAL (10, 2),
    FOREIGN KEY (id_pedido) REFERENCES PedidoClientes (id_pedido)
);

USE PatinesDB;

-- Inserciones para la tabla `Clientes`
INSERT INTO Clientes (nombre, apellido, email, telefono, direccion) VALUES
    ('Guicho','aguilar','luisg@example.com','4641793004','El Cerro de Dicis salon 303'),
    ('Maria', 'Gonzalez', 'guadalupeg@example.com', '0987654321', 'Av. Siempre Viva 456, Ciudad B'),
    ('Carlos', 'Lopez', 'carlos.l@example.com', '1122334455', 'Calle Nueva 789, Ciudad C'),
    ('Sofia', 'Cruz', 'sofia.cruz@example.com', '5551234567', 'Avenida del Sol 123, Ciudad X'),
    ('Ricardo', 'Mendez', 'ricardo.mendez@example.com', '5552345678', 'Calle Luna 45, Ciudad Y'),
    ('Fernanda', 'Gomez', 'fernanda.gomez@example.com', '5553456789', 'Boulevard Estrella 789, Ciudad Z'),
    ('Alejandro', 'Lopez', 'alejandro.lopez@example.com', '5554567890', 'Avenida Primavera 10, Ciudad W');

-- Inserciones para la tabla `Empleados`
INSERT INTO Empleados (nombre, apellido, puesto, salario, fecha_contratacion) VALUES
    ('Ana', 'Ramírez', 'Gerente de Ventas', 35000, '2023-01-15'),
    ('Luis', 'Martínez', 'Operador de Producción', 25000, '2023-05-20'),
    ('Elena', 'Hernández', 'Asistente Administrativo', 20000, '2024-02-10'),
    ('Thom','Yorke','limpieza y maquila','500','1997-03-07');
    
-- Inserciones para la tabla `Proveedores`
INSERT INTO Proveedores (nombre, contacto, telefono, email, direccion) VALUES
    ('Proveedor A', 'Alberto Sánchez', '5551234567', 'contactoA@proveedor.com', 'Calle Industria 101, Ciudad D'),
    ('Proveedor B', 'Lucía Torres', '5559876543', 'contactoB@proveedor.com', 'Av. Comercio 202, Ciudad E'),
    ('Distribuidora XYZ', 'Juan Pérez', '555-123-4567', 'juan.perez@xyz.com', 'Calle Principal #123, Ciudad Central'),
    ('Tecnologías Avanzadas SA', 'María Gómez', '555-987-6543', 'maria.gomez@tecavanzadas.com', 'Avenida Innovación #456, Ciudad Norte'),
    ('Metales Globales', 'Carlos Ramírez', '555-321-7890', 'carlos.ramirez@globales.com', 'Plaza Comercial #78, Ciudad Sur'),
    ('Poliuretrano al mayoreo', 'Ana Torres', '555-654-3210', 'ana.torres@poliuretano.com', 'Zona Industrial #12, Ciudad Este'),
    ('Cueros y pieles', 'Luis Martínez', '555-111-2222', 'luis.martinez@pieles.com', 'Boulevard Creativo #45, Ciudad Oeste');

-- Inserciones para la tabla `Materiales`
INSERT INTO Materiales (nombre, descripcion, stock, precio_unitario, id_proveedor) VALUES
    ('Ruedas', 'Ruedas de alta resistencia para patines', 100, 15.50, 1),
    ('Cojinetes', 'Cojinetes de acero para suavizar el movimiento', 200, 8.75, 1),
    ('Ejes', 'Ejes de aluminio para mayor durabilidad', 50, 12.30, 2),
    ('Botas', 'Botas de cuero para patines en línea', 40, 55.00, 2);

-- Inserciones para la tabla `Patines`
INSERT INTO Patines (nombre, tipo, precio, descripcion, stock) VALUES
    ('Patín Inline Pro', 'en línea', 120.00, 'Patín profesional para competiciones', 25),
    ('Patín Quad Clásico', 'cuatro ruedas', 80.00, 'Patín clásico para principiantes', 30),
    ('Patín Artístico Avanzado', 'artístico', 150.00, 'Patín diseñado para presentaciones artísticas', 15);

-- Inserciones para la tabla `PedidoClientes`
INSERT INTO PedidoClientes (id_cliente, id_empleado, fecha_pedido, estado, total) VALUES
    (1, 1, '2024-10-01', 'procesado', 240.00),
    (2, 2, '2024-10-05', 'pendiente', 80.00),
    (3, 1, '2024-10-10', 'enviado', 150.00);

-- Inserciones para la tabla `DetallePedidoClientes`
INSERT INTO DetallePedidoClientes (id_pedido, id_patines, cantidad, precio_unitario) VALUES
    (1, 1, 2, 120.00),
    (2, 2, 1, 80.00),
    (3, 3, 1, 150.00);

-- Inserciones para la tabla `PedidosProveedores`
INSERT INTO PedidosProveedores (id_proveedor, fecha_pedido, estado, total) VALUES
    (1, '2024-10-02', 'recibido', 500.00),
    (2, '2024-10-06', 'pendiente', 620.00),
    (3, '2024-10-10', 'pendiente', 5000.00),
    (4, '2024-10-15', 'pendiente', 7500.00),
    (5, '2024-10-28', 'recibido', 650.00),
    (6, '2024-11-11', 'recibido', 850.00),
    (7, '2024-11-16', 'pendiente', 900.00);
-- Inserciones para la tabla `DetallePedidosProveedores`
INSERT INTO DetallePedidosProveedores (id_pedido, id_material, cantidad, precio_unitario) VALUES
    (1, 1, 50, 15.50),
    (1, 2, 100, 8.75),
    (2, 3, 40, 12.30),
    (2, 4, 10, 55.00);
    

-- Inserciones para la tabla `Inventario`
INSERT INTO Inventario (id_material, cantidad, fecha_actualizacion) VALUES
    (1, 100, '2024-10-02 12:00:00'),
    (2, 200, '2024-10-02 12:00:00'),
    (3, 50, '2024-10-02 12:00:00'),
    (4, 40, '2024-10-02 12:00:00');

-- Inserciones para la tabla `Produccion`
INSERT INTO Produccion (id_patines, id_empleado, cantidad, fecha_produccion) VALUES
    (1, 2, 10, '2024-10-05'),
    (2, 3, 5, '2024-10-06'),
    (3, 2, 8, '2024-10-07');

-- Inserciones para la tabla `Ventas`
INSERT INTO Ventas (id_pedido, fecha_venta, total) VALUES
    (1, '2024-10-02', 240.00),
    (3, '2024-10-12', 150.00);
