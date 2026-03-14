create table persona (
	username stringa primary key
);

create table chiodatore (
	persona stringa primary key,
	foreign key (persona)
		references persona(username)
);

create table arrampicatore (
	persona stringa primary key,
	nome stringa,
	cognome stringa,
	foreign key (persona)
		references persona(username)
);


create table falesia (
	nome stringa primary key,
	longitudine longitudine not null,
	latitudine latitudine not null
);

create table settore (
	id_settore integer primary key,
	nome stringa not null, 
	esposizione esposizione not null,
	falesia stringa not null,

	unique (nome, falesia),

	foreign key (falesia)
		references falesia(nome)
);

create table grado (
	nome stringa primary key,
	valore intgez not null
);

create table via (
	id integer primary key,
	nome stringa not null,
	lunghezza intgz not null,
	n_split intgz not null,
	settore integer not null,

	unique (settore, nome),

	-- accorpo grado
	grado stringa not null,
	foreign key (grado)
		references grado(nome),

	foreign key (settore)
		references settore(id_settore),

	-- accorpo chiodatore 
	chiodatore stringa not null,
	foreign key (chiodatore)
		references chiodatore(persona)
);


create table salita (
	data date not null, 
	id integer primary key,

	-- accorpo sale 
	via integer not null,
	foreign key (via)
		references via(id),

	-- accorpo arr_sal
	arrampicatore stringa not null,
	foreign key (arrampicatore)
		references arrampicatore(persona)
);

create table flash (
	salita integer primary key,
	foreign key (salita)
		references salita(id)
);

create table avista (
	salita integer primary key,
	foreign key (salita)
		references salita(id)
);

create table ripetuta (
	salita integer primary key,
	foreign key (salita)
		references salita(id)

	-- v.inclusione (salita) occorre in tentativo(ripetuta)
);

create table tentativo (
	note stringa not null,
	id integer primary key,

	-- accorpo ripetuta
	ripetuta integer not null,
	foreign key (ripetuta)
		references ripetuta(salita)
);