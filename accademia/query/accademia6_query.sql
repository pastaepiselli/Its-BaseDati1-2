-- 1. Quanti sono gli strutturati di ogni fascia?

select posizione, count(*) -- per ogni gruppo conto le ennuple
from persona -- seleziono la persona
group by posizione -- gruppo per la posizione

-- 2. Quanti sono gli strutturati con stipendio ≥ 40000?

select count(*) -- conto le righe
from persona -- seleziono persona
where stipendio >= 40000 -- con stipendio >= 40000

-- 3. Quanti sono i progetti già finiti che superano il budget di 50000?

select count (*) -- li conto
from progetto -- seleziono progetti
where fine < current_date -- con fine < di adesso (finiti)
and budget > 50000 -- budget che supera 50000

-- 4. Qual è la media, il massimo e il minimo delle ore delle attività relative al progetto
-- ‘Pegasus’ ?

select avg(oredurata), max(oredurata), min(oredurata)
from attivitaprogetto, progetto
where progetto.nome = 'Pegasus'
and attivitaprogetto.progetto = progetto.id

-- 5. Quali sono le medie, i massimi e i minimi delle ore giornaliere dedicate al progetto
-- ‘Pegasus’ da ogni singolo docente?

select persona.nome, persona.cognome, round(avg(oredurata), 2), max(oredurata), min(oredurata)
from persona, progetto, attivitaprogetto
where progetto.nome = 'Pegasus'
and attivitaprogetto.persona = persona.id
group by persona.id

-- 6. Qual è il numero totale di ore dedicate alla didattica da ogni docente?

select p.nome, p.cognome, sum(oredurata)
from attivitanonprogettuale anp, persona p
where anp.tipo = 'Didattica'
and anp.persona = p.id
group by p.id

-- 7. Qual è la media, il massimo e il minimo degli stipendi dei ricercatori?

select avg(stipendio), min(stipendio), max(stipendio)
from persona
where posizione = 'Ricercatore'

-- 8. Quali sono le medie, i massimi e i minimi degli stipendi dei ricercatori, dei professori
-- associati e dei professori ordinari?

select posizione, avg(stipendio), max(stipendio), min(stipendio)
from persona
group by posizione

-- 9. Quante ore ‘Ginevra Riva’ ha dedicato ad ogni progetto nel quale ha lavorato?

select ap.progetto, sum(oredurata)
from persona p, attivitaprogetto ap
where p.nome = 'Ginevra'
and p.cognome = 'Riva'
and ap.persona = p.id
group by ap.progetto

-- 10. Qual è il nome dei progetti su cui lavorano più di due strutturati?

select distinct(p.nome)
from progetto p, attivitaprogetto ap1, attivitaprogetto ap2
where ap1.progetto = p.id
and ap2.progetto = p.id
and ap1.persona != ap2.persona

-- 11. Quali sono i professori associati che hanno lavorato su più di un progetto?

select distinct p.nome, p.cognome
from persona p, attivitaprogetto ap1, attivitaprogetto ap2
where p.posizione = 'Professore Associato'
and ap1.progetto != ap2.progetto
and ap1.persona = p.id
and ap2.persona = p.id