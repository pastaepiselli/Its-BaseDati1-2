-- ============================================
-- INSERIMENTO DATI PER DATABASE ARRAMPICATA
-- Schema aggiornato (chiodatore senza nome/cognome, arrampicatore con nome/cognome)
-- ============================================

-- PERSONE
INSERT INTO persona (username) VALUES
('mario.rossi'),
('luca.verdi'),
('giulia.bianchi'),
('anna.neri'),
('paolo.russo'),
('sara.ferrari'),
('marco.conti'),
('elena.greco'),
('davide.marino'),
('chiara.lombardi'),
('federico.costa'),
('martina.ricci'),
('alessandro.romano'),
('francesca.gallo'),
('simone.bruno');

-- CHIODATORI (solo username)
INSERT INTO chiodatore (persona) VALUES
('mario.rossi'),
('luca.verdi'),
('paolo.russo'),
('marco.conti'),
('federico.costa');

-- ARRAMPICATORI (con nome e cognome)
INSERT INTO arrampicatore (persona, nome, cognome) VALUES
('giulia.bianchi', 'Giulia', 'Bianchi'),
('anna.neri', 'Anna', 'Neri'),
('sara.ferrari', 'Sara', 'Ferrari'),
('elena.greco', 'Elena', 'Greco'),
('davide.marino', 'Davide', 'Marino'),
('chiara.lombardi', 'Chiara', 'Lombardi'),
('martina.ricci', 'Martina', 'Ricci'),
('alessandro.romano', 'Alessandro', 'Romano'),
('francesca.gallo', 'Francesca', 'Gallo'),
('simone.bruno', 'Simone', 'Bruno'),
('mario.rossi', 'Mario', 'Rossi'),
('luca.verdi', 'Luca', 'Verdi');

-- GRADI
INSERT INTO grado (nome, valore) VALUES
('4a', 1),
('4b', 2),
('4c', 3),
('5a', 4),
('5b', 5),
('5c', 6),
('6a', 7),
('6a+', 8),
('6b', 9),
('6b+', 10),
('6c', 11),
('6c+', 12),
('7a', 13),
('7a+', 14),
('7b', 15),
('7b+', 16),
('7c', 17),
('7c+', 18),
('8a', 19),
('8a+', 20);

-- FALESIE
INSERT INTO falesia (nome, latitudine, longitudine) VALUES
('Arco', 45.9188, 10.8858),
('Finale Ligure', 44.1697, 8.3436),
('Margalef', 41.2436, 0.7789),
('Kalymnos', 36.9500, 26.9833),
('Fontainebleau', 48.4040, 2.6996);

-- SETTORI
INSERT INTO settore (id_settore, nome, esposizione, falesia) VALUES
(1, 'Spiaggia delle Lucertole', 'S', 'Arco'),
(2, 'Colodri', 'W', 'Arco'),
(3, 'Placche Zebrate', 'E', 'Arco'),
(4, 'Settore Centrale', 'S', 'Finale Ligure'),
(5, 'Grotta dei Falsari', 'N', 'Finale Ligure'),
(6, 'Sector Lluís', 'W', 'Margalef'),
(7, 'Sector Finestra', 'S', 'Margalef'),
(8, 'Grande Grotta', 'W', 'Kalymnos'),
(9, 'Odyssey', 'S', 'Kalymnos'),
(10, 'Bas Cuvier', 'E', 'Fontainebleau');

-- VIE
INSERT INTO via (id, nome, lunghezza, n_split, settore, grado, chiodatore) VALUES
(1, 'Diedro Rosso', 25, 10, 1, '6b', 'mario.rossi'),
(2, 'La Scala', 30, 12, 1, '7a', 'mario.rossi'),
(3, 'Primo Sole', 20, 8, 2, '6a', 'luca.verdi'),
(4, 'Colori del Vento', 35, 15, 2, '7b+', 'luca.verdi'),
(5, 'Zebra Dance', 28, 11, 3, '6c+', 'paolo.russo'),
(6, 'Via del Guerriero', 22, 9, 3, '6a+', 'paolo.russo'),
(7, 'Berta Filava', 18, 7, 4, '5c', 'marco.conti'),
(8, 'Nuova Dimensione', 32, 14, 4, '7c', 'marco.conti'),
(9, 'Il Falsario', 25, 10, 5, '7a+', 'marco.conti'),
(10, 'Grotta Oscura', 30, 13, 5, '6b+', 'federico.costa'),
(11, 'El Delfin', 40, 18, 6, '8a', 'federico.costa'),
(12, 'Mora Mora', 35, 16, 6, '7b', 'federico.costa'),
(13, 'La Finestra sul Cielo', 28, 12, 7, '6c', 'mario.rossi'),
(14, 'Rambla del Oso', 45, 20, 7, '8a+', 'luca.verdi'),
(15, 'Odyssey Direct', 50, 22, 9, '7c+', 'paolo.russo'),
(16, 'Grande Caverna', 38, 17, 8, '7a', 'paolo.russo'),
(17, 'L''Elephant', 6, 1, 10, '6a', 'marco.conti'),
(18, 'La Marie Rose', 5, 1, 10, '7a+', 'federico.costa');

-- SALITE
INSERT INTO salita (data, id, via, arrampicatore) VALUES
('2024-03-15', 1, 1, 'giulia.bianchi'),
('2024-03-15', 2, 2, 'giulia.bianchi'),
('2024-03-16', 3, 3, 'anna.neri'),
('2024-03-16', 4, 1, 'anna.neri'),
('2024-03-20', 5, 4, 'sara.ferrari'),
('2024-03-21', 6, 5, 'elena.greco'),
('2024-03-21', 7, 6, 'elena.greco'),
('2024-03-22', 8, 7, 'davide.marino'),
('2024-03-22', 9, 8, 'davide.marino'),
('2024-03-25', 10, 1, 'chiara.lombardi'),
('2024-03-25', 11, 2, 'chiara.lombardi'),
('2024-03-26', 12, 9, 'martina.ricci'),
('2024-03-27', 13, 10, 'alessandro.romano'),
('2024-03-28', 14, 11, 'francesca.gallo'),
('2024-03-29', 15, 12, 'simone.bruno'),
('2024-04-01', 16, 1, 'mario.rossi'),
('2024-04-01', 17, 3, 'mario.rossi'),
('2024-04-02', 18, 5, 'luca.verdi'),
('2024-04-02', 19, 1, 'giulia.bianchi'),
('2024-04-03', 20, 2, 'anna.neri'),
('2024-04-03', 21, 7, 'sara.ferrari'),
('2024-04-05', 22, 8, 'elena.greco'),
('2024-04-06', 23, 13, 'davide.marino'),
('2024-04-07', 24, 14, 'chiara.lombardi'),
('2024-04-08', 25, 15, 'martina.ricci'),
('2024-04-09', 26, 16, 'alessandro.romano'),
('2024-04-10', 27, 17, 'francesca.gallo'),
('2024-04-10', 28, 18, 'francesca.gallo'),
('2024-04-11', 29, 1, 'simone.bruno'),
('2024-04-12', 30, 2, 'giulia.bianchi');

-- FLASH (salite al primo tentativo)
INSERT INTO flash (salita) VALUES
(1), (3), (7), (8), (10), (16), (17), (21), (27);

-- AVISTA (salite dopo aver visto qualcuno farla)
INSERT INTO avista (salita) VALUES
(4), (6), (13), (19), (29);

-- RIPETUTE (salite dopo più tentativi)
INSERT INTO ripetuta (salita) VALUES
(2), (5), (9), (11), (12), (14), (15), (18), (20), (22), (23), (24), (25), (26), (28), (30);

-- TENTATIVI
INSERT INTO tentativo (note, id, ripetuta) VALUES
('Primo tentativo, caduta sul crux', 1, 2),
('Secondo tentativo, migliorata la sequenza', 2, 2),
('Terzo tentativo, completata!', 3, 2),
('Troppo dura, caduta subito', 4, 5),
('Secondo tentativo, arrivo a metà', 5, 5),
('Caduta sul movimento chiave', 6, 9),
('Completata al secondo tentativo', 7, 9),
('Faticoso ma ce l''ho fatta', 8, 11),
('Lungo ma bello', 9, 12),
('Tentativo fallito', 10, 14),
('Secondo tentativo fallito', 11, 14),
('Terzo tentativo fallito', 12, 14),
('Difficoltà con la placca finale', 13, 15),
('Ottimo il boulder iniziale', 14, 18),
('Completata al secondo tentativo', 15, 18),
('Buona prestazione', 16, 20),
('Molto soddisfacente', 17, 22),
('Bella via tecnica', 18, 23),
('Impegnativa ma gratificante', 19, 24),
('Prima caduta sul tiro 3', 20, 25),
('Seconda caduta ancora sul tiro 3', 21, 25),
('Completata al terzo tentativo!', 22, 25),
('Via interessante', 23, 26),
('Boulder perfetto', 24, 28),
('Completata facilmente', 25, 28),
('Via nella mia comfort zone', 26, 30);