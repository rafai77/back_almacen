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
   id_producto  INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   producto varchar(50) NOT NULL,
   total int NOT NULL,
   tipo varchar(50),
   UNIQUE(producto)
 );
INSERT INTO inventario
( 
   producto,total,tipo
)
VALUES
(
    'Acido Sulfurico al 98%' ,5940, 'Liquido'
);




Acido Nitrico al 55%								
Acido Sulfurico al 98%								
Fitosal Raiz								
Acido Fosforico Ambar al 85%								
Bonosoil								
