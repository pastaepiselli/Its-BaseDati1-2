create domain realgez as real 
	check (value >= 0);

create domain string as varchar(100)
	check (value is not null);

create domain civico as integer
	check (value >= 0 and value is not null);

create type indirizzo (
	via string,
	civico civico
);


create table impiegato (
	id integer primary key,
	nome varchar(100) not null,
	cognome varchar(100) not null,
	nascita date not null,
	stipendio realgez
);

create table progetto (
	id integer primary key,
	nome varchar(100),
	budget realgez
);


create table coinvolto (
	impiegato integer not null, 
	progetto integer not null,
	primary key(impiegato, progetto),


	foreign key (impiegato)
		references impiegato(id),
	foreign key (progetto)
		references progetto(id)

);

create table dipartimento (
	id integer primary key,
	nome varchar(100) not null,
	indirizzo indirizzo, -- puo esssere null

	-- v.inclusione dipartimento(id) occorre in num_tel(dipartimento2)

	-- accorpamento direzione
	direzione integer, 
	foreign key (direzione)
		references impiegato(id)

);

create table afferenza (
	impiegato integer not null, 
	dipartimento integer not null,
	primary key (impiegato),

	foreign key (impiegato)
		references impiegato(id),
	foreign key (dipartimento)
		references dipartimento(id)
);


create table numerotelefono (
	telefono varchar(12) primary key
	-- v.inclusione numerotelefono(telefono) occorre in num_tel(telefono)
);


create table num_tel (
	dipartimento integer not null,
	telefono varchar(12) not null,

	foreign key (dipartimento)
		references dipartimento(id),
	foreign key (telefono)
		references numerotelefono(telefono)
);