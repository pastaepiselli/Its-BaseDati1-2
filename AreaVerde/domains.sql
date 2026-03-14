create domain stringa as varchar(100);

create domain latitudine as real
	check (value >= -90 and value <= 90);

create domain longitudine as real
	check (value >= -180 and value <= 180);

create domain intgz as int
	check (value > 0);

create domain priorita as integer
	check (value >= 1 and value <= 10);

create domain CF as varchar(16)
	check(value ~ '^[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z0-9]{4}');