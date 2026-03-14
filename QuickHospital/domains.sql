create domain stringa as varchar;

create domain email as varchar(255)
	check (VALUE ~ '^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,}$');

create domain telefono as varchar(15)
	check (value ~ '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');

create domain int1_8 as integer
	check (value >= 1 and value <= 8);

create domain via as varchar
	check (value is not null);

create domain civico as varchar
	check (value is not null);

create type indirizzo (
	via via,
	civico civico
);
