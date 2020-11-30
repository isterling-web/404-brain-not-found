-- Create a database
CREATE DATABASE MUSCLE_MADNESS;

-- Use the Database
USE MUSCLE_MADNESS;

-- Create required tables

CREATE TABLE EXERCISE_INFO(
	Exercise		CHAR(100) NOT NULL,
    Intensity2		CHAR(7) NOT NULL,
    TargetMuscles	VARCHAR(100) NOT NULL,
    PRIMARY KEY	(Exercise)
    );

CREATE TABLE NUMBER_OF_EXERCISES(
	DayID		INTEGER NOT NULL,
    CircuitNum 	INTEGER NOT NULL,
    ExerciseNum INTEGER NOT NULL,
    Exercise	CHAR(100) NOT NULL,
    NumSets		INTEGER,
    PRIMARY KEY (DayID, CircuitNum, ExerciseNum), -- Gotta use update stament if circuits/exercies = 0
    FOREIGN KEY (Exercise) REFERENCES EXERCISE_INFO(Exercise)
	);

CREATE TABLE DAY_TABLE(
	Calender		INTEGER NOT NULL,
    WorkoutDate		DATE NOT NULL,
    NumCircuits		INTEGER,
    DayID			INTEGER NOT NULL AUTO_INCREMENT,
    DayType			VARCHAR(50),
    PRIMARY KEY (Calender, WorkoutDate),
    FOREIGN KEY (DayID) REFERENCES NUMBER_OF_EXERCISES(DayID)
    );

CREATE TABLE ACCOUNT_INFO(
	UserID				INTEGER NOT NULL AUTO_INCREMENT,
    AccType				CHAR(40) NOT NULL,
    UserName			VARCHAR(25) NOT NULL,
    LastName			CHAR(25) NOT NULL,
    FirstName			CHAR(25) NOT NULL,
    EmailAddress		VARCHAR(100),
    Pass				VARCHAR(50) NOT NULL,
    Age					INTEGER NOT NULL,
    BirthDate			DATE NOT NULL,
    Weight				DECIMAL(4,2) NULL,-- in pounds
    Height				DECIMAL(4,2) NULL, -- in inches
    Gender				CHAR(20),
    Phone				CHAR(12) NOT NULL,
    Intensity			CHAR(7),
    Calender			INTEGER NOT NULL AUTO_INCREMENT,
    Instructor			INTEGER,
    PRIMARY KEY (UserID),
    FOREIGN KEY (Calender) REFERENCES DAY_TABLE(Calender)
    );
    
    
CREATE TABLE REPS(
	DayID			INTEGER NOT NULL,
    ExerciseNum		INTEGER NOT NULL,
    SetNum			INTEGER NOT NULL,
    NumReps			INTEGER,
    Duration		TIME,
    Distance		DECIMAL(8,2),
    PRIMARY KEY (DayID, ExcerciseNum, SetNum),
    FOREIGN KEY (DayID) REFERENCES NUMBER_OF_EXERCISES(DayID),
    FOREIGN KEY (ExerciseNum) REFERENCES NUMBER_OF_EXERCISES(ExerciseNum)
	);
    
    
-- insert data into account info table
INSERT INTO ACCOUNT_INFO VALUES(
null, 'Admin', 'Nik.Got', 'Gottipaty', 'Nikhil', 'NikhilGottipaty@mail.adelphi.edu', 'kIba143', 20, '08/21/2000', null, 'Male', '5163507364', 'Advanced', null, null);
INSERT INTO ACCOUNT_INFO VALUES(
null, 'Fitness Instructor', 'REEEE', 'Muller', 'John', 'Fitness.notreal@gmail.com', 'REEEEee', 29, '05/12/1991', null, 'Female', '555123542', null, null, null);						

-- Insert data into Day Table
INSERT INTO DAY_TABLE VALUES(
3, '12/1/2020', null, null, null);

-- Insert data into Exercise Info Table
INSERT INTO EXERICISE_INFO VALUES(
'Bench Press', 'High', 'Chest/Tris');

-- Insert Data into Number of Exercies Table
INSERT INTO NUMBER_OF_EXERCISES VALUES(
2, 1, 1, 'Bicep Curl', 3);

-- Insert Data into Reps
INSERT INTO REPS VALUES(
2, 1, 1, 20, null, null);



