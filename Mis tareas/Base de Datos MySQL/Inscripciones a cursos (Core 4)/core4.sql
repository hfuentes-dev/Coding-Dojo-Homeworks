-- Crear la base de datos
CREATE DATABASE core4;
USE core4;

-- Crear tabla de estudiantes
CREATE TABLE estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT NOT NULL
);

-- Crear tabla de cursos
CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    duracion INT NOT NULL
);

-- Crear tabla de inscripciones
CREATE TABLE inscripciones (
    id_estudiante INT,
    id_curso INT,
    PRIMARY KEY (id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- Crear tabla de libros
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(40) NOT NULL
);

-- Insertar estudiantes (mínimo 5)
INSERT INTO estudiantes (nombre, edad) VALUES 
('Juan Pérez', 20),
('Ana Gómez', 22),
('Luis Martínez', 21),
('María Rodríguez', 23),
('Carlos López', 19);

-- Insertar cursos
INSERT INTO cursos (nombre, duracion) VALUES 
('Matemáticas', 30),
('Historia', 40),
('Ciencias', 35),
('Literatura', 25);

-- Insertar inscripciones (asociar 4 estudiantes a 2 cursos)
INSERT INTO inscripciones (id_estudiante, id_curso) VALUES 
(1, 1), -- Juan Pérez está inscrito en Matemáticas
(1, 2), -- Juan Pérez está inscrito en Historia
(2, 1), -- Ana Gómez está inscrita en Matemáticas
(2, 3), -- Ana Gómez está inscrita en Ciencias
(3, 3), -- Luis Martínez está inscrito en Ciencias
(3, 4), -- Luis Martínez está inscrito en Literatura
(4, 1), -- María Rodríguez está inscrita en Matemáticas
(4, 4), -- María Rodríguez está inscrita en Literatura
(5, 2), -- Carlos López está inscrito en Historia
(5, 3); -- Carlos López está inscrito en Ciencias

-- Insertar libros (mínimo 4)
INSERT INTO libros (titulo) VALUES 
('Libro de Matemática'),
('Libro de Historia'),
('Libro de Ciencias'),
('Libro de Literatura');
SELECT * FROM libros;

-- Proyectar todos los estudiantes y sus respectivos cursos
SELECT e.nombre AS Estudiante, c.nombre AS Curso
FROM estudiantes e
JOIN inscripciones i ON e.id = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id;

-- Proyectar estudiantes inscritos en un curso específico (por ejemplo, "Matemáticas")
SELECT e.nombre AS Estudiante
FROM estudiantes e
JOIN inscripciones i ON e.id = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id
WHERE c.nombre = 'Matemáticas';

-- Proyectar cursos en los que está inscrito un estudiante específico (por ejemplo, "Juan Pérez")
SELECT c.nombre AS Curso
FROM cursos c
JOIN inscripciones i ON c.id = i.id_curso
JOIN estudiantes e ON i.id_estudiante = e.id
WHERE e.nombre = 'Juan Pérez';

-- Contar el número de estudiantes inscritos en cada curso
SELECT c.nombre AS Curso, COUNT(i.id_estudiante) AS NumeroDeEstudiantes
FROM cursos c
LEFT JOIN inscripciones i ON c.id = i.id_curso
GROUP BY c.id;

-- Encontrar estudiantes que no están inscritos en ningún curso
SELECT e.nombre AS Estudiante
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id = i.id_estudiante
WHERE i.id_estudiante IS NULL;

