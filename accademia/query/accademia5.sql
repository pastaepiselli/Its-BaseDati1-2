-- 1. Quali sono il nome, la data di inizio e la data di fine dei WP del progetto di nome
-- ‘Pegasus’ ?

select wp.nome, wp.inizio, wp.fine
from wp, progetto
where progetto.nome = 'Pegasus'
and wp.progetto = progetto.id

-- 2. Quali sono il nome, il cognome e la posizione degli strutturati che hanno almeno
-- una attività nel progetto ‘Pegasus’, ordinati per cognome decrescente?

select persona.nome, persona.cognome, posizione
from persona, attivitaprogetto, progetto
where progetto.nome = 'Pegasus'
and attivitaprogetto.progetto = progetto.id
and persona.id = attivitaprogetto.persona
group by persona.id desc

-- 3. Quali sono il nome, il cognome e la posizione degli strutturati che hanno più di
-- una attività nel progetto ‘Pegasus’ ?




