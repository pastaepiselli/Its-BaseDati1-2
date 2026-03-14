create table specie (
	n_scientifico stringa primary key,
	n_comune stringa not null
);

create table soggettoverde (
	id integer primary key,
	data date not null,

	-- accorpo sp_sv
	specie stringa not null,
	foreign key (specie)
		references specie(n_scientifico),

	-- accorpo appartiene
	areaverde integer not null,
	foreign key (areaverde)
		references areaverde(id)
);


create table areaverde (
	id integer primary key,
	lat latitudine not null,
	lon longitudine not null,
	is_fruibile boolean not null,
	is_sensibile boolean not null,

	check (not is_sensibile or is_fruibile) -- se A allora B
);

create table intervento (
	id integer primary key,
	inzio timestamp not null,
	durata_prev intgz not null,
	priorita priorita not null,

	-- accorpo av_i
	areaverde integer not null,
	foreign key (areaverde)
		references areaverde(id)
);

create table interventoassegnato (
	
	fine timestamp,
	intervento integer primary key,

	-- accorpo ia_isa_i

	foreign key (intervento)
		references intervento(id)

	-- v.incl (intervento) occorre in assegna(interventoassegnato)

);

create table operatore (
	cf cf primary key,
	nome stringa not null,
	cognome stringa not null,
	inizio date not null,
	fine date
);

create table assegna (
	istante timestamp not null,
	operatore cf not null,
	interventoassegnato integer not null,

	primary key (operatore, interventoassegnato),

	foreign key (operatore)
		references operatore(cf),

	foreign key (interventoassegnato)
		references interventoassegnato(intervento) 
);