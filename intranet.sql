DROP DATABASE IF EXISTS intranet;
CREATE DATABASE intranet;
USE intranet;

CREATE TABLE usuarios(
    usuario varchar(45) PRIMARY KEY,
    clave varchar(45) NOT NULL,
    admin boolean NOT NULL
);
CREATE TABLE datosPersonales(
    usuario varchar(45) PRIMARY KEY,
    nombre varchar(65),
    email varchar(45),
    FOREIGN KEY (usuario) REFERENCES usuarios(usuario)
);
CREATE TABLE categorias(
    ID_Categoria int AUTO_INCREMENT PRIMARY KEY,
    categoria varchar(45) NOT NULL,
    descripcion varchar(255) NOT NULL,
    ruta varchar(40) NOT NULL
);
CREATE TABLE permisos (
    usuario varchar(45),
    ID_Categoria int,
    PRIMARY KEY (usuario, ID_Categoria),
    FOREIGN KEY (usuario) REFERENCES usuarios(usuario),
    FOREIGN KEY (ID_Categoria) REFERENCES categorias(ID_Categoria)
);

INSERT categorias VALUES
(NULL, "Sección Multimedia", "Esta es la sección de videos explicativos", "multimedia.php"),
(NULL, "Material Académico", "Esta sección incluye material académico para descargar", "material.php"),
(NULL, "Tareas", "Esta sección presenta una serie de tareas para los alumnos", "tareas.php"),
(NULL, "Curiosidades", "Frases celebres, proverbios y adivinanzas", "curiosidades.php");

INSERT usuarios VALUES
('Test1', '123456', 0),
('Test2', '456789', 0),
('Admin', '753215', 1);

INSERT permisos VALUES
('Test1', 1), ('Test1', 4),
('Test2', 2), ('Test2', 3);
