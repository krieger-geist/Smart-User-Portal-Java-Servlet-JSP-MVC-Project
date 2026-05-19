CREATE DATABASE smartuserportal;

USE smartuserportal;

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    profilePic VARCHAR(255)
);

CREATE TABLE tasks(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    description TEXT,
    status VARCHAR(50),
    user_email VARCHAR(100)
);