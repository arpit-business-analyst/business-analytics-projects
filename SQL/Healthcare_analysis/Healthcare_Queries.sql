-- SET UP 
CREATE DATABASE healthcare_analytics; 
 
USE healthcare_analytics; 
 
CREATE TABLE patient_flow 
( 
    patient_id VARCHAR(50),        
    admission_date DATE, 
    admission_year INT, 
    admission_month VARCHAR(20), 
    admission_month_no INT, 
    admission_year_month VARCHAR(10), 
    admission_time TIME, 
    hour_of_day INT, 
    doctor_name VARCHAR(100),    
    gender VARCHAR(20), 
    age INT, 
    age_group VARCHAR(30), 
    race VARCHAR(50), 
    department VARCHAR(100) NULL,   
    admission_status VARCHAR(30), 
    is_admitted TINYINT, 
    satisfaction_score VARCHAR(10) NULL, 
    wait_time VARCHAR(10) NULL           
); 
 
SELECT * FROM patient_flow; 
 
SELECT satisfaction_score 
FROM patient_flow 
WHERE satisfaction_score REGEXP '[^0-9.]' 
LIMIT 10; 
 
SELECT wait_time 
FROM patient_flow 
WHERE wait_time REGEXP '[^0-9.]' 
LIMIT 10; 
 
SELECT wait_time 
FROM patient_flow 
WHERE wait_time = ROUND(wait_time); 
 
SET SQL_SAFE_UPDATES = 0; 

UPDATE patient_flow 
SET satisfaction_score = NULL 
WHERE satisfaction_score IS NULL 
OR satisfaction_score = ' '
OR satisfaction_score = 'NA' 
OR satisfaction_score = 'null' 
OR satisfaction_score = ' '; 

SET SQL_SAFE_UPDATES = 1; 

ALTER TABLE patient_flow 
MODIFY satisfaction_score FLOAT; 
ALTER TABLE patient_flow 
MODIFY wait_time INT; 

ALTER TABLE patient_flow 
ADD visit_id INT AUTO_INCREMENT PRIMARY KEY; 
SELECT COUNT(visit_id) 
FROM patient_flow; 

UPDATE patient_flow 
SET department = 'Other' 
WHERE department IS NULL 
OR department = ' '
OR department = 'NA' 
OR department = 'null' 
OR department = ' ';


-- LEVEL 1
-- Show all records where patients were admitted. 
SELECT * FROM patient_flow 
WHERE admission_status = 'admission'; 

-- Count the total number of patient visits. 
SELECT COUNT(visit_id) 
FROM patient_flow; 

-- Count how many visits resulted in admission vs not admission. 
SELECT admission_status, COUNT(visit_id) 
FROM patient_flow 
GROUP BY admission_status; 

-- List distinct departments in the hospital. 
SELECT DISTINCT department 
FROM patient_flow; 

-- Find the earliest and latest admission_date in the data. 
SELECT MIN(admission_date) AS earliest, 
MAX(admission_date) AS latest 
FROM patient_flow;

-- LEVEL 2 
-- Find the number of patient visits per year. 
SELECT admission_year, COUNT(patient_id) 
FROM patient_flow 
GROUP BY admission_year 
ORDER BY admission_year ASC;

-- Find the number of visits per month (year-month). 
SELECT admission_year_month, COUNT(patient_id) 
FROM patient_flow 
GROUP BY admission_year_month 
ORDER BY admission_year_month ASC;

-- Identify the busiest hour of the day. 
SELECT hour_of_day, COUNT(patient_id) 
FROM patient_flow 
GROUP BY hour_of_day 
ORDER BY COUNT(patient_id) DESC 
LIMIT 1; 

-- Compare weekday vs weekend admissions. 
SELECT 
CASE 
WHEN DAYOFWEEK(admission_date) IN (1, 7) THEN 'Weekend' 
ELSE 'Weekday' 
END AS day_type, 
COUNT(visit_id) AS total_visits 
FROM patient_flow 
GROUP BY day_type; 

-- LEVEL 3 
-- Find the total visits per department. 
SELECT department, COUNT(visit_id) 
FROM patient_flow 
GROUP BY department; 

-- Find the departments with highest admissions. 
SELECT department, COUNT(visit_id) 
FROM patient_flow 
GROUP BY department 
ORDER BY COUNT(visit_id) desc 
LIMIT 1;

-- Calculate the admission rate (%) per department. 
SELECT department, 
ROUND(SUM(is_admitted) / COUNT(visit_id) * 100, 2) AS admission_rate_percentage 
FROM patient_flow 
GROUP BY department; 

-- Identify departments with longest average wait time. 
SELECT department, AVG(wait_time) 
FROM patient_flow 
GROUP BY department 
ORDER BY AVG(wait_time) DESC 
LIMIT 1; 

-- Find departments where average satisfaction is lowest. 
SELECT department, AVG(satisfaction_score) 
FROM patient_flow 
GROUP BY department 
ORDER BY AVG(satisfaction_score) ASC 
LIMIT 1; 

-- LEVEL 4 
-- Count visits by gender. 
SELECT gender, COUNT(visit_id) 
FROM patient_flow 
GROUP BY gender; 

-- Count visits by age_group. 
SELECT age_group, COUNT(visit_id) 
FROM patient_flow 
GROUP BY age_group; 

-- Find the average wait time by age_group. 
SELECT age_group, AVG(wait_time) 
FROM patient_flow 
GROUP BY age_group; 

-- Find which race group has the highest admission rate. 
SELECT race, 
ROUND(SUM(is_admitted) / COUNT(visit_id) * 100, 2) AS admission_rate_percentage 
FROM patient_flow 
GROUP BY race 
ORDER BY admission_rate_percentage DESC 
LIMIT 1; 

-- Compare average satisfaction score by gender. 
SELECT gender, AVG(satisfaction_score) 
FROM patient_flow 
GROUP BY gender; 

-- LEVEL 5 
-- Find the average wait_time overall. 
SELECT AVG(wait_time) 
FROM patient_flow; 

-- Find wait time for admitted vs not admitted patients. 
SELECT admission_status, AVG(wait_time) 
FROM patient_flow 
GROUP BY admission_status; 

-- Check if longer wait time leads to lower satisfaction 
-- (Hint: group by wait ranges or admission status) 
SELECT 
CASE 
WHEN wait_time <= 15 THEN '0–15' 
WHEN wait_time <= 30 THEN '16–30' 
WHEN wait_time <= 60 THEN '31–60' 
ELSE '60+' 
END AS wait_time_range, 
AVG(satisfaction_score) AS avg_satisfaction 
FROM patient_flow 
GROUP BY wait_time_range; 

-- Identify hours with lowest satisfaction score. 
SELECT hour_of_day, AVG(satisfaction_score) AS avg_satisfaction 
FROM patient_flow 
GROUP BY hour_of_day 
ORDER BY avg_satisfaction ASC 
LIMIT 1; 

-- Find outlier visits where wait_time is unusually high. 
SELECT * 
FROM patient_flow 
WHERE wait_time > 
( 
SELECT AVG(wait_time) + 2 * STDDEV(wait_time) 
FROM patient_flow 
); 

-- LEVEL 6 
/*Create a query that returns: 
total visits, 
total admissions, 
admission rate, 
average wait time, 
average satisfaction score*/ 
SELECT 
COUNT(visit_id) AS total_visits, 
SUM(is_admitted) AS total_admissions, 
ROUND(SUM(is_admitted) / COUNT(visit_id) * 100, 2) AS admission_rate_percentage, 
ROUND(AVG(wait_time), 2) AS avg_wait_time, 
ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction_score 
FROM patient_flow;