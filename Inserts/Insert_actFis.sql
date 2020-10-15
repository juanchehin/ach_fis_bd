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

-- INSERT profesionales

INSERT INTO profesionales VALUES(5,'Nutricion','Observacion prof');
INSERT INTO profesionales VALUES(6,'Piernas','Observacion prof 2');
INSERT INTO profesionales VALUES(7,'Cuerpo completo','Observacion prof 3');
INSERT INTO profesionales VALUES(8,'Pecho y hombro','Observacion prof 4');