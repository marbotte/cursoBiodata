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
FROM countries;
-- <calculo1 END>

-- <espeletia>
SELECT *
FROM espeletia;
-- <espeletia END>

-- <concatenate_text>
SELECT *, genus ||' '|| spec_epith species
FROM espeletia;
-- <concatenate_text END>

-- <sin_from1>
SELECT '¡Viene de mi cerebro, no de una tabla!' AS "frase cualquiera";
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
ORDER BY superficie_km2 ASC;
-- <order1 END>

-- <order2>
SELECT *
FROM countries
ORDER BY superficie_km2 DESC;
-- <order2 END>

-- <order3>
SELECT *
FROM countries
ORDER BY sur_america,superficie_km2 DESC;
-- <order3 END>

-- <limit>
SELECT *
FROM countries
LIMIT 2;
-- <limit END>

-- <count1>
SELECT count(pais) num_pais
FROM countries;
-- <count1 END>


-- <count2>
SELECT count(*)
FROM countries
WHERE sur_america;
-- <count2 END>


-- <bog_chinga>
SELECT *
FROM bogota_chingaza;
-- <bog_chinga END>

-- <group1>
SELECT unidad_muestreo,count(especie)
FROM bogota_chingaza
GROUP BY unidad_muestreo;
-- <group1 END>

-- <sum>
SELECT especie ,sum(abundancia)
FROM bogota_chingaza
GROUP BY especie;
-- <sum END>

-- <avg>
SELECT unidad_muestreo ,AVG(abundancia)
FROM bogota_chingaza
GROUP BY unidad_muestreo;
-- <avg END>

-- <aggregate_txt>
SELECT unidad_muestreo , STRING_AGG(especie, ', ') list_esp
FROM bogota_chingaza
GROUP BY unidad_muestreo;
-- <aggregate_txt END>


-- <aggregate_arr>
SELECT especie , ARRAY_AGG(abundancia) list_abund
FROM bogota_chingaza
GROUP BY especie;
-- <aggregate_arr END>

-- <having1>
SELECT especie , SUM(abundancia) tot_abund
FROM bogota_chingaza
GROUP BY especie
HAVING SUM(abundancia) >= 1000
;
-- <having1 END>

