CREATE DATABASE sql_practice_pack;
USE sql_practice_pack;

CREATE TABLE menu_items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    available_qty INT
);

INSERT INTO menu_items VALUES
(1, 'Chicken Biryani', 'Main Course', 320, 25),
(2, 'Paneer Tikka', 'Starter', 240, 15),
(3, 'Masala Dosa', 'Breakfast', 120, 30),
(4, 'Veg Burger', 'Fast Food', 180, 10),
(5, 'Cold Coffee', 'Beverage', 150, 20),
(6, 'Chicken Burger', 'Fast Food', 220, 8),
(7, 'Idli', 'Breakfast', 80, 40),
(8, 'Fresh Lime', 'Beverage', 90, 0);

SELECT * FROM menu_items;

SELECT item_name, price FROM menu_items;

INSERT INTO menu_items VALUES (9, 'Paneer Butter Masala', 'Main Course', 280, 12);

UPDATE menu_items 
SET price = 350 
WHERE item_id = 1;

UPDATE menu_items 
SET price = price * 1.10 
WHERE item_id IN (4, 6);

UPDATE menu_items 
SET available_qty = available_qty - 2 
WHERE item_id = 4;

DELETE FROM menu_items 
WHERE item_id = 8;

SELECT * FROM menu_items 
WHERE price > 200;

SELECT * FROM menu_items 
WHERE price BETWEEN 100 AND 250;

SELECT * FROM menu_items 
WHERE category = 'Breakfast';

SELECT * FROM menu_items 
WHERE category IN ('Breakfast', 'Beverage');

SELECT * FROM menu_items 
WHERE item_name LIKE '%Chicken%';

SELECT * FROM menu_items 
ORDER BY price DESC;

SELECT * FROM menu_items 
ORDER BY price DESC 
LIMIT 3;

SELECT * FROM menu_items 
WHERE available_qty < 15;


CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    restaurant VARCHAR(100),
    city VARCHAR(50),
    food_type VARCHAR(50),
    order_amount DECIMAL(10,2),
    delivery_partner VARCHAR(50),
    order_date DATE
);

INSERT INTO food_orders VALUES
(101, 'Spice Hub', 'Hyderabad', 'Indian', 850, 'Ravi', '2026-09-01'),
(102, 'Burger Zone', 'Hyderabad', 'Fast Food', 520, 'Kiran', '2026-09-01'),
(103, 'Pizza Point', 'Mumbai', 'Fast Food', 1100, 'Ravi', '2026-09-02'),
(104, 'Curry House', 'Bangalore', 'Indian', 760, 'Aman', '2026-09-02'),
(105, 'Spice Hub', 'Hyderabad', 'Indian', 1250, 'Kiran', '2026-09-03'),
(106, 'Sushi World', 'Mumbai', 'Japanese', 1800, 'Aman', '2026-09-03'),
(107, 'Pizza Point', 'Mumbai', 'Fast Food', 900, 'Ravi', '2026-09-04'),
(108, 'Curry House', 'Bangalore', 'Indian', 640, 'Kiran', '2026-09-04'),
(109, 'Burger Zone', 'Hyderabad', 'Fast Food', 430, 'Aman', '2026-09-05'),
(110, 'Sushi World', 'Mumbai', 'Japanese', 2100, 'Ravi', '2026-09-05'),
(111, 'Spice Hub', 'Hyderabad', 'Indian', 950, 'Aman', '2026-09-06'),
(112, 'Curry House', 'Bangalore', 'Indian', 880, 'Ravi', '2026-09-06');

SELECT COUNT(*) AS total_orders 
FROM food_orders;

SELECT SUM(order_amount) AS total_revenue 
FROM food_orders;

SELECT AVG(order_amount) AS avg_order_value 
FROM food_orders;

SELECT MAX(order_amount) AS highest_order_amount 
FROM food_orders;

SELECT MIN(order_amount) AS lowest_order_amount 
FROM food_orders;

SELECT city, SUM(order_amount) AS total_revenue 
FROM food_orders 
GROUP BY city;

SELECT restaurant, COUNT(*) AS number_of_orders 
FROM food_orders 
GROUP BY restaurant;

SELECT food_type, AVG(order_amount) AS avg_order_value 
FROM food_orders 
GROUP BY food_type;

SELECT delivery_partner, SUM(order_amount) AS total_revenue 
FROM food_orders 
GROUP BY delivery_partner;

SELECT city, COUNT(*) AS total_orders 
FROM food_orders 
GROUP BY city 
HAVING COUNT(*) > 3;

SELECT restaurant, SUM(order_amount) AS total_revenue 
FROM food_orders 
GROUP BY restaurant 
HAVING SUM(order_amount) > 2000;

SELECT delivery_partner, AVG(order_amount) AS avg_order_amount 
FROM food_orders 
GROUP BY delivery_partner 
HAVING AVG(order_amount) > 800;

SELECT food_type, SUM(order_amount) AS total_revenue 
FROM food_orders 
GROUP BY food_type 
HAVING SUM(order_amount) > 2500;

SELECT city, SUM(order_amount) AS total_revenue 
FROM food_orders 
GROUP BY city 
ORDER BY total_revenue DESC;

SELECT restaurant, SUM(order_amount) AS total_revenue 
FROM food_orders 
GROUP BY restaurant 
ORDER BY total_revenue DESC 
LIMIT 1;


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO students VALUES
(1, 'Arun', 'Hyderabad'),
(2, 'Megha', 'Mumbai'),
(3, 'Zaid', 'Hyderabad'),
(4, 'Pooja', 'Pune'),
(5, 'Rohan', 'Delhi'),
(6, 'Sana', NULL),
(7, 'Vijay', 'Bangalore');

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    fee DECIMAL(10,2)
);

INSERT INTO courses VALUES
(101, 'Python', 15000),
(102, 'Data Engineering', 25000),
(103, 'Power BI', 12000),
(104, 'Cloud Computing', 20000),
(105, 'Cyber Security', 22000),
(106, 'Machine Learning', 28000);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

INSERT INTO enrollments VALUES
(1001, 1, 101, '2026-09-01'),
(1002, 1, 102, '2026-09-03'),
(1003, 2, 103, '2026-09-04'),
(1004, 3, 102, '2026-09-05'),
(1005, 4, 104, '2026-09-06'),
(1006, 2, 101, '2026-09-07'),
(1007, 3, 105, '2026-09-08'),
(1008, 20, 102, '2026-09-09'),
(1009, 5, NULL, '2026-09-10');

SELECT s.student_name, c.course_name 
FROM enrollments e 
JOIN students s ON e.student_id = s.student_id 
JOIN courses c ON e.course_id = c.course_id;

SELECT s.student_name, s.city, c.course_name, c.fee 
FROM enrollments e 
JOIN students s ON e.student_id = s.student_id 
JOIN courses c ON e.course_id = c.course_id;

SELECT s.student_name 
FROM enrollments e 
JOIN students s ON e.student_id = s.student_id 
JOIN courses c ON e.course_id = c.course_id 
WHERE c.course_name = 'Data Engineering';

SELECT s.student_name, c.course_name 
FROM students s 
LEFT JOIN enrollments e ON s.student_id = e.student_id 
LEFT JOIN courses c ON e.course_id = c.course_id;

SELECT s.student_name 
FROM students s 
LEFT JOIN enrollments e ON s.student_id = e.student_id 
WHERE e.enrollment_id IS NULL OR e.course_id IS NULL;

SELECT c.course_name, s.student_name 
FROM courses c 
LEFT JOIN enrollments e ON c.course_id = e.course_id 
LEFT JOIN students s ON e.student_id = s.student_id;

SELECT c.course_name 
FROM courses c 
LEFT JOIN enrollments e ON c.course_id = e.course_id 
WHERE e.enrollment_id IS NULL;

SELECT e.* 
FROM enrollments e 
LEFT JOIN students s ON e.student_id = s.student_id 
WHERE s.student_id IS NULL;

SELECT e.* 
FROM enrollments e 
LEFT JOIN courses c ON e.course_id = c.course_id 
WHERE c.course_id IS NULL;

SELECT s.student_name, COUNT(e.course_id) AS total_courses 
FROM students s 
LEFT JOIN enrollments e ON s.student_id = e.student_id 
GROUP BY s.student_id, s.student_name;

SELECT s.student_name, COALESCE(SUM(c.fee), 0) AS total_fees 
FROM students s 
LEFT JOIN enrollments e ON s.student_id = e.student_id 
LEFT JOIN courses c ON e.course_id = c.course_id 
GROUP BY s.student_id, s.student_name;

SELECT s.student_name, COUNT(e.course_id) AS course_count 
FROM students s 
JOIN enrollments e ON s.student_id = e.student_id 
GROUP BY s.student_id, s.student_name 
HAVING COUNT(e.course_id) > 1;

SELECT c.course_name, COUNT(e.student_id) AS student_count 
FROM courses c 
JOIN enrollments e ON c.course_id = e.course_id 
GROUP BY c.course_id, c.course_name 
HAVING COUNT(e.student_id) > 1;

SELECT c.course_name, COALESCE(SUM(c.fee), 0) AS total_revenue 
FROM courses c 
LEFT JOIN enrollments e ON c.course_id = e.course_id 
GROUP BY c.course_id, c.course_name;

SELECT c.course_name, SUM(c.fee) AS total_revenue 
FROM courses c 
JOIN enrollments e ON c.course_id = e.course_id 
GROUP BY c.course_id, c.course_name 
ORDER BY total_revenue DESC 
LIMIT 1;


CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_name VARCHAR(100),
    vehicle_type VARCHAR(50),
    daily_rate DECIMAL(10,2),
    available_status VARCHAR(20)
);

INSERT INTO vehicles VALUES
(1, 'Honda City', 'Car', 2500, 'Available'),
(2, 'Toyota Innova', 'Car', 3500, 'Available'),
(3, 'Royal Enfield', 'Bike', 1200, 'Rented'),
(4, 'Activa', 'Scooter', 700, 'Available'),
(5, 'Mahindra Thar', 'SUV', 4500, 'Rented'),
(6, 'Hyundai Creta', 'SUV', 3200, 'Available'),
(7, 'KTM Duke', 'Bike', 1500, 'Available');

DELIMITER //
CREATE PROCEDURE GetAllVehicles()
BEGIN
    SELECT * FROM vehicles;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetAvailableVehicles()
BEGIN
    SELECT * FROM vehicles 
    WHERE available_status = 'Available';
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetVehiclesByType(IN p_vehicle_type VARCHAR(50))
BEGIN
    SELECT * FROM vehicles 
    WHERE vehicle_type = p_vehicle_type;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetVehiclesByMaxRate(IN p_max_rate DECIMAL(10,2))
BEGIN
    SELECT * FROM vehicles 
    WHERE daily_rate <= p_max_rate;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateDailyRate(IN p_vehicle_id INT, IN p_new_rate DECIMAL(10,2))
BEGIN
    UPDATE vehicles 
    SET daily_rate = p_new_rate 
    WHERE vehicle_id = p_vehicle_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateVehicleStatus(IN p_vehicle_id INT, IN p_status VARCHAR(20))
BEGIN
    UPDATE vehicles 
    SET available_status = p_status 
    WHERE vehicle_id = p_vehicle_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE IncreaseRateByPercentage(IN p_pct DECIMAL(5,2))
BEGIN
    UPDATE vehicles 
    SET daily_rate = daily_rate * (1 + (p_pct / 100))
    WHERE vehicle_id > 0;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteVehicle(IN p_vehicle_id INT)
BEGIN
    DELETE FROM vehicles 
    WHERE vehicle_id = p_vehicle_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetVehiclesByRateRange(IN p_min_rate DECIMAL(10,2), IN p_max_rate DECIMAL(10,2))
BEGIN
    SELECT * FROM vehicles 
    WHERE daily_rate BETWEEN p_min_rate AND p_max_rate;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CountVehiclesByType(IN p_vehicle_type VARCHAR(50), OUT p_count INT)
BEGIN
    SELECT COUNT(*) INTO p_count 
    FROM vehicles 
    WHERE vehicle_type = p_vehicle_type;
END //
DELIMITER ;


CREATE TABLE registrations (
    registration_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    mobile VARCHAR(40),
    city VARCHAR(50),
    postal_code VARCHAR(20)
);

INSERT INTO registrations VALUES
(1, ' rohit sharma', 'ROHIT@GMAIL.COM', '+91-98765-43210', 'hyderabad', '500001'),
(2, 'SARA KHAN', 'sara@yahoo.com', '99887 66554', 'MUMBAI', '400001'),
(3, ' amit patel ', '', '(040)99887766', 'Hyderabad', '500 032'),
(4, 'Neha Singh', NULL, '9876543210', 'BANGALORE', '560001'),
(5, 'imran ali', 'IMRAN@MAIL.COM', '91 9988772211', NULL, '500084'),
(6, 'Priya Rao', 'priya@gmail', '98765-AB210', 'Pune', '411001');

UPDATE registrations 
SET full_name = TRIM(full_name)
WHERE registration_id > 0;

UPDATE registrations 
SET full_name = UPPER(full_name)
WHERE registration_id > 0;

UPDATE registrations 
SET email = LOWER(email)
WHERE registration_id > 0;

UPDATE registrations 
SET email = NULL 
WHERE TRIM(email) = '' AND registration_id > 0;

UPDATE registrations 
SET mobile = REPLACE(REPLACE(mobile, ' ', ''), '-', '')
WHERE registration_id > 0;

UPDATE registrations 
SET mobile = REGEXP_REPLACE(mobile, '[^0-9]', '')
WHERE registration_id > 0;

UPDATE registrations 
SET city = UPPER(city)
WHERE registration_id > 0;

SELECT * FROM registrations 
WHERE city IS NULL;

SELECT * FROM registrations 
WHERE email IS NULL OR TRIM(email) = '';

SELECT * FROM registrations 
WHERE email REGEXP '^[a-zA-Z0-9._%+-]+@gmail\\.com$';

SELECT * FROM registrations 
WHERE email IS NOT NULL AND email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';

SELECT registration_id, REGEXP_REPLACE(postal_code, '[^0-9]', '') AS clean_postal_code 
FROM registrations;

SELECT * FROM registrations 
WHERE mobile REGEXP '[a-zA-Z]';

SELECT 
    registration_id,
    TRIM(UPPER(full_name)) AS full_name,
    LOWER(NULLIF(TRIM(email), '')) AS email,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    UPPER(city) AS city,
    REGEXP_REPLACE(postal_code, '[^0-9]', '') AS postal_code
FROM registrations;

CREATE TABLE registrations_cleaned AS
SELECT 
    registration_id,
    TRIM(UPPER(full_name)) AS full_name,
    LOWER(NULLIF(TRIM(email), '')) AS email,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    UPPER(city) AS city,
    REGEXP_REPLACE(postal_code, '[^0-9]', '') AS postal_code
FROM registrations;


CREATE TABLE call_performance (
    call_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    team VARCHAR(50),
    calls_handled INT,
    customer_rating DECIMAL(3,2),
    performance_date DATE
);

INSERT INTO call_performance VALUES
(1, 'Aman', 'Alpha', 42, 4.50, '2026-09-01'),
(2, 'Sara', 'Alpha', 38, 4.70, '2026-09-01'),
(3, 'Ravi', 'Beta', 50, 4.20, '2026-09-01'),
(4, 'Neha', 'Beta', 45, 4.80, '2026-09-01'),
(5, 'Aman', 'Alpha', 48, 4.60, '2026-09-02'),
(6, 'Sara', 'Alpha', 44, 4.50, '2026-09-02'),
(7, 'Ravi', 'Beta', 46, 4.30, '2026-09-02'),
(8, 'Neha', 'Beta', 52, 4.90, '2026-09-02'),
(9, 'Kabir', 'Alpha', 41, 4.40, '2026-09-01'),
(10, 'Kabir', 'Alpha', 49, 4.60, '2026-09-02'),
(11, 'Pooja', 'Beta', 45, 4.70, '2026-09-01'),
(12, 'Pooja', 'Beta', 50, 4.80, '2026-09-02');

SELECT *, SUM(calls_handled) OVER() AS overall_total_calls 
FROM call_performance;

SELECT *, SUM(calls_handled) OVER(PARTITION BY team) AS team_total_calls 
FROM call_performance;

SELECT *, AVG(calls_handled) OVER(PARTITION BY team) AS team_avg_calls 
FROM call_performance;

SELECT *, AVG(customer_rating) OVER(PARTITION BY team) AS team_avg_rating 
FROM call_performance;

SELECT *, SUM(calls_handled) OVER(PARTITION BY agent_name ORDER BY performance_date) AS agent_cumulative_calls 
FROM call_performance;

SELECT *, SUM(calls_handled) OVER(PARTITION BY team ORDER BY performance_date, call_id) AS team_cumulative_calls 
FROM call_performance;

SELECT *, 
       calls_handled - AVG(calls_handled) OVER(PARTITION BY team) AS diff_from_team_avg 
FROM call_performance;

SELECT *, 
       LAG(calls_handled) OVER(PARTITION BY agent_name ORDER BY performance_date) AS prev_day_calls 
FROM call_performance;

SELECT *, 
       calls_handled - LAG(calls_handled) OVER(PARTITION BY agent_name ORDER BY performance_date) AS diff_from_prev_day 
FROM call_performance;

SELECT *, SUM(calls_handled) OVER(PARTITION BY agent_name) AS agent_total_calls 
FROM call_performance;


SELECT *, RANK() OVER(ORDER BY calls_handled DESC) AS overall_rank 
FROM call_performance;

SELECT *, ROW_NUMBER() OVER(ORDER BY calls_handled DESC) AS row_num 
FROM call_performance;

SELECT *, RANK() OVER(ORDER BY calls_handled DESC) AS rnk 
FROM call_performance;

SELECT *, DENSE_RANK() OVER(ORDER BY calls_handled DESC) AS dense_rnk 
FROM call_performance;

SELECT *, 
       ROW_NUMBER() OVER(ORDER BY calls_handled DESC) AS row_num,
       RANK() OVER(ORDER BY calls_handled DESC) AS rnk,
       DENSE_RANK() OVER(ORDER BY calls_handled DESC) AS dense_rnk 
FROM call_performance;

SELECT *, RANK() OVER(PARTITION BY team ORDER BY calls_handled DESC) AS team_rank 
FROM call_performance;

SELECT *, RANK() OVER(ORDER BY customer_rating DESC) AS rating_rank 
FROM call_performance;

WITH RankedPerformance AS (
    SELECT *, RANK() OVER(PARTITION BY team ORDER BY calls_handled DESC) AS rnk 
    FROM call_performance
)
SELECT * FROM RankedPerformance 
WHERE rnk <= 3;

WITH AgentBestDay AS (
    SELECT *, RANK() OVER(PARTITION BY agent_name ORDER BY calls_handled DESC) AS rnk 
    FROM call_performance
)
SELECT * FROM AgentBestDay 
WHERE rnk = 1;

WITH AgentTotalCalls AS (
    SELECT agent_name, SUM(calls_handled) AS total_calls 
    FROM call_performance 
    GROUP BY agent_name
)
SELECT agent_name, total_calls, 
       DENSE_RANK() OVER(ORDER BY total_calls DESC) AS agent_rank 
FROM AgentTotalCalls;


CREATE TABLE insurance_claims (
    claim_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    insurance_type VARCHAR(50),
    claim_amount DECIMAL(12,2),
    branch VARCHAR(50)
);

INSERT INTO insurance_claims VALUES
(1, 'Ajay Kumar', 'Health', 75000, 'Hyderabad'),
(2, 'Meena Shah', 'Motor', 45000, 'Mumbai'),
(3, 'Rohit Jain', 'Health', 125000, 'Hyderabad'),
(4, 'Sara Ali', 'Travel', 30000, 'Delhi'),
(5, 'Vikas Rao', 'Motor', 85000, 'Mumbai'),
(6, 'Nisha Singh', 'Health', 60000, 'Delhi'),
(7, 'Imran Khan', 'Travel', 55000, 'Hyderabad'),
(8, 'Pooja Patel', 'Motor', 40000, 'Delhi'),
(9, 'Karan Mehta', 'Health', 150000, 'Mumbai'),
(10, 'Farah Ahmed', 'Travel', 35000, 'Hyderabad');

WITH ClaimsByType AS (
    SELECT insurance_type, SUM(claim_amount) AS total_claims 
    FROM insurance_claims 
    GROUP BY insurance_type
)
SELECT * FROM ClaimsByType;

WITH ClaimsByBranch AS (
    SELECT branch, SUM(claim_amount) AS total_claims 
    FROM insurance_claims 
    GROUP BY branch
)
SELECT * FROM ClaimsByBranch;

WITH ClaimsByType AS (
    SELECT insurance_type, SUM(claim_amount) AS total_claims 
    FROM insurance_claims 
    GROUP BY insurance_type
)
SELECT * FROM ClaimsByType 
WHERE total_claims > 200000;

WITH OverallAvg AS (
    SELECT AVG(claim_amount) AS avg_claim 
    FROM insurance_claims
)
SELECT * FROM insurance_claims 
WHERE claim_amount > (SELECT avg_claim FROM OverallAvg);

WITH TotalClaims AS (
    SELECT insurance_type, SUM(claim_amount) AS total_amount 
    FROM insurance_claims 
    GROUP BY insurance_type
)
SELECT insurance_type, total_amount, 
       RANK() OVER(ORDER BY total_amount DESC) AS rnk 
FROM TotalClaims;

WITH TypeSummary AS (
    SELECT insurance_type, SUM(claim_amount) AS total_type_amount 
    FROM insurance_claims 
    GROUP BY insurance_type
),
BranchSummary AS (
    SELECT branch, SUM(claim_amount) AS total_branch_amount 
    FROM insurance_claims 
    GROUP BY branch
)
SELECT t.insurance_type, t.total_type_amount, b.branch, b.total_branch_amount 
FROM TypeSummary t 
CROSS JOIN BranchSummary b;

SELECT c1.* 
FROM insurance_claims c1 
WHERE c1.claim_amount > (
    SELECT AVG(c2.claim_amount) 
    FROM insurance_claims c2 
    WHERE c2.insurance_type = c1.insurance_type
);

SELECT c1.* 
FROM insurance_claims c1 
WHERE c1.claim_amount > (
    SELECT AVG(c2.claim_amount) 
    FROM insurance_claims c2 
    WHERE c2.branch = c1.branch
);

SELECT c1.* 
FROM insurance_claims c1 
WHERE c1.claim_amount = (
    SELECT MAX(c2.claim_amount) 
    FROM insurance_claims c2 
    WHERE c2.insurance_type = c1.insurance_type
);

SELECT c1.customer_name, c1.claim_amount, c1.branch 
FROM insurance_claims c1 
WHERE c1.claim_amount > (
    SELECT AVG(c2.claim_amount) 
    FROM insurance_claims c2 
    WHERE c2.branch = c1.branch
);


CREATE TABLE staff_hierarchy (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT,
    designation VARCHAR(100)
);

INSERT INTO staff_hierarchy VALUES
(1, 'Raj Malhotra', NULL, 'CEO'),
(2, 'Meera Shah', 1, 'CTO'),
(3, 'Vikram Rao', 1, 'Sales Director'),
(4, 'Aman Khan', 2, 'Engineering Manager'),
(5, 'Sara Ali', 2, 'Data Manager'),
(6, 'Rohit Das', 4, 'Developer'),
(7, 'Priya Singh', 4, 'Developer'),
(8, 'Kabir Ahmed', 5, 'Data Engineer'),
(9, 'Neha Rao', 5, 'Data Analyst'),
(10, 'Imran Sheikh', 3, 'Sales Manager'),
(11, 'Pooja Jain', 10, 'Sales Executive');

SELECT * FROM staff_hierarchy 
WHERE manager_id IS NULL;

SELECT * FROM staff_hierarchy 
WHERE manager_id = 1;

SELECT * FROM staff_hierarchy 
WHERE manager_id = (SELECT employee_id FROM staff_hierarchy WHERE designation = 'CTO');

WITH RECURSIVE OrgHierarchy AS (
    SELECT employee_id, employee_name, manager_id, designation 
    FROM staff_hierarchy 
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation 
    FROM staff_hierarchy e 
    JOIN OrgHierarchy h ON e.manager_id = h.employee_id
)
SELECT * FROM OrgHierarchy;

WITH RECURSIVE OrgHierarchy AS (
    SELECT employee_id, employee_name, manager_id, designation, 1 AS hierarchy_level 
    FROM staff_hierarchy 
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation, h.hierarchy_level + 1 
    FROM staff_hierarchy e 
    JOIN OrgHierarchy h ON e.manager_id = h.employee_id
)
SELECT * FROM OrgHierarchy;

WITH RECURSIVE Subordinates AS (
    SELECT employee_id, employee_name, manager_id, designation 
    FROM staff_hierarchy 
    WHERE manager_id = (SELECT employee_id FROM staff_hierarchy WHERE employee_name = 'Meera Shah')
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation 
    FROM staff_hierarchy e 
    JOIN Subordinates s ON e.manager_id = s.employee_id
)
SELECT * FROM Subordinates;

WITH RECURSIVE Subordinates AS (
    SELECT employee_id, employee_name, manager_id, designation 
    FROM staff_hierarchy 
    WHERE manager_id = (SELECT employee_id FROM staff_hierarchy WHERE employee_name = 'Aman Khan')
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation 
    FROM staff_hierarchy e 
    JOIN Subordinates s ON e.manager_id = s.employee_id
)
SELECT * FROM Subordinates;

SELECT 
    e.employee_name AS employee, 
    COALESCE(m.employee_name, 'No Manager') AS manager 
FROM staff_hierarchy e 
LEFT JOIN staff_hierarchy m ON e.manager_id = m.employee_id;

WITH RECURSIVE OrgHierarchy AS (
    SELECT employee_id, 1 AS hierarchy_level 
    FROM staff_hierarchy 
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, h.hierarchy_level + 1 
    FROM staff_hierarchy e 
    JOIN OrgHierarchy h ON e.manager_id = h.employee_id
)
SELECT hierarchy_level, COUNT(*) AS employee_count 
FROM OrgHierarchy 
GROUP BY hierarchy_level;

WITH RECURSIVE OrgHierarchy AS (
    SELECT employee_id, employee_name, manager_id, designation, 1 AS hierarchy_level 
    FROM staff_hierarchy 
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, e.designation, h.hierarchy_level + 1 
    FROM staff_hierarchy e 
    JOIN OrgHierarchy h ON e.manager_id = h.employee_id
)
SELECT * FROM OrgHierarchy 
ORDER BY hierarchy_level, manager_id;


CREATE TABLE hotel_bookings (
    booking_id INT PRIMARY KEY,
    hotel_city VARCHAR(50),
    room_type VARCHAR(50),
    nights INT,
    amount DECIMAL(10,2)
);

INSERT INTO hotel_bookings VALUES
(1, 'Hyderabad', 'Standard', 2, 6000),
(2, 'Hyderabad', 'Deluxe', 3, 13500),
(3, 'Hyderabad', 'Suite', 2, 18000),
(4, 'Mumbai', 'Standard', 2, 9000),
(5, 'Mumbai', 'Deluxe', 3, 18000),
(6, 'Mumbai', 'Suite', 1, 15000),
(7, 'Bangalore', 'Standard', 3, 10500),
(8, 'Bangalore', 'Deluxe', 2, 12000),
(9, 'Bangalore', 'Suite', 2, 20000);

SELECT hotel_city, SUM(amount) AS total_revenue 
FROM hotel_bookings 
GROUP BY hotel_city;

SELECT room_type, SUM(amount) AS total_revenue 
FROM hotel_bookings 
GROUP BY room_type;

SELECT hotel_city, room_type, SUM(amount) AS total_revenue 
FROM hotel_bookings 
GROUP BY hotel_city, room_type;

SELECT hotel_city, room_type, SUM(amount) AS total_revenue 
FROM hotel_bookings 
GROUP BY hotel_city, room_type WITH ROLLUP;

SELECT hotel_city, room_type, SUM(amount) AS total_revenue 
FROM hotel_bookings 
GROUP BY hotel_city, room_type WITH ROLLUP 
HAVING hotel_city IS NULL AND room_type IS NULL;

SELECT hotel_city, room_type, SUM(nights) AS total_nights 
FROM hotel_bookings 
GROUP BY hotel_city, room_type;

SELECT hotel_city, room_type, SUM(amount) AS total_revenue 
FROM hotel_bookings 
GROUP BY hotel_city, room_type WITH ROLLUP;