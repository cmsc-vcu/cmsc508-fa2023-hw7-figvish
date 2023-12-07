# hw7-ddl.sql - Fig Vishton

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.


# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;


# Section 2
# Create skills( id, name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id INT NOT NULL DEFAULT 0,
    name VARCHAR(255) NOT NULL DEFAULT '(Awesome Skill Name)',
    description VARCHAR(255) NOT NULL DEFAULT '(This skill is very difficult and impressive)',
    tag VARCHAR(255) NOT NULL DEFAULT '(Tag)',
    url VARCHAR(255),
    time_commitment INT,
    PRIMARY KEY (id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills 
(id, name, tag) 
VALUES
(1, 'Playing Guitar', 'Skill 1'),
(2, 'Gardening', 'Skill 2'),
(3, 'Swimming', 'Skill 3'),
(4, 'Programming in Python', 'Skill 4'),
(5, 'Surgery', 'Skill 5'),
(6, 'Foraging for Mushrooms', 'Skill 6'),
(7, 'Holding Breath for 2 Minutes', 'Skill 7'),
(8, 'Giving Speeches', 'Skill 8');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id int NOT NULL DEFAULT 0,
    people_last_name varchar(256) NOT NULL DEFAULT '(Vishton)',
    date_joined varchar(256) NOT NULL DEFAULT '(07/02/2000)',
    people_first_name varchar(256),
    people_email varchar(256),
    linkedin_url varchar(256),
    headshot_url varchar(256),
    discord_handle varchar(256),
    brief_bio varchar(256),
    PRIMARY KEY (id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people 
(id, people_last_name, date_joined, people_first_name, people_email, linkedin_url, headshot_url, discord_handle, brief_bio)
VALUES
(1, 'Person 1', '05/15/2015', 'John', 'john.smith@example.com', 'https://www.linkedin.com/in/johnsmith', 'https://example.com/john_smith_headshot.jpg', 'john.smith#1234', 'Experienced software engineer with a passion for coding.'),
(2, 'Person 2', '03/20/2018', 'Alice', 'alice.johnson@example.com', 'https://www.linkedin.com/in/alicejohnson', 'https://example.com/alice_johnson_headshot.jpg', 'alice.johnson#5678', 'Marketing specialist with a focus on digital strategies.'),
(3, 'Person 3', '11/10/2020', 'Robert', 'robert.williams@example.com', 'https://www.linkedin.com/in/robertwilliams', 'https://example.com/robert_williams_headshot.jpg', 'robert.williams#9012', 'Passionate graphic designer with a keen eye for detail.'),
(4, 'Person 4', '02/28/2019', 'Emma', 'emma.jones@example.com', 'https://www.linkedin.com/in/emmajones', 'https://example.com/emma_jones_headshot.jpg', 'emma.jones#3456', 'Environmental scientist dedicated to sustainable practices.'),
(5, 'Person 5', '09/05/2021', 'Michael', 'michael.brown@example.com', 'https://www.linkedin.com/in/michaelbrown', 'https://example.com/michael_brown_headshot.jpg', 'michael.brown#7890', 'Finance professional with expertise in investment analysis.'),
(6, 'Person 6', '06/12/2017', 'Sophia', 'sophia.davis@example.com', 'https://www.linkedin.com/in/sophiadavis', 'https://example.com/sophia_davis_headshot.jpg', 'sophia.davis#2345', 'Educator and advocate for inclusive education practices.'),

(7, 'Person 7', '05/01/2018', 'Emily', 'emily.jones@example.com', 'https://www.linkedin.com/in/emilyjones', 'https://example.com/emily_jones_headshot.jpg', 'emily.jones#5678', 'Creative writer with a passion for storytelling.'),
(8, 'Person 8', '09/15/2019', 'David', 'david.smith@example.com', 'https://www.linkedin.com/in/davidsmith', 'https://example.com/david_smith_headshot.jpg', 'david.smith#9012', 'Entrepreneur and business strategist with a focus on innovation.'),
(9, 'Person 9', '03/10/2020', 'Olivia', 'olivia.white@example.com', 'https://www.linkedin.com/in/oliviawhite', 'https://example.com/olivia_white_headshot.jpg', 'olivia.white#3456', 'Digital marketing specialist with expertise in online campaigns.'),
(10, 'Person 10', '12/05/2021', 'Daniel', 'daniel.miller@example.com', 'https://www.linkedin.com/in/danielmiller', 'https://example.com/daniel_miller_headshot.jpg', 'daniel.miller#7890', 'Data scientist passionate about extracting insights from big data.');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT,
    skills_id INT DEFAULT 0,
    people_id INT DEFAULT 0,
    date_acquired DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills (id),
    FOREIGN KEY (people_id) REFERENCES people (id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
INSERT INTO peopleskills 
(skills_id, people_id, date_acquired) 
VALUES 

#person 1
(1, 1, '2022-01-01'),
(3, 1, '2022-02-15'),
(6, 1, '2022-03-20'),

#person 2
(3, 2, '2022-04-10'),
(4, 2, '2022-05-25'),
(5, 2, '2022-06-30'),

#person 3
(1, 3, '2022-07-15'),
(5, 3, '2022-08-20'),

#person 4 has no skills :(

#person 5
(3, 5, '2022-09-10'),
(6, 5, '2022-10-15'),

#person 6
(2, 6, '2022-11-01'),
(3, 6, '2022-12-05'),
(4, 6, '2023-01-10'),

#person 7
(3, 7, '2023-02-15'),
(5, 7, '2023-03-20'),
(6, 7, '2023-04-25'),

#person 8
(1, 8, '2023-05-01'),
(3, 8, '2023-06-05'),
(5, 8, '2023-07-10'),
(6, 8, '2023-08-15'),

#person 9
(2, 9, '2023-09-01'),
(5, 9, '2023-10-05'),
(6, 9, '2023-11-10'),

#person 10
(1, 10, '2023-12-15'),
(4, 10, '2024-01-20'),
(5, 10, '2024-02-25');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT AUTO_INCREMENT,
    name varchar(256) NOT NULL DEFAULT '(Fig)',
    sort_priority INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles 
( name, sort_priority ) 
VALUES
('Designer', 10),
('Developer', 20),
('Recruit', 30),
('Team Lead', 40),
('Boss', 50),
('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT,
    people_id INT DEFAULT 0,
    role_id INT DEFAULT 0,
    date_assigned DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles 
(people_id, role_id, date_assigned) 
VALUES 

#person 1
(1, 2, '2022-01-01'),

#person 2
(2, 5, '2022-04-10'),
(2, 6, '2022-05-25'),

#person 3
(3, 2, '2022-07-15'),
(3, 4, '2022-08-20'),

#person 4 
(4, 3, '2022-10-15'),

#person 5
(5, 3, '2022-10-15'),

#person 6
(6, 2, '2022-11-01'),
(6, 1, '2022-12-05'),

#person 7
(7, 1, '2023-02-15'),

#person 8
(8, 1, '2023-05-01'),
(8, 4, '2023-06-05'),

#person 9
(9, 2, '2023-09-01'),

#person 10
(1, 2, '2023-12-15'),
(5, 1, '2024-02-25');
