/* 1. Create a database. Create 2 tables using the database you just created. 
There should be a minimum of 3 columns with different data types in each table. 
Explicitly identify each column as NULL or NOT NULL. 
Include a default value for at least one column. 
Include a primary key constraint in each table. 
Include at least one UNIQUE constraint. 
Include a referential integrity (FOREIGN KEY) constraint in one table that references the other table. 
Hint: The foreign key should reference the primary key in the other table. 
Make sure they are the same exact datatype. */

DROP DATABASE IF EXISTS lab;
CREATE DATABASE lab;
USE lab;
CREATE TABLE Patient (
    PatientID INT NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    DateOfBirth DATETIME NOT NULL ,
    Height DOUBLE NOT NULL,
    Weight DOUBLE NOT NULL,
    Email VARCHAR(50),
    Address VARCHAR(255) NOT NULL DEFAULT 'Irvine',
    CONSTRAINT Patient_pk PRIMARY KEY (PatientID),
    CONSTRAINT unique_Patient UNIQUE (PatientID)
);
CREATE TABLE Test (
	TestID INT NOT NULL,
    TestDate DATETIME NOT NULL DEFAULT NOW(),
    TestResult VARCHAR(255) NOT NULL,
    Price DOUBLE NOT NULL,
    PatientID INT NOT NULL,
    CONSTRAINT Test_pk PRIMARY KEY (TestID),
    CONSTRAINT Test_Patient_fk FOREIGN KEY (PatientID)
    REFERENCES Patient (PatientID)
);

/*  Run the following file to create the database and tables used in questions 2-6. */
    DROP DATABASE IF EXISTS test_hw11;
	CREATE DATABASE test_hw11;
	USE test_hw11;

	CREATE TABLE team (
    team_id INT NOT NULL AUTO_INCREMENT,
    team_name CHAR(20) NOT NULL,
    coach CHAR(50) NULL,
    num_wins INT NOT NULL DEFAULT 0,
  	num_losses INT NOT NULL DEFAULT 0,
    CONSTRAINT team_pk PRIMARY KEY (team_id),
    CONSTRAINT unique_team UNIQUE (team_name)
    );
	
	CREATE TABLE player (
    player_id INT NOT NULL AUTO_INCREMENT,
    player_name CHAR(50) NOT NULL,
    games_played INT NOT NULL DEFAULT 0,
    team_id INT NOT NULL,
    CONSTRAINT player_pk PRIMARY KEY (player_id),
    CONSTRAINT player_team_fk FOREIGN KEY (team_id)
        REFERENCES team (team_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
    );
    
/* 	2. Alter the team table by adding a column named mascot with datatype CHAR(20). It should be placed after the coach column. */
	ALTER TABLE team
	ADD mascot CHAR(20) AFTER coach;

/* 	3. Insert 5 rows into the team table. */
	INSERT INTO team(team_name, coach, num_wins, num_losses)
	VALUES ('Tiger','Tom Davis', '3','3'),
       ('Bear','Bob Brown', '2','4'),
       ('Dragon','David Smith', '4','2'),
       ('Wolf','William Lee', '1','5'),
       ('Eagle','Ethan Moore', '5','1');

/* 	4. Insert 10 rows into the player table. There should be 2 players on each team. 
	You may have to query the team table after inserting rows to make sure you are using a valid team_id for each player. */
	INSERT INTO player(player_name, games_played, team_id)
	VALUES ('Michael Chow','6','1'),
		('Andy Luo','3','5'),
       ('Jayden Harris','4','4'),
       ('Jeremy Wang','6','3'),
       ('Max Clark','6','2'),
       ('Ryan Nguyen','5','5'),
       ('Frank Hill','6','4'),
       ('Leo Adams','7','3'),
       ('Zac Ford','5','2'),
       ('Chris Martin','3','1');
       
       SELECT *  FROM  player;
       
/* 	5. Use an update statement to change exactly one player name to 'Raymond F. Boyce'. */    
	UPDATE player
    SET player_name = 'Raymond F. Boyce'
    LIMIT 1;
    
    SELECT * FROM player;
    
/* 	6. Delete exactly one player, but not 'Raymond F. Boyce'. */ 
    DELETE FROM player
    WHERE player_name <> 'Raymond F. Boyce'
    LIMIT 1;
    
    SELECT * FROM player;
    
    
		





