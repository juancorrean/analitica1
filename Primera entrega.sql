/*   1. Muestre los muertos por departamento en cada año   */
 
drop table if exists `EMERGENCIAS.muertes_2018`;
create table `EMERGENCIAS.muertes_2018` as 
SELECT  DEPARTAMENTO_2018, sum(FALLECIDOS_2018) as muertos_2018  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2018` 
group by DEPARTAMENTO_2018
order by muertos_2018 desc;
 
drop table if exists `EMERGENCIAS.muertes_2019`;
create table `EMERGENCIAS.muertes_2019` as 
SELECT  DEPARTAMENTO_2019, sum(FALLECIDOS_2019) as muertos_2019  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2019` 
group by DEPARTAMENTO_2019
order by muertos_2019 desc;
 
drop table if exists `EMERGENCIAS.muertes_2020`;
create table `EMERGENCIAS.muertes_2020` as 
SELECT  DEPARTAMENTO_2020, sum(FALLECIDOS_2020) as muertos_2020  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2020` 
group by DEPARTAMENTO_2020
order by muertos_2020 desc;
 
drop table if exists `EMERGENCIAS.resumenmuertes_12`;
create table `EMERGENCIAS.resumenmuertes_12` as 
SELECT  t1.muertos_2018,t2.muertos_2019,t1.DEPARTAMENTO_2018 FROM `primera-entrega-355420.EMERGENCIAS.muertes_2018` t1
left join `primera-entrega-355420.EMERGENCIAS.muertes_2019` t2 on t1.DEPARTAMENTO_2018= t2.DEPARTAMENTO_2019;
 
drop table if exists `EMERGENCIAS.resumenmuertes_123`;
create table `EMERGENCIAS.resumenmuertes_123` as 
SELECT  t1.DEPARTAMENTO_2018,t1.muertos_2018,t1.muertos_2019,t2.muertos_2020 FROM `primera-entrega-355420.EMERGENCIAS.resumenmuertes_12` t1
left join `primera-entrega-355420.EMERGENCIAS.muertes_2020` t2 on t1.DEPARTAMENTO_2018= t2.DEPARTAMENTO_2020;
 
 
 
/*   2. ¿Cuántas familias fueron afectadas por sequías en cada año?   */
 
drop table if exists `EMERGENCIAS.sequia_2018`;
create table `EMERGENCIAS.sequia_2018` as 
select TIPO_DE_EVENTO_2018 as EVENTO_2018, sum(FAMILIAS_2018) as familias_afectadas_2018
from `primera-entrega-355420.EMERGENCIAS.emergencias_2018` 
where TIPO_DE_EVENTO_2018 = "SEQUIA"
group by EVENTO_2018;
 
drop table if exists `EMERGENCIAS.sequia_2019`;
create table `EMERGENCIAS.sequia_2019` as 
select TIPO_DE_EVENTO_2019 as EVENTO_2019, sum(FAMILIAS_2019) as familias_afectadas_2019
from `primera-entrega-355420.EMERGENCIAS.emergencias_2019` 
where TIPO_DE_EVENTO_2019 = "SEQUIA"
group by EVENTO_2019;
 
drop table if exists `EMERGENCIAS.sequia_2020`;
create table `EMERGENCIAS.sequia_2020` as 
select TIPO_DE_EVENTO_2020 as EVENTO_2020, sum(FAMILIAS_2020) as familias_afectadas_2020
from `primera-entrega-355420.EMERGENCIAS.emergencias_2020` 
where TIPO_DE_EVENTO_2020 = "SEQUIA"
group by EVENTO_2020;
 
drop table if exists `EMERGENCIAS.sequia_12`;
create table `EMERGENCIAS.sequia_12` as 
select t1.EVENTO_2018, t1.familias_afectadas_2018, T2.familias_afectadas_2019
from `primera-entrega-355420.EMERGENCIAS.sequia_2018` t1
left join `primera-entrega-355420.EMERGENCIAS.sequia_2019` t2 on t1.EVENTO_2018= t2.EVENTO_2019;
 
drop table if exists `EMERGENCIAS.sequia_123`;
create table `EMERGENCIAS.sequia_123` as 
select t1.EVENTO_2018, t1.familias_afectadas_2018, t1.familias_afectadas_2019, t2.familias_afectadas_2020
from `primera-entrega-355420.EMERGENCIAS.sequia_12` t1
left join `primera-entrega-355420.EMERGENCIAS.sequia_2020` t2 on t1.EVENTO_2018= t2.EVENTO_2020;
 
 
/*   3. ¿Cuál fue el evento con mayor número de muertes de los tres años?   */
 
 
drop table if exists `EMERGENCIAS.nmuertes_2018`;
create table `EMERGENCIAS.nmuertes_2018` as 
SELECT TIPO_DE_EVENTO_2018,max(FALLECIDOS_2018) as fallecidos_2018  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2018`  
group by TIPO_DE_EVENTO_2018
order by fallecidos_2018 desc
limit 1;
 
drop table if exists `EMERGENCIAS.nmuertes_2019`;
create table `EMERGENCIAS.nmuertes_2019` as 
SELECT TIPO_DE_EVENTO_2019,max(FALLECIDOS_2019) as fallecidos_2019  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2019`  
group by TIPO_DE_EVENTO_2019
order by fallecidos_2019 desc
limit 1;
 
drop table if exists `EMERGENCIAS.nmuertes_2020`;
create table `EMERGENCIAS.nmuertes_2020` as 
SELECT TIPO_DE_EVENTO_2020,max(FALLECIDOS_2020) as fallecidos_2020  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2020`  
group by TIPO_DE_EVENTO_2020
order by fallecidos_2020 desc
limit 1;
 
 
 
/*   4. Promedio de personas afectadas en Antioquia por cada evento para cada año.   */
 
drop table if exists `EMERGENCIAS.antioquia_2018`;
create table `EMERGENCIAS.antioquia_2018` as 
select TIPO_DE_EVENTO_2018, round(avg(AFECTADOS_2018)) as prom_afectados_2018
from `primera-entrega-355420.EMERGENCIAS.emergencias_2018`
where DEPARTAMENTO_2018 = "ANTIOQUIA"
group by TIPO_DE_EVENTO_2018;
 
drop table if exists `EMERGENCIAS.antioquia_2019`;
create table `EMERGENCIAS.antioquia_2019` as 
select TIPO_DE_EVENTO_2019, round(avg(AFECTADOS_2019)) as prom_afectados_2019
from `primera-entrega-355420.EMERGENCIAS.emergencias_2019`
where DEPARTAMENTO_2019 = "ANTIOQUIA"
group by TIPO_DE_EVENTO_2019;
 
drop table if exists `EMERGENCIAS.antioquia_2020`;
create table `EMERGENCIAS.antioquia_2020` as 
select TIPO_DE_EVENTO_2020, round(avg(AFECTADOS_2020)) as prom_afectados_2020
from `primera-entrega-355420.EMERGENCIAS.emergencias_2020`
where DEPARTAMENTO_2020 = "ANTIOQUIA"
group by TIPO_DE_EVENTO_2020;
 
drop table if exists `EMERGENCIAS.antioquia_12`;
create table `EMERGENCIAS.antioquia_12` as 
select t1.TIPO_DE_EVENTO_2018,t2.TIPO_DE_EVENTO_2019, t1.prom_afectados_2018, t2.prom_afectados_2019
from `primera-entrega-355420.EMERGENCIAS.antioquia_2018` t1
full outer join `primera-entrega-355420.EMERGENCIAS.antioquia_2019` t2 on t1.TIPO_DE_EVENTO_2018= t2.TIPO_DE_EVENTO_2019;
 
drop table if exists `EMERGENCIAS.antioquia_123`;
create table `EMERGENCIAS.antioquia_123` as 
select t1.TIPO_DE_EVENTO_2018, t1.TIPO_DE_EVENTO_2019, t2.TIPO_DE_EVENTO_2020, t1.prom_afectados_2018, t1.prom_afectados_2019, t2.prom_afectados_2020
from `primera-entrega-355420.EMERGENCIAS.antioquia_12` t1
full outer join `primera-entrega-355420.EMERGENCIAS.antioquia_2020` t2 on t1.TIPO_DE_EVENTO_2019 = t2.TIPO_DE_EVENTO_2020
order by t1.TIPO_DE_EVENTO_2018, t1.TIPO_DE_EVENTO_2019, t2.TIPO_DE_EVENTO_2020;
 
 
 
/*   5. Inundaciones en los primeros dos años con viviendas destruidas y averiadas según el departamento   */
 
DROP TABLE IF EXISTS `EMERGENCIAS.Inundaciones2018`;
CREATE TABLE `EMERGENCIAS.Inundaciones2018` AS 
SELECT DEPARTAMENTO_2018, count(*) as Inundaciones_2018, sum(VIVIENDAS_DESTRUIDAS_2018) as Destruidas, sum(VIVIENDAS_AVERIADAS_2018) as Averiadas
FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2018`
WHERE TIPO_DE_EVENTO_2018 =  'INUNDACIÓN'
group by DEPARTAMENTO_2018
order by Inundaciones_2018 desc;
 
DROP TABLE IF EXISTS `EMERGENCIAS.Inundaciones2019`;
CREATE TABLE `EMERGENCIAS.Inundaciones2019` AS 
SELECT DEPARTAMENTO_2019, count(*) as Inundaciones_2019, sum(VIVIENDAS_DESTRUIDAS_2019) as Destruidas, sum(VIVIENDAS_AVERIADAS_2019) as Averiadas
FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2019`
WHERE TIPO_DE_EVENTO_2019 =  'INUNDACIÓN'
group by DEPARTAMENTO_2019
order by Inundaciones_2019 desc;



/*   6. ¿Cuál es el departamento donde hubo mayor número de afectados en cada uno de los años analizados? Muestre que tipo de evento era   */
 
drop table if exists `EMERGENCIAS.p61`;
create table `EMERGENCIAS.p61` as 
select DEPARTAMENTO_2018,TIPO_DE_EVENTO_2018, sum(AFECTADOS_2018) as cantidad_2018 from `primera-entrega-355420.EMERGENCIAS.emergencias_2018` 
WHERE TIPO_DE_EVENTO_2018 =  'INUNDACIÓN'
group by DEPARTAMENTO_2018,TIPO_DE_EVENTO_2018 
order by cantidad_2018 desc
limit 1;
 
drop table if exists `EMERGENCIAS.p62`;
create table `EMERGENCIAS.p62` as 
select DEPARTAMENTO_2019,TIPO_DE_EVENTO_2019, sum(AFECTADOS_2019) as cantidad_2019 from `primera-entrega-355420.EMERGENCIAS.emergencias_2019` 
WHERE TIPO_DE_EVENTO_2019 = 'INUNDACION' 
group by DEPARTAMENTO_2019,TIPO_DE_EVENTO_2019 
order by cantidad_2019 desc
limit 1;
 
drop table if exists `EMERGENCIAS.p63`;
create table `EMERGENCIAS.p63` as 
select DEPARTAMENTO_2020,TIPO_DE_EVENTO_2020, sum(AFECTADOS_2020) as cantidad_2020 from `primera-entrega-355420.EMERGENCIAS.emergencias_2020` 
WHERE TIPO_DE_EVENTO_2020 = 'INUNDACION' 
group by DEPARTAMENTO_2020,TIPO_DE_EVENTO_2020 
order by cantidad_2020 desc
limit 1;


/*   7. ¿Cuáles fueron los departamentos con más eventos de tipo INCENDIO ESTRUCTURAL en el año 2018 y 2019?   */
 
drop table if exists `EMERGENCIAS.p17`;
create table `EMERGENCIAS.p17` as 
select DEPARTAMENTO_2018, count(*) as cantidad_2018 from `primera-entrega-355420.EMERGENCIAS.emergencias_2018` 
where TIPO_DE_EVENTO_2018 = 'INCENDIO ESTRUCTURAL'
group by DEPARTAMENTO_2018 
order by cantidad_2018 desc;
 
drop table if exists `EMERGENCIAS.p27`;
create table `EMERGENCIAS.p27` as 
select DEPARTAMENTO_2019, count(*) as cantidad_2019 from `primera-entrega-355420.EMERGENCIAS.emergencias_2019`
where TIPO_DE_EVENTO_2019 = 'INCENDIO ESTRUCTURAL'
group by DEPARTAMENTO_2019
order by cantidad_2019 desc;
 
drop table if exists `EMERGENCIAS.p7`;
create table `EMERGENCIAS.p7` as 
SELECT  p72.DEPARTAMENTO_2019,p71.cantidad_2018,p72.cantidad_2019 FROM `primera-entrega-355420.EMERGENCIAS.p17` p71
left join `primera-entrega-355420.EMERGENCIAS.p27` p72 on p72.DEPARTAMENTO_2019 = p71.DEPARTAMENTO_2018
order by p71.cantidad_2018 desc;



/*   8.¿Cuáles son los 3 días en que ocurrieron más desaparecidos en el 2020?   */
 
DROP TABLE IF EXISTS `EMERGENCIAS.Desaparecidos2020`;
 
CREATE TABLE `EMERGENCIAS.Desaparecidos2020` AS 
SELECT FECHA, DESAPARECIDOS_2020 FROM(
SELECT DATE (FECHA_2020) AS FECHA, COUNT (*) AS DESAPARECIDOS_2020 FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2020`
group by DATE (FECHA_2020))
order by DESAPARECIDOS_2020 DESC
LIMIT 3;



/*   9. ¿Cuántas viviendas fueron destruidas de acuerdo a los eventos ocurridos en el 2018 en cada año?   */
 
drop table if exists `EMERGENCIAS.viviendas_2018`;
create table `EMERGENCIAS.viviendas_2018` as 
SELECT  TIPO_DE_EVENTO_2018, sum(VIVIENDAS_DESTRUIDAS_2018) as viviendas_2018  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2018`  
group by TIPO_DE_EVENTO_2018
order by viviendas_2018 desc;
 
drop table if exists `EMERGENCIAS.viviendas_2019`;
create table `EMERGENCIAS.viviendas_2019` as 
SELECT  TIPO_DE_EVENTO_2019, sum(VIVIENDAS_DESTRUIDAS_2019) as viviendas_2019  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2019`  
group by TIPO_DE_EVENTO_2019
order by viviendas_2019 desc;
 
drop table if exists `EMERGENCIAS.viviendas_2020`;
create table `EMERGENCIAS.viviendas_2020` as 
SELECT TIPO_DE_EVENTO_2020, sum(VIVIENDAS_DESTRUIDAS_2020) as viviendas_2020  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2020` 
group by TIPO_DE_EVENTO_2020
order by viviendas_2020 desc;
 
drop table if exists `EMERGENCIAS.resumen_p912`;
create table `EMERGENCIAS.resumen_p912` as 
SELECT  p91.viviendas_2018,p92.viviendas_2019,p91.TIPO_DE_EVENTO_2018 FROM `primera-entrega-355420.EMERGENCIAS.viviendas_2018` p91
left join `primera-entrega-355420.EMERGENCIAS.viviendas_2019` p92 on p91.TIPO_DE_EVENTO_2018 = p92.TIPO_DE_EVENTO_2019;
 
drop table if exists `EMERGENCIAS.resumen_p9`;
create table `EMERGENCIAS.resumen_p9` as 
SELECT  p91.TIPO_DE_EVENTO_2018,p91.viviendas_2018,p91.viviendas_2019,p92.viviendas_2020 FROM `primera-entrega-355420.EMERGENCIAS.resumen_p912` p91
left join `primera-entrega-355420.EMERGENCIAS.viviendas_2020` p92 on p91.TIPO_DE_EVENTO_2018 = p92.TIPO_DE_EVENTO_2020
order by viviendas_2018 desc;



/*   10. ¿Cuál es el total de familias afectadas por el evento vendaval en cada año?   */
 
drop table if exists `EMERGENCIAS.familias_2018`;
create table `EMERGENCIAS.familias_2018` as 
SELECT  TIPO_DE_EVENTO_2018, sum(FAMILIAS_2018) as familias_2018  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2018`  
group by TIPO_DE_EVENTO_2018
order by familias_2018 desc;
 
drop table if exists `EMERGENCIAS.familias_2019`;
create table `EMERGENCIAS.familias_2019` as 
SELECT  TIPO_DE_EVENTO_2019, sum(FAMILIAS_2019) as familias_2019  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2019`  
group by TIPO_DE_EVENTO_2019
order by familias_2019 desc;
 
drop table if exists `EMERGENCIAS.familias_2020`;
create table `EMERGENCIAS.familias_2020` as 
SELECT TIPO_DE_EVENTO_2020, sum(FAMILIAS_2020) as familias_2020  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2020` 
group by TIPO_DE_EVENTO_2020
order by familias_2020 desc;
 
drop table if exists `EMERGENCIAS.resumen_p1012`;
create table `EMERGENCIAS.resumen_p1012` as 
SELECT  p101.familias_2018,p102.familias_2019,p101.TIPO_DE_EVENTO_2018 FROM `primera-entrega-355420.EMERGENCIAS.familias_2018` p101
left join `primera-entrega-355420.EMERGENCIAS.familias_2019` p102 on p101.TIPO_DE_EVENTO_2018 = p102.TIPO_DE_EVENTO_2019;
 
drop table if exists `EMERGENCIAS.resumen_p100`;
create table `EMERGENCIAS.resumen_p100` as 
SELECT  p101.TIPO_DE_EVENTO_2018,p101.familias_2018,p101.familias_2019,p102.familias_2020 FROM `primera-entrega-355420.EMERGENCIAS.resumen_p1012` p101
left join `primera-entrega-355420.EMERGENCIAS.familias_2020` p102 on p101.TIPO_DE_EVENTO_2018 = p102.TIPO_DE_EVENTO_2020
order by familias_2018 desc;
 
drop table if exists `EMERGENCIAS.resumen_p10`;
create table `EMERGENCIAS.resumen_p10` as 
select * FROM `primera-entrega-355420.EMERGENCIAS.resumen_p100` WHERE TIPO_DE_EVENTO_2018 = 'VENDAVAL';



/*   11. Muestre los heridos, muertos y desaparecidos de cada año por departamento, en order descendente según el número de muertos   */
 
DROP TABLE IF EXISTS `EMERGENCIAS.Resumen2018`;
 
create table `EMERGENCIAS.Resumen2018` as 
select DEPARTAMENTO_2018, sum(FALLECIDOS_2018) as personas_muertas_2018, sum(HERIDOS_2018) as personas_heridas_2018, sum (DESAPARECIDOS_2018) as personas_desaparecidas_2018
from `primera-entrega-355420.EMERGENCIAS.emergencias_2018`
group by DEPARTAMENTO_2018
order by personas_muertas_2018 desc;
 
 
DROP TABLE IF EXISTS `EMERGENCIAS.Resumen2019`;
 
create table `EMERGENCIAS.Resumen2019` as 
select DEPARTAMENTO_2019, sum(FALLECIDOS_2019) as personas_muertas_2019, sum(HERIDOS_2019) as personas_heridas_2019, sum (DESAPARECIDOS_2019) as personas_desaparecidas_2019
from `primera-entrega-355420.EMERGENCIAS.emergencias_2019`
group by DEPARTAMENTO_2019
order by personas_muertas_2019 desc;
 
 
DROP TABLE IF EXISTS `EMERGENCIAS.Resumen2020`;
 
create table `EMERGENCIAS.Resumen2020` as 
select DEPARTAMENTO_2020, sum(FALLECIDOS_2020) as personas_muertas_2020, sum(HERIDOS_2020) as personas_heridas_2020, sum (DESAPARECIDOS_2020) as personas_desaparecidas_2020
from `primera-entrega-355420.EMERGENCIAS.emergencias_2020`
group by DEPARTAMENTO_2020
order by personas_muertas_2020 desc;


 
/*   12. Muestre las viviendas destruidas por departamento en cada año.   */
 
drop table if exists `EMERGENCIAS.viviendas_destruidas_2018`;
create table `EMERGENCIAS.viviendas_destruidas_2018` as 
SELECT  DEPARTAMENTO_2018, sum(VIVIENDAS_DESTRUIDAS_2018) as viviendas_destruidas_2018  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2018` 
group by DEPARTAMENTO_2018
order by viviendas_destruidas_2018 desc;
 
drop table if exists `EMERGENCIAS.viviendas_destruidas_2019`;
create table `EMERGENCIAS.viviendas_destruidas_2019` as 
SELECT  DEPARTAMENTO_2019, sum(VIVIENDAS_DESTRUIDAS_2019) as viviendas_destruidas_2019  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2019` 
group by DEPARTAMENTO_2019
order by viviendas_destruidas_2019 desc;
 
drop table if exists `EMERGENCIAS.viviendas_destruidas_2020`;
create table `EMERGENCIAS.viviendas_destruidas_2020` as 
SELECT  DEPARTAMENTO_2020, sum(VIVIENDAS_DESTRUIDAS_2020) as viviendas_destruidas_2020  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2020` 
group by DEPARTAMENTO_2020
order by viviendas_destruidas_2020 desc;
 
drop table if exists `EMERGENCIAS.resumen_viviendas_destruidas_12`;
create table `EMERGENCIAS.resumen_viviendas_destruidas_12` as 
SELECT  t1.viviendas_destruidas_2018,t2.viviendas_destruidas_2019,t1.DEPARTAMENTO_2018 FROM `primera-entrega-355420.EMERGENCIAS.viviendas_destruidas_2018` t1
left join `primera-entrega-355420.EMERGENCIAS.viviendas_destruidas_2019` t2 on t1.DEPARTAMENTO_2018= t2.DEPARTAMENTO_2019;
 
drop table if exists `EMERGENCIAS.resumen_viviendas_destruidas_123`;
create table `EMERGENCIAS.resumen_viviendas_destruidas_123` as 
SELECT  t1.DEPARTAMENTO_2018,t1.viviendas_destruidas_2018,t1.viviendas_destruidas_2019,t2.viviendas_destruidas_2020 FROM `primera-entrega-355420.EMERGENCIAS.resumen_viviendas_destruidas_12` t1
left join `primera-entrega-355420.EMERGENCIAS.viviendas_destruidas_2020` t2 on t1.DEPARTAMENTO_2018= t2.DEPARTAMENTO_2020
ORDER BY DEPARTAMENTO_2018;




/*   13. De los eventos ocurridos en el 2018, muestre el total de familias afectadas por evento en el 2018, 2019 y 2020 */
 
drop table if exists `EMERGENCIAS.familias_afectadas_2018`;
create table `EMERGENCIAS.familias_afectadas_2018` as 
SELECT  TIPO_DE_EVENTO_2018, sum(FAMILIAS_2018) as familias_afectadas_2018  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2018` 
group by TIPO_DE_EVENTO_2018
order by familias_afectadas_2018 desc;
 
drop table if exists `EMERGENCIAS.familias_afectadas_2019`;
create table `EMERGENCIAS.familias_afectadas_2019` as 
SELECT  TIPO_DE_EVENTO_2019, sum(FAMILIAS_2019) as familias_afectadas_2019  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2019` 
group by TIPO_DE_EVENTO_2019
order by familias_afectadas_2019 desc;
 
drop table if exists `EMERGENCIAS.familias_afectadas_2020`;
create table `EMERGENCIAS.familias_afectadas_2020` as 
SELECT  TIPO_DE_EVENTO_2020, sum(FAMILIAS_2020) as familias_afectadas_2020  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2020` 
group by TIPO_DE_EVENTO_2020
order by familias_afectadas_2020 desc;
 
drop table if exists `EMERGENCIAS.resumen_familias_afectadas_12`;
create table `EMERGENCIAS.resumen_familias_afectadas_12` as 
SELECT  t1.familias_afectadas_2018,t2.familias_afectadas_2019,t1.TIPO_DE_EVENTO_2018 FROM `primera-entrega-355420.EMERGENCIAS.familias_afectadas_2018` t1
LEFT JOIN `primera-entrega-355420.EMERGENCIAS.familias_afectadas_2019` t2 on t1.TIPO_DE_EVENTO_2018= t2.TIPO_DE_EVENTO_2019;
 
drop table if exists `EMERGENCIAS.resumen_familias_afectadas_123`;
create table `EMERGENCIAS.resumen_familias_afectadas_123` as 
SELECT  t1.TIPO_DE_EVENTO_2018,t1.familias_afectadas_2018,t1.familias_afectadas_2019,t2.familias_afectadas_2020 FROM `primera-entrega-355420.EMERGENCIAS.resumen_familias_afectadas_12` t1
left join `primera-entrega-355420.EMERGENCIAS.familias_afectadas_2020` t2 on t1.TIPO_DE_EVENTO_2018= t2.TIPO_DE_EVENTO_2020;
 
 
 
/*   14. Muestre el total de personas desaparecidas por municipio en cada año mostrando los primeros 10 resultados de acuerdo al número de desaparecidos en el año 2019   */
 
drop table if exists `EMERGENCIAS.desaparecidos_2018`;
create table `EMERGENCIAS.desaparecidos_2018` as 
SELECT  MUNICIPIO_2018, sum(DESAPARECIDOS_2018) as desaparecidos_2018  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2018`
group by MUNICIPIO_2018
order by desaparecidos_2018 desc;
 
drop table if exists `EMERGENCIAS.desaparecidos_2019`;
create table `EMERGENCIAS.desaparecidos_2019` as 
SELECT  MUNICIPIO_2019, sum(DESAPARECIDOS_2019) as desaparecidos_2019  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2019`
group by MUNICIPIO_2019
order by desaparecidos_2019 desc;
 
drop table if exists `EMERGENCIAS.desaparecidos_2020`;
create table `EMERGENCIAS.desaparecidos_2020` as 
SELECT  MUNICIPIO_2020, sum(DESAPARECIDOS_2020) as desaparecidos_2020  FROM `primera-entrega-355420.EMERGENCIAS.emergencias_2020`
group by MUNICIPIO_2020
order by desaparecidos_2020 desc;
 
drop table if exists `EMERGENCIAS.resumen_desaparecidos_12`;
create table `EMERGENCIAS.resumen_desaparecidos_12` as 
SELECT  t1.desaparecidos_2018,t2.desaparecidos_2019,t1.MUNICIPIO_2018 FROM `primera-entrega-355420.EMERGENCIAS.desaparecidos_2018` t1
LEFT JOIN `primera-entrega-355420.EMERGENCIAS.desaparecidos_2019` t2 on t1.MUNICIPIO_2018= t2.MUNICIPIO_2019;
 
 
drop table if exists `EMERGENCIAS.resumen_desaparecidos_123`;
create table `EMERGENCIAS.resumen_desaparecidos_123` as 
SELECT  MUNICIPIO_2018,t1.desaparecidos_2018,t1.desaparecidos_2019,t2.desaparecidos_2020 FROM `primera-entrega-355420.EMERGENCIAS.resumen_desaparecidos_12` t1
left join `primera-entrega-355420.EMERGENCIAS.desaparecidos_2020` t2 on t1.MUNICIPIO_2018= t2.MUNICIPIO_2020
order by t1.desaparecidos_2019 desc
LIMIT 10;
 
 
 
/*   15. Muestre el total de casas averiadas y casas destruidas por año en el departamento del Cauca  */
 
drop table if exists `EMERGENCIAS.viviendas_2018`;
create table `EMERGENCIAS.viviendas_2018` as 
select DEPARTAMENTO_2018, sum(VIVIENDAS_DESTRUIDAS_2018) as viviendas_destruidas_2018, sum(VIVIENDAS_AVERIADAS_2018) as viviendas_averiadas_2018
from `primera-entrega-355420.EMERGENCIAS.emergencias_2018`
where DEPARTAMENTO_2018 = "CAUCA" 
group by DEPARTAMENTO_2018;
 
drop table if exists `EMERGENCIAS.viviendas_2019`;
create table `EMERGENCIAS.viviendas_2019` as 
select DEPARTAMENTO_2019, sum(VIVIENDAS_DESTRUIDAS_2019) as viviendas_destruidas_2019, sum(VIVIENDAS_AVERIADAS_2019) as viviendas_averiadas_2019
from `primera-entrega-355420.EMERGENCIAS.emergencias_2019`
where DEPARTAMENTO_2019 = "CAUCA"
group by DEPARTAMENTO_2019;
 
drop table if exists `EMERGENCIAS.viviendas_2020`;
create table `EMERGENCIAS.viviendas_2020` as 
select DEPARTAMENTO_2020, sum(VIVIENDAS_DESTRUIDAS_2020) as viviendas_destruidas_2020, sum(VIVIENDAS_AVERIADAS_2020) as viviendas_averiadas_2020
from `primera-entrega-355420.EMERGENCIAS.emergencias_2020`
where DEPARTAMENTO_2020 = "CAUCA"
group by DEPARTAMENTO_2020;
 
drop table if exists `EMERGENCIAS.viviendas_12`;
create table `EMERGENCIAS.viviendas_12` as 
select t1.DEPARTAMENTO_2018, t1.viviendas_destruidas_2018, t1.viviendas_averiadas_2018, t2.viviendas_destruidas_2019, t2.viviendas_averiadas_2019
from `primera-entrega-355420.EMERGENCIAS.viviendas_2018` t1
left join `primera-entrega-355420.EMERGENCIAS.viviendas_2019` t2 on t1.DEPARTAMENTO_2018= t2.DEPARTAMENTO_2019;
 
drop table if exists `EMERGENCIAS.viviendas_123`;
create table `EMERGENCIAS.viviendas_123` as 
select t2.DEPARTAMENTO_2020 AS departamento, t1.viviendas_destruidas_2018, t1.viviendas_averiadas_2018, t1.viviendas_destruidas_2019, t1.viviendas_averiadas_2019, t2.viviendas_destruidas_2020, t2.viviendas_averiadas_2020
from `primera-entrega-355420.EMERGENCIAS.viviendas_12` t1
left join `primera-entrega-355420.EMERGENCIAS.viviendas_2020` t2 on t1.DEPARTAMENTO_2018= t2.DEPARTAMENTO_2020;
