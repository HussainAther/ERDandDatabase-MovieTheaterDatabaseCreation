from sqlalchemy import create_engine, Column, Integer, String, Date, DateTime, ForeignKey, Numeric
from sqlalchemy.orm import relationship, sessionmaker
from sqlalchemy.ext.declarative import declarative_base

# Create the SQLAlchemy engine
engine = create_engine('postgresql://username:password@localhost/database_name')

# Create a session factory
Session = sessionmaker(bind=engine)
session = Session()

# Create a base class for declarative models
Base = declarative_base()

# Define the ORM models
class Customer(Base):
    __tablename__ = 'customers'
    
    customer_id = Column(Integer, primary_key=True)
    first_name = Column(String(50))
    last_name = Column(String(50))
    email = Column(String(100))
    phone_number = Column(String(20))
    
    tickets = relationship('Ticket', back_populates='customer')


class Movie(Base):
    __tablename__ = 'movies'
    
    movie_id = Column(Integer, primary_key=True)
    title = Column(String(100))
    release_date = Column(Date)
    genre = Column(String(50))
    duration_minutes = Column(Integer)
    director = Column(String(100))
    
    tickets = relationship('Ticket', back_populates='movie')


class Ticket(Base):
    __tablename__ = 'tickets'
    
    ticket_id = Column(Integer, primary_key=True)
    customer_id = Column(Integer, ForeignKey('customers.customer_id'))
    movie_id = Column(Integer, ForeignKey('movies.movie_id'))
    ticket_date = Column(DateTime)
    seat_number = Column(String(10))
    price = Column(Numeric(8, 2))
    
    customer = relationship('Customer', back_populates='tickets')
    movie = relationship('Movie', back_populates='tickets')


class Concession(Base):
    __tablename__ = 'concessions'
    
    concession_id = Column(Integer, primary_key=True)
    name = Column(String(100))
    description = Column(String)
    price = Column(Numeric(8, 2))


class TicketConcession(Base):
    __tablename__ = 'ticket_concessions'
    
    ticket_id = Column(Integer, ForeignKey('tickets.ticket_id'), primary_key=True)
    concession_id = Column(Integer, ForeignKey('concessions.concession_id'), primary_key=True)
    quantity = Column(Integer)
    
    ticket = relationship('Ticket')
    concession = relationship('Concession')


# Create the tables in the database
Base.metadata.create_all(engine)

# Now you can use SQLAlchemy to perform various database operations
# For example, to query all customers and their associated tickets:
customers = session.query(Customer).all()
for customer in customers:
    print(f"Customer: {customer.first_name} {customer.last_name}")
    for ticket in customer.tickets:
        print(f"Ticket: {ticket.movie.title} ({ticket.ticket_date})")

# You can also perform insertions, updates, and deletions using SQLAlchemy's ORM features

# Insert a new customer
new_customer = Customer(first_name='John', last_name='Doe', email='johndoe@example.com', phone_number='1234567890')
session.add(new_customer)
session.commit()

# Update a movie's title
movie = session.query(Movie).filter_by(movie_id=1).first()
movie.title = 'The Shawshank Redemption: Special Edition'
session.commit()

# Delete a concession
concession = session.query(Concession).filter_by(concession_id=1).first()
session.delete(concession)
session.commit()

