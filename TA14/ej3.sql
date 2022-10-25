use TIENDAINFORMATICA;
create table FABRICANTES (
codigo int not null auto_increment primary key,
nombre varchar(100))
ENGINE=InnoDB;

create table ARTICULOS (
codigo int not null auto_increment primary key,
nombre varchar(100),
precio int,
fabricante int not null ,
foreign key(fabricante) references FABRICANTES(codigo) on delete cascade on update cascade)
ENGINE=InnoDB;

SHOW COLUMNS from ARTICULOS;

SHOW COLUMNS FROM FABRICANTES;
