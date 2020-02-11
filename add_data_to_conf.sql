BEGIN;
-- conference data
INSERT INTO conf.Conferences(name, acronym, country, city, venue, startDate, endDate)
VALUES  ('Highload ++','hghl','Russia','Moscow','Sky hall',CURRENT_DATE,CURRENT_DATE + 10),
        ('Everyday robotics','evr','UK','London','University of London Venues',CURRENT_DATE,CURRENT_DATE + 6),
        ('Not very formal methods','Noty','Poland','Cracow','AGH',CURRENT_DATE,CURRENT_DATE + 8),
        ('How to fail your student','Host','Poland','Cracow','AGH',CURRENT_DATE,CURRENT_DATE + 1),
        ('TEDx London ','TEDxLn','UK','London','City hall',CURRENT_DATE,CURRENT_DATE + 5),
        ('TEDx Warsaw','TEDxWr','Poland','Warsaw','National Philharmonic',CURRENT_DATE,CURRENT_DATE + 7),
        ('Robotics + AI','Rob','USA','New York','City hall',CURRENT_DATE,CURRENT_DATE + 2),
        ('Small talk about postgres','Smallk','USA','New York','City hall',CURRENT_DATE,CURRENT_DATE + 15);
-- days
INSERT INTO conf.ConferenceDays(conferenceID,eventDate,startTime,endTime,price,studentDiscount,maxParticipantsNumber)
VALUES      (1,CURRENT_DATE,'11:00','12:30',1000,20.1,100),
            (1,CURRENT_DATE,'13:00','14:30',1000,2.1,200),
            (1,CURRENT_DATE + 2,'11:00','12:30',1000,2.1,200),
            (2,CURRENT_DATE + 1,'15:00','16:30',5000,20,100),
            (2,CURRENT_DATE + 2,'19:00','20:30',1800,10,500),
            (3,CURRENT_DATE + 1,'11:00','12:30',1900,15,50),
            (3,CURRENT_DATE + 1,'8:00','10:30',1000,5,90),
            (4,CURRENT_DATE + 3,'11:00','12:30',8000,8,80),
            (4,CURRENT_DATE,'19:00','21:30',100,15,300),
            (5,CURRENT_DATE + 2,'11:00','12:30',100,10,110),
            (5,CURRENT_DATE,'11:00','12:30',900,10,100);
-- events
INSERT INTO conf.ConferenceEvents(conferenceID,eventDate,startTime,endTime,price,studentDiscount,maxParticipantsNumber)
VALUES      (1,CURRENT_DATE,'11:00','14:30',1000,20.1,100),
            (1,CURRENT_DATE + 2,'11:00','12:30',1000,2.1,200),
            (2,CURRENT_DATE + 1,'15:00','16:30',5000,20,100),
            (2,CURRENT_DATE + 2,'19:00','20:30',1800,10,500),
            (3,CURRENT_DATE + 1,'11:00','12:30',1900,15,50),
            (3,CURRENT_DATE + 1,'8:00','10:30',1000,5,90),
            (4,CURRENT_DATE + 3,'11:00','12:30',8000,8,80),
            (4,CURRENT_DATE,'19:00','21:30',100,15,300),
            (5,CURRENT_DATE + 2,'11:00','12:30',100,10,110),
            (5,CURRENT_DATE,'11:00','12:30',900,10,100);
--clients
INSERT INTO conf.Clients(name,country,city,postalCode,isUniversity)
VALUES      ('AGH','Poland','Cracow','00-112','t'),
            ('Boston Dynamics','USA','Boston','32-013','t'),
            ('Elephant SQL','Sweden','Stockholm','21-032','f'),
            ('ABB','Poland','Cracow','21-432','f');
--participants
INSERT INTO conf.Participants(firstName,lastName,isStudent)
VALUES      ('Marcin','Szpyrka','f'),
            ('John','Doe','f'),
            ('Andrew','White','t'),
            ('Kiu','Em Son','t'),
            ('Igor','Cosmodemianski','f'),
            ('Andrei','Bunin','t'),
            ('Irving','Finkel','f'),
            ('Tom','Scott','f');
--reservations
INSERT INTO conf.Reservations(conferenceID,clientID,participantID,arrivalDate,departureDate,isPaid,isCancelled)
VALUES      (4,1,1,CURRENT_DATE,CURRENT_DATE + 1,'t','f'),
            (1,2,2,CURRENT_DATE,CURRENT_DATE + 1,'t','f'),
            (1,2,3,CURRENT_DATE,CURRENT_DATE + 1,'t','f'),
            (1,3,4,CURRENT_DATE,CURRENT_DATE + 1,'f','f'),
            (5,3,5,CURRENT_DATE,CURRENT_DATE + 1,'t','f'),
            (6,4,6,CURRENT_DATE,CURRENT_DATE + 1,'t','f'),
            (6,4,7,CURRENT_DATE,CURRENT_DATE + 1,'f','f'),
            (6,4,8,CURRENT_DATE,CURRENT_DATE + 1,'f','f');
--day reservations
INSERT INTO conf.DaysReservations(reservationID,conferenceDayID,specialDiscount,isCancelled)
VALUES      (1,1,10,'f'),
            (2,1,10,'f'),
            (3,1,10,'f'),
            (1,5,0,'f'),
            (1,6,0,'f');

INSERT INTO conf.EventsReservations(reservationID,conferenceEventID,specialDiscount,isCancelled)
VALUES      (1,1,10,'f'),
            (2,1,0,'f'),
            (3,1,0,'f'),
            (1,5,0,'f'),
            (1,6,0,'f');
COMMIT;