data sterfte.ststr2016p;
%let _EFIERR_ = 0;
infile 'G:\OIS\Basisbestanden\bevolking\mutaties\sterfte\2016\sterfte_aangehaakt_sas.csv'
delimiter = ';' MISSOVER DSD lrecl=32767 firstobs=2 ;

	informat jaar 8.0 ;
	informat anummr $10. ;
	informat bsnumm $9. ;
	informat unicod $14. ;
	informat ovldat $8. ;
	informat ovllnd $4. ;
	informat ovlpls $50. ;
	informat gslcha $1. ;
	informat gbdtb8 $8. ;
	informat leeftd 3.0 ;
	informat leeft1 3.0 ;
	informat lndgbb $4. ;
	informat gebpla $50. ;
	informat bevcbs $1. ;
	informat etncbs $4. ;
	informat natiob $3. ;
	informat vstdgr $8. ;
	informat vstdta $8. ;
	informat vstned $8. ;
	informat brgstb $1. ;
	informat codvbt $2. ;
	informat dathon $8. ;
	informat dathuw $8. ;
	informat dtbvbt $8. ;
	informat dtevbt $8. ;
	informat uniou1 $14. ;
	informat uniou2 $14. ;
	informat gslou1 $1. ;
	informat gslou2 $1. ;
	informat gblou1 $4. ;
	informat gblou2 $4. ;
	informat gbdou1 $50. ;
	informat gbdou2 $50. ;
	informat huisnr $5. ;
	informat huislt $5. ;
	informat hstoev $1. ;
	informat pttkod $6. ;
	informat adrs15 $15. ;
	informat strkod $5. ;
	informat bagids $16. ;
	informat numids $16. ;
	informat brtk15 $4. ;
	informat bctk15 $3. ;
	informat stad15 $1. ;
	informat i22geb $4. ;
	informat i27geb $4. ;
	informat altbrt15 $4. ;
	informat rayon15 $4. ;
	informat brtk10 $4. ;
	informat tydber $8. ;

	format jaar 8.0 ;
	format anummr $10. ;
	format bsnumm $9. ;
	format unicod $14. ;
	format ovldat $8. ;
	format ovllnd $4. ;
	format ovlpls $50. ;
	format gslcha $1. ;
	format gbdtb8 $8. ;
	format leeftd 3.0 ;
	format leeft1 3.0 ;
	format lndgbb $4. ;
	format gebpla $50. ;
	format bevcbs $1. ;
	format etncbs $4. ;
	format natiob $3. ;
	format vstdgr $8. ;
	format vstdta $8. ;
	format vstned $1. ;
	format brgstb $1. ;
	format codvbt $2. ;
	format dathon $8. ;
	format dathuw $8. ;
	format dtbvbt $8. ;
	format dtevbt $8. ;
	format uniou1 $14. ;
	format uniou2 $14. ;
	format gslou1 $1. ;
	format gslou2 $1. ;
	format gblou1 $4. ;
	format gblou2 $4. ;
	format gbdou1 $50. ;
	format gbdou2 $50. ;
	format huisnr $5. ;
	format huislt $5. ;
	format hstoev $1. ;
	format pttkod $6. ;
	format adrs15 $15. ;
	format strkod $5. ;
	format bagids $16. ;
	format numids $16. ;
	format brtk15 $4. ;
	format bctk15 $3. ;
	format stad15 $1. ;
	format i22geb $4. ;
	format i27geb $4. ;
	format altbrt15 $4. ;
	format rayon15 $4. ;
	format brtk10 $4. ;
	format tydber $8. ;

input
	jaar
	anummr $
	bsnumm $
	unicod $
	ovldat $
	ovllnd $
	ovlpls $
	gslcha $
	gbdtb8 $
	leeftd
	leeft1
	lndgbb $
	gebpla $
	bevcbs $
	etncbs $
	natiob $
	vstdgr $
	vstdta $
	vstned $
	brgstb $
	codvbt $
	dathon $
	dathuw $
	dtbvbt $
	dtevbt $
	uniou1 $
	uniou2 $
	gslou1 $
	gslou2 $
	gblou1 $
	gblou2 $
	gbdou1 $
	gbdou2 $
	huisnr $
	huislt $
	hstoev $
	pttkod $
	adrs15 $
	strkod $
	bagids $
	numids $
	brtk15 $
	bctk15 $
	stad15 $
	i22geb $
	i27geb $
	altbrt15 $
	rayon15 $
	brtk10 $
	tydber $;

label
	jaar = "jaar van verwerking"
	anummr = "administratienummer"
	bsnumm = "burgerservicenummer"
	unicod = "unieke code persoon"
	ovldat = "datum overlijden"
	ovllnd = "code van het land van overlijden"
	ovlpls = "code van de gemeente van overlijden"
	gslcha = "geslacht"
	gbdtb8 = "geboortedatum"
	leeftd = "leeftijd"
	leeft1 = "leeftijd op 1 januari van het mutatiejaar"
	lndgbb = "code geboorteland"
	gebpla = "geboorteplaats"
	bevcbs = "herkomstgroepering CBS"
	etncbs = "modelclassificatie herkomstgroepering CBS"
	natiob = "code van de nationaliteit"
	vstdgr = "vestigingsdatum in de gemeente"
	vstdta = "vestigingsdatum op het adres"
	vstned = "vestigingsdatum in nederland"
	brgstb = "burgerlijke staat"
	codvbt = "code van verblijfstitel"
	dathon = "datum huwelijksbeëindiging"
	dathuw = "datum huwelijkssluiting"
	dtbvbt = "datum begin verblijfstitel"
	dtevbt = "datum einde verblijfstitel"
	uniou1 = "unieke code ouder1"
	uniou2 = "unieke code ouder2"
	gslou1 = "geslacht van ouder1"
	gslou2 = "geslacht van ouder2"
	gblou1 = "geboortelandcode ouder1"
	gblou2 = "geboortelandcode ouder2"
	gbdou1 = "geboortedatum van ouder1"
	gbdou2 = "geboortedatum van ouder2"
	huisnr = "huisnummer"
	huislt = "huisletter"
	hstoev = "huisnummertoevoeging"
	pttkod = "postcode"
	adrs15 = "15 positie adrescode"
	strkod = "straatcode"
	bagids = "landelijke bagidentificatie van het adresseerbaar object BAG"
	numids = "landelijke bagnummeridentificatie"
	brtk15 = "buurtindeling 2015"
	bctk15 = "buurtcombinatieindeling 2015"
	stad15 = "stadsdeelindeling 2015"
	i22geb = "gebiedsgericht werken indeling in 22 gebieden"
	i27geb = "gebiedsgericht werken indeling in 27 gebieden"
	altbrt15 = "alternatieve buurtindeling stadsdelen 2015"
	rayon15 = "rayon indeling stadsdelen 2015"
	brtk10 = "buurtindeling 2010"
	tydber = "tijdstip van verwerking mutatie";

if _ERROR_ then call symputx('_EFIERR_',1);
run;
