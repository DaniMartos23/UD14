create database ACADEMIA;

use ACADEMIA;

create table PROFESORES (
dni varchar(8) not null primary key,
nombre varchar(10) unique key,
apellido1 varchar(10),
apellido2 varchar(10),
direccion varchar(50),
titulo varchar(50),
gana double not null)
engine=InnoDB;

create table CURSOS(
codigo int not null auto_increment primary key,
nombre varchar(10) unique key,
maxalumnos int,
fecha_inicio date not null,
fecha_final date not null,
num_horas int not null,
profesor varchar(8),
foreign key(profesor) references PROFESORES(dni) on delete cascade on update cascade)
engine=InnoDB;

create table ALUMNOS(
dni varchar(8) not null primary key,
nombre varchar(10),
apellido1 varchar(10),
apellido2 varchar(10),
direccion varchar(50),
sexo char(1),
fecha_nacimiento date not null)
engine=InnoDB;


create table ASIGNADO_A(
curso int not null,
alumno varchar(8) not null,
primary key(curso,alumno),
foreign key(curso) references CURSOS(codigo) on delete cascade on update cascade,
foreign key(alumno) references ALUMNOS(dni) on delete cascade on update cascade)
engine=InnoDB;

show columns from ALUMNOS;

show columns from CURSOS;

show columns from PROFESORES;

show columns from ASIGNADO_A;