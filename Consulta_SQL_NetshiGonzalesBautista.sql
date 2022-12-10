-- CREADO POR NETSHI GONZALES BAUTISTA
-- Consulta SQL
select c.modelo,m.nombre as marca,
c.idmatricula as matricula, c.color, c.km KM_TOTALES,
ge.nombre_grupo,
a.nombre as Aseguradora,
p.num_poliza as NUMERO_POLIZA
from flota_vh.COCHES c,
flota_vh.marca m,
flota_vh.grupoemp ge,
flota_vh.aseguradora a,
flota_vh.poliza p
where c.idmarca = m.idmarca
and M.idgrupo = ge.idgrupo
and a.idaseguradora = p.idaseguradora
and c.idmatricula = p.idmatricula
and c.fecha_baja is null;