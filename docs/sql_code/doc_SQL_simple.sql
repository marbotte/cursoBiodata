-- <select_example_1>
SELECT pais, superficie_km2 
FROM countries;
-- <select_example_1 END>

-- <select_estrella>
SELECT * 
FROM countries;
-- <select_estrella END>


-- <case1>
select *
frOm countries;
-- <case1 END>


-- <quote1>
SELECT "pais", "superficie_km2"
FROM "countries";
-- <quote1 END>


-- <case2>
SELECT PaIs, SuPerficie_km2
FROM countries;
-- <case2 END>


-- <colnames1>
SELECT pais, superficie_km2 AS "¿Que tan grande es?, digamos... ¿en km2?"
FROM countries;
-- <colnames1 END>

-- <colnames2>
SELECT pais tierra, superficie_km2 km2
FROM countries;
-- <colnames2 END>

-- <schema>
SELECT *
FROM public.countries;
-- <schema END>

-- <select_anadir_num>
SELECT *, 12 AS mi_numero_favorito
FROM countries;
-- <select_anadir_num END>

-- <select_anadir_texto>
SELECT *, 'lo que quiera' AS "Puedo añadir"
FROM countries;
-- <select_anadir_texto END>


-- <calculo1>
SELECT *, superficie_km2/2 mitad
FROM countries
-- <calculo1 END>


-- <sin_from1>
SELECT '¡Viene de mi cerebro, no de una tabla!' AS "frase cualquiera"
-- <sin_from1 END>

-- <from_raro>
SELECT * 
FROM (VALUES('a',1),('b',2),('c',3)) AS tabla(letra, numero);
-- <from_raro END>


-- <where_1>
SELECT *
FROM countries
WHERE sur_america;
-- <where_1 END>

-- <where_2>
SELECT *
FROM countries
WHERE superficie_km2 < 1000000;
-- <where_2 END>

-- <where_3>
SELECT *
FROM countries
WHERE pais = 'Chile';
-- <where_3 END>


-- <where_4>
SELECT *
FROM countries
WHERE pais <> 'Chile';
-- <where_4 END>

-- <where_5>
SELECT *
FROM countries
WHERE pais IN ('Chile', 'Francia');
-- <where_5 END>

-- <where_6>
SELECT *
FROM countries
WHERE sur_america AND superficie_km2 < 1000000;
-- <where_6 END>

-- <order1>
SELECT *
FROM countries
ORDER BY superficie_km2 ASC
-- <order1 END>

-- <order2>
SELECT *
FROM countries
ORDER BY superficie_km2 DESC
-- <order2 END>

-- <order3>
SELECT *
FROM countries
ORDER BY sur_america,superficie_km2 DESC
-- <order3 END>

-- <limit>
SELECT *
FROM countries
LIMIT 2;
-- <limit END>

