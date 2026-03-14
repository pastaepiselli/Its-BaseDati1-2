-- 1. Quante sono le compagnie che operano (sia in arrivo che in partenza) nei diversi
-- aeroporti?

select a.codice, a.nome, count(distinct comp) 
from arrpart ap, aeroporto a
where ap.arrivo = a.codice
or ap.partenza = a.codice
group by a.codice, a.nome

-- 2. Quanti sono i voli che partono dall’aeroporto ‘HTR’ e hanno una durata di almeno
-- 100 minuti?

select count (v.codice)
from arrpart ap, volo v
where ap.partenza = 'HTR'
and ap.codice = v.codice
and v.durataminuti >= 100

-- 3. Quanti sono gli aeroporti sui quali opera la compagnia ‘Apitalia’, per ogni nazione
-- nella quale opera?

select la.nazione, count (distinct la.aeroporto)
from luogoaeroporto la, arrpart a
where la.aeroporto = a.partenza
and a.comp = 'Apitalia'
group by la.nazione

-- 4. Qual è la media, il massimo e il minimo della durata dei voli effettuati dalla
-- compagnia ‘MagicFly’ ?

select avg(durataminuti) as media, max(durataminuti) as massimo, min(durataminuti) as minimo
from volo v
where v.comp = 'MagicFly'

-- 5. Qual è l’anno di fondazione della compagnia più vecchia che opera in ognuno degli
-- aeroporti?

select a.codice, a.nome, min(c.annofondaz)
from compagnia c, arrpart ap, aeroporto a
where c.nome = ap.comp
and ap.partenza = a.codice 
group by a.codice

-- 6. Quante sono le nazioni (diverse) raggiungibili da ogni nazione tramite uno o più
-- voli?

select la1.nazione, count (distinct la2.nazione)
from luogoaeroporto la1, luogoaeroporto la2, arrpart ap
where la1.aeroporto = ap.partenza
and la2.aeroporto = ap.arrivo
and la1.nazione <> la2.nazione
group by la1.nazione

-- 7. Qual è la durata media dei voli che partono da ognuno degli aeroporti?

select a.codice, a.nome, avg(durataminuti)
from volo v, arrpart ap, aeroporto a
where v.codice = ap.codice
and a.codice = ap.partenza
group by a.codice

-- 8. Qual è la durata complessiva dei voli operati da ognuna delle compagnie fondate
-- a partire dal 1950?

select v.comp, sum(v.durataminuti)
from volo v, compagnia c
where v.comp = c.nome
and c.annofondaz >= 1950
group by v.comp

-- 9. Quali sono gli aeroporti nei quali operano esattamente due compagnie?


select a.codice, a.nome
from aeroporto a, arrpart ap
where a.codice = ap.partenza
or a.codice= ap.arrivo
group by a.codice, a.nome
having count(distinct ap.comp) = 2 

-- 10. Quali sono le città con almeno due aeroporti?

select citta
from luogoaeroporto
group by citta
having count(aeroporto) >=  2

-- 11. Qual è il nome delle compagnie i cui voli hanno una durata media maggiore di 6
-- ore?

select comp
from volo
group by comp
having avg(durataminuti) > 360

-- 12. Qual è il nome delle compagnie i cui voli hanno tutti una durata maggiore di 100
-- minuti?

select comp
from volo
group by comp
having comp not in (
	select comp
	from volo
	where durataminuti < 100
)
