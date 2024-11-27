-- CONSULTAS DE LA BASE DE DATOS 
USE patinesdb;

-- TABLA Clientes
SELECT * FROM Clientes;
-- Ordenar  por apellido de forma ascendente 
SELECT nombre, apellido, telefono, email, direccion, fecha_registro FROM Clientes
ORDER BY 2 asc;
 -- Ordenar por nombre de forma ascendente
SELECT nombre, apellido, telefono, email, direccion, fecha_registro FROM Clientes
ORDER BY 1 asc;

-- TABLA EMPLEADOS 
SELECT * FROM Empleados;
-- Ordenar por nombre ascendente
SELECT nombre, apellido, puesto, salario, fecha_contratacion FROM empleados
ORDER BY 1 asc;
-- Ordenar por apellido ascendenete
SELECT nombre, apellido, puesto, salario, fecha_contratacion FROM empleados
ORDER BY 2 asc;
-- Ordenar por fecha de contratación (mas recientes primero)
SELECT nombre, apellido, fecha_contratacion FROM empleados
ORDER BY fecha_contratacion desc;
-- Ordenar por salario 
Select nombre, apellido, salario from empleados
ORDER BY salario desc;
-- promedio de salario de los empleados
SELECT AVG(salario) AS salario_promedio FROM Empleados;

-- TABLA detallepedidocliente
SELECT * FROM detallepedidoclientes;

-- Tabla detellapedidoproveedores
SELECT * FROM detallepedidosproveedores;

-- Tabla inventario 
SELECT * FROM inventario;

-- TABLA materiales
SELECT * FROM materiales;
-- materiales con stock menor a 100
SELECT nombre, stock FROM Materiales WHERE stock < 100;

--- TABLA PATINES
SELECT * FROM patines;
-- ORDENAR POR ASCENDENTE
SELECT nombre, precio FROM patines
ORDER BY precio asc;
-- ORDENAR POR PRECIO DESCENDENTE 
SELECT nombre, precio FROM patines
ORDER BY precio desc;
-- orden alfabetico (ordenará por orden alfabetico los tipos de patines que hay y tambien mostrara su precio)
SELECT nombre, precio FROM patines 
ORDER BY 1 asc;
-- Informacion de pedido de los clientes 
SELECT * FROM PedidoClientes WHERE estado = 'pendiente';
-- numero total de patines en stock
SELECT SUM(stock) AS total_patines_en_stock FROM Patines;

-- TABLA pedidoclientes
SELECT * FROM pedidoclientes;

-- TABLA pedidoproveedores
SELECT * FROM pedidosproveedores;

-- TABLA produccion
SELECT * FROM produccion;

-- ------------ TABLA PROVEEDORES 
SELECT * FROM Proveedores; 
-- ordernar por contacto ascedente 
select nombre, contacto, telefono, email, direccion from proveedores
Order by contacto asc;
-- camntidad de proveedores registrados 
SELECT COUNT(*) AS total_proveedores FROM Proveedores;

-- ---------- TABLA  ventas
SELECT * FROM ventas;
-- calcular total de inegresos por venta


-- COMSULTAS CON JOIN 

-- detalles del pedido junto con el nombre de los clientes 
SELECT 
    PedidoClientes.id_pedido,
    Clientes.nombre AS cliente,
    Clientes.apellido AS apellido_cliente,
    PedidoClientes.fecha_pedido,
    PedidoClientes.estado,
    PedidoClientes.total
FROM PedidoClientes
INNER JOIN Clientes ON PedidoClientes.id_cliente = Clientes.id_cliente;

-- Materiales pedidos por proveedores junto con nombre del material
SELECT 
    DetallePedidosProveedores.id_pedido,
    Materiales.nombre AS material,
    DetallePedidosProveedores.cantidad,
    DetallePedidosProveedores.precio_unitario
FROM DetallePedidosProveedores
INNER JOIN Materiales ON DetallePedidosProveedores.id_material = Materiales.id_material;

-- Producciones hechas por cada empleado
SELECT 
    Produccion.id_produccion,
    Empleados.nombre AS empleado,
    Patines.nombre AS patines,
    Produccion.cantidad,
    Produccion.fecha_produccion
FROM Produccion
INNER JOIN Empleados ON Produccion.id_empleado = Empleados.id_empleado
INNER JOIN Patines ON Produccion.id_patines = Patines.id_patines;



-- FILTRADO Y ORDENACIÓN
-- pedidos de proveedores pendientes por fecha de pedido
SELECT * FROM PedidosProveedores WHERE estado = 'pendiente' 
ORDER BY fecha_pedido asc;

-- patines disponibles de mayor a menor
SELECT nombre, tipo, precio, stock FROM Patines 
ORDER BY precio DESC;

-- CONSULTAS CON SUBCONSULTAS 

-- clientes con pedidso mayor a $200
SELECT DISTINCT Clientes.nombre, Clientes.apellido FROM Clientes
WHERE Clientes.id_cliente IN (
    SELECT id_cliente FROM PedidoClientes WHERE total > 200
);

-- proveedor con mas materiales asociados
SELECT Proveedores.nombre, COUNT(Materiales.id_material) AS total_materiales
FROM Proveedores
INNER JOIN Materiales ON Proveedores.id_proveedor = Materiales.id_proveedor
GROUP BY Proveedores.id_proveedor
ORDER BY total_materiales DESC
LIMIT 1;
