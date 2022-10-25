create database ESCUELA;
USE ESCUELA;

create table ASIGNATURA(
cod_asignatura int not null primary key,
nombre varchar(100),
cod_eur int)
ENGINE=InnoDB;

create table AULA(
cod_aula int not null primary key,
nombre varchar(100),
num_aula int,
metros double,
vacia boolean)
ENGINE=InnoDB;

create table CICLO(
cod_ciclo int not null primary key,
tipo varchar(100))
ENGINE=InnoDB;

create table CURSO(
cod_curso int not null primary key,
tipo varchar(100))
ENGINE=InnoDB;

create table PROFESOR(
cod_profe int not null primary key,
dni varchar(8),
seg_social varchar(100),
direccion varchar(255),
telefono int,
email varchar(255),
curso int,
foreign key(curso) references CURSO(cod_curso) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  NECESITA(
asignatura1 int,
asignatura2 int,
primary key (asignatura1,asignatura2),
foreign key(asignatura1) references ASIGNATURA(cod_asignatura) on update cascade on delete cascade,
foreign key(asignatura2) references ASIGNATURA(cod_asignatura) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  COMPONE(
asignatura int,
ciclo int,
primary key (asignatura,ciclo),
foreign key(asignatura) references ASIGNATURA(cod_asignatura) on update cascade on delete cascade,
foreign key(ciclo) references CICLO(cod_ciclo) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  HAY(
ciclo int,
curso int,
primary key (ciclo,curso),
foreign key(ciclo) references CICLO(cod_ciclo) on update cascade on delete cascade,
foreign key(curso) references CURSO(cod_curso) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  IMPARTE(
profesor int,
asignatura int,
primary key (profesor,asignatura),
foreign key(profesor) references PROFESOR(cod_profe) on update cascade on delete cascade,
foreign key(asignatura) references ASIGNATURA(cod_asignatura) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  HORARIO(
asignatura int,
aula int,
fecha date,
primary key (asignatura,aula),
foreign key(asignatura) references ASIGNATURA(cod_asignatura) on update cascade on delete cascade,
foreign key(aula) references AULA(cod_aula) on update cascade on delete cascade)
ENGINE=InnoDB;