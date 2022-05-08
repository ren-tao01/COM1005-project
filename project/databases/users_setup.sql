CREATE TABLE Users (
  id INTEGER PRIMARY KEY,
  role INTEGER,
  first_name TEXT,
  surname TEXT,
  email TEXT,
  username TEXT,
  password TEXT,
  gender INTEGER,
  university TEXT,
  field TEXT,
  description TEXT,
  pairing_status INTEGER,
  outgoing_request INTEGER,
  requested_to INTEGER,
  FOREIGN KEY(role) REFERENCES roles(id),
  FOREIGN KEY(gender) REFERENCES genders(id),
  FOREIGN KEY(pairing_status) REFERENCES pairing_status(id)
);

CREATE TABLE roles (
  id INTEGER PRIMARY KEY,
  role TEXT 
); 

CREATE TABLE genders (
  id INTEGER PRIMARY KEY,
  gender TEXT 
);

CREATE TABLE pairing_status ( 
  id INTEGER PRIMARY KEY,
  status TEXT 
);

CREATE TABLE requests (
  mentee_id INTEGER PRIMARY KEY,
  mentor_id INTEGER,
  mentor_status INTEGER,
  mentee_status INTEGER
);

INSERT INTO Users VALUES(1, 1, "Haochen", "Yang", "context1@shef.ac.uk",
                           "hy1001", "Password123", 1, "Sheffield", "Business", "context", 0, 0, 0);
INSERT INTO Users VALUES(999, 0, "Artur", "W", "context1@shef.ac.uk",
                           "artur", "artur", 1, "Sheffield", "Business", "context", 0, 0, 0);
INSERT INTO Users VALUES(2, 1, "George", "Johnson", "context2@shef.ac.uk",
                           "gj1001", "Password123", 1, "Cambridge", "Engineering", "context", 0, 0, 0);
INSERT INTO Users VALUES(3, 1, "LeBron", "James", "context3@shef.ac.uk",
                           "lj1001", "Password123", 1, "Sheffield", "Engineering", "context", 0, 0, 0);
INSERT INTO Users VALUES(4, 1, "Anne", "Hathaway", "context4@shef.ac.uk",
                           "ah1001", "Password123", 0, "Sheffield Hallam", "Engineering", "context", 0, 0, 0);
INSERT INTO Users VALUES(5, 1, "Ren", "", "context5@shef.ac.uk", 
                           "ry1001", "Password123", 1, "Sheffield", "Engineering", "context", 1, 0, 0);
INSERT INTO Users VALUES(6, 1, "Jessica", "Alba", "context6@shef.ac.uk", 
                           "ja1001", "Password123", 0, "Birmingham", "Engineering", "context", 1, 0, 0);
INSERT INTO Users VALUES(7, 1, "Kyrie", "Irving", "context7@shef.ac.uk",
                           "ki1001", "Password123", 1, "Manchester", "Engineering", "context", 0, 0, 0);
INSERT INTO Users VALUES(8, 1, "Tom", "Cruise", "context8@shef.ac.uk",
                           "tc1001", "Password123", 1, "Sheffield", "Computer science", "context", 1, 0, 0);
INSERT INTO Users VALUES(9, 1, "Will", "Smith", "context9@shef.ac.uk", 
                           "ws1001", "Password123", 1, "Sheffield", "Engineering", "context", 0, 0, 0);
INSERT INTO Users VALUES(10, 1, "Elle", "Fanning", "context10@shef.ac.uk",
                           "ef1001", "Password123", 0, "Sheffield", "Computer science", "context", 1, 0, 0);
INSERT INTO Users VALUES(11, 1, "Bill", "Connor", "context11@shef.ac.uk",
                           "bc1001", "Password123", 1, "Sheffield", "Computer science", "context", 0, 0, 0);
INSERT INTO Users VALUES(12, 2, "Daniel", "Trump", "context@shef.ac.uk",
                           "dt1001", "Password123", 1, "Sheffield", "Business", "context", 0, 0, 0);
INSERT INTO Users VALUES(1005, 2, "Mentor", "One", "context@shef.ac.uk", "mentor1", "mentor1", 1, "Sheffield", "Computer Science", "I work at Google", 0, 0, 0);
INSERT INTO Users VALUES(14, 2, "Harry", "Lake", 
                           "context@shef.ac.uk", "hl1001", "Password123", 
                           1, "Sheffield", "Computer Science", "context", 0, 0, 0);
INSERT INTO Users VALUES(15, 2, "John", "Weak",
                           "context@shef.ac.uk", "jo1001", "Password123", 
                           1, "Sheffield", "Computer Science", "context", 0, 0, 0);
INSERT INTO Users VALUES(16, 2, "Alex", "",
                           "context@shef.ac.uk", "al1001", "Password123", 
                           0, "Sheffield Hallam", "Engineering", "context", 0, 0, 0);
INSERT INTO Users VALUES(17, 2, "Shelly", "Lee",
                           "context@shef.ac.uk", "sh1001", "Password123", 
                           0, "Sheffield", "Engineering", "context", 0, 0, 0);
INSERT INTO Users VALUES(18, 2, "Josie", "Orla", 
                           "context@shef.ac.uk", "joo1001", "Password123", 
                           0, "Manchester", "Engineering", "context", 0, 0, 0);
INSERT INTO Users VALUES(19, 0, "Admin", "One", 
                           "admin001@email.com", "admin001", "Password123", 
                           0, "-", "-", "-", 0, 0, 0);

INSERT INTO roles VALUES(0, "Admin");
INSERT INTO roles VALUES(1, "Mentor");
INSERT INTO roles VALUES(2, "Mentee");

INSERT INTO genders VALUES(0, "Female");
INSERT INTO genders VALUES(1, "Male");

INSERT INTO pairing_status VALUES(0, "NOT_PAIRED");
INSERT INTO pairing_status VALUES(1, "PAIRED");

INSERT INTO requests VALUES(1, 0, 0, 0);
INSERT INTO requests VALUES(2, 0, 0, 0);
INSERT INTO requests VALUES(3, 0, 0, 0);
INSERT INTO requests VALUES(4, 0, 0, 0);
INSERT INTO requests VALUES(5, 0, 0, 0);
INSERT INTO requests VALUES(6, 0, 0, 0);
INSERT INTO requests VALUES(7, 0, 0, 0);
INSERT INTO requests VALUES(8, 0, 0, 0);
INSERT INTO requests VALUES(9, 0, 0, 0);
INSERT INTO requests VALUES(10, 0, 0, 0);
INSERT INTO requests VALUES(11, 0, 0, 0);
INSERT INTO requests VALUES(12, 0, 0, 0);
INSERT INTO requests VALUES(13, 0, 0, 0);
INSERT INTO requests VALUES(14, 0, 0, 0);
INSERT INTO requests VALUES(15, 0, 0, 0);
INSERT INTO requests VALUES(16, 0, 0, 0);
INSERT INTO requests VALUES(17, 0, 0, 0);
INSERT INTO requests VALUES(18, 0, 0, 0);

/*
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
* pairing_status: 0= "NOT_PAIRED", 1= "PAIRED" 
* mentor = 2 mentee = 1 admin = 0 
* female = 0 male = 1 
* requested_to = the mentor's id, requested_to = 0 => no request
* all mentors dont have to request to anyone
*/
