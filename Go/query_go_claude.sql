-- 1) Quante partite sono state giocate in ogni città?

select citta, regione, nazione, count(id) as numero_partite
from partita
group by citta, regione, nazione

-- 2) Quanti giocatori hanno un rank maggiore o uguale a 5?

select count(*)
from giocatore g
where g.rank >= 5

-- 3) Quante partite sono state giocate con ogni insieme di regole?

select regole, count(*)
from partita
group by regole

-- 4) Qual è la media, il massimo e il minimo dei punteggi del bianco?

select avg(punteggio_bianco), max(punteggio_bianco), min(punteggio_bianco)
from partita_con_punteggio 


-- 5) Quali sono le medie, i massimi e i minimi dei punteggi per ogni giocatore?
   nickname    |  nome   | cognome | media_punteggio | minimo_punteggio | massimo_punteggio 
---------------+---------+---------+-----------------+------------------+-------------------
 SamuraiGo     | Takeshi | Yamamoto|           110.0 |               88 |               120
 CloudPlayer   | Wei     | Chen    |           106.0 |               98 |               110
 WhitePhoenix  | Marco   | Ricci   |            88.5 |               82 |                95
 ZenMaster     | Kenji   | Tanaka  |            88.0 |               75 |               100
 MoonStone     | Jin     | Park    |            87.5 |               85 |                90
 DragonKing    | Mario   | Rossi   |            85.0 |               76 |                92
 GoNinja       | Giulia  | Verdi   |            81.5 |               75 |                88
 StoneMaster   | Luca    | Bianchi |            81.5 |               78 |                85
 RiverFlow     | Sara    | Colombo |            80.0 |               70 |                90
 OceanWave     | Lisa    | Romano  |            70.0 |               70 |                70
(10 rows)

-- non abbiamo le competenze per questo

-- 6) Qual è il numero totale di partite giocate da ogni giocatore?

select g.nickname, g.nome, g.cognome, count(p.id)
from partita p, giocatore g
where (g.nickname = p.bianco or g.nickname = p.nero)
group by g.nickname, g.nome, g.cognome

-- 7) Qual è la media, il massimo e il minimo dei rank dei giocatori italiani?

select avg(g.rank), max(g.rank), min(g.rank)
from giocatore g
where nazione = 'Italia'

-- 8) Quali sono le medie, i massimi e i minimi dei rank per ogni nazione?

select nazione, avg(g.rank), max(g.rank), min(g.rank)
from giocatore g
group by nazione 

-- 9) Quante partite ha giocato 'Mario Rossi' (DragonKing) in ogni torneo?

select t.nome, t.edizione, count(*)
from partita p, giocatore g, torneo t
where (g.nickname = p.bianco or g.nickname = p.nero)
and g.nome = 'Mario'
and g.cognome = 'Rossi'
and t.id = p.torneo
group by t.id

-- 10) Quali sono i tornei in cui hanno giocato più di 2 partite?

select t.id, t.nome, count(*)
from partita p, torneo t
where p.torneo  = t.id
group by t.id
having count(*) > 2


-- 11) Quali sono i giocatori con rank >= 5 che hanno giocato in più di un torneo?

select g.nickname, g.nome, g.cognome, g.rank, count(distinct p.torneo)
from partita p, giocatore g
where g.rank >= 5
and (g.nickname = p.bianco or g.nickname = p.nero)
and p.torneo is not null
group by g.nickname
having count (distinct p.torneo) > 1

-- 12) Qual è il numero di vittorie per rinuncia di ogni giocatore?

select g.nickname, g.nome, g.cognome, count(*)
from partita_con_rinuncia pcr, partita p, giocatore g
where pcr.partita = p.id
and ((g.nickname = p.bianco and pcr.rinunciatario = 'Nero') or 
	(g.nickname = p.nero and pcr.rinunciatario = 'Bianco'))
group by g.nickname
