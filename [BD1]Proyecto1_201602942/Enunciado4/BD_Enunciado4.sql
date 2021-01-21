CREATE DATABASE Enunciado4;
USE Enunciado4;

CREATE TABLE IF NOT EXISTS Empleado(
ID_Empleado INT NOT NULL AUTO_INCREMENT,
Nombre_Empleado VARCHAR(40) NOT NULL,
DPI INT NOT NULL,
NIT INT NOT NULL,
Telefono  INT NOT NULL,
Sueldo INT NOT NULL,
PRIMARY KEY(ID_Empleado)
)ENGINE=InnoDB;'sólo existe soporte para claves foráneas en tablas de tipo InnoDB.'


CREATE TABLE IF NOT EXISTS Proveedor(
ID_Proveedor INT NOT NULL AUTO_INCREMENT,
Nombre_Proveedor VARCHAR(40) NOT NULL,
Apellido_Proveedor VARCHAR(40) NOT NULL,
Direccion VARCHAR(40) NOT NULL,
Telefono INT NOT NULL,
Correo VARCHAR(40) NOT NULL,
Nombre_Empresa VARCHAR(40) NOT NULL,
PRIMARY KEY(ID_Proveedor)
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Cliente(
ID_Cliente INT NOT NULL AUTO_INCREMENT,
Nombre_Cliente  VARCHAR(40) NOT NULL,
Apellido_Cliente  VARCHAR(40) NOT NULL,
Direccion VARCHAR(40) NOT NULL,
Telefono INT NOT NULL,
Telefono_Casa INT,'es opcional'
Correo VARCHAR(40) NOT NULL,
DPI INT NOT NULL,
NIT INT NOT NULL,
PRIMARY KEY(ID_Cliente)
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Inventario(
ID_Inventario INT NOT NULL AUTO_INCREMENT,
Cantidad_Disponible_Vehiculo INT NOT NULL,
Fecha_Inventario DATE NOT NULL,
Capital INT NOT NULL,
Ganancias INT NOT NULL,
PRIMARY KEY(ID_Inventario)
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Sucursal(
ID_Sucursal INT NOT NULL AUTO_INCREMENT,
Nombre_Sucursal VARCHAR(40) NOT NULL,
Direccion VARCHAR(40) NOT NULL,
Telefono INT NOT NULL,
Direccio_Sitio_Web VARCHAR(40) NOT NULL,
Fecha_Inicio_Empleado DATE NOT NULL,
Fecha_Fin_Empleado DATE NOT NULL,
PRIMARY KEY(ID_Sucursal),
FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado)
ON DELETE NO ACTION
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Departamento(
ID_Departamento INT NOT NULL AUTO_INCREMENT,
Nombre_Departamento VARCHAR(40) NOT NULL,
PRIMARY KEY(ID_Departamento),
FOREIGN KEY(ID_Sucursal) REFERENCES Sucursal(ID_Sucursal)
ON DELETE NO ACTION
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Municipio(
ID_Municipio INT NOT NULL AUTO_INCREMENT,
Nombre_Municipio VARCHAR(40) NOT NULL,
PRIMARY KEY(ID_Municipio),
FOREIGN KEY(ID_Departamento) REFERENCES Departamento(ID_Departamento)
ON DELETE NO ACTION
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Transaccion(
ID_Transaccion INT NOT NULL AUTO_INCREMENT,
Tipo_Transaccion VARCHAR(20) NOT NULL,
Fecha_Transaccion DATE INT NOT NULL,
PRIMARY KEY(ID_Transaccion),
FOREIGN KEY(ID_Proveedor) REFERENCES Proveedor(ID_Proveedor),
FOREIGN KEY(ID_Cliente) REFERENCES Cliente(ID_Cliente)
ON DELETE NO ACTION
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Vehiculo(
ID_Vehiculo INT NOT NULL AUTO_INCREMENT,
Numero_Placa INT NOT NULL,
Color VARCHAR(20) NOT NULL,
Marca VARCHAR(20) NOT NULL,
Modelo VARCHAR(20) NOT NULL,
Kilometraje_Recorrido INT NOT NULL,
Año INT NOT NULL,
Tipo_Transmision VARCHAR(20) NOT NULL,
Numero_Puertas INT NOT NULL,
Condicion VARCHAR(20) NOT NULL,
PRIMARY KEY(ID_Vehiculo),
FOREIGN KEY(ID_Sucursal) REFERENCES Sucursal(ID_Sucursal),
FOREIGN KEY(ID_Transaccion) REFERENCES Transaccion(ID_Transaccion),
FOREIGN KEY(ID_Inventario) REFERENCES Inventario(ID_Inventario)
ON DELETE NO ACTION
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Forma_Pago(
ID_Pago INT NOT NULL AUTO_INCREMENT,
Forma_Pago VARCHAR(20) NOT NULL,
Nombre_Banco VARCHAR(20),'opcional'
Numero_Tarjeta_Credito INT,'opcional'
Monto INT NOT NULL,
PRIMARY KEY(ID_Pago),
FOREIGN KEY(ID_Transaccion) REFERENCES Transaccion(ID_Transaccion)
ON DELETE NO ACTION
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Detalle_Transaccion(
ID_Detalle INT NOT NULL AUTO_INCREMENT,
Cantidad_Producto INT NOT NULL,
Descuento INT,'opcional'
Descripcion VARCHAR(20) NOT NULL,
PRIMARY KEY(ID_Detalle ),
FOREIGN KEY(ID_Transaccion) REFERENCES Transaccion(ID_Transaccion)
ON DELETE NO ACTION
)ENGINE=InnoDB;




