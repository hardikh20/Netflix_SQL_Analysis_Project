USE netflix_project;


DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  country VARCHAR(100),
  signup_date DATE,
  plan_type VARCHAR(20),
  device VARCHAR(50)
);

-- Insert sample user data
INSERT INTO users (name, country, signup_date, plan_type, device) VALUES
('Aarav Sharma', 'India', '2024-03-01', 'Premium', 'Mobile'),
('Emily Brown', 'USA', '2024-01-15', 'Standard', 'TV'),
('Lucas Silva', 'Brazil', '2024-02-20', 'Basic', 'Laptop'),
('Hiro Tanaka', 'Japan', '2024-04-05', 'Premium', 'Tablet'),
('Sophia Khan', 'UK', '2024-03-25', 'Standard', 'Mobile'),
('Raj Mehta', 'India', '2024-02-10', 'Basic', 'TV'),
('Maria Lopez', 'Spain', '2024-04-02', 'Premium', 'Laptop'),
('John Doe', 'Canada', '2024-05-12', 'Standard', 'TV'),
('Mei Lin', 'China', '2024-03-18', 'Premium', 'Tablet'),
('Omar Ali', 'UAE', '2024-06-01', 'Basic', 'Mobile'),
('Isabella Rossi', 'Italy', '2024-04-10', 'Standard', 'Smart TV'),
('Ahmed Hassan', 'Egypt', '2024-02-28', 'Basic', 'Mobile'),
('Noah Wilson', 'Australia', '2024-03-05', 'Premium', 'Laptop'),
('Liu Wei', 'China', '2024-01-30', 'Standard', 'Tablet'),
('Emma Johnson', 'USA', '2024-05-02', 'Premium', 'TV'),
('Carlos Fernandez', 'Mexico', '2024-04-15', 'Basic', 'Mobile'),
('Ananya Iyer', 'India', '2024-02-14', 'Standard', 'Laptop'),
('David Miller', 'Germany', '2024-03-22', 'Premium', 'Smart TV'),
('Fatima Noor', 'Pakistan', '2024-05-09', 'Basic', 'Tablet'),
('Olivia Martin', 'France', '2024-06-02', 'Standard', 'TV');

select * from users;




DROP TABLE IF EXISTS watch_events;

-- Create table for viewing activity
CREATE TABLE watch_events (
  event_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  show_id VARCHAR(10),
  watch_date DATE,
  watch_duration_minutes INT,
  completed VARCHAR(5),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (show_id) REFERENCES netflix_titles(show_id)
);

-- Insert 20 watch events
INSERT INTO watch_events (user_id, show_id, watch_date, watch_duration_minutes, completed) VALUES
(1, 's1', '2024-06-10', 95, 'Yes'),
(2, 's2', '2024-06-11', 45, 'No'),
(3, 's3', '2024-06-11', 120, 'Yes'),
(4, 's4', '2024-06-12', 80, 'Yes'),
(5, 's5', '2024-06-13', 60, 'No'),
(6, 's6', '2024-06-13', 110, 'Yes'),
(7, 's7', '2024-06-14', 130, 'Yes'),
(8, 's8', '2024-06-14', 50, 'No'),
(9, 's9', '2024-06-15', 70, 'Yes'),
(10, 's10', '2024-06-15', 30, 'No'),
(11, 's11', '2024-06-16', 90, 'Yes'),
(12, 's12', '2024-06-16', 40, 'No'),
(13, 's13', '2024-06-17', 110, 'Yes'),
(14, 's14', '2024-06-17', 65, 'Yes'),
(15, 's15', '2024-06-18', 85, 'No'),
(16, 's16', '2024-06-18', 120, 'Yes'),
(17, 's17', '2024-06-19', 95, 'Yes'),
(18, 's18', '2024-06-19', 70, 'No'),
(19, 's19', '2024-06-20', 100, 'Yes'),
(20, 's20', '2024-06-20', 55, 'No');

select * from watch_events;

SELECT 
    watch_events.event_id,
    users.name AS user_name,
    users.country,
    users.plan_type,
    netflix_titles.title,
    netflix_titles.type,
    netflix_titles.listed_in AS genre,
    watch_events.watch_date,
    watch_events.watch_duration_minutes,
    watch_events.completed
FROM watch_events
INNER JOIN users ON watch_events.user_id = users.user_id
INNER JOIN netflix_titles ON watch_events.show_id = netflix_titles.show_id
LIMIT 10;
