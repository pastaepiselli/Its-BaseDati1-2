CREATE DOMAIN codicefiscale AS VARCHAR(16);
CREATE TYPE ruolo AS ENUM('Sportello',
'Back-office');
CREATE TABLE dipendente(nome VARCHAR NOT NULL,
cognome VARCHAR NOT NULL,
cf codicefiscale NOT NULL PRIMARY KEY(cf));
CREATE TABLE tecnico(
	cf codicefiscale NOT NULL,
	annoassunzione intgez NOT NULL PRIMARY KEY(cf),
	FOREIGN KEY(cf) REFERENCES dipendente(cf)
);
CREATE TABLE amministrativo(
	ruolo ruolo NOT NULL,
	cf codicefiscale NOT NULL PRIMARY KEY(cf),
	FOREIGN KEY(cf) REFERENCES dipendente(cf)
);
CREATE TABLE richiesta(
	istante TIMESTAMP NOT NULL,
	id INTEGER NOT NULL,
	amministrativo codicefiscale NOT NULL PRIMARY KEY(id),
	FOREIGN KEY(amministrativo) REFERENCES amministrativo(cf)
);
CREATE TABLE campione(
	codice VARCHAR NOT NULL,
	nome_analisi VARCHAR NOT NULL,
	tecnico codicefiscale PRIMARY KEY(codice),
	FOREIGN KEY(tecnico) REFERENCES tecnico(cf)-- potevo accorparre 
-- richiesta integer not null,
-- foreign key (richeista)
-- references richiesta(id)

);
-- tabella creata x scopi di apprendimento!!
CREATE TABLE contiene(
	campione VARCHAR NOT NULL,
	richiesta INTEGER NOT NULL PRIMARY KEY(campione),
	FOREIGN KEY(campione) REFERENCES campione(codice) FOREIGN KEY(richiesta) REFERENCES richiesta(id)
);
