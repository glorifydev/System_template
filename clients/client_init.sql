CREATE TABLE client_type (
	id          SERIAL PRIMARY KEY,
	name        TEXT NOT NULL UNIQUE,
	description TEXT
);

CREATE TABLE client_status (
	id          SERIAL PRIMARY KEY,
	name        TEXT NOT NULL UNIQUE,
	description TEXT
);

CREATE TABLE client (
	id               SERIAL PRIMARY KEY,
	name             TEXT NOT NULL,
	phone            TEXT,
	email            TEXT,
	address          TEXT,
	type_id          INTEGER REFERENCES client_type(id),
	status_id        INTEGER REFERENCES client_status(id) DEFAULT 1,
	created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
