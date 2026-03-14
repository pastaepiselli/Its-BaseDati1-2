create domain IntGEZ as integer
        check (value >= 0);
        
create domain IntGZ as integer
        check (value > 0);

create domain RealGEZ as real
        check (value >= 0);

create domain Stringa as varchar;

create domain CAP as char(5)
        check (value ~ '[0-9]{5}');

create type Indirizzo as (
        via Stringa,
        cap CAP,
        civico Stringa
);



create table impiegato(
    id serial primary key,
    nome stringa not null,
    cognome stringa not null,
    nascita date not null,
    stipendio RealGEZ not null,
    
    -- accorpo 'afferenza'
    dipartimento_aff integer,
    -- foreign key verso dipartimento posticipata
    data_afferenza date,

    check (
        (dipartimento_aff is null) =
        (data_afferenza is null)
        )
);

create table dipartimento(
    id serial primary key,
    nome stringa not null,
    indirizzo indirizzo,
    -- v. incl (id) 
    --   appare in dip_tel(dipartimento)

    -- accorpo 'direzione'
    direttore integer not null,
    foreign key (direttore)
        references impiegato(id)
);

alter table impiegato
    add foreign key (dipartimento_aff)
        references dipartimento(id);


create table telefono(
    telefono Stringa primary key
    -- v. incl (telefono)
    --  appare in dip_tel(telefono)
);

create table dip_tel (
    dipartimento integer not null,
    telefono stringa not null,
    primary key (dipartimento, telefono),
    foreign key (dipartimento)
        references dipartimento(id),
    foreign key (telefono)
        references telefono(telefono)
);


create table progetto(
    id serial primary key,
    nome stringa not null,
    budget RealGEZ not null
);


create table coinvolto (
    impiegato integer not null,
    progetto integer not null,

    primary key (impiegato, progetto),

    foreign key (impiegato)
        references impiegato(id),
    foreign key (progetto)
        references progetto(id)
);