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

INSERT INTO usuarios
( 
   nombre,user,pass,rol
)
VALUES
("Alamacen","almacen",aes_encrypt("almacen2020","abc1234cimarron"),"admin");

INSERT INTO usuarios
( 
   nombre,user,pass,rol
)
VALUES
("Cuarnto de maquinas 1","usercm1",aes_encrypt("cm12020","abc1234cimarron"),"userm");


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


INSERT INTO cm1(id_producto, total)VALUES ("FERL0001",  17548.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERL0002",  5940.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERL0007",  442.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERL0010",  4180.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERL0012",  335.000) ;  
INSERT INTO cm1(id_producto, total)VALUES ("FERS0001", 350.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0002", 187680.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0003", 14740.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0004", 30975.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0007", 3420.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0008",  80975.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0009", 13320.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0010", 57885.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0014", 653.400);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0015", 57.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0019", 4633.800);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0028", 19039.450);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0029", 11824.400);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0030", 480.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0031", 1700.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0032", 540.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0034", 3202.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0036", 4425.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0038", 600.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0039", 725.000);
INSERT INTO cm1(id_producto, total)VALUES ("FERS0040", 425.000);

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
   nombre varchar(45) not null,
   invernaderos varchar(50)not null,
   planta varchar (10),
   nom2 varchar(10) not null,
   UNIQUE(nombre,planta)
);

UPDATE cms set nom2= "cm6_t" where id_cm=7;
--1-4 cm1
Insert into cms Values  (1,"Cuarto de maquinas 1-Pimiento","1,2,3,4","Pimiento","cm1");
--5-6-7-8 uno solo para 2-3 pimineto cm2 y 3
Insert into cms Values  (2,"Cuarto de maquinas 2-3-Pimiento" , "5,6,7,8","Pimiento","cm2");
--9-10 pimineto cm 4
Insert into cms Values  (3,"Cuarto de maquinas 4-Pimiento","9,10","Pimiento","cm4_p");
--11-12 tomate cm 4
Insert into cms Values  (4,"Cuarto de maquinas 4-Tomate","11,12","Tomate","cm4_t");
--13 14 cm5 tomate
Insert into cms Values  (5,"Cuarto de maquinas 5-Tomate","13,14","Tomate","cm5");
-- 17 18 pimiento cm6
Insert into cms Values  (6,"Cuarto de maquinas 6-Pimiento","17,18","Pimiento","cm6_p");
--15 16 tomate cm6
Insert into cms Values  (7,"Cuarto de maquinas 6-Tomate","15,16","Tomate","cm6_t");

create table user_cms
(
   id_user int not null,
   id_cm int not null,
   PRIMARY KEY(id_user,id_cm),
   FOREIGN KEY (id_user) REFERENCES usuarios(id_user),
   FOREIGN KEY (id_cm) REFERENCES cms(id_cm)
);


Insert into user_cms VALUES (1,1);
Insert into user_cms VALUES (1,2);
Insert into user_cms VALUES (1,3);
Insert into user_cms VALUES (1,4);
Insert into user_cms VALUES (1,5);
Insert into user_cms VALUES (1,6);
Insert into user_cms VALUES (1,7);


Insert into user_cms VALUES (2,1);
Insert into user_cms VALUES (2,2);
Insert into user_cms VALUES (2,3);
Insert into user_cms VALUES (2,4);
Insert into user_cms VALUES (2,5);
Insert into user_cms VALUES (2,6);
Insert into user_cms VALUES (2,7);

Insert into user_cms VALUES (3,1);
select c.* from user_cms uc,usuarios u,cms c where uc.id_user=u.id_user and c.id_cm=uc.id_cm and u.id_user=3






 create TABLE cm2
 (
   id_inve  int NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   id_producto varchar(50) NOT NULL,
   total DECIMAL(12,3) NOT NULL,
   UNIQUE(total,id_producto),
   FOREIGN KEY(id_producto) REFERENCES productos (id_producto)
 );


INSERT INTO cm2(id_producto, total)VALUES ("FERL0001",  17548.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERL0002",  5940.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERL0007",  442.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERL0010",  4180.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERL0012",  335.000) ;  
INSERT INTO cm2(id_producto, total)VALUES ("FERS0001", 350.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0002", 187680.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0003", 14740.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0004", 30975.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0007", 3420.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0008",  80975.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0009", 13320.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0010", 57885.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0014", 653.400);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0015", 57.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0019", 4633.800);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0028", 19039.450);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0029", 11824.400);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0030", 480.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0031", 1700.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0032", 540.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0034", 3202.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0036", 4425.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0038", 600.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0039", 725.000);
INSERT INTO cm2(id_producto, total)VALUES ("FERS0040", 425.000);

UPDATE cm2 SET total=2750 where id_producto="FERL0001"; 
UPDATE cm2 SET total=640 where id_producto="FERL0002"; 
UPDATE cm2 SET total=100 where id_producto="FERL0007"; 
UPDATE cm2 SET total=0 where id_producto="FERL0010"; 
UPDATE cm2 SET total=0 where id_producto="FERL0012"; 
UPDATE cm2 SET total=150 where id_producto="FERS0001"; 
UPDATE cm2 SET total=13200 where id_producto="FERS0002"; 
UPDATE cm2 SET total=1300 where id_producto="FERS0003"; 
UPDATE cm2 SET total=600 where id_producto="FERS0004"; 
UPDATE cm2 SET total=0 where id_producto="FERS0007"; 
UPDATE cm2 SET total=3600 where id_producto="FERS0008"; 
UPDATE cm2 SET total=300 where id_producto="FERS0009"; 
UPDATE cm2 SET total=7125 where id_producto="FERS0010"; 
UPDATE cm2 SET total=159.9 where id_producto="FERS0014"; 
UPDATE cm2 SET total=57 where id_producto="FERS0015"; 
UPDATE cm2 SET total=1360 where id_producto="FERS0019"; 
UPDATE cm2 SET total=0 where id_producto="FERS0028"; 
UPDATE cm2 SET total=0 where id_producto="FERS0029"; 
UPDATE cm2 SET total=0 where id_producto="FERS0030"; 
UPDATE cm2 SET total=0 where id_producto="FERS0031"; 
UPDATE cm2 SET total=0 where id_producto="FERS0032"; 
UPDATE cm2 SET total=1320 where id_producto="FERS0034"; 
UPDATE cm2 SET total=725 where id_producto="FERS0036"; 
UPDATE cm2 SET total=0 where id_producto="FERS0038"; 
UPDATE cm2 SET total=225 where id_producto="FERS0039"; 
UPDATE cm2 SET total=0 where id_producto="FERS0040"; 





 create TABLE cm4_p
 (
   id_inve  int NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   id_producto varchar(50) NOT NULL,
   total DECIMAL(12,3) NOT NULL,
   UNIQUE(total,id_producto),
   FOREIGN KEY(id_producto) REFERENCES productos (id_producto)
 );


INSERT INTO cm4_p(id_producto, total)VALUES ("FERL0001",  17548.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERL0002",  5940.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERL0007",  442.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERL0010",  4180.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERL0012",  335.000) ;  
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0001", 350.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0002", 187680.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0003", 14740.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0004", 30975.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0007", 3420.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0008",  80975.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0009", 13320.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0010", 57885.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0014", 653.400);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0015", 57.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0019", 4633.800);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0028", 19039.450);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0029", 11824.400);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0030", 480.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0031", 1700.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0032", 540.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0034", 3202.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0036", 4425.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0038", 600.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0039", 725.000);
INSERT INTO cm4_p(id_producto, total)VALUES ("FERS0040", 425.000);

UPDATE cm4_p SET total=1300 where id_producto="FERL0001"; 
UPDATE cm4_p SET total=0 where id_producto="FERL0002"; 
UPDATE cm4_p SET total=140 where id_producto="FERL0007"; 
UPDATE cm4_p SET total=0 where id_producto="FERL0010"; 
UPDATE cm4_p SET total=0 where id_producto="FERL0012"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0001"; 
UPDATE cm4_p SET total=21600 where id_producto="FERS0002"; 
UPDATE cm4_p SET total=5500 where id_producto="FERS0003"; 
UPDATE cm4_p SET total=4250 where id_producto="FERS0004"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0007"; 
UPDATE cm4_p SET total=3900 where id_producto="FERS0008"; 
UPDATE cm4_p SET total=2775 where id_producto="FERS0009"; 
UPDATE cm4_p SET total=6500 where id_producto="FERS0010"; 
UPDATE cm4_p SET total=470.2 where id_producto="FERS0014"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0015"; 
UPDATE cm4_p SET total=760 where id_producto="FERS0019"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0028"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0029"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0030"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0031"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0032"; 
UPDATE cm4_p SET total=340 where id_producto="FERS0034"; 
UPDATE cm4_p SET total=1100 where id_producto="FERS0036"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0038"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0039"; 
UPDATE cm4_p SET total=0 where id_producto="FERS0040"; 




 create TABLE cm6_p
 (
   id_inve  int NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   id_producto varchar(50) NOT NULL,
   total DECIMAL(12,3) NOT NULL,
   UNIQUE(total,id_producto),
   FOREIGN KEY(id_producto) REFERENCES productos (id_producto)
 );


INSERT INTO cm6_p(id_producto, total)VALUES ("FERL0001",  17548.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERL0002",  5940.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERL0007",  442.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERL0010",  4180.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERL0012",  335.000) ;  
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0001", 350.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0002", 187680.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0003", 14740.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0004", 30975.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0007", 3420.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0008",  80975.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0009", 13320.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0010", 57885.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0014", 653.400);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0015", 57.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0019", 4633.800);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0028", 19039.450);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0029", 11824.400);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0030", 480.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0031", 1700.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0032", 540.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0034", 3202.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0036", 4425.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0038", 600.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0039", 725.000);
INSERT INTO cm6_p(id_producto, total)VALUES ("FERS0040", 425.000);

UPDATE cm6_p SET total=750 where id_producto="FERL0001"; 
UPDATE cm6_p SET total=0 where id_producto="FERL0002"; 
UPDATE cm6_p SET total=80 where id_producto="FERL0007"; 
UPDATE cm6_p SET total=0 where id_producto="FERL0010"; 
UPDATE cm6_p SET total=0 where id_producto="FERL0012"; 
UPDATE cm6_p SET total=200 where id_producto="FERS0001"; 
UPDATE cm6_p SET total=17400 where id_producto="FERS0002"; 
UPDATE cm6_p SET total=2925 where id_producto="FERS0003"; 
UPDATE cm6_p SET total=3225 where id_producto="FERS0004"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0007"; 
UPDATE cm6_p SET total=2450 where id_producto="FERS0008"; 
UPDATE cm6_p SET total=1150 where id_producto="FERS0009"; 
UPDATE cm6_p SET total=3150 where id_producto="FERS0010"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0014"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0015"; 
UPDATE cm6_p SET total=720 where id_producto="FERS0019"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0028"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0029"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0030"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0031"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0032"; 
UPDATE cm6_p SET total=340 where id_producto="FERS0034"; 
UPDATE cm6_p SET total=2600 where id_producto="FERS0036"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0038"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0039"; 
UPDATE cm6_p SET total=0 where id_producto="FERS0040"; 





 create TABLE cm4_t
 (
   id_inve  int NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   id_producto varchar(50) NOT NULL,
   total DECIMAL(12,3) NOT NULL,
   UNIQUE(total,id_producto),
   FOREIGN KEY(id_producto) REFERENCES productos (id_producto)
 );


INSERT INTO cm4_t(id_producto, total)VALUES ("FERL0001",  17548.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERL0002",  5940.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERL0007",  442.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERL0010",  4180.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERL0012",  335.000) ;  
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0001", 350.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0002", 187680.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0003", 14740.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0004", 30975.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0007", 3420.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0008",  80975.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0009", 13320.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0010", 57885.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0014", 653.400);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0015", 57.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0019", 4633.800);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0028", 19039.450);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0029", 11824.400);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0030", 480.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0031", 1700.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0032", 540.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0034", 3202.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0036", 4425.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0038", 600.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0039", 725.000);
INSERT INTO cm4_t(id_producto, total)VALUES ("FERS0040", 425.000);

UPDATE cm4_t SET total=4000 where id_producto="FERL0001"; 
UPDATE cm4_t SET total=640 where id_producto="FERL0002"; 
UPDATE cm4_t SET total=0 where id_producto="FERL0007"; 
UPDATE cm4_t SET total=1200 where id_producto="FERL0010"; 
UPDATE cm4_t SET total=0 where id_producto="FERL0012"; 
UPDATE cm4_t SET total=0 where id_producto="FERS0001"; 
UPDATE cm4_t SET total=55275 where id_producto="FERS0002"; 
UPDATE cm4_t SET total=975 where id_producto="FERS0003"; 
UPDATE cm4_t SET total=4400 where id_producto="FERS0004"; 
UPDATE cm4_t SET total=800 where id_producto="FERS0007"; 
UPDATE cm4_t SET total=21400 where id_producto="FERS0008"; 
UPDATE cm4_t SET total=3935 where id_producto="FERS0009"; 
UPDATE cm4_t SET total=20550 where id_producto="FERS0010"; 
UPDATE cm4_t SET total=0 where id_producto="FERS0014"; 
UPDATE cm4_t SET total=0 where id_producto="FERS0015"; 
UPDATE cm4_t SET total=0 where id_producto="FERS0019"; 
UPDATE cm4_t SET total=7639.45 where id_producto="FERS0028"; 
UPDATE cm4_t SET total=2292.1 where id_producto="FERS0029"; 
UPDATE cm4_t SET total=180 where id_producto="FERS0030"; 
UPDATE cm4_t SET total=1425 where id_producto="FERS0031"; 
UPDATE cm4_t SET total=255 where id_producto="FERS0032"; 
UPDATE cm4_t SET total=180 where id_producto="FERS0034"; 
UPDATE cm4_t SET total=0 where id_producto="FERS0036"; 
UPDATE cm4_t SET total=100 where id_producto="FERS0038"; 
UPDATE cm4_t SET total=0 where id_producto="FERS0039"; 
UPDATE cm4_t SET total=0 where id_producto="FERS0040"; 

)
create TABLE cm5
 (
   id_inve  int NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   id_producto varchar(50) NOT NULL,
   total DECIMAL(12,3) NOT NULL,
   UNIQUE(total,id_producto),
   FOREIGN KEY(id_producto) REFERENCES productos (id_producto)
 );


INSERT INTO cm5(id_producto, total)VALUES ("FERL0001",  17548.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERL0002",  5940.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERL0007",  442.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERL0010",  4180.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERL0012",  335.000) ;  
INSERT INTO cm5(id_producto, total)VALUES ("FERS0001", 350.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0002", 187680.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0003", 14740.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0004", 30975.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0007", 3420.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0008",  80975.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0009", 13320.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0010", 57885.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0014", 653.400);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0015", 57.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0019", 4633.800);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0028", 19039.450);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0029", 11824.400);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0030", 480.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0031", 1700.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0032", 540.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0034", 3202.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0036", 4425.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0038", 600.000);
INSERT INTO cm5(id_producto, total)VALUES ("FERS0039", 725.000);
INSERT INTO cm5(id_producto, total) VALUES ("FERS0040", 425.000);

UPDATE cm5 SET total=0 where id_producto="FERL0001"; 
UPDATE cm5 SET total=0 where id_producto="FERL0002"; 
UPDATE cm5 SET total=0 where id_producto="FERL0007"; 
UPDATE cm5 SET total=480 where id_producto="FERL0010"; 
UPDATE cm5 SET total=0 where id_producto="FERL0012"; 
UPDATE cm5 SET total=0 where id_producto="FERS0001"; 
UPDATE cm5 SET total=2425 where id_producto="FERS0002"; 
UPDATE cm5 SET total=0 where id_producto="FERS0003"; 
UPDATE cm5 SET total=975 where id_producto="FERS0004"; 
UPDATE cm5 SET total=540 where id_producto="FERS0007"; 
UPDATE cm5 SET total=1350 where id_producto="FERS0008"; 
UPDATE cm5 SET total=0 where id_producto="FERS0009"; 
UPDATE cm5 SET total=1700 where id_producto="FERS0010"; 
UPDATE cm5 SET total=0 where id_producto="FERS0014"; 
UPDATE cm5 SET total=0 where id_producto="FERS0015"; 
UPDATE cm5 SET total=0 where id_producto="FERS0019"; 
UPDATE cm5 SET total=1350 where id_producto="FERS0028"; 
UPDATE cm5 SET total=1725 where id_producto="FERS0029"; 
UPDATE cm5 SET total=40 where id_producto="FERS0030"; 
UPDATE cm5 SET total=25 where id_producto="FERS0031"; 
UPDATE cm5 SET total=90 where id_producto="FERS0032"; 
UPDATE cm5 SET total=0 where id_producto="FERS0034"; 
UPDATE cm5 SET total=0 where id_producto="FERS0036"; 
UPDATE cm5 SET total=100 where id_producto="FERS0038"; 
UPDATE cm5 SET total=0 where id_producto="FERS0039"; 
UPDATE cm5 SET total=0 where id_producto="FERS0040"; 


create TABLE cm6_t
 (
   id_inve  int NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   id_producto varchar(50) NOT NULL,
   total DECIMAL(12,3) NOT NULL,
   UNIQUE(total,id_producto),
   FOREIGN KEY(id_producto) REFERENCES productos (id_producto)
 );


INSERT INTO cm6_t(id_producto, total)VALUES ("FERL0001",  17548.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERL0002",  5940.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERL0007",  442.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERL0010",  4180.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERL0012",  335.000) ;  
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0001", 350.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0002", 187680.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0003", 14740.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0004", 30975.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0007", 3420.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0008",  80975.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0009", 13320.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0010", 57885.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0014", 653.400);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0015", 57.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0019", 4633.800);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0028", 19039.450);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0029", 11824.400);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0030", 480.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0031", 1700.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0032", 540.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0034", 3202.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0036", 4425.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0038", 600.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0039", 725.000);
INSERT INTO cm6_t(id_producto, total)VALUES ("FERS0040", 425.000);

UPDATE cm5 SET total=4000 where id_producto="FERL0001"; 
UPDATE cm5 SET total=440 where id_producto="FERL0002"; 
UPDATE cm5 SET total=0 where id_producto="FERL0007"; 
UPDATE cm5 SET total=520 where id_producto="FERL0010"; 
UPDATE cm5 SET total=0 where id_producto="FERL0012"; 
UPDATE cm5 SET total=0 where id_producto="FERS0001"; 
UPDATE cm5 SET total=46900 where id_producto="FERS0002"; 
UPDATE cm5 SET total=3500 where id_producto="FERS0003"; 
UPDATE cm5 SET total=8250 where id_producto="FERS0004"; 
UPDATE cm5 SET total=1140 where id_producto="FERS0007"; 
UPDATE cm5 SET total=19800 where id_producto="FERS0008"; 
UPDATE cm5 SET total=2150 where id_producto="FERS0009"; 
UPDATE cm5 SET total=3825 where id_producto="FERS0010"; 
UPDATE cm5 SET total=0 where id_producto="FERS0014"; 
UPDATE cm5 SET total=0 where id_producto="FERS0015"; 
UPDATE cm5 SET total=0 where id_producto="FERS0019"; 
UPDATE cm5 SET total=2875 where id_producto="FERS0028"; 
UPDATE cm5 SET total=1343.1 where id_producto="FERS0029"; 
UPDATE cm5 SET total=180 where id_producto="FERS0030"; 
UPDATE cm5 SET total=200 where id_producto="FERS0031"; 
UPDATE cm5 SET total=160 where id_producto="FERS0032"; 
UPDATE cm5 SET total=480 where id_producto="FERS0034"; 
UPDATE cm5 SET total=0 where id_producto="FERS0036"; 
UPDATE cm5 SET total=80 where id_producto="FERS0038"; 
UPDATE cm5 SET total=0 where id_producto="FERS0039"; 
UPDATE cm5 SET total=237.5 where id_producto="FERS0040"; 