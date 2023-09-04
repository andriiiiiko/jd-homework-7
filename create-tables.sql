CREATE DATABASE osbb;

CREATE TABLE person (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(45),
last_name VARCHAR(45),
middle_name VARCHAR(45),
age TINYINT,
gender ENUM('MALE', 'FEMALE', 'NON-BINARY', 'OTHER'),
email VARCHAR(100),
phone_number VARCHAR(15)
);

CREATE TABLE osbb_role (
id INT AUTO_INCREMENT PRIMARY KEY,
employee BOOLEAN,
board_member BOOLEAN,
chairman BOOLEAN
);

CREATE TABLE participant (
id INT AUTO_INCREMENT PRIMARY KEY,
ownership_right BOOLEAN,
osbb_role_id INT,
person_id INT,
FOREIGN KEY (osbb_role_id) REFERENCES osbb_role(id),
FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE street (
id INT AUTO_INCREMENT PRIMARY KEY,
street VARCHAR(45)
);

CREATE TABLE building (
id INT AUTO_INCREMENT PRIMARY KEY,
number VARCHAR(10),
street_id INT,
FOREIGN KEY (street_id) REFERENCES street(id)
);

CREATE TABLE apartment (
id INT AUTO_INCREMENT PRIMARY KEY,
floor TINYINT,
number INT,
area DECIMAL(5, 2),
building_id INT,
FOREIGN KEY (building_id) REFERENCES building(id)
);

CREATE TABLE resident (
id INT AUTO_INCREMENT PRIMARY KEY,
car_entry_permission BOOLEAN,
apartment_id INT,
person_id INT,
FOREIGN KEY (apartment_id) REFERENCES apartment(id),
FOREIGN KEY (person_id) REFERENCES person(id)
);
