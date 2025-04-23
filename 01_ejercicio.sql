-- 18. mi primera tabla
CREATE table users(
	name VARCHAR(10) UNIQUE
);

-- 19. insertar registros
INSERT INTO users (name) 
VALUES ('MATHIEU');

INSERT INTO users (name) 
VALUES ('DEISY');

INSERT INTO users (name) 
VALUES ('JESUS');

INSERT INTO users (name)
VALUES
	('ROSA'),
	('TANIA'),
	('NIKESHA');

-- 20. actualizar registros
UPDATE users
SET
	name = 'MATHIEU'
WHERE
	name = 'MATHIEU 1'

-- 21. seleccionar todos los registros
SELECT * FROM users;

-- 21. seleccionar solo los primeros 2 registros
SELECT * 
FROM users
LIMIT 2;

-- 21. seleccionar solo los primeros 2 registros, saltandote 2
SELECT * 
FROM users
LIMIT 2
OFFSET 2;

--22. clausula where
-- postgresql es case sensitive (como lo busques, tal cual debe estar)
SELECT *
FROM users
WHERE name = 'ROSA'

--22. clausula where para busqueda combinado con like %
SELECT *
FROM users
WHERE name
-- LIKE '%A%' -- que el nombre tenga a la letra A
-- LIKE '___IA' -- que el nombre tenga 5 caracteres y que termine obligatoriamente en IA.
-- LIKE '_A%' -- que al nombre le antepongas 1 caracter y los caracteres siguientes no importen. 
LIKE 'MA%' -- que el nombre inicie en MA y lo que termine ni importe

--23. eliminar registros
-- CUIDADO - con esto te eliminas todos los registros
DELETE 
FROM user

SELECT * -- primero te aseguras que sea el registro correcto y luego lo cambias por un DELETE
-- DELETE
FROM users
WHERE name 
LIKE '_AT%'

--24. DROP: para eliminar una tabla (estructura de tabla + contenido)
-- Tienes que considerar que si tiene un constraint en otra tabla, primero tienes que eliminar el registro en esa tabla para que recien te permita su eliminación
DROP TABLE users;

--24. TRUNCATE: con truncate te eliminas todos los registros de una tabla
TRUNCATE TABLE users;