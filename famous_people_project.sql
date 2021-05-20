-- Project: Famous people
-- In this project, you’re going to make your own table with some small set of “famous people”, then make more 
-- tables about things they do and join those to create nice human readable lists.

/* Create table about the people  */
CREATE TABLE Fictional_characters ( id INTEGER PRIMARY KEY AUTOINCREMENT, name integer, age integer, favourite_quote text, time_of_ascendance integer);


INSERT INTO Fictional_characters (name, age, favourite_quote, time_of_ascendance) VALUES ("Alice Mcbrownie", "62", "One day, one day.", "0547");
INSERT INTO Fictional_characters (name, age, favourite_quote, time_of_ascendance) VALUES ("Minke Tesla", "25", "Ha! Ar tu kazka zinai?", "1124");
INSERT INTO Fictional_characters (name, age, favourite_quote, time_of_ascendance) VALUES ("Brons Bronston", "45", "The rain will rain, it will pour", "2359");
INSERT INTO Fictional_characters (name, age, favourite_quote, time_of_ascendance) VALUES ("Shibari Laikas", "19", "Ehh h-hontoni desuka, onii-sama?", "1810");
INSERT INTO Fictional_characters (name, age, favourite_quote, time_of_ascendance) VALUES ("Borif Torkiela", "8", "Time is manmade.", "0547");



/* Create table about what the people do here */
CREATE TABLE morning_routine ( id INTEGER PRIMARY KEY AUTOINCREMENT, character_id integer, wakeup_time integer, drinks_coffee text);

INSERT INTO morning_routine (character_id, wakeup_time, drinks_coffee) VALUES (2, 0645, "yes");
INSERT INTO morning_routine (character_id, wakeup_time, drinks_coffee) VALUES (3, 0900, "yes");
INSERT INTO morning_routine (character_id, wakeup_time, drinks_coffee) VALUES (5, 0645, "no");
INSERT INTO morning_routine (character_id, wakeup_time, drinks_coffee) VALUES (4, 2055, "yes");
INSERT INTO morning_routine (character_id, wakeup_time, drinks_coffee) VALUES (1, 1120, "no");


/* Create one more table about what the people do here.  */
CREATE TABLE afterlife ( id INTEGER PRIMARY KEY AUTOINCREMENT, character_id integer, heard_about text, believes_in text);

INSERT INTO afterlife (character_id, heard_about, believes_in ) VALUES (3, "The Great Beyond", "maybe");
INSERT INTO afterlife (character_id, heard_about, believes_in ) VALUES (5, "My doctor", "yes");
INSERT INTO afterlife (character_id, heard_about, believes_in ) VALUES (4, "The Simpsons", "maybe");
INSERT INTO afterlife (character_id, heard_about, believes_in ) VALUES (1, "Claudia and her sister", " ");
INSERT INTO afterlife (character_id, heard_about, believes_in ) VALUES (2, "The Great Beyond", "maybe");


SELECT * FROM fictional_characters char JOIN morning_routine morning ON char.id = morning.character_id 
JOIN afterlife ON char.id = afterlife.character_id;
