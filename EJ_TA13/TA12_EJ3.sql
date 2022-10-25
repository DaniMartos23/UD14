create database COMUNIDADES;

USE COMUNIDADES;

create table  COMUNIDADES_AUTONOMAS(
nombre varchar(100) not null primary key,
poblacion int,
superficie double)
ENGINE=InnoDB;


create table PROVINCIAS(
id_provincias int not null primary key,
nombre varchar(100),
num_localidades int,
com_autonoma varchar(100),
foreign key(com_autonoma) references COMUNIDADES_AUTONOMAS(nombre) on delete cascade on update cascade)
ENGINE=InnoDB;

create table LOCALIDAD(
nombre varchar(100) not null primary key,
poblacion int,
superficie double,
provincia int,
capital_prov boolean,
capitalcom boolean,
foreign key(provincia) references PROVINCIAS(id_provincias) on delete cascade on update cascade)
ENGINE=InnoDB;