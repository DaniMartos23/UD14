create database IMMOBI;
USE IMMOBI;

create table PERSONAS(
dni varchar(8) not null primary key,
nombre varchar(100),
apellidos varchar(255),
telefono int,
movil int)
ENGINE=InnoDB;

create table TRABAJADOR(
dni varchar(8) primary key,
cod_trabajador varchar(100),
foreign key(dni) references PERSONAS(dni) on update cascade on delete cascade)
ENGINE=InnoDB;

create table CLIENTE(
dni varchar(8) primary key,
cod_cliente varchar(100),
foreign key(dni) references PERSONAS(dni) on update cascade on delete cascade)
ENGINE=InnoDB;

create table ALQUILER(
id_alquiler int not null primary key,
nombre_empresa varchar(100),
fecha date,
valor int,
num_alquiler int,
persona varchar(8),
foreign key(persona) references PERSONAS(dni) on update cascade on delete cascade)
ENGINE=InnoDB;

create table IMMUEBLE(
cod_inmueble int not null primary key,
descripcion varchar(255),
metros int,
direccion varchar(255),
alquila int,
foreign key(alquila) references ALQUILER(id_alquiler) on update cascade on delete cascade)
ENGINE=InnoDB;

create table COMPRA(
cod_compra int not null primary key,
fecha date,
valor int)
ENGINE=InnoDB;

create table LOCALES(
inmueble int primary key,
uso varchar(100),
servicio boolean,
foreign key(inmueble) references IMMUEBLE(cod_inmueble) on update cascade on delete cascade)
ENGINE=InnoDB;

create table GARAJE(
inmueble int primary key,
cod_garaje int unique key,
planta int,
foreign key(inmueble) references IMMUEBLE(cod_inmueble) on update cascade on delete cascade)
ENGINE=InnoDB;

create table PISO(
inmueble int primary key,
cod_especial int unique key,
garaje int,
foreign key(inmueble) references IMMUEBLE(cod_inmueble) on update cascade on delete cascade,
foreign key(garaje) references GARAJE(cod_garaje) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  SE_COMPRA(
inmueble int,
comprar int,
primary key (inmueble,comprar),
foreign key(inmueble) references IMMUEBLE(cod_inmueble) on update cascade on delete cascade,
foreign key(comprar) references COMPRA(cod_compra) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  HACE(
persona varchar(8),
comprar int,
primary key (persona,comprar),
foreign key(persona) references PERSONAS(dni) on update cascade on delete cascade,
foreign key(comprar) references COMPRA(cod_compra) on update cascade on delete cascade)
ENGINE=InnoDB;