-- Create a database
CREATE DATABASE DATABASE_FINAL;

-- Use the database
USE DATABASE_FINAL;

-- Create required tables
CREATE TABLE INCIDENT(
	IncidentNum		INTEGER NOT NULL AUTO_INCREMENT,
	Type			CHAR(50) NOT NULL,
	IncidentDate	DATE NOT NULL,
	State			CHAR(50) NOT NULL,
	HandlerID		INTEGER NOT NULL,
	PRIMARY KEY		(IncidentNum)
);

CREATE TABLE PEOPLE_INVOVLED(
	IncidentNum		INTEGER NOT NULL,
	PersonNum		INTEGER NOT NULL,
	LastName		CHAR(50) NOT NULL,
	FirstName		CHAR(50) NOT NULL,
	PersonID		INTEGER NOT NULL,
	PRIMARY KEY		(IncidentNum, PersonNum),
	FOREIGN KEY		(IncidentNum) REFERENCES INCIDENT(IncidentNum),
	FOREIGN KEY		(PersonID)	  REFERENCES PEOPLE(PersonID)
);

CREATE TABLE PEOPLE(
	PersonID		INTEGER NOT NULL,
	EmailAddress	VARCHAR(100),
	IP 				CHAR(50) NOT NULL,
	PRIMARY KEY (PersonID)
);


CREATE TABLE COMMENTS(
	IncidentNum		INTEGER NOT NULL,
	HandlerID		INTEGER NOT NULL,
	CommentNum		INTEGER NOT NULL,
	Comment 		VARCHAR(500),
	PRIMARY KEY		(IncidentNum, HandlerID,  CommentNum)
	FOREIGN KEY		(IncidentNum, HandlerID) REFERENCES INCIDENT(IncidentNum, HandlerID)
);

-- Insert data into incident table
INSERT INTO INCIDENT VALUES(
null, 'Phishing', '12/15/2020', 'closed', 1001);
INSERT INTO INCIDENT VALUES(
null, 'Account Hacked', '01/05/2021', 'stalled', 1002);

-- Insert data into incident table
INSERT INTO PEOPLE_INVOVLED VALUES(
1,	1,	'Gottipaty', 'Nikhil', 1); 
INSERT INTO PEOPLE_INVOVLED VALUES(
2,	1,	'Smith', 'John', 2); 
INSERT INTO PEOPLE_INVOVLED VALUES(
2,	2,	'Gottipaty',	'Nikhil', 1);	
INSERT INTO PEOPLE_INVOVLED VALUES(
2,	3,	'Muhammad',	'Ali',	3); 
INSERT INTO PEOPLE_INVOVLED VALUES(
2, 4, 'Micheal', 'Scott', 4); 

--Insert data into people
INSERT INTO PEOPLE VALUES(
1, 'nikgot@yahoo.com', '97.31.226.237');
INSERT INTO PEOPLE VALUES(
2, 'jsmith@yahoo.com', '127.166.201.13');
INSERT INTO PEOPLE VALUES(
3, 'ali@yahoo.com', '118.197.30.112');
INSERT INTO PEOPLE VALUES(
4, 'MScott@yahoo.com', '94.8.74.88');


-- Insert data into Comments
INSERT INTO COMMENTS VALUES(
1, 1001, 1,  'It was a well targeted phishing scheme.');
INSERT INTO COMMENTS VALUES(
1, 1001, 2,  'After further review it was concluded that no information was compromised.');
INSERT INTO COMMENTS VALUES(
2, 1002, 1,  'Several accounts were compromised.');



