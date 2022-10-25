create database LOSCIENTIFICOS;

use LOSCIENTIFICOS;

create table CIENTIFICOS (
dni varchar(8) primary key,
nomapels varchar(255))
engine=InnoDB;

create table PROYECTO (
id char(4) primary key,
nombre varchar(255),
horas int)
engine=InnoDB;

create table ASIGNADO_A (
cientifico varchar(8),
proyecto char(4),
primary key(cientifico,proyecto),
foreign key(cientifico) references CIENTIFICOS(dni) on delete cascade on update cascade,
foreign key(proyecto) references PROYECTO(id) on delete cascade on update cascade)
engine=InnoDB;

show columns from CIENTIFICOS;

show columns from PROYECTO;

show columns from ASIGNADO_A;