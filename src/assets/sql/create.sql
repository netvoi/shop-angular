CREATE TABLE category (
	id SERIAL PRIMARY KEY NOT NULL,
	category_name VARCHAR NOT NULL
);

CREATE TABLE manufacturer (
	id SERIAL PRIMARY KEY NOT NULL,
	manufacturer_name VARCHAR NOT NULL,
	country VARCHAR NOT NULL
);

CREATE TABLE instrument (
	id SERIAL PRIMARY KEY NOT NULL,
	instrument_name VARCHAR NOT NULL,
	description VARCHAR NOT NULL,
	price INTEGER NOT NULL,
	category_id INTEGER NOT NULL
    REFERENCES category(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  manufacturer_id INTEGER NOT NULL
    REFERENCES manufacturer(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE item (
	id SERIAL PRIMARY KEY NOT NULL,
	serial_number VARCHAR NOT NULL,
  year_of_production INTEGER NOT NULL,
	instrument_id INTEGER NOT NULL
    REFERENCES instrument(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE customer (
  id SERIAL PRIMARY KEY NOT NULL,
  customer_name VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  password VARCHAR NOT NULL
);

CREATE TABLE order_status (
  id SERIAL PRIMARY KEY NOT NULL,
  status_name VARCHAR NOT NULL
);

CREATE TABLE customer_order (
  id SERIAL PRIMARY KEY NOT NULL,
  order_time TIMESTAMP NOT NULL,
  address VARCHAR NOT NULL,
  total_price INTEGER NOT NULL,
  total_count INTEGER NOT NULL,
  customer_id INTEGER NOT NULL
    REFERENCES customer(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  order_status_id INTEGER NOT NULL
    REFERENCES order_status(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE order_item (
  id SERIAL PRIMARY KEY NOT NULL,
  customer_order_id INTEGER NOT NULL
    REFERENCES customer_order(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  item_id INTEGER NOT NULL
    REFERENCES item(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
