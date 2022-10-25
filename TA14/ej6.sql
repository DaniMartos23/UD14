create database PELICULASYSALAS;

use PELICULASYSALAS;

create table PELICULAS (
codigo int not null auto_increment primary key,
nombre varchar(100),
calificacionedad int)
ENGINE=InnoDB;

create table SALAS(
codigo int not null auto_increment primary key,
nombre varchar(100),
pelicula int not null,
foreign key(pelicula) references PELICULAS(codigo) on delete cascade on update cascade)
ENGINE=InnoDB;

SHOW COLUMNS FROM SALAS;

SHOW COLUMNS FROM PELICULAS;