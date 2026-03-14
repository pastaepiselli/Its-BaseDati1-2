-- 1. Elencare tutti i progetti la cui fine è successiva al
-- 2023-12-31. [2 punti]

select *
from progetto
where fine > '2023-12-31'

-- 2. Contare il numero totale di persone per ciascuna posizione
-- (Ricercatore, Professore Associato, Professore Ordinario).
-- [3 punti]

select posizione, count(*)
from persona
group by posizione


-- 3.RestituireRestituire gli id e i nomi delle persone che hanno almeno
-- un giorno di assenza per "Malattia". [2 punti]

select distinct persona.id, persona.nome
from persona, assenza
where assenza.id = persona.id 
and assenza.tipo = 'Malattia'

-- 4. Per ogni tipo di assenza, restituire il numero complessivo
-- di occorrenze. [3 punti]

select tipo, count(*)
from assenza
group by tipo

-- 5. Calcolare lo stipendio massimo tra tutti i "Professori
-- Ordinari". [2 punti]

select max(stipendio)
from persona
where posizione = 'Professore Ordinario'

-- 6. Quali sono le attività e le ore spese dalla persona con id 1
-- nelle attività del progetto con id 4, ordinate in ordine
-- decrescente. Per ogni attività, restituire l’id, il tipo e il
-- numero di ore. [3 punti]

select attivitaprogetto.id, attivitaprogetto.tipo, attivitaprogetto.oredurata
from attivitaprogetto
where attivitaprogetto.persona = 1
and attivitaprogetto.progetto = 4
order by attivitaprogetto.oredurata desc


-- 7. Quanti sono i giorni di assenza per tipo e per persona. Per
-- ogni persona e tipo di assenza, restituire nome, cognome,
-- tipo assenza e giorni totali. [4 punti]

select persona.nome, persona.cognome, assenza.tipo, count(assenza.tipo) as giorni_totali
from persona, assenza
where persona.id = assenza.persona
group by assenza.tipo, persona.id

-- 8. Restituire tutti i “Professori Ordinari” che hanno lo
-- stipendio massimo. Per ognuno, restituire id, nome e
-- cognome [4 punti]

select persona.id, persona.nome, persona.cognome
from persona
where persona.posizione = 'Professore Ordinario'
and persona.stipendio = (
select max(stipendio) from persona where persona.posizione= 'Professore Ordinario'
)

-- oppure

with max_stipendio_table as (
	select max(stipendio) as max_stipendio
	from persona
		where posizione = 'Professore Ordinario')

select p.id, p.nome, p.cognome
from persona p, max_stipendio_table
where p.stipendio = max_stipendio_table.max_stipendio
and p.posizione = 'Professore Ordinario'

-- 9. Restituire la somma totale delle ore relative alle attività
-- progettuali svolte dalla persona con id = 3 e con durata
-- minore o uguale a 3 ore. [3 punti]

select sum(attivitaprogetto.oredurata)
from attivitaprogetto
where attivitaprogetto.persona = 3
and attivitaprogetto.oredurata <= 3

-- 10. Restituire gli id e i nomi delle persone che non hanno
-- mai avuto assenze di tipo "Chiusura Universitaria" [4
-- punti]

select * -- tutte le persone 
from persona p 
where p.id not in ( # il quale id NON E
	select a.persona
	from assenza a # nella tabella delle persone che hanno fatto chiusura universitaria
	where a.tipo = 'Chiusura Universitaria')


-- oppure meno efficiente

select p.id, p.nome, p.cognome
from persona p

except

select p.id, p.nome, p.cognome
from persona p, assenza a
where p.id = a.persona
and a.tipo = 'Chiusura Universitaria'

