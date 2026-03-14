create table nazione (
	nome stringa primary key
);

create table regione (
	nome stringa not null,

	-- accorpo reg naz
	nazione stringa not null,

	foreign key (nazione)
		references nazione(nome),

	primary key (nome, nazione)
);

create table citta (
	nome stringa not null,
	regione stringa not null,
	nazione stringa not null,

	foreign key (regione, nazione)
		references regione(nome, nazione),

	primary key (nome, regione, nazione)
);

create table giocatore (
	nickname stringa primary key, 
	nome stringa not null,
	cognome stringa not null,
	indirizzo indirizzo not null,
	rank intgz not null, 

	-- accorpo gioc_cit
	citta stringa not null,
	regione stringa not null,
	nazione stringa not null,

	foreign key(citta, regione, nazione)
		references citta(nome, regione, nazione)
);

create table regole (
	regole stringa primary key
);

create table torneo (
	nome stringa not null,
	edizione stringa not null,
	descrizione stringa not null,
	id integer primary key
);

create table partita (
	data date not null,
	indirizzo indirizzo not null,
	komi komi not null,
	id integer primary key,

	-- accorpo parc_cit
	citta stringa not null,
	regione stringa not null,
	nazione stringa not null,

	foreign key (citta, regione, nazione)
		references citta(nome, regione, nazione),

	-- accorpo segue 
	regole stringa not null,

	foreign key (regole)
		references regole(regole),

	-- accorpo part_torneo
	torneo integer,
	foreign key (torneo)
		references torneo(id),

	-- accorpo bianco e nero
	bianco stringa not null,
	nero stringa not null,

	foreign key (bianco)
		references giocatore(nickname),

	foreign key (nero)
		references giocatore(nickname),

	-- nickname diverso
	check (bianco <> nero)

);

create table partita_con_rinuncia(
	rinunciatario colore not null,

	-- accorpo pcr_isa_p
	partita integer primary key,
	foreign key (partita)
		references partita(id)
);

create table partita_con_punteggio (
	punteggio_bianco intgez not null,
	punteggio_nero intgez not null,

	-- accorpo pcp_isa_p
	partita integer primary key,
	foreign key (partita)
		references partita(id)
);