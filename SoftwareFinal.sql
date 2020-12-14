CREATE DATABASE MUSCLE_MADNESS;

USE MUSCLE_MADNESS;

CREATE TABLE EXERCISE_INFO(
	Exercise		CHAR(100) NOT NULL,
    Intensity2		CHAR(7) NOT NULL,
    TargetMuscles	VARCHAR(100) NOT NULL,
    PRIMARY KEY	(Exercise)
    );

 CREATE TABLE ACCOUNT_INFO(
	UserID				INTEGER NOT NULL,
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
    Instructor			INTEGER,
    PRIMARY KEY (UserID)
    );

CREATE TABLE DAY_TABLE(
	UserID			INTEGER NOT NULL,
    WorkoutDate		VARCHAR(50) NOT NULL,
    DayType			VARCHAR(50),
    PRIMARY KEY (UserID, WorkoutDate),
	FOREIGN KEY (UserID) REFERENCES ACCOUNT_INFO(UserID)
    );

CREATE TABLE NUMBER_OF_CIRCUITS(
	UserID			INTEGER NOT NULL,
	WorkoutDate        VARCHAR(50) NOT NULL,
    CircuitNum   	INTEGER NOT NULL,
    PRIMARY KEY (UserID, WorkoutDate, CircuitNum), -- Gotta use update statement if circuits/exercise = 0
	FOREIGN KEY (UserID, WorkoutDate) REFERENCES DAY_TABLE(UserID, WorkoutDate)
	);

CREATE TABLE NUMBER_OF_EXERCISES(
    UserID          INTEGER NOT NULL,
    WorkoutDate        VARCHAR(50) NOT NULL,
    CircuitNum      INTEGER NOT NULL,
    ExerciseNum     INTEGER NOT NULL,
    Exercise        CHAR(100),
    PRIMARY KEY (UserID, WorkoutDate, CircuitNum, ExerciseNum), -- Gotta use update statement if circuits/exercise = 0
    FOREIGN KEY (Exercise) REFERENCES EXERCISE_INFO(Exercise),
    FOREIGN KEY (UserID, WorkoutDate) REFERENCES DAY_TABLE(UserID, WorkoutDate),
    FOREIGN KEY (CircuitNum) REFERENCES NUMBER_OF_CIRCUITS(CircuitNum)
)

CREATE TABLE REPS(
	UserID				INTEGER NOT NULL,
    WorkoutDate     VARCHAR(50) NOT NULL,
    CircuitNum		INTEGER NOT NULL,
    ExerciseNum		INTEGER NOT NULL,
    SetNum			INTEGER NOT NULL,
    NumReps			INTEGER,
	Weight		    DECIMAL(8,2),
    Duration		TIME,
    Distance		DECIMAL(8,2),
    PRIMARY KEY (UserID, WorkoutDate, CircuitNum, ExerciseNum, SetNum),
    FOREIGN KEY (UserID, WorkoutDate) REFERENCES DAY_TABLE(UserID, WorkoutDate),
    FOREIGN KEY (CircuitNum) REFERENCES NUMBER_OF_CIRCUITS(CircuitNum),
    FOREIGN KEY (ExerciseNum) REFERENCES NUMBER_OF_EXERCISES(ExerciseNum)
	);
	
	-- Insert data into Exercise Info Table
INSERT INTO EXERCISE_INFO VALUES(
'Bench Press', 'High', 'Chest/Tris');
INSERT INTO EXERCISE_INFO VALUES(
'Biceps curl', 'High', 'Biceps');
INSERT INTO EXERCISE_INFO VALUES(
'Shoulder Press', 'High', 'Shoulders');
INSERT INTO EXERCISE_INFO VALUES(
'Tricep Dips', 'High', 'Triceps/Chest');
INSERT INTO EXERCISE_INFO VALUES(
'Barbell back squat', 'High', 'Quads/Glutes/Hamstrings');
INSERT INTO EXERCISE_INFO VALUES(
'Deadlifts', 'High', 'Lower Back');
INSERT INTO EXERCISE_INFO VALUES(
'Dumbbell fly', 'High', 'Chest/Tris');
INSERT INTO EXERCISE_INFO VALUES(
'Pull ups', 'High', 'Traps/Biceps');
INSERT INTO EXERCISE_INFO VALUES(
'Lat Row', 'High', 'Lats');
INSERT INTO EXERCISE_INFO VALUES(
'Pushups', 'Medium', 'Chest/tris/shoulders/traps');
INSERT INTO EXERCISE_INFO VALUES(
'Calf raises', 'Low', 'Calfs');
INSERT INTO EXERCISE_INFO VALUES(
'Planks', 'Medium', 'Abs');
INSERT INTO EXERCISE_INFO VALUES(
'Hammer Curl', 'High', 'Biceps');
INSERT INTO EXERCISE_INFO VALUES(
'Weighted Rows', 'High', 'Traps/Lats/Biceps');
INSERT INTO EXERCISE_INFO VALUES(
'Tricep Extensions', 'Medium', 'Triceps');
INSERT INTO EXERCISE_INFO VALUES(
'Incline Press', 'High', 'Upper Chest/Shoulders');
INSERT INTO EXERCISE_INFO VALUES(
'Running', 'High', 'Quads/Glutes/Calves/Hamstrings');
INSERT INTO EXERCISE_INFO VALUES(
'Leg Press', 'High', 'Quads/Glutes/Hamstrings');
INSERT INTO EXERCISE_INFO VALUES(
'Wall Sits', 'High', 'Quads/Glutes/Hamstrings');
INSERT INTO EXERCISE_INFO VALUES(
'Sit Ups/Crunches', 'Low', 'Abs');
INSERT INTO EXERCISE_INFO VALUES(
'Lunges', 'High', 'Quads/Glutes');
INSERT INTO EXERCISE_INFO VALUES(
'Russian Twists', 'Low', 'Abs');
INSERT INTO EXERCISE_INFO VALUES(
'Seated Calf Raises', 'Low', 'Calves');
INSERT INTO EXERCISE_INFO VALUES(
'Six inches', 'Low', 'Lower Abs');
INSERT INTO EXERCISE_INFO VALUES(
'Leg Raises', 'Low', 'Lower Abs');
INSERT INTO EXERCISE_INFO VALUES(
'Side Plank', 'Low', 'Obliques');
INSERT INTO EXERCISE_INFO VALUES(
'Shoulder Shrugs', 'Medium', 'Traps');
INSERT INTO EXERCISE_INFO VALUES(
'Squats', 'High', 'Quads/Glutes/Hamstrings');
INSERT INTO EXERCISE_INFO VALUES(
'Lat Raises', 'Medium', 'Lats/Biceps');
INSERT INTO EXERCISE_INFO VALUES(
'Lat pull downs', 'Medium', 'Lats/Biceps');
    
    
-- insert data into account info table
INSERT INTO ACCOUNT_INFO VALUES(
1001, 'Admin', 'Nik.Got', 'Gottipaty', 'Nikhil', 'NikhilGottipaty@mail.adelphi.edu', 'kIba143', 20, 70, '08/21/2000', null, 'Male', '5163507364', 'Advanced', null);
INSERT INTO ACCOUNT_INFO VALUES(
1002, 'Fitness Instructor', 'REEEE', 'Muller', 'John', 'Fitness.notreal@gmail.com', 'REEEEee', 29, 78.5, '05/12/1991', null, 'Female', '555123542', null, null);
INSERT INTO ACCOUNT_INFO VALUES(
1003, 'User', 'understandable', 'Nice', 'Day', 'NiceDay@mail.adelphi.edu', 'gotchu143', 18, 65.8, '04/28/2002', null, 'Male', '516184134', 'Intermediate', null);					

-- Insert data into Day Table
INSERT INTO DAY_TABLE VALUES(
1003, '12/2/2020', 'biceps/back/shoulders');
INSERT INTO DAY_TABLE VALUES(
1003, '12/3/2020', 'chest/tris');
INSERT INTO DAY_TABLE VALUES(
1003, '12/4/2020', 'cardio');
INSERT INTO DAY_TABLE VALUES(
1003, '12/5/2020','legs');
INSERT INTO DAY_TABLE VALUES(
1003, '12/7/2020', 'abs');

--Insert Data into number of circuits table
INSERT INTO NUMBER_OF_CIRCUITS VALUES(
1003, '12/2/2020', 1);
INSERT INTO NUMBER_OF_CIRCUITS VALUES(
1003, '12/2/2020', 2);
INSERT INTO NUMBER_OF_CIRCUITS VALUES(
1003, '12/2/2020', 3);
INSERT INTO NUMBER_OF_CIRCUITS VALUES(
1003, '12/3/2020', 1);
INSERT INTO NUMBER_OF_CIRCUITS VALUES(
1003, '12/3/2020', 2);
INSERT INTO NUMBER_OF_CIRCUITS VALUES(
1003, '12/4/2020', 1);
INSERT INTO NUMBER_OF_CIRCUITS VALUES(
1003, '12/5/2020', 1);
INSERT INTO NUMBER_OF_CIRCUITS VALUES(
1003, '12/5/2020', 2);
INSERT INTO NUMBER_OF_CIRCUITS VALUES(
1003, '12/7/2020', 1);


-- Insert Data into Number of Exercises Table
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/2/2020', 1, 1, 'Biceps curl');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/2/2020',	2,	1,	'Hammer Curl');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/2/2020',	2,	2,	'Lat Row');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/2/2020',	3,	1,	'Shoulder Press');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/2/2020',	3,	2,	'Deadlifts');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/3/2020',	1,	1,	'Bench Press');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/3/2020',	1,	2,	'Tricep Extensions');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/3/2020',	2,	1,	'Incline Press');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/3/2020',	2,	2,	'Tricep Dips');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/4/2020',	1,	1,	'Running');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/5/2020',	1,	1,	'Leg Press');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/5/2020',	2,	1,	'Calf raises');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/5/2020',	2,	2,	'Wall Sits');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/5/2020',	3,	1,	'Seated Calf Raises');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/5/2020',	3,	2,	'Lunges');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/7/2020',	1,	1,	'Russian Twists');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/7/2020',	1,	2,	'Planks');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/7/2020',	1,	3,	'Six inches');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/7/2020',	1,	4,	'Leg Raises');
INSERT INTO NUMBER_OF_EXERCISES VALUES(
1003, '12/7/2020',	1,	5,	'Sit Ups/Crunches');

-- Insert Data into Reps
INSERT INTO REPS VALUES(
1003, '12/2/2020', 1, 1, 1, 20, 60, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 1, 1, 2, 20, 60, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 1, 1, 3, 18, 60, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 2, 1, 1, 20, 50, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 2, 1, 2, 20, 50, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 2, 1, 3, 20, 50, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 2, 2, 1, 16, 60, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 2, 2, 2, 16, 60, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 2, 2, 3, 14, 60, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 3, 1, 1, 10, 80, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 3, 1, 2, 8, 80, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 3, 1, 3, 8, 80, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 3, 2, 1, 12, 100, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 3, 2, 2, 11, 100, null, null);
INSERT INTO REPS VALUES(
1003, '12/2/2020', 3, 2, 3, 9, 100, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 1, 1, 1, 10, 190, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 1, 1, 2, 8, 190, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 1, 1, 3, 6, 190, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 1, 2, 1, 15, 40, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 1, 2, 2, 15, 40, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 1, 2, 3, 12, 40, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 2, 1, 1, 8, 90, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 2, 1, 2, 8, 90, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 2, 1, 3, 8, 90, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 2, 2, 1, 20, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 2, 2, 2, 22, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/3/2020', 2, 2, 3, 20, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/4/2020', 1, 1, 1, null, null, '0:16:00', 2);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 1, 1, 1, 12, 300, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 1, 1, 2, 10, 300, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 1, 1, 3, 8, 300, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 2, 1, 1, 30, 90, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 2, 1, 2, 30, 90, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 2, 1, 3, 30, 90, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 2, 2, 1, null, null, '0:01:00', null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 2, 2, 2, null, null, '0:01:00', null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 2, 2, 3, null, null, '0:01:00', null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 3, 1, 1, 30, 100, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 3, 1, 2, 25, 100, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 3, 1, 3, 25, 100, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 3, 2, 1, 12, 40, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 3, 2, 2, 12, 40, null, null);
INSERT INTO REPS VALUES(
1003, '12/5/2020', 3, 2, 3, 12, 40, null, null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 1, 1, 50, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 1, 2, 50, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 1, 3, 50, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 2, 1, null, null, '0:01:00', null);
INSERT INTO REPS VALUES(
 1003, '12/7/2020', 1, 2, 2, null, null, '0:01:00', null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 2, 3, null, null, '0:01:00', null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 3, 1, null, null, '0:01:00', null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 3, 2, null, null, '0:01:00', null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 3, 3, null, null, '0:01:00', null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 4, 1, 15, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 4, 2, 15, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 4, 3, 15, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 5, 1, 25, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 5, 2, 25, null, null, null);
INSERT INTO REPS VALUES(
1003, '12/7/2020', 1, 5, 3, 25, null, null, null);