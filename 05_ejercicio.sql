
-- 1. Cuantos usuarios tenemos con cuentas @google.com
-- Tip: count, like
/* SELECT 
	SUBSTRING(EMAIL, POSITION('@' IN EMAIL)+1) as EMAIL,
	COUNT(*) as CONTADOR
FROM 
	_USERS
GROUP BY 
	SUBSTRING(EMAIL, POSITION('@' IN EMAIL)+1)
HAVING 
	SUBSTRING(EMAIL, POSITION('@' IN EMAIL)+1) = 'google.com' */
	
SELECT 
	COUNT(*)
FROM
	_USERS
WHERE
	EMAIL
LIKE '%@google.com'

-- 2. De qué países son los usuarios con cuentas de @google.com
-- Tip: distinct
SELECT 
	-- SUBSTRING(EMAIL, POSITION('@' IN EMAIL)+1) as EMAIL,
	DISTINCT country
FROM 
	_USERS
WHERE 
	SUBSTRING(EMAIL, POSITION('@' IN EMAIL)+1) = 'google.com' 

-- 3. Cuantos usuarios hay por país (country)
-- Tip: Group by
SELECT
	COUNTRY,
	COUNT(*)
FROM
	_USERS
GROUP BY COUNTRY -- AND first_name AND last_bane


-- 4. Listado de direcciones IP de todos los usuarios de Iceland
-- Campos requeridos first_name, last_name, country, last_connection
SELECT
	first_name, last_name, country, last_connection
FROM
	_USERS
WHERE COUNTRY = 'Iceland'


-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX
SELECT
	first_name, last_name, country, last_connection
FROM
	_USERS
WHERE 
	COUNTRY = 'Iceland' AND 
	LAST_CONNECTION LIKE '112.%'


-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
-- Tip: Agrupar condiciones entre paréntesis 
SELECT
	first_name, last_name, country, last_connection
FROM
	_USERS
WHERE 
	COUNTRY = 'Iceland' AND
	(LAST_CONNECTION LIKE '112.%' OR 
	LAST_CONNECTION LIKE '28.%' OR 
	LAST_CONNECTION LIKE '188.%')


-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también
SELECT
	first_name, last_name, country, last_connection
FROM
	_USERS
WHERE 
	COUNTRY = 'Iceland' AND
	(LAST_CONNECTION LIKE '112.%' OR 
	LAST_CONNECTION LIKE '28.%' OR 
	LAST_CONNECTION LIKE '188.%')
ORDER BY
	last_name ASC, first_name ASC;

-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
-- Tip: Investigar IN
-- Tip2: Ver Operadores de Comparación en la hoja de atajos (primera página)
SELECT
	*
FROM
	_USERS
WHERE
	COUNTRY IN ('Mexico','Honduras','Costa Rica')
ORDER BY
	COUNTRY ASC, 
	FIRST_NAME ASC, 
	LAST_NAME ASC

-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc
SELECT
	COUNT(*),
	COUNTRY
FROM
	_USERS
WHERE
	COUNTRY IN ('Mexico','Honduras','Costa Rica')
GROUP BY
	COUNTRY
ORDER BY
	COUNTRY ASC
ORDER BY