-- 1) Elencare tutti i WP del progetto con id "1" e iniziati prima del 2026-01-01
-- Per ognuno restituire nome e id.

select wp.nome, wp.cognome
from wp
where wp.progetto = 1
and wp.inzio > '2026-01-01'

-- 2) Restituire gli id, i nomi e i cognomi delle persone che hanno almeno un'assenza di tipo 'Malattia'.

select p.id, p.nome, p.cognome
from persona p, assenza a
where p.id = a.persona
and a.tipo = 'Malattia'
group by p.id

-- 3) Restituire il budget minimo dei progetti terminati prima del 2025-12-12.

select min(budget)
from progetto
where fine < '2025-12-12'

-- 4) Calcolare il numero di WP che hanno un'attivita progettuale di tipo 'Dimostrazione'.
select count(distinct wp)
from attivitaprogetto
where tipo = 'Dimostrazione';

-- 5) Elencare le attivita non progettuali durate meno di tre ore, svolte da persone con uno stipendio superiore a 50000soldi
-- in un WP chiamato 'WP1'. Per ogni attivita, restituire id, tipo e durata. Le attivita risultanti devono essere ordinate in 
-- ordine crescente per durata.

select anp.id, anp.tipo, anp.oredurata
from attivitanonprogettuale anp, persona p, wp, attivitaprogetto ap
where anp.persona = p.id
and p.stipendio > 50000
and anp.oredurata < 3
and wp.nome = 'WP1'
and ap.progetto = wp.progetto
and ap.persona = p.id
and ap.wp = wp.id
order by anp.oredurata asc

-- 6) calcolare il numero di attivita progettuali in ognuno dei progetti. Per ogni progetto
-- restituire l'id, il nome, e il numero di attivita che ne fanno parte.

select p.id, p.nome, count (ap.id)
from attivitaprogetto ap, progetto p
where ap.progetto = p.id
group by p.id

-- 7) elencare i wp che hanno almeno 2 attivita. Per wp, restituire il nome, l'inizio e la fine.

select wp.id, wp.nome, wp.inizio, wp.fine
from wp, attivitaprogetto ap
where wp.progetto = ap.progetto
and ap.wp = wp.id
group by wp.id, wp.nome, wp.inizio, wp.fine
having count(ap.id) >= 3

-- 8) restiturie i nomi e i cognomi delle persone che hanno avuto assenze in giorni in cui avevano
-- anche attivita non progettuali. Elencare tali persone in ordine alfabefico per cognome.

select p.nome, p.cognome
from assenza a, attivitanonprogettuale anp, persona p
where a.persona = anp.persona
and a.giorno = anp.giorno
and p.id = a.persona
order by p.cognome asc

-- 9) elencare le persone che hanno partecipato ad attivita progettuali per un numero totale di ore
-- superiore a 25.

select p.nome, p.cognome, sum(ap.oredurata) as totale_ore
from attivitaprogetto ap, persona p
where p.id = ap.persona
group by p.id, p.nome, p.cognome
having sum(ap.oredurata) > 25

-- 10) restituire l'id e i nome dei wp che non hanno alcuna attivita iniziata prima del '2025-12-01'
select *select wp.id, wp.nome
from wp
where not exists (
	select wp.id
	from attivitaprogetto ap
	where ap.wp = wp.id
	and ap.progetto = wp.progetto
	and ap.giorno < '2025-12-01'
)




