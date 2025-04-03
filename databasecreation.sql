-- Create the database
CREATE DATABASE exam_portal;

-- Use the database
USE exam_portal;

-- Create a table for users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Create a table for exam questions
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_option CHAR(1) NOT NULL
);

-- Insert sample questions
INSERT INTO questions (question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
('What is the capital of France?', 'A) Paris', 'B) London', 'C) Berlin', 'D) Madrid', 'A'),
('What is 2 + 2?', 'A) 3', 'B) 4', 'C) 5', 'D) 6', 'B');