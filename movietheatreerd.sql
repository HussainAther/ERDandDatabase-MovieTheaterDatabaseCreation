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

