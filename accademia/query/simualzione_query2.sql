-- 1. Quali sono le persone con stipendio di al massimo 40000
-- euro [2 punti]

select nome, cognome
from persona
where stipendio <= 40000

-- 2. Quali sono i ricercatori che lavorano ad almeno un
-- progetto e hanno uno stipendio di al massimo 40000 [2
-- punti]

select persona.nome, persona.cognome
from persona, attivitaprogetto
where persona.id = attivitaprogetto.persona
and persona.posizione = 'Ricercatore'
and persona.stipendio <= 40000
group by persona.id

-- 3. Qual è il budget totale dei progetti nel db [2 punti]

select sum(progetto.budget) as budget_totale_progetti
from progetto

-- 4. Qual è il budget totale dei progetti a cui lavora ogni
-- persona. Per ogni persona restituire nome, cognome e
-- budget totale dei progetti nei quali è coinvolto. [3 punti]

select persona.nome, persona.cognome, sum(progetto.budget)
from persona, progetto, attivitaprogetto
where persona.id = attivitaprogetto.persona
and attivitaprogetto.progetto = progetto.id
group by persona.id

-- 5. Qual è il numero di progetti a cui partecipa ogni
-- professore ordinario. Per ogni professore ordinario,
-- restituire nome, cognome, numero di progetti nei quali è
-- coinvolto [3 punti]

select persona.nome, persona.cognome, count(distinct progetto.id)
from persona, attivitaprogetto, progetto
where persona.posizione = 'Professore Ordinario'
and persona.id = attivitaprogetto.persona
and attivitaprogetto.progetto = progetto.id
group by persona.id

-- 6. Qual è il numero di assenze per malattia di ogni
-- professore associato. Per ogni professore associato,
-- restituire nume, cognome e numero di assenze per
-- malattia [3 punti]

select nome, cognome, count(*)
from persona, assenza
where persona.posizione = 'Professore Associato'
and persona.id = assenza.persona
and assenza.tipo = 'Malattia'
group by persona.id

-- 7. Qual è il numero totale di ore, per ogni persona, dedicate
-- al progetto con id ‘5’. Per ogni persona che lavora al
-- progetto, restituire nome, cognome e numero di ore totali
-- dedicate ad attività progettuali relative al progetto [4
-- punti]

select nome, cognome, sum(attivitaprogetto.oredurata) as ore_totali
from persona, attivitaprogetto
where attivitaprogetto.progetto = 5
and persona.id = attivitaprogetto.persona
group by persona.id 

-- 8. Qual è il numero medio di ore delle attività progettuali
-- svolte da ogni persona. Per ogni persona, restituire nome,
-- cognome e numero medio di ore delle sue attività
-- progettuali (in qualsivoglia progetto) [3 punti]

select nome, cognome, round(avg(attivitaprogetto.oredurata), 1) as numero_medio_ore
from persona, attivitaprogetto
where persona.id = attivitaprogetto.persona
group by persona.id

-- 9. Qual è il numero totale di ore, per ogni persona, dedicate
-- alla didattica. Per ogni persona che ha svolto attività
-- didattica, restituire nome, cognome e numero di ore totali
-- dedicate alla didattica [4 punti]

select nome, cognome, sum(attivitanonprogettuale.oredurata)
from attivitanonprogettuale, persona
where attivitanonprogettuale.tipo = 'Didattica'
and persona.id = attivitanonprogettuale.persona
group by persona.id

-- 10. Quali sono le persone che hanno svolto attività nel WP
-- di id ‘5’ del progetto con id ‘3’. Per ogni persona, restituire
-- il numero totale di ore svolte in attività progettuali per il
-- WP in questione [4 punti]

select nome, cognome, sum(oredurata)
from attivitaprogetto, persona
where attivitaprogetto.wp = 5
and attivitaprogetto.progetto = 3
and attivitaprogetto.persona = persona.id
group by persona.id