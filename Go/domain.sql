create domain stringa as varchar(100);

create domain intgz as integer
	check (value > 0);

create domain komi as real
	check (value between 0 and 10);

create type colore as enum (
	'Bianco', 'Nero'
);

create type intgez as integer 
	check (value >= 0);

create domain via as varchar
	check (value is not null);

create domain civico as varchar
	check (value is not null);

create type indirizzo (
	via via,
	civico civico
);



