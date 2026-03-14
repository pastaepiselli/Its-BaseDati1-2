-- 1. Quanti Work Package (WP) sono stati definiti per ogni progetto? 
-- (Si richiede il nome del progetto e il numero di WP).

select p.nome, count(*)
from wp, progetto p
where p.id = wp.progetto
group by p.id

-- 2. Qual è lo stipendio medio dei Professori Ordinari?.

select avg(stipendio)
from persona
where posizione = 'Professore Ordinario'

-- 3. Qual è il budget totale di tutti i progetti che sono iniziati dopo il 1° gennaio 2020?.

select sum(budget) as budget_totale
from progetto
where inizio > '2020-01-01'

-- 4. Quante ore totali di attività non progettuale di tipo 'Ricerca' ha svolto ogni singola persona? 
-- (Si richiede id, nome, cognome e somma delle ore).

select p.id, p.nome, sum(oredurata) as oretotali
from persona p, attivitanonprogettuale anp
where anp.persona = p.id
and anp.tipo = 'Ricerca'
group by p.id

-- 5. Quali sono i nomi dei progetti che hanno un budget complessivo superiore a 100.000?.

select nome
from progetto
where budget > 100000

-- 6. Qual è il numero totale di ore dedicate ad attività di progetto da ogni Ricercatore? 
-- (Si richiede id, nome, cognome e totale ore).

select p.id, p.nome, p.cognome, sum(oredurata) as totaleore
from persona p, attivitaprogetto ap
where p.id = ap.persona
and p.posizione = 'Ricercatore'
group by p.id

-- 7. Quante assenze per 'Malattia' ha effettuato ogni dipendente? 
-- (Si richiede nome, cognome e numero di assenze).

select p.id, p.nome, p.cognome, count(*) as numero_assenze
from assenza a, persona p
where a.persona = p.id
and a.tipo = 'Malattia'
group by p.id

-- 8. Qual è la durata media, massima e minima delle singole attività di progetto svolte nel Work Package 'Management' del progetto 'Pegasus'?.

select avg(oredurata), max(oredurata), min(oredurata)
from attivitaprogetto ap, wp, progetto p
where p.nome = 'Pegasus'
and wp.nome = 'Management'
and wp.id = ap.wp
and ap.progetto = p.id
and ap.progetto = wp.progetto

-- 9. Quali sono i dipendenti (id, nome, cognome) che hanno lavorato su più di tre Work Package (WP) distinti?.

select p.id, p.nome, p.cognome
from persona p, attivitaprogetto ap, wp
where p.id = ap.persona
and ap.wp = wp.id
and wp.progetto = ap.progetto
group by p.id
having count(distinct wp.id) > 3

-- 10. Per ogni posizione (Ricercatore, Associato, Ordinario), qual è lo stipendio massimo e minimo percepito?.

select posizione, avg(stipendio), min(stipendio), max(stipendio)
from persona
group by posizione

-- 11. Quali sono i nomi dei progetti che coinvolgono più di cinque persone diverse?.

select p.nome
from progetto p, attivitaprogetto ap
where p.id = ap.progetto
group by p.id
having count(distinct ap.persona) > 5

-- 12. Qual è il numero totale di ore di 'Didattica' svolte dai Professori Associati che hanno uno stipendio superiore a 35.000?.

select sum(oredurata)
from persona p, attivitanonprogettuale anp
where p.stipendio > 35000
and p.id = anp.persona
and p.posizione = 'Professore Associato'
and anp.tipo = 'Didattica'

