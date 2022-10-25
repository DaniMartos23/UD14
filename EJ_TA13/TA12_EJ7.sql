create database EMPRESA;

USE EMPRESA;

create table  CATEGORIAS(
id_categoria int not null primary key,
nombre varchar(100))
ENGINE=InnoDB;

create table  CONTRATOS(
id_contrato int not null primary key,
fecha_inicio date,
fecha_fin date,
categoria int,
foreign key(categoria) references CATEGORIAS(id_categoria) on delete cascade on update cascade)
ENGINE=InnoDB;

create table NOMINA(
id_nomina int not null primary key,
fecha date,
salario double,
contrato int,
foreign key(contrato) references CONTRATOS(id_contrato) on delete cascade on update cascade)
ENGINE=InnoDB;

create table  DEPARTAMENTOS(
codigo int not null primary key,
nombre varchar(100))
ENGINE=InnoDB;

create table EMPLEADO(
dni varchar(8) primary key,
num_segsoc int,
cod_trabajador int,
nombre varchar(100),
apellidos varchar(255),
direccion varchar(255),
telefono int,
departamento int,
foreign key(departamento) references DEPARTAMENTOS(codigo) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  COORDINA(
persona varchar(8),
departamento int,
primary key(persona,departamento),
foreign key(persona) references EMPLEADO(dni) on update cascade on delete cascade,
foreign key(departamento) references DEPARTAMENTOS(codigo) on update cascade on delete cascade)
ENGINE=InnoDB;