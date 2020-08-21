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
   id_producto  varchar(9) NOT NULL PRIMARY KEY  ,
   producto varchar(50) NOT NULL,
   total DECIMAL(12,3) NOT NULL,
   tipo varchar(50) not null,
   unidad varchar(4)not null,
   UNIQUE(producto)
 );

--liquidos
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERL0001", 'Acido Nitrico al 55%' ,17548.000, 'Liquido' , 'Lt');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERL0002", 'Acido Sulfurico al 98%' ,5940.000, 'Liquido' , 'Lt');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERL0007", 'Fitosal Raiz' ,442.000, 'Liquido' , 'Lt');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERL0010", 'Acido Fosforico Ambar al 85%' ,4180.000, 'Liquido' , 'Lt');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERL0012", 'Bonosoil' ,335.000, 'Liquido' , 'Lt');

--solidos
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0001", 'Amonitro' ,350.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0002", 'Nitrato de Calcio' ,187680.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0003", 'Nitrato de Magnesio' ,14740.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0004", 'MKP' ,30975.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0007", 'Quelsel Hidroponia' ,3420.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0008", 'Sulfato de Magnesio' ,80975.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0009", 'Sulfato de Potasio' ,13320.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0010", 'Nitrato de Potasio' ,57885.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0014", 'Newquel Ca B' ,653.400, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0015", 'Actives Reforzado' ,57.000, 'Solido' , 'Pza');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0019", 'Quelsel mix+TI' ,4633.800, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0028", 'Cloruro de Potasio' ,19039.450, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0029", 'Cloruro de Calcio' ,11824.400, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0030", 'Newquel Zinc 14%' ,480.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0031", 'Solubor' ,1700.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0032", 'Newquel (Mn 12%)' ,540.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0034", 'Newquel Fe 13.2%' ,3202.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0036", 'Fosfatomonoamonico' ,4425.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0038", 'Quelsel Mg 6%' ,600.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0039", 'Hipoclorito de calcio granulado 65%' ,725.000, 'Solido' , 'Kg');
INSERT INTO inventario(id_producto, producto,total,tipo,unidad)VALUES ("FERS0040", 'Tradecorp Ca' ,425.000, 'Solido' , 'Kg');
SELECT * FROM `almacen`.`inventario` LIMIT 1000;


