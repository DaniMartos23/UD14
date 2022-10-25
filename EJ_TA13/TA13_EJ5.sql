CREATE DATABASE BIBLIOTECA;

USE BIBLIOTECA;

create table SOCIOS(
num_socio int not null auto_increment primary key,
nombre varchar(100),
apellidos varchar(255),
telefono int,
fecha_cad date,
num_dias int)
ENGINE=InnoDB;

create table SANCION(
socio int,
num_dias int primary key,
foreign key(socio) references SOCIOS(num_socio) on update cascade on delete cascade)
ENGINE=InnoDB;

create table FONDO(
titulo varchar(100),
autor varchar(100),
primary key(titulo,autor),
cantidad int)
ENGINE=InnoDB;

create table LIBRO(
signatura varchar(100) primary key,
disponible boolean,
titulol varchar(100),
autorl varchar(100),
foreign key(titulol,autorl) references FONDO(titulo,autor) on update cascade on delete cascade)
ENGINE=InnoDB;

create table PRESTAMO (
num_prestamo int not null auto_increment primary key,
fecha_prest date,
socio int,
libro varchar(100),
foreign key(socio) references SOCIOS(num_socio) on update cascade on delete cascade,
foreign key(libro) references LIBRO(signatura) on update cascade on delete cascade)
ENGINE=InnoDB;

create table PRESTAMO_S (
num_prestamo int not null primary key,
foreign key(num_prestamo) references PRESTAMO(num_prestamo) on update cascade on delete cascade)
ENGINE=InnoDB;

create table PRESTAMO_E (
num_prestamo int not null primary key,
fecha_devol date,
foreign key(num_prestamo) references PRESTAMO(num_prestamo) on update cascade on delete cascade)
ENGINE=InnoDB;

SHOW COLUMNS FROM FONDO;
SHOW COLUMNS FROM LIBRO;
SHOW COLUMNS FROM PRESTAMO_S;
SHOW COLUMNS FROM PRESTAMO_E;
SHOW COLUMNS FROM PRESTAMO;
SHOW COLUMNS FROM SANCION;
SHOW COLUMNS FROM SOCIOS;
