CREATE DATABASE proyecto;

USE proyecto;

-- TABLE USER
-- all pasword wil be encrypted using SHA1
CREATE TABLE user (
  id INT(11) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apelldio VARCHAR(100) NOT NULL,
  edad int(4) NOT NULL,
  email VARCHAR(100) NOT NULL,
  username VARCHAR(16) NOT NULL,
  password VARCHAR(60) NOT NULL,
   
);

ALTER TABLE user
  ADD PRIMARY KEY (id);

ALTER TABLE user
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE user;

INSERT INTO user (id, nombre, apellido, edad, email, username, password ) 
  VALUES (1, 'john', 'password1', 'John Carter');

SELECT * FROM user;

-- LINKS TABLE
CREATE TABLE links (
  id INT(11) NOT NULL,
  title VARCHAR(150) NOT NULL,
  url VARCHAR(255) NOT NULL,
  description TEXT,
  user_id INT(11),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id)
);

ALTER TABLE links
  ADD PRIMARY KEY (id);

ALTER TABLE links
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE links;