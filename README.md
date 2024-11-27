**LUIS GADIEL AGUILAR VILLANUEVA**


# **🛼PatinesDB - Gestión de Bases de Datos para Tienda de Patines**

Este repositorio contiene todos los archivos, scripts y documentación necesarios para la implementación y gestión de una base de datos relacional diseñada para una tienda de patines.

---
## **🛠️ Requisitos Previos**
Para implementar y ejecutar **PatinesDB**, se necesitan las siguientes herramientas:

1. **MySQL Server** (v5.7 o superior).
2. **MySQL Workbench** para la visualización y gestión gráfica de la base de datos.
3. Herramienta de línea de comandos o IDE compatible con SQL para ejecutar los scripts.

---

## **🚀 CÓMO USAR ESTE REPOSITORIO**

### **1. Clonar el Repositorio**

git clone https://github.com/tuusuario/patinesdb.git
cd patinesdb

---

## **📄 DESCRIPCIÓN**
**PatinesDB** es una base de datos relacional que organiza la información clave de clientes, empleados, proveedores, inventarios, pedidos y ventas de una tienda de patines. Diseñada para ser eficiente, escalable y fácil de gestionar, esta base de datos utiliza MySQL como sistema gestor.

Incluye:
- Modelado completo del esquema de la base de datos.
- Scripts para la creación de tablas y relaciones.
- Inserciones de datos iniciales para simulaciones.
- Índices y consultas optimizadas para mejorar el rendimiento.
- Documentación técnica y ejemplos prácticos para su uso.

---

## **🗃️ ESTRUCTURA DEL REPOSITORIO**
### 🖇️PatinesDB.sql
Este es el archivo con el código fuente para la creación del esquema de la base de Datos, tambien se implementan la creación de las tablas junto con sus inserciones respectivamente.

##### Ejemplo
```MySQL
CREATE DATABASE IF NOT EXISTS patinesdb;

USE PatinesDB;
```

Descargar y compilar este archivo en la herramienta de desarrollo de su preferencia.

### 🖇️indices.sql

El archivo `indices.sql`contiene los comandos SQL necesarios para crear índices en las tablas de la base de datos PatinesDB. Estos índices están diseñados para optimizar el rendimiento de las consultas más frecuentes, como búsquedas, filtros y uniones entre tablas.

##### Ejemplo
```MySQL
-- INDICES TABLA CLIENTES 
CREATE INDEX idx_clientes_email ON Clientes(email);
CREATE INDEX idx_clientes_nombre_apellido ON Clientes(nombre, apellido);
```

### 📂CONSULTAS
### 🖇️Consultas.sql
En este primer archivo `Consultas.sql` se encuentra el script para realizar consultas frecuentes  en la base de datos, para realizar una consulta solo debemos seleccionar con el cursor las lineas de código donde esta la consulta de nuestro interes y compilar. 

##### Ejemplo
```MySQL 
--- TABLA PATINES
SELECT * FROM patines;
-- ORDENAR POR ASCENDENTE
SELECT nombre, precio FROM patines
ORDER BY precio asc;
-- ORDENAR POR PRECIO DESCENDENTE 
SELECT nombre, precio FROM patines
ORDER BY precio desc;
```
### 🖇️Consultas_indices.sql
Dentro de `Consultas_inidces`estan las consultas que poedmos hacer en la base de datos usando los indices previamente creados con `Indices.sql` estas consultas mejorará la optimización de nuestra base de datos pues la ruta de busqueda de los datos es mas eficiente a diferencia de si hicieramos consultas sin los indices como en el aapartado anterior, igualmente para realizarlas solo debemos seleccionar con nuestro cursor las lineas de código donde esten las consultas de nuestro ineteres y compilar.

##### Ejemplo
```MySQL
-- -------------- TABLA PEDIDOSPROVEEDORES
-- Buscar pedidos de un proveedor específico
SELECT * FROM PedidosProveedores WHERE id_proveedor = 1;
-- Buscar pedidos pendientes realizados en octubre de 2024
SELECT * FROM PedidosProveedores WHERE estado = 'pendiente' AND fecha_pedido BETWEEN '2024-10-01' AND '2024-10-31';
