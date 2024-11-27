-- CONSULTAS CON INDICES

-- -------- TABLA CLIENTES
-- Buscar un cliente por email
SELECT * FROM Clientes WHERE email = 'luisg@example.com';
-- Buscar clientes por nombre y apellido
SELECT * FROM Clientes WHERE nombre = 'Guicho' AND apellido = 'Aguilar';


-- --------- TABLA EMPLEADOS 
-- Buscar empleados en un puesto específico
SELECT * FROM Empleados WHERE puesto = 'Gerente de Ventas';
-- Buscar empleados por nombre y apellido
SELECT * FROM Empleados WHERE nombre = 'Thom' AND apellido = 'Yorke';


-- ------------ TABLA PROVEEDORES 
-- Buscar un proveedor por nombre
SELECT * FROM Proveedores WHERE nombre = 'Proveedor A';
-- Buscar un proveedor por email
SELECT * FROM Proveedores WHERE email = 'contactoA@proveedor.com';


-- ------------ TABLA MATERIALES 
-- Buscar materiales por nombre
SELECT * 
FROM Materiales 
WHERE nombre = 'Ruedas';
-- Buscar materiales proporcionados por un proveedor específico
SELECT * FROM Materiales 
WHERE id_proveedor = 1;


-- ------------- TABLA PATINES 
-- Buscar patines por tipo
SELECT * FROM Patines WHERE tipo = 'en línea';
-- Buscar patines por nombre
SELECT * FROM Patines WHERE nombre = 'Patín Inline Pro';


-- -------------- YTABLA PEDIDOCLIENTES
-- Buscar pedidos de un cliente específico
SELECT * 
FROM PedidoClientes WHERE id_cliente = 1;
-- Buscar pedidos procesados dentro de un rango de fechas
SELECT * FROM PedidoClientes WHERE estado = 'procesado' AND fecha_pedido BETWEEN '2024-10-01' AND '2024-10-31';


-- -------------- TABLA DETALLEPEDIDOCLIENTES
-- Obtener el detalle de un pedido específico
SELECT * FROM DetallePedidoClientes WHERE id_pedido = 1;
-- Buscar detalles asociados a un modelo de patines
SELECT * FROM DetallePedidoClientes WHERE id_patines = 1;


-- -------------- TABLA PEDIDOSPROVEEDORES
-- Buscar pedidos de un proveedor específico
SELECT * FROM PedidosProveedores WHERE id_proveedor = 1;
-- Buscar pedidos pendientes realizados en octubre de 2024
SELECT * FROM PedidosProveedores WHERE estado = 'pendiente' AND fecha_pedido BETWEEN '2024-10-01' AND '2024-10-31';


-- --------------- TABLA DETALLEPEDIDOPROVEEDORES
-- Obtener detalles de un pedido específico
SELECT * FROM DetallePedidosProveedores WHERE id_pedido = 1;
-- Buscar materiales en un pedido específico
SELECT * FROM DetallePedidosProveedores WHERE id_material = 1;


-- -------------- TABLA INVENTARIO
-- Buscar inventario de un material específico
SELECT * FROM Inventario WHERE id_material = 1;
-- Obtener materiales actualizados después de una fecha específica
SELECT * FROM Inventario WHERE fecha_actualizacion > '2024-10-01 00:00:00';


-- ---------------- TABLA PRODUCCION 
-- Buscar producción de un modelo de patines específico
SELECT * 
FROM Produccion 
WHERE id_patines = 1;
-- Buscar producción realizada por un empleado específico
SELECT * FROM Produccion WHERE id_empleado = 2;
-- Buscar producción realizada en un rango de fechas
SELECT * FROM Produccion WHERE fecha_produccion BETWEEN '2024-10-01' AND '2024-10-31';


-- ---------------- TABLA VENTAS 
-- Buscar ventas asociadas a un pedido específico
SELECT * FROM Ventas WHERE id_pedido = 1;
-- Buscar ventas realizadas en un rango de fechas
SELECT * FROM Ventas WHERE fecha_venta BETWEEN '2024-10-01' AND '2024-10-31';
