CREATE DATABASE IF NOT EXISTS EditorialRevistas;
USE EditorialRevistas;

-- Tabla de Revistas
CREATE TABLE Revistas (
    RevistaID VARCHAR(50) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT NOT NULL
);

-- Tabla de Ediciones
CREATE TABLE Ediciones (
    EdicionID VARCHAR(50) PRIMARY KEY,
    RevistaID VARCHAR(50) NOT NULL,
    Numero INT NOT NULL,
    FechaPublicacion DATE NOT NULL,
    FOREIGN KEY (RevistaID) REFERENCES Revistas(RevistaID)
);

-- Tabla de Artículos
CREATE TABLE Articulos (
    ArticuloID VARCHAR(50) PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Contenido TEXT NOT NULL,
    EdicionID VARCHAR(50) NOT NULL,
    FOREIGN KEY (EdicionID) REFERENCES Ediciones(EdicionID)
);

-- Tabla de Autores
CREATE TABLE Autores (
    AutorID VARCHAR(50) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL
);

-- Tabla intermedia para la relación muchos a muchos entre Autores y Artículos
CREATE TABLE Autores_Articulos (
    AutorID VARCHAR(50) NOT NULL,
    ArticuloID VARCHAR(50) NOT NULL,
    PRIMARY KEY (AutorID, ArticuloID),
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID),
    FOREIGN KEY (ArticuloID) REFERENCES Articulos(ArticuloID)
);

-- Insertar datos de prueba
INSERT INTO Revistas (RevistaID, Nombre, Descripcion) VALUES
('R001', 'Revista Científica', 'Publicación sobre avances científicos'),
('R002', 'Tech Today', 'Lo último en tecnología');

INSERT INTO Ediciones (EdicionID, RevistaID, Numero, FechaPublicacion) VALUES
('E001', 'R001', 1, '2023-01-01'),
('E002', 'R001', 2, '2023-02-01');

INSERT INTO Articulos (ArticuloID, Titulo, Contenido, EdicionID) VALUES
('A001', 'El futuro de la energía', 'Contenido sobre energías renovables...', 'E001'),
('A002', 'Inteligencia Artificial', 'Avances en IA...', 'E002');

INSERT INTO Autores (AutorID, Nombre, Nacionalidad, FechaNacimiento) VALUES
('AU001', 'Carlos Pérez', 'Mexicano', '1980-05-15'),
('AU002', 'Ana Gómez', 'Española', '1990-09-20');

INSERT INTO Autores_Articulos (AutorID, ArticuloID) VALUES
('AU001', 'A001'),
('AU002', 'A002');