--
-- Test 1: Overleden in 2015 en op dezelfde datum ingeschreven in Amsterdam.
--
insert into persoon.persoon ( id ) values ( 1 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 1, 1, 474223401, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 1, '2015-01-12', '2015-01-31' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 1, 363, '2015-01-12', '2015-01-31' );

--
-- Test 2: Overleden in 2015 en laatste inschrijvingsdatum in Amsterdam.
--
insert into persoon.persoon ( id ) values ( 2 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 2, 1, 534733852, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 2, '2015-02-02', '2015-02-26' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 2, 363, '2002-02-02', '2015-02-26' );

--
-- Test 3: Overleden in 2015 en op dezelfde datum ingeschreven in Zaandam.
--
insert into persoon.persoon ( id ) values ( 3 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 3, 1, 651097794, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 3, '2015-01-15', '2015-07-01' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 3, 471, '2015-03-23', '2015-07-01' );

--
-- Test 4: Overleden in 2015 en laatste inschrijvingsdatum in Zaandam.
--
insert into persoon.persoon ( id ) values ( 4 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 4, 1, 609717078, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 4, '2015-03-26', '2015-03-29' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 4, 471, '2015-03-05', '2015-03-29' );

--
-- Test 5: Overleden na tijdvak. Ingeschreven in Amsterdam. Voor 1e peildatum gecorrigeerd naar binnen tijdvak.
--
insert into persoon.persoon ( id ) values ( 5 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 5, 1, 38525252, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 5, '2016-11-25', '2015-11-25' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 5, '2015-11-25', '2015-11-26' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 5, 363, '2015-11-25', '2015-11-25' );

--
-- Test 6: Overleden in 2015 in Zaandam. Na 1e peildatum en voor 2e peildatum wordt gemeente van inschrijving gecorrigeerd naar Amsterdam (alles in tijdvak).
--
insert into persoon.persoon ( id ) values ( 6 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 6, 1, 458698957, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 6, '2015-08-06', '2015-09-20' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 6, 471, '2015-01-18', '2015-01-21' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 6, 363, '2015-05-18', '2016-02-24' );

--
-- Test 7: Overleden in 2015 in Zaandam. Voor 1e peildatum wordt gemeente van inschrijving gecorrigeerd naar Amsterdam (in tijdvak).
--
insert into persoon.persoon ( id ) values ( 7 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 7, 1, 181982948, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 7, '2015-09-28', '2015-09-30' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 7, 471, '2015-02-28', '2015-02-28' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 7, 363, '2015-09-24', '2015-12-31' );

--
-- Test 8: Overlijdensdatum voor 1e peildatum gecorrigeerd, naar andere datum binnen tijdvak. Ingeschreven in Amsterdam.
--
insert into persoon.persoon ( id ) values ( 8 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 8, 1, 692053062, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 8, '2015-11-08', '2015-11-19' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 8, '2015-11-09', '2015-11-20' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 8, 363, '1990-09-28', '1990-09-28' );

--
-- Test 9: Overlijdensdatum na 1e peildatum en voor 2e peildatum gecorrigeerd naar binnen tijdvak. Ingeschreven in Amsterdam.
--
insert into persoon.persoon ( id ) values ( 9 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 9, 1, 271495649, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 9, '2016-11-08', '2015-11-19' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 9, '2015-11-08', '2016-03-06' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 9, 363, '2015-08-04', '2015-08-08' );

--
-- Test 10: Overlijdensdatum aanvankelijk binnen tijdvak. Datum na 1e peildatum en voor 2e peildatum gecorrigeerd naar buiten tijdvak. Ingeschreven in Amsterdam.
--
insert into persoon.persoon ( id ) values ( 10 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 10, 1, 78219462, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 10, '2015-08-11', '2015-08-11' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 10, '2016-01-08', '2016-02-12' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 10, 363, '1993-08-04', '2015-08-08' );

--
-- Test 11: Overleden op 31 december in tijdvak. Ingeschreven in Amsterdam.
--
insert into persoon.persoon ( id ) values ( 11 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 11, 1, 644660624, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 11, '2015-12-31', '2016-01-01' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 11, 363, '2015-12-31', '2016-01-01' );

--
-- Test 12: Overleden op 1 januari in tijdvak. Ingeschreven in Amsterdam.
--
insert into persoon.persoon ( id ) values ( 12 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 12, 1, 398478429, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 12, '2015-01-01', '2015-01-05' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 12, 363, '2015-01-01', '2015-01-05' );

--
-- Test 13: Overleden in tijdvak, kennisgegeven op 31-01-2016. Ingeschreven in Amsterdam.
--
insert into persoon.persoon ( id ) values ( 13 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 13, 1, 471002471, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 13, '2015-12-30', '2016-01-31' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 13, 363, '1953-03-04', '2015-03-10' );

--
-- Test 14: Overleden in tijdvak, kennisgegeven op 01-02-2016. Ingeschreven in Amsterdam.
--
insert into persoon.persoon ( id ) values ( 14 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 14, 1, 201256381, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 14, '2015-12-28', '2016-02-28' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 14, 363, '2015-04-04', '2015-04-07' );

--
-- Test 15: Geboren en ingeschreven voor tijdvak (31-12-2014), maar in tijdvak gecommuniceerd
--
insert into persoon.persoon ( id ) values ( 15 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 15, 1, 602641627, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 15, '2014-12-31', '2015-01-05' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 15, 363, '2014-12-31', '2015-01-05' );

--
-- Test 16: Overlijdensdatum in tijdvak waarna voor de 1e peildatum de overlijdensdatum wordt gecorrigeerd naar een andere datum in tijdvak, maar met dezelfde kennisgevingsdatum. Ingeschreven in Amsterdam.
--
insert into persoon.persoon ( id ) values ( 16 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 16, 1, 013495264, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 16, '2015-11-26', '2015-11-26' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 16, '2015-11-25', '2015-11-26' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 16, 363, '2015-11-25', '2015-11-26' );

--
-- Test 17: Overleden in 2015. Ingeschreven in Amsterdam. Vertrekt naar Zaandam maar met inschrijvingsdatum na overlijdensdatum.
--
insert into persoon.persoon ( id ) values ( 17 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 17, 1, 693247629, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 17, '2015-12-05', '2015-12-12' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 17, 363, '2015-11-26', '2015-11-26' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 17, 471, '2015-12-06', '2015-12-13' );

--
-- Test 18: Overleden in 2015. Ingeschreven in Amsterdam. Vertrekt naar Zaandam maar met onbekende inschrijvingsdatum.
--
insert into persoon.persoon ( id ) values ( 18 );
insert into persoon.persoon_id ( persoon_id, type_id, code, kennisgegeven_op ) values ( 18, 1, 645996683, '1900-01-01' );
insert into persoon.sterfte ( persoon_id, overleden_op, kennisgegeven_op ) values ( 18, '2015-05-05', '2015-05-08' );
insert into persoon.inschrijving ( persoon_id, gemeente_id, ingeschreven_op, kennisgegeven_op ) values ( 18, 363, NULL, '2015-05-08' );
