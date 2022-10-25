create database IMMOBILIARIA;

use IMMOBILIARIA;

create table PISO(
puerta varchar(10) primary key,
dni varchar(8),
nombre varchar(100),
apellidos varchar(255),
direccion varchar(255),
codigopostal int,
localidad varchar(100),
provincia varchar(100),
telefono int)
ENGINE=InnoDB;

create table CARGO(
codigo_cargo int not null primary key,
nombre varchar(100),
funciones varchar(255))
ENGINE=InnoDB;

create table ANOTACION(
cod_anotacion int not null auto_increment primary key,
fecha date,
importe double)
ENGINE=InnoDB;

create table GASTO_VARIABLE(
cod_anotacion int not null auto_increment primary key,
fecha_fact date,
concepto varchar(255),
num_fact int,
foreign key(cod_anotacion) references ANOTACION(cod_anotacion) on update cascade on delete cascade)
ENGINE=InnoDB;

create table INGRESO_RECIBO(
cod_anotacion int not null auto_increment primary key,
mes varchar(100),
pagado boolean,
puerta varchar(10),
foreign key(cod_anotacion) references ANOTACION(cod_anotacion) on update cascade on delete cascade,
foreign key(puerta) references PISO(puerta) on update cascade on delete cascade)
ENGINE=InnoDB;	

create table INGRESO_EXTRA(
cod_anotacion int not null auto_increment primary key,
concepto varchar(255),
foreign key(cod_anotacion) references ANOTACION(cod_anotacion) on update cascade on delete cascade)
ENGINE=InnoDB;

create table TIPO_GASTO_FIJO(
cod_gasto int not null auto_increment primary key,
nombre varchar(100),
descripcion varchar(255))
ENGINE=InnoDB;

create table GASTO_FIJO(
cod_anotacion int not null auto_increment primary key,
fecha_inicio date,
fecha_fin date,
consumo int,
cod_tipo_gasto int,
foreign key(cod_anotacion) references ANOTACION(cod_anotacion) on update cascade on delete cascade,
foreign key(cod_tipo_gasto) references TIPO_GASTO_FIJO(cod_gasto) on update cascade on delete cascade)
ENGINE=InnoDB;

create table DETALLE_RECIBO(
num_linea int not null auto_increment primary key,
concepto varchar(255),
importe double,
cod_anotacion int,
foreign key(cod_anotacion) references ANOTACION(cod_anotacion) on update cascade on delete cascade)
ENGINE=InnoDB;

create table OSTENTA(
cod_cargo int,
piso varchar(10),
primary key(cod_cargo,piso),
foreign key(cod_cargo) references CARGO(codigo_cargo) on update cascade on delete cascade,
foreign key(piso) references PISO(puerta) on update cascade on delete cascade)
ENGINE=InnoDB;