-- 1) Quante vie ci sono in ogni falesia?
      falesia      | numero_vie 
select f.nome, count(*)
from falesia f , via v, settore s
where f.nome = s.falesia
    and v.settore = s.id_settore
group by f.nome

-- 2) Quante vie hanno difficoltà maggiore o uguale a 7a?
select count(*)
from via
where via.grado >= '7a'

-- 3) Quante falesie hanno più di 2 settori?
with a as (select falesia, count(*)
from settore
group by falesia
having count(*) > 2)

select count(*)
from a;

-- oppure

select count(*)
from (select count(*)
    from settore
    group by falesia
    having count(id_settore) > 2)

-- 4) Qual è la media, il massimo e il minimo della lunghezza 
--    delle vie della falesia 'Arco'?
select avg(v.lunghezza), max(v.lunghezza), min(v.lunghezza)
from via v, settore s, falesia f
where f.nome = 'Arco'
and v.settore = s.id_settore
and s.falesia = f.nome

-- 5) Quali sono le medie, i massimi e i minimi della lunghezza 
--    delle vie per ogni singola falesia?
      falesia      |       media        | minimo | massimo 
-------------------+--------------------+--------+---------
 Kalymnos          |               44.0 |     38 |      50
 Margalef          | 36.500000000000000 |     28 |      45
 Arco              | 26.666666666666668 |     20 |      35
 Finale Ligure     |             26.250 |     18 |      32
 Fontainebleau     |                5.5 |      5 |       6
(5 rows)

-- 6) Qual è il numero totale di salite effettuate da ogni arrampicatore?
    username     | totale_salite 
-----------------+---------------
 giulia.bianchi  |             4
 anna.neri       |             2
 mario.rossi     |             2
 sara.ferrari    |             2
 elena.greco     |             2
 davide.marino   |             2
 chiara.lombardi |             2
 martina.ricci   |             2
 alessandro.romano |           2
 francesca.gallo |             2
 simone.bruno    |             2
 luca.verdi      |             1
(12 rows)

-- 7) Qual è la media, il massimo e il minimo del numero di split 
--    delle vie chiodate da 'Mario Rossi'?
       media        | minimo | massimo 
--------------------+--------+---------
 11.000000000000000 |     10 |      12
(1 row)

-- 8) Quali sono le medie, i massimi e i minimi del numero di split 
--    delle vie per ogni chiodatore?
    persona     |  nome   | cognome |       media        | minimo | massimo 
----------------+---------+---------+--------------------+--------+---------
 luca.verdi     | Luca    | Verdi   | 18.500000000000000 |     15 |      20
 federico.costa | Federico| Costa   | 12.250000000000000 |      1 |      18
 paolo.russo    | Paolo   | Russo   | 13.500000000000000 |      9 |      22
 marco.conti    | Marco   | Conti   |               8.25 |      1 |      14
 mario.rossi    | Mario   | Rossi   | 11.000000000000000 |     10 |      12
(5 rows)

-- 9) Quante salite ha effettuato 'giulia.bianchi' in ogni falesia?
 falesia | numero_salite 
---------+---------------
 Arco    |             4
(1 row)

-- 10) Quali sono le vie su cui hanno arrampicato più di 3 persone?
 id |     via      | numero_arrampicatori 
----+--------------+----------------------
  1 | Diedro Rosso |                    4
(1 row)

-- 11) Quali sono gli arrampicatori che hanno effettuato 
--     salite in più di una falesia?
    username    | numero_falesie 
----------------+----------------
 mario.rossi    |              2
(1 row)

-- 12) Qual è il numero totale di tentativi per ogni salita ripetuta?
 salita |           via            | numero_tentativi 
--------+--------------------------+------------------
      2 | La Scala                 |                3
     25 | Odyssey Direct           |                3
      5 | Colori del Vento         |                2
      9 | Il Falsario              |                2
     18 | Zebra Dance              |                2
     28 | La Marie Rose            |                2
     11 | La Scala                 |                1
     12 | Il Falsario              |                1
     14 | El Delfin                |                3
     15 | Mora Mora                |                1
     20 | La Scala                 |                1
     22 | Nuova Dimensione         |                1
     23 | La Finestra sul Cielo    |                1
     24 | Rambla del Oso           |                1
     26 | Grande Caverna           |                1
     30 | La Scala                 |                1
(16 rows)

-- 13) Quali arrampicatori hanno effettuato più salite flash?
       username       | numero_flash 
----------------------+--------------
 giulia.bianchi       |            2
 anna.neri            |            1
 elena.greco          |            1
 davide.marino        |            1
 chiara.lombardi      |            1
 mario.rossi          |            1
 sara.ferrari         |            1
 francesca.gallo      |            1
(8 rows)

-- 14) Qual è la distribuzione delle salite per tipo 
--     (flash, avista, ripetuta, non classificate)?
   tipo_salita    | numero 
------------------+--------
 Flash            |      9
 Avista           |      5
 Ripetuta         |     16
 Non classificata |      0
(4 rows)

-- 15) Quali chiodatori hanno aperto vie in più di un settore?
    persona     |   nome   | cognome | numero_settori 
----------------+----------+---------+----------------
 luca.verdi     | Luca     | Verdi   |              2
 mario.rossi    | Mario    | Rossi   |              2
 paolo.russo    | Paolo    | Russo   |              3
 marco.conti    | Marco    | Conti   |              3
 federico.costa | Federico | Costa   |              3
(5 rows)