-- Nazioni
INSERT INTO nazione (nome) VALUES 
('Italia'),
('Giappone'),
('Cina'),
('Corea del Sud');

-- Regioni
INSERT INTO regione (nome, nazione) VALUES 
('Lazio', 'Italia'),
('Lombardia', 'Italia'),
('Veneto', 'Italia'),
('Tokyo', 'Giappone'),
('Osaka', 'Giappone'),
('Beijing', 'Cina'),
('Seoul', 'Corea del Sud');

-- Città
INSERT INTO citta (nome, regione, nazione) VALUES 
('Roma', 'Lazio', 'Italia'),
('Milano', 'Lombardia', 'Italia'),
('Venezia', 'Veneto', 'Italia'),
('Tokyo', 'Tokyo', 'Giappone'),
('Osaka', 'Osaka', 'Giappone'),
('Beijing', 'Beijing', 'Cina'),
('Seoul', 'Seoul', 'Corea del Sud');

-- Giocatori
INSERT INTO giocatore (nickname, nome, cognome, indirizzo, rank, citta, regione, nazione) VALUES 
('DragonKing', 'Mario', 'Rossi', ROW('Via Nazionale', '15'), 5, 'Roma', 'Lazio', 'Italia'),
('StoneMaster', 'Luca', 'Bianchi', ROW('Corso Buenos Aires', '23'), 3, 'Milano', 'Lombardia', 'Italia'),
('GoNinja', 'Giulia', 'Verdi', ROW('Via Roma', '8'), 7, 'Venezia', 'Veneto', 'Italia'),
('BlackTiger', 'Anna', 'Ferrari', ROW('Via Veneto', '42'), 4, 'Roma', 'Lazio', 'Italia'),
('WhitePhoenix', 'Marco', 'Ricci', ROW('Viale Monza', '100'), 6, 'Milano', 'Lombardia', 'Italia'),
('SamuraiGo', 'Takeshi', 'Yamamoto', ROW('Shibuya', '1-1'), 9, 'Tokyo', 'Tokyo', 'Giappone'),
('ZenMaster', 'Kenji', 'Tanaka', ROW('Namba', '2-5'), 8, 'Osaka', 'Osaka', 'Giappone'),
('CloudPlayer', 'Wei', 'Chen', ROW('Chaoyang', '15'), 7, 'Beijing', 'Beijing', 'Cina'),
('MoonStone', 'Jin', 'Park', ROW('Gangnam', '88'), 6, 'Seoul', 'Seoul', 'Corea del Sud'),
('RiverFlow', 'Sara', 'Colombo', ROW('Via Garibaldi', '7'), 2, 'Milano', 'Lombardia', 'Italia'),
('MountainPeak', 'Paolo', 'Greco', ROW('Piazza Venezia', '3'), 5, 'Roma', 'Lazio', 'Italia'),
('OceanWave', 'Lisa', 'Romano', ROW('Riva Schiavoni', '12'), 4, 'Venezia', 'Veneto', 'Italia');

-- Regole
INSERT INTO regole (regole) VALUES 
('Giapponesi'),
('Cinesi'),
('Coreane'),
('AGA');

-- Tornei
INSERT INTO torneo (nome, edizione, descrizione, id) VALUES 
('Campionato Italiano', '2024', 'Torneo nazionale italiano di Go', 1),
('European Go Congress', '2024', 'Congresso europeo annuale', 2),
('Asian Masters', '2024', 'Campionato asiatico professionisti', 3),
('World Championship', '2024', 'Campionato mondiale', 4),
('Milano Open', '2024', 'Torneo aperto città di Milano', 5);

-- Partite
INSERT INTO partita (data, indirizzo, komi, id, citta, regione, nazione, regole, torneo, bianco, nero) VALUES 
('2024-01-15', ROW('Via del Corso', '100'), 6.5, 1, 'Roma', 'Lazio', 'Italia', 'Giapponesi', 1, 'DragonKing', 'BlackTiger'),
('2024-01-15', ROW('Via del Corso', '100'), 6.5, 2, 'Roma', 'Lazio', 'Italia', 'Giapponesi', 1, 'GoNinja', 'MountainPeak'),
('2024-01-16', ROW('Via del Corso', '100'), 6.5, 3, 'Roma', 'Lazio', 'Italia', 'Giapponesi', 1, 'DragonKing', 'GoNinja'),
('2024-02-10', ROW('Corso Buenos Aires', '50'), 7.5, 4, 'Milano', 'Lombardia', 'Italia', 'Cinesi', 5, 'StoneMaster', 'WhitePhoenix'),
('2024-02-10', ROW('Corso Buenos Aires', '50'), 6.5, 5, 'Milano', 'Lombardia', 'Italia', 'Giapponesi', 5, 'RiverFlow', 'WhitePhoenix'),
('2024-02-11', ROW('Corso Buenos Aires', '50'), 6.5, 6, 'Milano', 'Lombardia', 'Italia', 'Giapponesi', 5, 'StoneMaster', 'RiverFlow'),
('2024-03-20', ROW('Shibuya', '5-10'), 6.5, 7, 'Tokyo', 'Tokyo', 'Giappone', 'Giapponesi', 3, 'SamuraiGo', 'ZenMaster'),
('2024-03-20', ROW('Shibuya', '5-10'), 6.5, 8, 'Tokyo', 'Tokyo', 'Giappone', 'Giapponesi', 3, 'CloudPlayer', 'MoonStone'),
('2024-03-21', ROW('Shibuya', '5-10'), 6.5, 9, 'Tokyo', 'Tokyo', 'Giappone', 'Giapponesi', 3, 'SamuraiGo', 'CloudPlayer'),
('2024-04-05', ROW('Via Roma', '15'), 6.5, 10, 'Venezia', 'Veneto', 'Italia', 'AGA', NULL, 'GoNinja', 'OceanWave'),
('2024-04-12', ROW('Piazza Venezia', '8'), 6.5, 11, 'Roma', 'Lazio', 'Italia', 'Giapponesi', NULL, 'MountainPeak', 'BlackTiger'),
('2024-05-01', ROW('Gangnam', '100'), 6.5, 12, 'Seoul', 'Seoul', 'Corea del Sud', 'Coreane', 4, 'MoonStone', 'SamuraiGo'),
('2024-05-01', ROW('Gangnam', '100'), 6.5, 13, 'Seoul', 'Seoul', 'Corea del Sud', 'Coreane', 4, 'CloudPlayer', 'ZenMaster'),
('2024-05-15', ROW('Via Nazionale', '20'), 6.5, 14, 'Roma', 'Lazio', 'Italia', 'Giapponesi', 1, 'DragonKing', 'MountainPeak'),
('2024-06-10', ROW('Viale Monza', '80'), 7.5, 15, 'Milano', 'Lombardia', 'Italia', 'Cinesi', 5, 'WhitePhoenix', 'RiverFlow');

-- Partite con rinuncia
INSERT INTO partita_con_rinuncia (rinunciatario, partita) VALUES 
('Nero', 3),
('Bianco', 6),
('Nero', 11);

-- Partite con punteggio
INSERT INTO partita_con_punteggio (punteggio_bianco, punteggio_nero, partita) VALUES 
(85, 92, 1),
(78, 75, 2),
(95, 88, 4),
(82, 90, 5),
(120, 115, 7),
(105, 110, 8),
(118, 112, 9),
(65, 70, 10),
(88, 95, 12),
(100, 98, 13),
(76, 80, 14),
(91, 85, 15);