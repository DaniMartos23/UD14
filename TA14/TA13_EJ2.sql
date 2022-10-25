create database ELEMENTOS;

use ELEMENTOS;

create table ELEMENTO(
nombre_elem varchar(100) primary key,
peso double,
simbolo char(2),
num_atomico int)
ENGINE=InnoDB;

create table COMPUESTO(
nombre varchar(100) primary key)
ENGINE=InnoDB;

create table COMPUESTO_POR(
element varchar(100),
compuest varchar(100),
primary key(element,compuest),
foreign key(element) references ELEMENTO(nombre_elem) on update cascade on delete cascade,
foreign key(compuest) references COMPUESTO(nombre) on update cascade on delete cascade)
ENGINE=InnoDB;

create table GASEOSO(
nombre varchar(100),
coef_exp double,
temp_lic int,
primary key(nombre),
foreign key(nombre) references COMPUESTO(nombre) on update cascade on delete cascade)
ENGINE=InnoDB;

create table LIQUIDO(
nombre varchar(100),
densidad double,
temp_evap int,
primary key(nombre),
foreign key(nombre) references COMPUESTO(nombre) on update cascade on delete cascade)
ENGINE=InnoDB;

create table SOLIDO(
nombre varchar(100),
color varchar(100),
olor varchar(100),
dureza double,
primary key(nombre),
foreign key(nombre) references COMPUESTO(nombre) on update cascade on delete cascade)
ENGINE=InnoDB;

SHOW columns FROM SOLIDO;

SHOW columns FROM LIQUIDO;

SHOW columns FROM GASEOSO;

SHOW columns FROM COMPUESTO;

SHOW columns FROM ELEMENTO;

SHOW columns FROM COMPUESTO_POR;