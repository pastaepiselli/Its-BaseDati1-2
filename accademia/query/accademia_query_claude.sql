-- 1) Qual è il budget totale, medio, minimo e massimo dei progetti finiti prima del 2010?

select sum(budget) as totale, avg(budget) as media, min(budget) as minimo, max(budget) as massimo
from progetto
where extract(year from fine) < 2010

-- 2) Quanti sono i docenti (professori associati e ordinari) che hanno dedicato più di 5 ore complessive ad attività non progettuali?

select p.id
from attivitanonprogettuale anp, persona p
where (p.posizione = 'Professore Associato' 
or  p.posizione = 'Professore Ordinario')
and anp.persona = p.id
group by p.id
having sum(oredurata) > 5


-- 3) Quali sono i nomi delle persone che hanno lavorato su più di un WP del progetto 'Simap', e quanti WP distinti hanno gestito ciascuno?

select p.id, p.nome, p.cognome
from persona p, attivitaprogetto ap, progetto pr
where pr.nome = 'Simap'
and ap.progetto = pr.id
and ap.persona = p.id
group by p.id
having count(distinct ap.wp) > 1


-- 4) Qual è il numero totale di giorni di assenza per ogni tipo di causa?

select tipo, count(giorno) as numero_assenze
from assenza
group by tipo

-- 5) Quali sono gli strutturati che hanno uno stipendio superiore alla media della loro fascia?

select p1.id, p1.nome, p1.cognome, p1.stipendio, p1.posizione
from persona p1
where p1.stipendio > (
	select avg(p2.stipendio)
	from persona p2
	where p1.posizione = p2.posizione
)

order by p1.posizione desc