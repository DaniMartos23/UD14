create database LIGA;

use LIGA;

create table  EQUIPOS(
id_equipo varchar(100) primary key,
nombre varchar(100),
num_puntos int,
num_ganados int,
num_perdidos int,
num_empatados int,
num_goles int)
ENGINE=InnoDB;

create table  PERSONA(
dni varchar(8) primary key,
nombre varchar(100),
apellidos varchar(255),
genero char(1),
edad int)
ENGINE=InnoDB;

create table  JUGADOR(
dni varchar(8),
posicion varchar(100),
dorsal int,
num_goles int,
num_asist int,
num_tarjetas int,
equipo varchar(100),
foreign key(equipo) references EQUIPOS(id_equipo) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  ENTRENADOR(
dni varchar(8),
num_temp int,
num_titulos int,
equipo varchar(100),
foreign key(equipo) references EQUIPOS(id_equipo) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  JUEGA(
id_partido int,
id_local varchar(100),
id_visitante varchar(100),
num_goles_local int,
num_goles_visitante int,
foreign key(id_local) references EQUIPOS(id_equipo) on update cascade on delete cascade,
foreign key(id_visitante) references EQUIPOS(id_equipo) on update cascade on delete cascade)
ENGINE=InnoDB;