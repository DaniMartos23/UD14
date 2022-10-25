create database SOCIAL;

USE SOCIAL;

create table CUENTA(
id_usuario int not null primary key,
nombre varchar(100),
apellidos varchar(255),
id_foto varchar(100))
ENGINE=InnoDB;

create table  GRUPO(
id_contacto int primary key,
nombre varchar(100))
ENGINE=InnoDB;

create table USUARIO(
cuenta int primary key,
direccion varchar(255),
telefono int,
email varchar(255),
foreign key(cuenta) references CUENTA(id_usuario) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  CONTACTO(
id_contacto int not null primary key,
descripcion varchar(255),
bloqueado boolean,
usuario int,
foreign key(usuario) references CUENTA(id_usuario) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  COMENTARIO(
id_coment int not null primary key,
comentario varchar(255),
id_img varchar(100),
usuario int,
foreign key(usuario) references CUENTA(id_usuario) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  PUEDE_VER(
id_coment int,
id_contacto int,
primary key (id_coment, id_contacto),
foreign key(id_coment) references COMENTARIO(id_coment) on update cascade on delete cascade,
foreign key(id_contacto) references CONTACTO(id_contacto) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  VE(
comentario int,
grupo int,
primary key (comentario,grupo),
foreign key(comentario) references COMENTARIO(id_coment) on update cascade on delete cascade,
foreign key(grupo) references GRUPO(id_contacto) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  PERTENECE(
contacto int,
grupo int,
primary key (contacto,grupo),
foreign key(contacto) references CONTACTO(id_contacto) on update cascade on delete cascade,
foreign key(grupo) references GRUPO(id_contacto) on update cascade on delete cascade)
ENGINE=InnoDB;

create table  FORMA_PARTE(
cuenta int,
grupo int,
primary key (cuenta,grupo),
foreign key(cuenta) references CUENTA(id_usuario) on update cascade on delete cascade,
foreign key(grupo) references GRUPO(id_contacto) on update cascade on delete cascade)
ENGINE=InnoDB;