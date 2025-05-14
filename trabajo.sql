DROP DATABASE IF EXISTS Consultas;
CREATE DATABASE Consultas;
USE Consultas;

CREATE TABLE fabricante (
	codigo int(10) primary key auto_increment,
    nombre varchar (100)
);
CREATE TABLE producto (
	codigo int(10) primary key auto_increment,
    nombre varchar(100),
    precio double,
    codigo_fabricante int(10)
);    
   
ALTER TABLE producto
ADD CONSTRAINT FK_productos_fabricante
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante (codigo);

