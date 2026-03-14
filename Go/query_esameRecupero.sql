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

-- continuare con il popa



