-- -----------------------------
-- INVENTORY MODULE - TABLE DEFINITIONS
-- -----------------------------

---------- Tabla de categorías de producto
CREATE TABLE product_category (
	id          SERIAL PRIMARY KEY,
	name        TEXT NOT NULL UNIQUE,
	description TEXT
);

---------- Tabla base de productos
CREATE TABLE product (
	id           SERIAL PRIMARY KEY,
	name         TEXT NOT NULL,
	description  TEXT,
	code         TEXT UNIQUE,
	category_id  INT REFERENCES product_category(id),
	created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---------- Tabla de stock por producto
CREATE TABLE product_stock (
	id          SERIAL PRIMARY KEY,
	product_id  INT REFERENCES product(id) ON DELETE CASCADE,
	quantity    NUMERIC NOT NULL DEFAULT 0,
	updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---------- Tabla de proveedores
CREATE TABLE supplier (
	id          SERIAL PRIMARY KEY,
	name        TEXT NOT NULL,
	phone       TEXT,
	email       TEXT,
	address     TEXT,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---------- Relación producto - proveedor (N:N)
CREATE TABLE product_supplier (
	id           SERIAL PRIMARY KEY,
	product_id   INT REFERENCES product(id) ON DELETE CASCADE,
	supplier_id  INT REFERENCES supplier(id) ON DELETE CASCADE,
	cost_price   NUMERIC
);

---------- Tabla de listas de precios
CREATE TABLE price_list (
	id          SERIAL PRIMARY KEY,
	name        TEXT NOT NULL,
	description TEXT,
	created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---------- Ítems de la lista de precios
CREATE TABLE price_list_item (
	id             SERIAL PRIMARY KEY,
	price_list_id  INT REFERENCES price_list(id) ON DELETE CASCADE,
	product_id     INT REFERENCES product(id) ON DELETE CASCADE,
	price          NUMERIC NOT NULL
);
