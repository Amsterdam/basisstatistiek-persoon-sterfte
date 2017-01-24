--
-- stap 1
--
create materialized view persoon.sterfte_kern as
select * from sterfte('2017-01-01', '2018-02-01', '2017-01-01', '2018-01-01');

--
-- stap 2
--
create index sterfte_kern_a_nummer_idx on persoon.sterfte_kern(a_nummer);
create index sterfte_kern_bs_nummer_idx on persoon.sterfte_kern(bs_nummer);

create materialized view persoon.sterfte_aangehaakt as
select * from sterfte_aangehaakt();

grant all on persoon.sterfte_aangehaakt to maurice;
grant all on persoon.sterfte_aangehaakt to hans;
grant all on persoon.sterfte_aangehaakt to aafke;
