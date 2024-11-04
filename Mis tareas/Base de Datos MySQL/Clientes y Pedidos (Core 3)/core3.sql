CREATE DATABASE Core3;
USE Core3;

create table clientes(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
direccion VARCHAR(100) NOT NULL,
telefono VARCHAR(20) NOT NULL
);

CREATE TABLE pedidos(
id INT AUTO_INCREMENT PRIMARY KEY,
cliente_id INT,
fecha DATE NOT NULL,
total INT NOT NULL,
FOREIGN KEY(cliente_id) REFERENCES clientes(id)
);

INSERT INTO clientes(nombre, direccion, telefono) VALUES
('Emilio Garrido', 'Calle Naranja', '909897867'),
('Matias Garrido', 'Calle Verde', '904567895'),
('Juan Campos', 'Calle Azul', '909778944'),
('Martin Gajardo', 'Calle Amarilla', '923237873'),
('Fernando Sepulveda', 'Calle Violeta', '916097812');

INSERT INTO pedidos (cliente_id, fecha, total) VALUES
(1, '2024-10-01', 150),
(1, '2024-10-02', 200),
(2, '2024-10-03', 350),
(2, '2024-10-04', 400),
(3, '2024-10-05', 100),
(3, '2024-10-06', 250),
(4, '2024-10-07', 300),
(4, '2024-10-08', 450),
(5, '2024-10-09', 600),
(5, '2024-10-10', 700);

-- Proyección de clientes y sus pedidos
SELECT c.id, c.nombre, p.id AS pedido_id, p.fecha, p.total
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id;

-- Proyección de pedidos por un cliente específico (ID = 1)
SELECT * FROM pedidos WHERE cliente_id = 1;

-- Total de pedidos por cliente
SELECT c.id, c.nombre, SUM(p.total) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre;

-- Eliminar un cliente y sus pedidos (ID = 1)
DELETE FROM pedidos WHERE cliente_id = 1;
DELETE FROM clientes WHERE id = 1;

-- Proyección de los tres clientes que más pedidos han realizado
SELECT c.id, c.nombre, COUNT(p.id) AS cantidad_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre
ORDER BY cantidad_pedidos DESC
LIMIT 3;