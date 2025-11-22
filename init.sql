-- Create user table
CREATE TABLE IF NOT EXISTS user(
    id bigint(20) NOT NULL AUTO_INCREMENT,
    account_non_expired bit(1) NOT NULL,
    account_non_locked bit(1) NOT NULL,
    credentials_non_expired bit(1) NOT NULL,
    date_created datetime NOT NULL,
    email varchar(255) DEFAULT NULL,
    enabled bit(1) NOT NULL,
    first_name varchar(255) DEFAULT NULL,
    last_name varchar(255) DEFAULT NULL,
    mobile varchar(255) DEFAULT NULL,
    password varchar(255) NOT NULL,
    role varchar(255) NOT NULL,
    username varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Create breed table
CREATE TABLE IF NOT EXISTS breed(
    id bigint NOT NULL AUTO_INCREMENT,
    date_created datetime(6) NOT NULL,
    name varchar(255) NOT NULL,
    type varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Create pet table
CREATE TABLE IF NOT EXISTS pet(
    id bigint NOT NULL AUTO_INCREMENT,
    birth_date datetime(6) NOT NULL,
    date_created datetime(6) NOT NULL,
    dewormed bit(1) NULL,
    name varchar(255) NOT NULL,
    status varchar(255) NOT NULL,
    sterilized bit(1) NULL,
    uuid varchar(255) NOT NULL,
    vaccinated bit(1) NULL,
    adopter_id bigint DEFAULT NULL,
    breed_id bigint DEFAULT NULL,
    user_id bigint DEFAULT NULL,
    pet_id bigint DEFAULT NULL,
    PRIMARY KEY (id)
);

-- Create vaccination table
CREATE TABLE IF NOT EXISTS vaccination(
    id bigint NOT NULL AUTO_INCREMENT,
    date date NOT NULL,
    name varchar(255) NOT NULL,
    status enum('APPLIED','PENDING') NOT NULL,
    pet_id bigint DEFAULT NULL,
    PRIMARY KEY (id)
);

-- Insert user rows
INSERT IGNORE INTO user VALUES(1, 0, 0, 0,'2024-04-21 20:08:51','contact@josdem.io', 1,'jose','morales',NULL,'password','USER','josdem');
INSERT IGNORE INTO user VALUES(2, 0, 0, 0,'2024-04-21 20:08:52','contact@josdem.io', 1,'jose','morales',NULL,'password','USER','johndoe');
INSERT IGNORE INTO user VALUES(3, 0, 0, 0,'2024-04-21 20:08:53','contact@josdem.io', 1,'jose','morales',NULL,'password','USER','NHUQfuLarRMDj');
INSERT IGNORE INTO user VALUES(4, 0, 0, 0,'2024-04-21 20:08:54','contact@josdem.io', 1,'jose','morales',NULL,'password','USER','rJVyFMNsmXhPUvG');

-- Insert breed and pet data
INSERT IGNORE INTO breed VALUES (1,'2022-06-03 21:23:01.000000','Chihuahua','DOG');
INSERT IGNORE INTO pet VALUES (1,'2023-05-14 20:59:00.000000','2023-10-23 10:24:18.375559',NULL,'Cremita','OWNED',NULL,'0694c042-a4ae-4f99-b329-98f519da0164',NULL,NULL,1,1,NULL);
