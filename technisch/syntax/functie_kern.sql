create or replace function sterfte (
	kennisgevingsdatum_begin timestamp without time zone,
	kennisgevingsdatum_eind timestamp without time zone,
	geldigheidsdatum_begin timestamp without time zone,
	geldigheidsdatum_eind timestamp without time zone
)
returns table (
	persoon_id bigint,
	bs_nummer bigint,
	a_nummer bigint,
	overleden_op timestamp without time zone,
	ingeschreven_op timestamp without time zone,
	kennisgegeven_op timestamp without time zone
) as $$

select
	a.persoon_id,
	d.bs_nummer,
	c.a_nummer,
	a.overleden_op,
	b.ingeschreven_op,
	a.kennisgegeven_op
from
	(select
		*
	from
		--
		-- Selecteer alle overlijdensrecords
		-- voor het tijdvak en voor de peildatum
		--
		(select
			distinct on(persoon_id)
			persoon_id,
			overleden_op,
			geldig_op,
			kennisgegeven_op
		from
			persoon.sterfte
		where
			(case when kennisgevingsdatum_begin is null and kennisgevingsdatum_eind is null then
				true
			when kennisgevingsdatum_begin is null and kennisgevingsdatum_eind is not null then
				kennisgegeven_op < kennisgevingsdatum_eind
			when kennisgevingsdatum_begin is not null and kennisgevingsdatum_eind is null then
				kennisgegeven_op >= kennisgevingsdatum_begin
			when kennisgevingsdatum_begin is not null and kennisgevingsdatum_eind is not null then
				(kennisgegeven_op >= kennisgevingsdatum_begin and kennisgegeven_op < kennisgevingsdatum_eind)
			end)
		order by
			persoon_id, geldig_op desc, kennisgegeven_op desc, id desc
		) as a
	where
		(case when geldigheidsdatum_begin is null and geldigheidsdatum_eind is null then
			true
		when geldigheidsdatum_begin is null and geldigheidsdatum_eind is not null then
			overleden_op < geldigheidsdatum_eind
		when geldigheidsdatum_begin is not null and geldigheidsdatum_eind is null then
			overleden_op >= geldigheidsdatum_begin
		when geldigheidsdatum_begin is not null and geldigheidsdatum_eind is not null then
			(overleden_op >= geldigheidsdatum_begin and overleden_op < geldigheidsdatum_eind)
		end)
	) as a
left join
	(select
		distinct on(persoon_id)
		persoon_id,
		ingeschreven_op,
		gemeente_id
	from
		persoon.inschrijving as b
	where
		(case when kennisgevingsdatum_eind is null then
			true
		when kennisgevingsdatum_eind is not null then
			kennisgegeven_op < kennisgevingsdatum_eind
		end)
	order by
		persoon_id, ingeschreven_op desc
	) as b
on
	a.persoon_id = b.persoon_id
left join
	(select
		distinct on(persoon_id)
		persoon_id,
		code as a_nummer
	from
		persoon.persoon_id
	where
		type_id = (select id from persoon.persoon_id_type where afkorting = 'AN')
	and
		(case when kennisgevingsdatum_eind is null then
			true
		when kennisgevingsdatum_eind is not null then
			kennisgegeven_op < kennisgevingsdatum_eind
		end)
	order by
		persoon_id
	) as c
on
	a.persoon_id = c.persoon_id
left join
	(select
		distinct on(persoon_id)
		persoon_id,
		code as bs_nummer
	from
		persoon.persoon_id
	where
		type_id = (select id from persoon.persoon_id_type where afkorting = 'BSN')
	and
		(case when kennisgevingsdatum_eind is null then
			true
		when kennisgevingsdatum_eind is not null then
			kennisgegeven_op < kennisgevingsdatum_eind
		end)
	order by
		persoon_id
	) as d
on
	a.persoon_id = d.persoon_id
where
	ingeschreven_op is null
or
	(
		ingeschreven_op <= overleden_op
	and
		gemeente_id = 363
	)
order by
	a.persoon_id;

$$ language sql;