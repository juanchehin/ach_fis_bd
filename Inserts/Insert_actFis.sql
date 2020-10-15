-- INSERT Personas

INSERT INTO personas VALUES(1,'Garcia','Maria','M','2010-01-01','1233','garciA@gmail.com','Aguilares','Liumnia 123','213123465',curdate(),null,'A','Observaciones prueba');
INSERT INTO personas VALUES(2,'Lopez','Ana','M','2010-01-01','32423','lopez@gmail.com','Aguilares','Jujuy 123','213123465',curdate(),null,'A','Observaciones prueba');
INSERT INTO personas VALUES(3,'Fernandez','Lucia','M','2010-01-01','23423432','fernandez@gmail.com','Concepcion','Belgrano 23','213123465',curdate(),null,'A','Observaciones prueba');
INSERT INTO personas VALUES(4,'Moreno','Luis','H','2010-01-01','324','moreno@gmail.com','Alderete','Av gral paz 22','213123465',curdate(),null,'A','Observaciones prueba');
INSERT INTO personas VALUES(5,'Navarro','Angeles','M','2010-01-01','5464534','navarro@gmail.com','Calle s/n','Liumnia 123','213123465',curdate(),null,'A','Observaciones prueba');
INSERT INTO personas VALUES(6,'Rodriguez','Rosario','M','2010-01-01','54645645','rodrig@gmail.com','Las heras','Liumnia 123','213123465',curdate(),null,'A','Observaciones prueba');
INSERT INTO personas VALUES(7,'Ruiz','Juan Jose','H','2010-01-01','54645645','ruiz@gmail.com','Combate las piedras','Liumnia 123','213123465',curdate(),null,'A','Observaciones prueba');
INSERT INTO personas VALUES(8,'Diaz','Pablo','H','2010-01-01','345345','diaz@gmail.com','Cruz alta','Velez 123','213123465',curdate(),null,'A','Observaciones prueba');

-- Planes

INSERT INTO Planes VALUES(1,'Sin Plan','0','Cualquier cliente que no este inscripto en algun plan','A','0','0','0');
INSERT INTO Planes VALUES(2,'Zumba','1500','Clases de zumba','A','15 a 17','0','0');
INSERT INTO Planes VALUES(3,'Spinning','1000','Clases de spinnig','A','17 a 19','0','0');
INSERT INTO Planes VALUES(4,'Pesas','2000','Pesas libres arriba','A','0','0','12');

-- INSERT Clientes

INSERT INTO Clientes VALUES(1,1,'N');
INSERT INTO Clientes VALUES(2,3,'S');
INSERT INTO Clientes VALUES(3,3,'S');
INSERT INTO Clientes VALUES(4,4,'N');

-- INSERT Empleados

INSERT INTO Empleados VALUES(1,'Nombre Empleado 1','Apellido 1','DNI 1','A','Direccion 1','456879');
INSERT INTO Empleados VALUES(2,'Nombre Empleado 2','Apellido 2','DNI 2','A','Direccion 2','5456546');
INSERT INTO Empleados VALUES(3,'Nombre Empleado 3','Apellido 3','DNI 3','A','Direccion 3','555444');
INSERT INTO Empleados VALUES(4,'Nombre Empleado 4','Apellido 4','DNI 4','A','Direccion 4','45469789');

-- INSERT Productos

INSERT INTO Productos VALUES(1,'Nombre Producto 1','Descripcion producto 1','9');
INSERT INTO Productos VALUES(2,'Nombre Producto 2','Descripcion producto 2','7');
INSERT INTO Productos VALUES(3,'Nombre Producto 3','Descripcion producto 3','6');
INSERT INTO Productos VALUES(4,'Nombre Producto 4','Descripcion producto 4','5');

-- INSERT Proveedores

INSERT INTO Proveedores VALUES(1,'Nombre Proveedor 1','1-9887892232-2','Direccion 1','456465');
INSERT INTO Proveedores VALUES(2,'Nombre Proveedor 2','1-54648799-3','Direccion 2','5646664');
INSERT INTO Proveedores VALUES(3,'Nombre Proveedor 3','1-45664123-8','Direccion 3','4546564');
INSERT INTO Proveedores VALUES(4,'Nombre Proveedor 4','6-4678799898-8','Direccion 4','4564879');


-- INSERT Trabajos

INSERT INTO Trabajos VALUES(1,'Cambio aceite','550');
INSERT INTO Trabajos VALUES(2,'Parchado rueda tractor','300');
INSERT INTO Trabajos VALUES(3,'Soldadura Tren delantero','900');
INSERT INTO Trabajos VALUES(4,'Cambio camara','500');

-- INSERT Compras

INSERT INTO Compras VALUES(1,2);
INSERT INTO Compras VALUES(2,2);
INSERT INTO Compras VALUES(3,1);
INSERT INTO Compras VALUES(4,3);

-- INSERT Ventas

INSERT INTO Ventas VALUES(1,1,3);
INSERT INTO Ventas VALUES(2,2,4);
INSERT INTO Ventas VALUES(3,1,3);
INSERT INTO Ventas VALUES(4,3,1);

-- INSERT LineaCompra

INSERT INTO LineaCompra VALUES(1,1,10,600,CURDATE());
INSERT INTO LineaCompra VALUES(2,4,11,500,CURDATE());
INSERT INTO LineaCompra VALUES(3,3,1,100,CURDATE());
INSERT INTO LineaCompra VALUES(4,1,8,600,CURDATE());

-- INSERT LineasVentas

INSERT INTO LineasVentas VALUES(1,1,10,CURDATE(),900);
INSERT INTO LineasVentas VALUES(2,4,8,CURDATE(),900);
INSERT INTO LineasVentas VALUES(3,3,15,CURDATE(),500);
INSERT INTO LineasVentas VALUES(4,1,36,CURDATE(),600);

-- INSERT Pedidos

INSERT INTO Pedidos VALUES(1,1,1);
INSERT INTO Pedidos VALUES(1,4,3);
INSERT INTO Pedidos VALUES(3,3,5);
INSERT INTO Pedidos VALUES(2,1,6);

-- INSERT Realizan

INSERT INTO Realizan VALUES(1,1,CURDATE(),8);
INSERT INTO Realizan VALUES(1,4,CURDATE(),9);
INSERT INTO Realizan VALUES(3,3,CURDATE(),6);
INSERT INTO Realizan VALUES(2,1,CURDATE(),2);