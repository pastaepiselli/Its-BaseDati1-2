create domain stringa as varchar;

create domain latitudine as real
	check (value >= -90 and value <= 90);

create domain longitudine as real
	check (value >= -180 and value <= 180);

create type esposizione as enum (
	'N', 'S', 'W', 'E');

create domain intgez as integer
	check (value >= 0);

create domain intgz as integer
	check (value > 0);