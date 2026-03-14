create table persona (
	nome stringa not null,
	cognome stringa not null,
	datanascita data not null,
	id integer primary key
);

create table paziente (
	email email not null,
	indirizzo indirizzo not null,
	persona integer primary key,

	unique (email, indirizzo),

	-- accorpo pa_is_p
	foreign key (persona)
		references persona(id)

	-- v.inclusione (persona) occorre in paz_tel(paziente)
);

create table specializzazione (
	nome stringa primary key
);


create table medico (
	persona integer primary key,
	foreign key (persona)
		references persona(id),

	specializzazione stringa not null,
	foreign key (specializzazione)
		references specializzazione(nome)

	-- v.inclusione (persona) occorre in spec_secondaria(medico)
);

create table spec_secondaria (
	medico integer not null,
	specializzazione stringa not null,

	primary key (medico, specializzazione),

	foreign key(medico)
		references medico(persona),

	foreign key(specializzazione)
		references specializzazione(nome)
);

create table telefono (
	numero telefono primary key

	-- v.inclusione (numero) occore in paz_tel(telefono)
);


create table paz_tel (
	telefono telefono not null,
	paziente integer not null,

	primary key (telefono, paziente),

	foreign key (telefono)
		references telefono(numero),

	foreign key (paziente)
		references paziente(persona)
);

create table pazienteesterno (
	paziente integer primary key,

	foreign key (paziente)
		references paziente(persona)

	-- v.inclusione (paziente) occorre in prestazioneesterna(pazienteesterno)
);

create table prestazioneesterna (
	data_richiesta date not null,
	descrizione stringa not null,
	id integer primary key,

	-- accorpo paz_prest
	pazienteesterno integer not null, 
	foreign key (pazienteesterno)
		references pazienteesterno(paziente),

	-- accorpo med_prest
	medico integer not null,
	foreign key (medico)
		references medico(persona)

);

create table stanza (
	piano integer not null,
	settore integer not null,
	id integer primary key 
);

create table letto (
	numero int1_8 not null,
	stanza integer not null,

	primary key (stanza, numero),

	foreign key (stanza)
		references stanza(id)
);

create table ricovero (
	inizio timestamp not null,
	dismissione timestamp,
	id integer primary key,

	-- accorpo ric_med
	medico integer not null,
	foreign key (medico)
		references medico(persona),

	-- accorpo paz_star
	paziente integer not null,
	foreign key(paziente)
		references paziente(persona),

	-- accorpo ric_let
	letto int1_8 not null,
	stanza integer not null,
	foreign key (stanza, letto)
    	references letto(stanza, numero)
);




