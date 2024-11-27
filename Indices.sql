-- INDEICES TABLA CLIENTES 
CREATE INDEX idx_clientes_email ON Clientes(email);
CREATE INDEX idx_clientes_nombre_apellido ON Clientes(nombre, apellido);

-- INDICES TABLA EMPLEADOS
CREATE INDEX idx_empleados_nombre_apellido ON Empleados(nombre, apellido);
CREATE INDEX idx_empleados_puesto ON Empleados(puesto);

-- INDICES TABLA PROVEEDORES
CREATE INDEX idx_proveedores_nombre ON Proveedores(nombre);
CREATE INDEX idx_proveedores_email ON Proveedores(email);

-- ÍINDICES TABLA MATERIALES
CREATE INDEX idx_materiales_nombre ON Materiales(nombre);
CREATE INDEX idx_materiales_id_proveedor ON Materiales(id_proveedor);

-- INDICES TABLA PATINES
CREATE INDEX idx_patines_nombre ON Patines(nombre);
CREATE INDEX idx_patines_tipo ON Patines(tipo);

-- INDICESTABLA PEDIDOS CLIENTES
CREATE INDEX idx_pedidoclientes_id_cliente ON PedidoClientes(id_cliente);
CREATE INDEX idx_pedidoclientes_id_empleado ON PedidoClientes(id_empleado);
CREATE INDEX idx_pedidoclientes_estado_fecha ON PedidoClientes(estado, fecha_pedido);

-- INDICES TABLA DETALLEPEDIDOCLIENTE
CREATE INDEX idx_detallepedidoclientes_id_pedido ON DetallePedidoClientes(id_pedido);
CREATE INDEX idx_detallepedidoclientes_id_patines ON DetallePedidoClientes(id_patines);

-- INDICES TBALA PEDIDOSPROVEEDORES
CREATE INDEX idx_pedidosproveedores_id_proveedor ON PedidosProveedores(id_proveedor);
CREATE INDEX idx_pedidosproveedores_estado_fecha ON PedidosProveedores(estado, fecha_pedido);

-- INDICES TABLA DETALLEPEDIDOSPROVEEDORES
CREATE INDEX idx_detallepedidosproveedores_id_pedido ON DetallePedidosProveedores(id_pedido);
CREATE INDEX idx_detallepedidosproveedores_id_material ON DetallePedidosProveedores(id_material);

-- INDICE TABLA INVENTARIO
CREATE INDEX idx_inventario_id_material ON Inventario(id_material);

-- INDICE TABLA PRODUCCION 
CREATE INDEX idx_produccion_id_patines ON Produccion(id_patines);
CREATE INDEX idx_produccion_id_empleado ON Produccion(id_empleado);
CREATE INDEX idx_produccion_fecha ON Produccion(fecha_produccion);

-- INDICE TABLA VENTAS
CREATE INDEX idx_ventas_id_pedido ON Ventas(id_pedido);
CREATE INDEX idx_ventas_fecha ON Ventas(fecha_venta);
