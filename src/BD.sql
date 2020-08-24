--Consulatas y creacion de la base de datos;
--entrar a la terminar y crear bd;ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234'

create DATABASE alamacen;
use mysql;
use almacen
 create TABLE usuarios
 (
    id_user INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    nombre varchar(50) NOT NULL,
    user varchar(50) NOT NULL,
    pass blob,
    rol varchar(50) NOT NULL,
    UNIQUE (user)
 );

-- Insert rows into table 'usuarios'
use almacen;
INSERT INTO usuarios
( 
   nombre,user,pass,rol
)
VALUES
("horticola cimarron","Hcimarron",aes_encrypt("cimarron2020","abc1234cimarron"),"admin");

select user, aes_decrypt(pass ,"abc1234cimarron") from usuarios;


select * from usuarios where user='Hcimarron' and aes_decrypt(pass ,"abc1234cimarron")='cimarron2020'

 create TABLE inventario
 (
   id_inve  int NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   id_producto varchar(50) NOT NULL,
   total DECIMAL(12,3) NOT NULL,
   UNIQUE(total,id_producto),
   FOREIGN KEY(id_producto) REFERENCES productos (id_producto)
 );

--liquidos
INSERT INTO inventario(id_producto, total)VALUES ("FERL0001",  17548.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERL0002",  5940.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERL0007",  442.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERL0010",  4180.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERL0012",  335.000)   
INSERT INTO inventario(id_producto, total)VALUES ("FERS0001", 350.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0002", 187680.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0003", 14740.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0004", 30975.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0007", 3420.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0008",  80975.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0009", 13320.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0010", 57885.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0014", 653.400)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0015", 57.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0019", 4633.800)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0028", 19039.450)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0029", 11824.400)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0030", 480.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0031", 1700.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0032", 540.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0034", 3202.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0036", 4425.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0038", 600.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0039", 725.000)
INSERT INTO inventario(id_producto, total)VALUES ("FERS0040", 425.000)
SELECT count(*) FROM `almacen`.`inventario`  order by id_producto ASC;




 create TABLE cm1
 (
   id_inve  int NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   id_producto varchar(50) NOT NULL,
   total DECIMAL(12,3) NOT NULL,
   UNIQUE(total,id_producto),
   FOREIGN KEY(id_producto) REFERENCES productos (id_producto)
 );


INSERT INTO cm1(id_producto, total)VALUES ("FERL0001",  17548.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERL0002",  5940.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERL0007",  442.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERL0010",  4180.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERL0012",  335.000)   
INSERT INTO cm1(id_producto, total)VALUES ("FERS0001", 350.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0002", 187680.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0003", 14740.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0004", 30975.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0007", 3420.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0008",  80975.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0009", 13320.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0010", 57885.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0014", 653.400)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0015", 57.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0019", 4633.800)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0028", 19039.450)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0029", 11824.400)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0030", 480.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0031", 1700.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0032", 540.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0034", 3202.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0036", 4425.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0038", 600.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0039", 725.000)
INSERT INTO cm1(id_producto, total)VALUES ("FERS0040", 425.000)

UPDATE cm1 SET total=2250 where id_producto="FERL0001"; 
UPDATE cm1 SET total=2440 where id_producto="FERL0002"; 
UPDATE cm1 SET total=38 where id_producto="FERL0007"; 
UPDATE cm1 SET total=0 where id_producto="FERL0010"; 
UPDATE cm1 SET total=335.5 where id_producto="FERL0012"; 
UPDATE cm1 SET total=0 where id_producto="FERS0001"; 
UPDATE cm1 SET total=5575 where id_producto="FERS0002"; 
UPDATE cm1 SET total=0 where id_producto="FERS0003"; 
UPDATE cm1 SET total=1507 where id_producto="FERS0004"; 
UPDATE cm1 SET total=0 where id_producto="FERS0007"; 
UPDATE cm1 SET total=1650 where id_producto="FERS0008"; 
UPDATE cm1 SET total=1785 where id_producto="FERS0009"; 
UPDATE cm1 SET total=6310 where id_producto="FERS0010"; 
UPDATE cm1 SET total=28.3 where id_producto="FERS0014"; 
UPDATE cm1 SET total=0 where id_producto="FERS0015"; 
UPDATE cm1 SET total=1137.5 where id_producto="FERS0019"; 
UPDATE cm1 SET total=0 where id_producto="FERS0028"; 
UPDATE cm1 SET total=0 where id_producto="FERS0029"; 
UPDATE cm1 SET total=0 where id_producto="FERS0030"; 
UPDATE cm1 SET total=0 where id_producto="FERS0031"; 
UPDATE cm1 SET total=0 where id_producto="FERS0032"; 
UPDATE cm1 SET total=498 where id_producto="FERS0034"; 
UPDATE cm1 SET total=725 where id_producto="FERS0036"; 
UPDATE cm1 SET total=0 where id_producto="FERS0038"; 
UPDATE cm1 SET total=180 where id_producto="FERS0039"; 
UPDATE cm1 SET total=0 where id_producto="FERS0040"; 


SELECT count(*) FROM `almacen`.`cm1` order by total DESC

SELECT * FROM `almacen`.`inventario` order by total DESC





create TABLE productos
 (
   id_producto  varchar(9) NOT NULL PRIMARY KEY  ,
   producto varchar(50) NOT NULL,
   tipo varchar(50) not null,
   unidad varchar(4)not null,
   UNIQUE(producto)
 );


 --liquidos
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERL0001", 'Acido Nitrico al 55%' , 'Liquido' , 'Lt');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERL0002", 'Acido Sulfurico al 98%' , 'Liquido' , 'Lt');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERL0007", 'Fitosal Raiz' , 'Liquido' , 'Lt');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERL0010", 'Acido Fosforico Ambar al 85%' , 'Liquido' , 'Lt');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERL0012", 'Bonosoil' , 'Liquido' , 'Lt');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0001", 'Amonitro' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0002", 'Nitrato de Calcio' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0003", 'Nitrato de Magnesio' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0004", 'MKP' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0007", 'Quelsel Hidroponia' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0008", 'Sulfato de Magnesio' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0009", 'Sulfato de Potasio' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0010", 'Nitrato de Potasio' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0014", 'Newquel Ca B' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0015", 'Actives Reforzado' , 'Solido' , 'Pza');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0019", 'Quelsel mix+TI' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0028", 'Cloruro de Potasio' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0029", 'Cloruro de Calcio' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0030", 'Newquel Zinc 14%' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0031", 'Solubor' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0032", 'Newquel (Mn 12%)' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0034", 'Newquel Fe 13.2%' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0036", 'Fosfatomonoamonico' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0038", 'Quelsel Mg 6%' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0039", 'Hipoclorito de calcio granulado 65%' , 'Solido' , 'Kg');
INSERT INTO productos(id_producto, producto,tipo,unidad)VALUES ("FERS0040", 'Tradecorp Ca' , 'Solido' , 'Kg');


create table cms
(
   id_cm int not null PRIMARY KEY,
   nombre varchar(30) not null,
   invernaderos varchar(50)not null,
   planta varchar (10),
   nom2 varchar(10) not null,
   UNIQUE(nombre,planta)
);

Insert into cm (1,"Cuarto de maquinas 1","")