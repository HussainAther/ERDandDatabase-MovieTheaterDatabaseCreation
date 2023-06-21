# ERDandDatabase-MovieTheaterDatabaseCreation

Movie database entity relationship diagram 

In our example, we have created five tables: customers, movies, tickets, concessions, and ticket_concessions.

The customers table stores information about the customers, such as their ID, first name, last name, email, and phone number.

The movies table contains details about the movies, including the movie ID, title, release date, genre, duration in minutes, and director.

The tickets table represents the ticket purchases made by customers. It has a ticket ID, references to the customers and movies tables, the ticket date, seat number, and price.

The concessions table stores information about the concessions available at the movie theater. It has a concession ID, name, description, and price.

The ticket_concessions table represents the concessions purchased along with each ticket. It has references to the tickets and concessions tables, along with the quantity of each concession item.
