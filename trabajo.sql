DROP DATABASE IF EXISTS Consultas;
CREATE DATABASE Consultas;
USE Consultas;

CREATE TABLE Fabricantes (
	CODIGO tinyint primary key auto_increment,
    NOMBRE varchar(19)
);
CREATE TABLE Productos (
	ID_Producto tinyint primary key auto_increment,
    NomProducto varchar(20),
    Valor double,
    ID_Fabricante tinyint
);    
   
ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Fabricante
FOREIGN KEY (ID_Fabricante) REFERENCES Fabricantes (ID_Fabricante);