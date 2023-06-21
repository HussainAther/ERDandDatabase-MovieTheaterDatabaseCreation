-- Create tables of information for our ERD. 
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone_number VARCHAR(20)
);

CREATE TABLE movies (
  movie_id SERIAL PRIMARY KEY,
  title VARCHAR(100),
  release_date DATE,
  genre VARCHAR(50),
  duration_minutes INTEGER,
  director VARCHAR(100)
);

CREATE TABLE tickets (
  ticket_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id),
  movie_id INTEGER REFERENCES movies(movie_id),
  ticket_date TIMESTAMP,
  seat_number VARCHAR(10),
  price DECIMAL(8, 2)
);

CREATE TABLE concessions (
  concession_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  price DECIMAL(8, 2)
);

CREATE TABLE ticket_concessions (
  ticket_id INTEGER REFERENCES tickets(ticket_id),
  concession_id INTEGER REFERENCES concessions(concession_id),
  quantity INTEGER,
  PRIMARY KEY (ticket_id, concession_id)
);

-- The following code is run on the created database to output the .csv file that can be uploaded to 
-- Lucidchart.

SET enable_nestloop=0;SELECT 'postgresql' AS dbms,t.table_catalog,t.table_schema,t.table_name,c.column_name,c.ordinal_position,c.data_type,c.character_maximum_length,n.constraint_type,k2.table_schema,k2.table_name,k2.column_name FROM information_schema.tables t NATURAL LEFT JOIN information_schema.columns c LEFT JOIN(information_schema.key_column_usage k NATURAL JOIN information_schema.table_constraints n NATURAL LEFT JOIN information_schema.referential_constraints r)ON c.table_catalog=k.table_catalog AND c.table_schema=k.table_schema AND c.table_name=k.table_name AND c.column_name=k.column_name LEFT JOIN information_schema.key_column_usage k2 ON k.position_in_unique_constraint=k2.ordinal_position AND r.unique_constraint_catalog=k2.constraint_catalog AND r.unique_constraint_schema=k2.constraint_schema AND r.unique_constraint_name=k2.constraint_name WHERE t.TABLE_TYPE='BASE TABLE' AND t.table_schema NOT IN('information_schema','pg_catalog');
