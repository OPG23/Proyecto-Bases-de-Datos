-- CREAR TABLAS

CREATE SCHEMA `proyecto1` ;
USE proyecto1;
-- Tabla de Productos
CREATE TABLE Productos (
    idProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    precio DECIMAL(10, 2),
    donaFOPRE BOOLEAN
);

-- Tabla de Compras
CREATE TABLE Compras (
    idCompra INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT,
    cantidad INT,
    montoTotal DECIMAL(10, 2),
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);

-- Tabla de Monedas
CREATE TABLE Monedas (
    idMoneda INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(5, 2)
);

-- Tabla de Creditos
CREATE TABLE Creditos (
    idCredito INT PRIMARY KEY AUTO_INCREMENT,
    idMoneda INT,
    monto DECIMAL(10, 2),
    FOREIGN KEY (idMoneda) REFERENCES Monedas(idMoneda)
);

-- Tabla de Donaciones FOPRE
CREATE TABLE DonacionesFOPRE (
    idDonacion INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT,
    porcentajeDonacion DECIMAL(5, 2),
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);

-- Ingresar productos
INSERT INTO Productos (nombre, precio, donaFOPRE) VALUES
('Chocorramo', 2500, FALSE),
('Gala', 1800, TRUE),
('CocaCola', 2500, FALSE),
('Pepsi', 2800, TRUE),
('PapasFritas', 2200, FALSE),
('BomBomBum', 700, FALSE),
('Galletas', 1200, FALSE),
('Chicles', 800, FALSE),
('Gomitas', 2000, TRUE),
('JugoHit', 3800, FALSE);
