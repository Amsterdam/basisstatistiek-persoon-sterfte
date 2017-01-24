create or replace function sterfte_aangehaakt()
returns table (
	anummr bigint,
	bsnumm bigint,
	unicod bigint,
	ovldat int,
	ovllnd character varying,
	ovlpls character varying,
	gslcha char,
	gbdtb8 int,
	leeftd double precision,
	leeft1 double precision,
	lndgbb bigint,
	gebpla character varying,
	bevcbs bigint,
	etncbs bigint,
	natiob bigint,
	vstdgr bigint,
	vstdta bigint,
	vstned bigint,
	brgstb bigint,
	codvbt int,
	dathon bigint,
	dathuw bigint,
	dtbvbt bigint,
	dtevbt bigint,
	uniou1 bigint,
	uniou2 bigint,
	gslou1 character varying,
	gslou2 character varying,
	gblou1 bigint,
	gblou2 bigint,
	gbdou1 bigint,
	gbdou2 bigint,
	huisnr int,
	huislt char,
	hstoev char,
	pttkod char,
	adrs15 text,
	strkod bigint,
	bagids bigint,
	numids bigint,
	brtk15 text,
	bctk15 text,
	stad15 text,
	i22geb character varying,
	i27geb character varying,
	altbrt15 character varying,
	rayon15 character varying,
	brtk10 character varying,
	tydber int
) as $$

select
	distinct on(a.a_nummer, a.bs_nummer)
	--persoonsgegevens
	a.a_nummer as anummr,
	a.bs_nummer as bsnumm,
	c.unicod,
	to_char(a.overleden_op, 'YYYYMMDD')::int as ovldat,
	(select coalesce("O_landVanOverlijden", "N_landVanOverlijden") from bron.brp_stuf_csv as z where ("O_bsn" = a.bs_nummer or "N_bsn" = a.bs_nummer) and ("O_landVanOverlijden" is not null or "N_landVanOverlijden" is not null) order by "O_landVanOverlijden", "N_landVanOverlijden" limit 1) as ovllnd,
	(select coalesce("O_plaatsVanOverlijden", "N_plaatsVanOverlijden") from bron.brp_stuf_csv as z where ("O_bsn" = a.bs_nummer or "N_bsn" = a.bs_nummer) and ("O_plaatsVanOverlijden" is not null or "N_plaatsVanOverlijden" is not null) limit 1) as ovlpls,
	(select coalesce("O_geslachtsaanduiding", "N_geslachtsaanduiding") from bron.brp_stuf_csv as z where "O_bsn" = a.bs_nummer or "N_bsn" = a.bs_nummer limit 1) as gslcha,
	to_char(i.datum, 'YYYYMMDD')::int as gbdtb8,
	extract('years' from age(a.overleden_op, to_timestamp(i.datum::char(8), 'YYYYMMDD')::timestamp without time zone)) as leeftd,
	extract('years' from age('2017-01-01', to_timestamp(i.datum::char(8), 'YYYYMMDD')::timestamp without time zone)) as leeft1,
	c.lndgbb,
	c.gebpla,
	c.bevcbs,
	c.etncbs,
	c.natiob,
	c.vstdgr,
	c.vstdta,
	c.vstned,
	c.brgstb,
	c.codvbt::int,
	c.dathon::bigint,
	c.dathuw::bigint,
	c.dtbvbt::bigint,
	c.dtevbt::bigint,
	--relatiegegevens
	c.uniou1,
	c.uniou2,
	d.gslcha as gslou1,
	e.gslcha as gslou2,
	d.lndgbb as gblou1,
	e.lndgbb as gblou2,
	d.gbdtb8 as gbdou1,
	e.gbdtb8 as gbdou2,
	--adresgegevens
	g.huisnummer as huisnr,
	g.huisletter as huislt,
	g.huisnummertoevoeging as hstoev,
	case when (g.postcode4 is null or g.postcode2 is null) and j.postcode is not null then
		j.postcode
	else
		(g.postcode4::char(4) || g.postcode2)::char(6)
	end as pttkod,
	case when g.straat_id is null then
		lpad(coalesce(j.straatcode::char(5), '00000'), 5, '0') || lpad(coalesce(g.huisnummer::char(5), '00000'), 5, '0') || lpad(coalesce(g.huisletter::char(1), ' '), 1, ' ') || rpad(coalesce(g.huisnummertoevoeging::char(4), '    '), 4, ' ')
	else
		lpad(coalesce(g.straat_id::char(5), '00000'), 5, '0') || lpad(coalesce(g.huisnummer::char(5), '00000'), 5, '0') || lpad(coalesce(g.huisletter::char(1), ' '), 1, ' ') || rpad(coalesce(g.huisnummertoevoeging::char(4), '    '), 4, ' ')
	end as adrs15,
	case when g.straat_id is null then
		j.straatcode
	else
		g.straat_id
	end as strkod,
	j.object_id as bagids,
	j.nummer_id as numids,
	j.buurtcode as brtk15,
	substring(j.buurtcode, 1, 3) as bctk15,
	substring(j.buurtcode, 1, 1) as stad15,
	(select i22geb from bron.kwadrs where brtk15 = j.buurtcode and i22geb is not null order by kwartaal desc limit 1) as i22geb,
	(select i27geb from bron.kwadrs where brtk15 = j.buurtcode and i27geb is not null order by kwartaal desc limit 1) as i27geb,
	(select altbrt15 from bron.kwadrs where brtk15 = j.buurtcode and altbrt15 is not null order by kwartaal desc limit 1) as altbrt15,
	(select rayon15 from bron.kwadrs where brtk15 = j.buurtcode and rayon15 is not null order by kwartaal desc limit 1) as rayon15,
	(select brtk10 from bron.kwadrs as k where k.pttkod = (g.postcode4::char(4) || g.postcode2)::char(6) and k.huisnr = g.huisnummer and coalesce(k.huislt, '-') = coalesce(g.huisletter, '-') and k.brtk10 is not null order by k.kwartaal desc limit 1) as brtk10,
	to_char(a.kennisgegeven_op, 'YYYYMMDD')::int as tydber
from
	persoon.sterfte_kern as a
left join lateral
	(select
		distinct on(a_nummer, bs_nummer)
		*
	from
		(
			select '201701' as kwartaal, peildt, anummr, bsnumm, unicod, gbdtb8, lndgbb, gebpla, bevcbs, etncbs, natiob, vstdgr, vstdta, vstned, brgstb, codvbt, dathon, dathuw::bigint, dtbvbt, dtevbt, uniou1, uniou2 from bron.kw20171 as z where (a.a_nummer = z.anummr or a.bs_nummer = z.bsnumm)
		union all
			select '201704' as kwartaal, peildt, anummr, bsnumm, unicod, gbdtb8, lndgbb, gebpla, bevcbs, etncbs, natiob, vstdgr, vstdta, vstned, brgstb, codvbt, dathon, dathuw::bigint, dtbvbt, dtevbt, uniou1, uniou2 from bron.kw20172 as y where (a.a_nummer = y.anummr or a.bs_nummer = y.bsnumm)
		union all
			select '201707' as kwartaal, peildt, anummr, bsnumm, unicod, gbdtb8, lndgbb, gebpla, bevcbs, etncbs, natiob, vstdgr, vstdta, vstned, brgstb, codvbt, dathon, dathuw::bigint, dtbvbt, dtevbt, uniou1, uniou2 from bron.kw20173 as x where (a.a_nummer = x.anummr or a.bs_nummer = x.bsnumm)
		union all
			select '201710' as kwartaal, peildt, anummr, bsnumm, unicod, gbdtb8, lndgbb, gebpla, bevcbs, etncbs, natiob, vstdgr, vstdta, vstned, brgstb, codvbt, dathon, dathuw::bigint, dtbvbt, dtevbt, uniou1, uniou2 from bron.kw20174 as w where (a.a_nummer = w.anummr or a.bs_nummer = w.bsnumm)
		union all
			select '201801' as kwartaal, peildt, anummr, bsnumm, unicod, gbdtb8, lndgbb, gebpla, bevcbs, etncbs, natiob, vstdgr, vstdta, vstned, brgstb, codvbt, dathon, dathuw::bigint, dtbvbt, dtevbt, uniou1, uniou2 from bron.kw20181 as v where (a.a_nummer = v.anummr or a.bs_nummer = v.bsnumm)
		) as b
	order by
		a_nummer, bs_nummer, abs(extract(day from a.overleden_op - to_timestamp(kwartaal::char(6), 'YYYYMM')::timestamp without time zone))
	) as c
on
	(
		a.a_nummer = c.anummr
or
		a.bs_nummer = c.bsnumm
	)
left join
	persoon.geboorte as i
on
	a.persoon_id = i.persoon_id
left join lateral
	(select
		distinct on(unicod)
		*
	from
		(
			select peildt, unicod, anummr, bsnumm, gslcha, lndgbb, gbdtb8 from bron.kw20181 as z where (z.unicod = c.uniou1)
		union all
			select peildt, unicod, anummr, bsnumm, gslcha, lndgbb, gbdtb8 from bron.kw20174 as y where (y.unicod = c.uniou1)
		union all
			select peildt, unicod, anummr, bsnumm, gslcha, lndgbb, gbdtb8 from bron.kw20173 as x where (x.unicod = c.uniou1)
		union all
			select peildt, unicod, anummr, bsnumm, gslcha, lndgbb, gbdtb8 from bron.kw20172 as w where (w.unicod = c.uniou1)
		union all
			select peildt, unicod, anummr, bsnumm, gslcha, lndgbb, gbdtb8 from bron.kw20171 as v where (v.unicod = c.uniou1)
		) as b
	order by
		unicod, peildt desc
	) as d
on
	d.unicod = c.uniou1
left join lateral
	(select
		distinct on(unicod)
		*
	from
		(
			select peildt, unicod, anummr, bsnumm, gslcha, lndgbb, gbdtb8 from bron.kw20181 as z where (z.unicod = c.uniou2)
		union all
			select peildt, unicod, anummr, bsnumm, gslcha, lndgbb, gbdtb8 from bron.kw20174 as y where (y.unicod = c.uniou2)
		union all
			select peildt, unicod, anummr, bsnumm, gslcha, lndgbb, gbdtb8 from bron.kw20173 as x where (x.unicod = c.uniou2)
		union all
			select peildt, unicod, anummr, bsnumm, gslcha, lndgbb, gbdtb8 from bron.kw20172 as w where (w.unicod = c.uniou2)
		union all
			select peildt, unicod, anummr, bsnumm, gslcha, lndgbb, gbdtb8 from bron.kw20171 as v where (v.unicod = c.uniou2)
		) as b
	order by
		unicod, peildt desc
	) as e
on
	e.unicod = c.uniou2
left join
	persoon.adres as g
on
	g.persoon_id = a.persoon_id
and
	coalesce(g.geldig_op, '1900-01-01') <= a.overleden_op
left join lateral
	geef_bag_informatie_voor_adres(g.postcode4||g.postcode2, g.straat_id, g.huisnummer, g.huisletter, g.huisnummertoevoeging, a.overleden_op) as j
on true
order by
	a.a_nummer, a.bs_nummer, g.geldig_op desc, g.kennisgegeven_op desc, g.id desc;

$$ language sql;