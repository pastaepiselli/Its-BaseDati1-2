-- 1. Gli operatori devono
-- poter calcolare l’insieme delle aree verdi fruibili che hanno almeno un soggetto verde
-- della specie 'Pinus pinea' e piantata almeno 5 anni fa

select distinct areaverde.id
from areaverde, soggettoverde
where areaverde.is_fruibile = true
and soggettoverde.area = areaverde.id
and soggettoverde.specie = 'Pinus pinea'
and soggettoverde.data < current_date - interval '5 year'



-- 2. Il management deve poter calcolare, l’insieme delle aree verdi sensibili che non sono state 
-- oggetto di alcun intervento
-- nel periodo '2023-10-9' - '2023-10-13'

select * -- seleziono tutte le aree verdi
from areaverde
where id not in ( -- che non sono nella aree verdi
	select a.id
	from areaverde a, intervento i, interventoassegnato ia
	where i.area = a.id 
		and ia.intervento = i.distinct
		-- con almeno un interento lavori durante questo periodo
		and (i.inizio, ia.fine) overlaps ('2023-10-9', '2023-10-13')
);

-- 3. I dipendenti
-- comunali devono poter ottenere dal sistema gli operatori ai quali è stato assegnato il
-- minor numero di interventi con priorità maggiore o uguale a 5 nell'anno 2023.

with n_int_per_op as (select o.nome, o.cognome, count(*) as n_interventi
	from assegna a, intervento i, operatore o
	where a.interventoassegnato = i.id
	and o.cf = a.operatore
	and i.priorita >= 5
	and extract(year from a.istante) = 2023
	group by o.cf),

with n_min_int as (
	select min(n_interventi) as min
	from n_int_per_op
)

select *
from n_int_per_op t1, n_min_interv t2
where t1.n_interventi = t2.min

-- 4. restituire tutte le aree verdi con almeno 10 soggetti verdi 


select areaverde.id, count(soggettoverde.area)
from areaverde, soggettoverde
where areaverde.id = soggettoverde.area
group by areaverde.id
having count(soggettoverde.area) >= 10;

-- 5. il numero di operatori che sono stati assegnati almeno una volta ad interventi con priorità < 4

select count(distinct assegna.operatore)
from assegna, intervento
where assegna.interventoassegnato = intervento.id
and intervento.priorita < 4

-- 6. la durata prevista media e la durata effettiva media degli interventi completati.

with durata_effettiva_media as 
	(select avg(ia.fine - i.inizio) as durata_media_effettiva
		from intervento i, interventoassegnato ia
		where i.id = ia.id_intervento
			and ia.fine is not null
),
durata_prevista_media as 
	(select avg(i1.durata) as durata_media_prevista
		from intervento i1, interventoassegnato ia1
		where i1.id = ia1.id_intervento
			and ia1.fine is not null)

select durata_media_effettiva, durata_media_prevista 
from durata_prevista_media, durata_effettiva_media



-- 7. gli operatori assegnati all'intervento più lungo


select a.operatore
	from intervento i, interventoassegnato ia, assegna a 
	where i.id = ia.id_intervento
		and ia.fine is not null
		and a.interventoassegnato = i.id
		and ia.fine - i.inizio = (
	select max(ia.fine - i.inizio)
	from intervento i, interventoassegnato ia
	where i.id = ia.id_intervento
	and ia.fine is not null)



-- 8. il numero degli interventi non terminati assegnati
-- aree verdi non sensibili

select count(*)
from intervento i, areaverde av, interventoassegnato ia
where av.is_sensibile = false
and i.area = av.id
and i.id = ia.id_intervento
and ia.fine is null



-- 9. le aree verdi senza nessun soggetto verde.


select count(*)
from areaverde av
where av.id not in (
	select sv.area
	from soggettoverde sv
)


