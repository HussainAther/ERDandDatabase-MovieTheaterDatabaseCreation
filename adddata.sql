-- Insert sample data into the customers table
INSERT INTO customers (first_name, last_name, email, phone_number)
VALUES
  ('John', 'Doe', 'johndoe@example.com', '1234567890'),
  ('Jane', 'Smith', 'janesmith@example.com', '9876543210'),
  ('Mike', 'Johnson', 'mikejohnson@example.com', '5555555555');

-- Insert sample data into the movies table
INSERT INTO movies (title, release_date, genre, duration_minutes, director)
VALUES
  ('The Shawshank Redemption', '1994-09-22', 'Drama', 142, 'Frank Darabont'),
  ('Inception', '2010-07-16', 'Action', 148, 'Christopher Nolan'),
  ('Pulp Fiction', '1994-10-14', 'Crime', 154, 'Quentin Tarantino');

-- Insert sample data into the tickets table
INSERT INTO tickets (customer_id, movie_id, ticket_date, seat_number, price)
VALUES
  (1, 1, '2023-06-20 18:30:00', 'A10', 12.50),
  (2, 2, '2023-06-20 20:00:00', 'B5', 15.00),
  (3, 3, '2023-06-21 14:00:00', 'C7', 10.00);

-- Insert sample data into the concessions table
INSERT INTO concessions (name, description, price)
VALUES
  ('Popcorn', 'Freshly popped corn kernels', 5.50),
  ('Soda', 'Carbonated beverage', 3.50),
  ('Candy', 'Assorted candy', 4.00);

-- Insert sample data into the ticket_concessions table
INSERT INTO ticket_concessions (ticket_id, concession_id, quantity)
VALUES
  (1, 1, 2),
  (1, 2, 1),
  (2, 1, 1),
  (3, 3, 3);

