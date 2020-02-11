BEGIN;
CREATE SCHEMA conf;

CREATE TABLE conf.Conferences(
    conferenceID SERIAL PRIMARY KEY,
    name         VARCHAR(200),
    acronym      VARCHAR(10),
    country      VARCHAR(40),
    city         VARCHAR(40),
    venue        VARCHAR(80),
    startDate    DATE,
    endDate      DATE
);

CREATE TABLE conf.Reservations(
    reservationID     SERIAL PRIMARY KEY,
    conferenceID      INTEGER REFERENCES conf.conferences(conferenceID),
    clientID          INTEGER,
    participantID     INTEGER,
    arrivalDate       DATE,
    departureDate     DATE,
    isPaid            BOOLEAN,
    isCancelled       BOOLEAN
);

CREATE TABLE conf.ConferenceDays(
    conferenceDayID   SERIAL PRIMARY KEY,
    conferenceID      INTEGER REFERENCES conf.conferences(conferenceID),
    description       VARCHAR(300),
    eventDate         DATE,
    startTime         TIME,
    endTime           TIME,
    price             NUMERIC(6, 2),
    studentDiscount   NUMERIC(5, 2),
    maxParticipantsNumber INTEGER
);

CREATE TABLE conf.ConferenceEvents(
    conferenceEventID   SERIAL PRIMARY KEY,
    conferenceID        INTEGER REFERENCES conf.conferences(conferenceID),
    description         VARCHAR(300),
    eventDate           DATE,
    startTime           TIME,
    endTime             TIME,
    price               NUMERIC(6, 2),
    studentDiscount     NUMERIC(5,2),
    maxParticipantsNumber INTEGER
);

CREATE TABLE conf.DaysReservations(
    reservationID      INTEGER REFERENCES conf.reservations(reservationID),
    conferenceDayID    INTEGER REFERENCES conf.conferenceDays(conferenceDayID),
    specialDiscount    NUMERIC(5, 2),
    isCancelled        BOOLEAN,
    PRIMARY KEY(reservationID, conferenceDayID)
);

CREATE TABLE conf.EventsReservations(
    reservationID           INTEGER REFERENCES conf.reservations(reservationID),
    conferenceEventID       INTEGER REFERENCES conf.conferenceEvents(conferenceEventID),
    specialDiscount         NUMERIC(5, 2),
    isCancelled             BOOLEAN,
    PRIMARY KEY(reservationID, conferenceEventID)
);


CREATE TABLE conf.Clients(
    clientID      SERIAL PRIMARY KEY,
    name          VARCHAR(80),
    country       VARCHAR(40),
    city          VARCHAR(40),
    address       VARCHAR(80),
    postalCode    VARCHAR(6),
    phone         VARCHAR(15),
    isUniversity  BOOLEAN
);

CREATE TABLE conf.Participants(
    participantID   SERIAL PRIMARY KEY,
    firstName       VARCHAR(40),
    lastName        VARCHAR(60),
    idCardNumber    VARCHAR(15),
    isStudent       BOOLEAN,
    phone           VARCHAR(15),
    email           VARCHAR(40)
);
ALTER TABLE conf.Reservations
ADD FOREIGN KEY (clientID)
REFERENCES  conf.clients(clientID);

ALTER TABLE conf.Reservations
ADD FOREIGN KEY (participantID)
REFERENCES conf.Participants(participantID);

COMMIT;