-- Total ticket sales for each movie
SELECT m.title, COUNT(t.ticket_id) AS total_tickets_sold, SUM(t.price) AS total_ticket_sales
FROM movies m
JOIN tickets t ON m.movie_id = t.movie_id
GROUP BY m.title;

-- Average concession prices for each movie
SELECT m.title, AVG(c.price) AS average_concession_price
FROM movies m
JOIN ticket_concessions tc ON tc.ticket_id = t.ticket_id
JOIN concessions c ON c.concession_id = tc.concession_id
GROUP BY m.title;

-- Number of tickets sold for each movie
SELECT m.title, COUNT(t.ticket_id) AS number_of_tickets_sold
FROM movies m
JOIN tickets t ON m.movie_id = t.movie_id
GROUP BY m.title;

