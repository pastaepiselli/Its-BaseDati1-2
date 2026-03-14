create domain stringa as varchar(100);

create domain realgez as real
	check(value >= 0);

create type tipobiglietto as enum (
	'Standard',
	'Exetended access'
);

create table citta (
	id integer primary key,
	nome stringa not null
);

create table artista (
	nome_arte stringa not null,
	data_nascita date not null,
	data_morte date,
	citta integer not null,
	id integer primary key,

	-- accorpo cit_nasc
	foreign key (citta)
		references citta(id),

	check (data_morte is null or data_morte > data_nascita)
);

create table tecnica (
	nome stringa not null,
	id integer primary key
);

create table categoria (
	nome stringa primary key
);

create table correnteartistica (
	nome stringa primary key
);

create table opera (
	nome stringa not null,
	anno_realizzazione integer not null,
	id integer primary key

	-- accorpo op_tec
	tecnica integer,
	foreign key (tecnica)
		references tecnica(id),

	-- accorpo opa_cat
	categoria stringa not null,
	foreign key (categoria)
		references categoria(nome),

	-- v.inclusione opera(id) occorre in  op_corr(opera)	
);

create table op_corr (
	opera integer not null,
	correnteartistica integer not null,

	primary key (opera, categoria),

	foreign key (opera)
		references opera(id),
	foreign key (correnteartistica)
		references correnteartistica(nome)
);

create table 

