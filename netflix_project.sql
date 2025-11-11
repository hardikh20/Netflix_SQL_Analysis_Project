-- Create Database
CREATE DATABASE IF NOT EXISTS netflix_project;
USE netflix_project;

--  Create Table
CREATE TABLE IF NOT EXISTS netflix_titles (
  show_id VARCHAR(10) PRIMARY KEY,
  type VARCHAR(20),
  title VARCHAR(2000),
  director VARCHAR(2000),
  cast TEXT,
  country VARCHAR(2000),
  date_added VARCHAR(50),
  release_year INT,
  rating VARCHAR(50),
  duration VARCHAR(50),
  listed_in VARCHAR(2000),
  description LONGTEXT
);

-- Confirm MySQL Secure File Path
SHOW VARIABLES LIKE 'secure_file_priv';

-- Clean existing data (optional before reloading)
TRUNCATE TABLE netflix_titles;

-- Import Dataset from CSV
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/datasql.csv'
INTO TABLE netflix_titles
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description);

-- Verify Data Import
SELECT COUNT(*) AS total_records FROM netflix_titles;


SELECT * FROM netflix_titles 
ORDER BY CAST(SUBSTRING(show_id, 2) AS UNSIGNED);
