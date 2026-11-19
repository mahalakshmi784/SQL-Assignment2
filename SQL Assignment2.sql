USE cdg_hyd_jfs_060;

-- A. CREATE TABLE

CREATE TABLE courses (
    course_id INT,course_code VARCHAR(15), course_title VARCHAR(150),
    category VARCHAR(60),duration_hours INT, fee DECIMAL(10,2),
    discount_percentage DECIMAL(5,2),delivery_mode VARCHAR(20),
    start_date DATE,class_start_time TIME,
    class_end_time TIME,created_at DATETIME
);

-- Check table structure

DESCRIBE courses;

-- Check complete table creation statement

SHOW CREATE TABLE courses;

-- B. INSERT OPERATIONS

-- CRS-I1: Insert Java using explicit column list

INSERT INTO courses (
    course_id,course_code,course_title,category,
    duration_hours,fee,discount_percentage,delivery_mode,
    start_date,class_start_time,class_end_time,created_at
)
VALUES (
    1,'CRS-JAVA-101','Java Fundamentals','Programming',
    40,6500.00, 10.00,'CLASSROOM','2026-12-01',
    '09:00:00','11:00:00','2026-11-19 09:00:00'
);


-- CRS-I2: Insert SQL and Web Development
-- Using one multi-row INSERT

INSERT INTO courses (
    course_id,course_code,course_title,category,
    duration_hours,fee,discount_percentage,delivery_mode,
    start_date,class_start_time,class_end_time, created_at
)
VALUES
(
    2,'CRS-SQL-102','MySQL Essentials','Database',32,4500.50,
    5.00,'ONLINE','2026-12-05','10:00:00','12:00:00',
    '2026-11-19 09:15:00'
),
(
    3,'CRS-WEB-103','Web Development', 'Web Development',60,
    8500.00,12.50,'HYBRID','2027-01-10','14:00:00',
    '16:00:00','2026-11-19 09:30:00'
);


-- CRS-I3: Insert Testing and Python

INSERT INTO courses (
    course_id,course_code,course_title,category,
    duration_hours,fee,discount_percentage,delivery_mode,
    start_date,class_start_time,class_end_time,created_at
)
VALUES
(
    4,'CRS-TST-104','Software Testing','Testing', 24,
    3500.75,0.00,'ONLINE', '2026-12-15','15:00:00',
    '17:00:00','2026-11-19 09:45:00'
),
(
    5,'CRS-PYT-105', 'Python Basics', 'Programming',
    36, 5500.25,7.50, 'CLASSROOM', '2027-01-05',
    '09:30:00','11:30:00','2026-11-19 10:00:00'
);


-- Insert an additional course with fractional fee and discount

INSERT INTO courses (
    course_id,course_code,  course_title, category,duration_hours,
    fee,discount_percentage,delivery_mode,start_date,
    class_start_time,class_end_time, created_at
)
VALUES (
    6,'CRS-DS-106','Data Science','Data Science',50,
    7250.75, 8.25, 'ONLINE', '2027-02-01','10:00:00',
    '12:00:00', '2026-11-19 10:15:00'
);


-- Insert a course starting at 08:30 and ending at 10:30

INSERT INTO courses (
    course_id,course_code, course_title,category,
    duration_hours,fee,discount_percentage,delivery_mode,
    start_date,class_start_time,class_end_time,created_at
)
VALUES (
    7,'CRS-JS-107','JavaScript Basics','Programming',
    30,3000.50, 5.50, 'CLASSROOM', '2027-02-10','08:30:00',
    '10:30:00','2026-11-19 10:30:00'
);


-- Verify inserted records

SELECT * FROM courses;

-- C. UPDATE OPERATIONS

-- CRS-U1: Change Java course fee to 7000

UPDATE courses
SET fee = 7000.00
WHERE course_code = 'CRS-JAVA-101';


-- CRS-U2: Increase fee of every ONLINE course by 8.50%

UPDATE courses
SET fee = ROUND(fee * 1.085, 2)
WHERE delivery_mode = 'ONLINE';


-- CRS-U3: Change Web Development delivery mode to ONLINE

UPDATE courses
SET delivery_mode = 'ONLINE'
WHERE course_code = 'CRS-WEB-103';


-- CRS-U4: Change Python course start date

UPDATE courses
SET start_date = '2027-01-15'
WHERE course_code = 'CRS-PYT-105';


-- CRS-U5: Change timings of all CLASSROOM courses

UPDATE courses
SET
    class_start_time = '10:00:00',
    class_end_time = '12:00:00'
WHERE delivery_mode = 'CLASSROOM';


-- CRS-U6: Update created_at of one course

UPDATE courses
SET created_at = '2026-11-19 14:30:00'
WHERE course_code = 'CRS-JAVA-101';



USE cdg_hyd_jfs_060;

-- A. CREATE EXERCISES

-- INS-C1: Create instructors table

CREATE TABLE instructors (
    instructor_id INT,instructor_code VARCHAR(12), first_name VARCHAR(60),
    last_name VARCHAR(60),email VARCHAR(120),specialization VARCHAR(100),
    years_experience INT,hourly_rate DECIMAL(8,2),employment_type VARCHAR(20),
    joined_on DATE,work_start_time TIME,work_end_time TIME,created_at DATETIME
);

-- Inspect table structure
DESCRIBE instructors;

-- Verify table definition
SHOW CREATE TABLE instructors;

-- B. INSERT EXERCISES

-- INS-I1: Insert first instructor

INSERT INTO instructors (
    instructor_id,instructor_code,first_name, last_name,email,
    specialization,years_experience,hourly_rate,employment_type,
    joined_on, work_start_time, work_end_time,created_at
)
VALUES (
    1,'INS-JV-001','Kavya','Menon','kavya@example.com','Java',
    8,1500.50,'FULL_TIME','2021-06-14','09:00:00',
    '18:00:00','2026-11-19 09:00:00'
);


-- INS-I2: Insert next two instructors using multi-row INSERT

INSERT INTO instructors (
    instructor_id,instructor_code,first_name,last_name,
    email, specialization,years_experience,hourly_rate,
    employment_type,joined_on,work_start_time,
    work_end_time,created_at
)
VALUES
(
    2, 'INS-DB-002','Ritesh','Kumar','ritesh@example.com',
    'Databases',12,1800.75,'CONTRACT','2019-02-01', '10:00:00',
    '19:00:00','2026-11-19 09:15:00'
),
(
    3,'INS-WB-003','Farah','Ali','farah@example.com',
    'Web Development',5,1200.00,'PART_TIME','2023-08-21','14:00:00',
    '18:00:00','2026-11-19 09:30:00'
);


-- INS-I3: Insert remaining two instructors

INSERT INTO instructors (
    instructor_id,instructor_code, first_name,last_name,
    email,specialization,years_experience, hourly_rate,
    employment_type,joined_on,work_start_time,
    work_end_time,created_at
)
VALUES
(
    4,'INS-QA-004','Nitin',
    'Bose',
    'nitin@example.com',
    'Software Testing',
    7,
    1350.25,
    'PART_TIME',
    '2022-01-10',
    '09:30:00',
    '13:30:00',
    '2026-11-19 09:45:00'
),
(
    5,
    'INS-PY-005',
    'Leela',
    'Shah',
    'leela@example.com',
    'Python',
    10,
    1650.00,
    'FULL_TIME',
    '2020-05-17',
    '09:00:00',
    '18:00:00',
    '2026-11-19 10:00:00'
);


-- Insert instructor with 0 years experience

INSERT INTO instructors (
    instructor_id,
    instructor_code,
    first_name,
    last_name,
    email,
    specialization,
    years_experience,
    hourly_rate,
    employment_type,
    joined_on,
    work_start_time,
    work_end_time,
    created_at
)
VALUES (
    6,
    'INS-NEW-006',
    'Arjun',
    'Reddy',
    'arjun@example.com',
    'Cloud Computing',
    0,
    800.00,
    'CONTRACT',
    '2026-11-01',
    '09:00:00',
    '17:00:00',
    '2026-11-19 10:15:00'
);


-- Insert instructor with decimal hourly rate

INSERT INTO instructors (
    instructor_id,instructor_code,first_name,last_name,
    email, specialization, years_experience,hourly_rate,
    employment_type,joined_on,work_start_time,
    work_end_time,created_at
)
VALUES (
    7,'INS-AI-007','Sneha','Rao','sneha@example.com',
    'Artificial Intelligence',6,2450.85,'FULL_TIME',
    '2024-03-15','10:00:00', '18:00:00','2026-11-19 10:30:00'
);


-- C. UPDATE EXERCISES

-- INS-U1: Update hourly rate

UPDATE instructors
SET hourly_rate = 1500.75
WHERE instructor_code = 'INS-QA-004';

-- INS-U2: Increase FULL_TIME hourly rates by 10%

UPDATE instructors
SET hourly_rate = ROUND(hourly_rate * 1.10, 2)
WHERE employment_type = 'FULL_TIME';

-- INS-U3: Change specialization

UPDATE instructors
SET specialization = 'Full-Stack Web Development'
WHERE instructor_code = 'INS-WB-003';

-- INS-U4: Change joining date

UPDATE instructors
SET joined_on = '2020-06-01'
WHERE instructor_code = 'INS-PY-005';

-- INS-U5: Change working hours of PART_TIME instructors

UPDATE instructors
SET
    work_start_time = '10:00:00',
    work_end_time = '14:00:00'
WHERE employment_type = 'PART_TIME';

-- INS-U6: Update created_at

UPDATE instructors
SET created_at = '2026-11-19 14:30:00'
WHERE instructor_code = 'INS-JV-001';


USE cdg_hyd_jfs_060;

-- A. CREATE EXERCISES

-- WHS-C1: Create warehouses table

CREATE TABLE warehouses (
    warehouse_id INT,
    warehouse_code VARCHAR(10),
    warehouse_name VARCHAR(100),
    city VARCHAR(80),
    state VARCHAR(80),
    capacity_units INT,
    occupied_units INT,
    monthly_rent DECIMAL(12,2),
    temperature_controlled INT,
    operational_status VARCHAR(20),
    opening_time TIME,
    closing_time TIME,
    last_inspection DATE,
    created_at DATETIME
);

-- Inspect table structure
DESCRIBE warehouses;

-- Verify table definition
SHOW CREATE TABLE warehouses;


-- B. INSERT EXERCISES

-- WHS-I1: Insert Bengaluru warehouse

INSERT INTO warehouses (
    warehouse_id,
    warehouse_code,
    warehouse_name,
    city,
    state,
    capacity_units,
    occupied_units,
    monthly_rent,
    temperature_controlled,
    operational_status,
    opening_time,
    closing_time,
    last_inspection,
    created_at
)
VALUES (
    1,
    'WH-BLR-01',
    'Bengaluru Central',
    'Bengaluru',
    'Karnataka',
    10000,
    6400,
    125000.50,
    0,
    'ACTIVE',
    '08:00:00',
    '20:00:00',
    '2026-10-01',
    '2026-11-19 09:00:00'
);


-- WHS-I2: Insert Hyderabad and Mumbai warehouses

INSERT INTO warehouses (
    warehouse_id,
    warehouse_code,
    warehouse_name,
    city,
    state,
    capacity_units,
    occupied_units,
    monthly_rent,
    temperature_controlled,
    operational_status,
    opening_time,
    closing_time,
    last_inspection,
    created_at
)
VALUES
(
    2,
    'WH-HYD-02',
    'Hyderabad North',
    'Hyderabad',
    'Telangana',
    8000,
    7900,
    98000.00,
    1,
    'ACTIVE',
    '07:00:00',
    '22:00:00',
    '2026-09-15',
    '2026-11-19 09:15:00'
),
(
    3,
    'WH-MUM-03',
    'Mumbai Port Store',
    'Mumbai',
    'Maharashtra',
    15000,
    9000,
    175500.75,
    0,
    'MAINTENANCE',
    '09:00:00',
    '18:00:00',
    '2026-08-20',
    '2026-11-19 09:30:00'
);


-- WHS-I3: Insert remaining warehouses

INSERT INTO warehouses (
    warehouse_id,
    warehouse_code,
    warehouse_name,
    city,
    state,
    capacity_units,
    occupied_units,
    monthly_rent,
    temperature_controlled,
    operational_status,
    opening_time,
    closing_time,
    last_inspection,
    created_at
)
VALUES
(
    4,
    'WH-KOC-04',
    'Kochi Cold Hub',
    'Kochi',
    'Kerala',
    6000,
    3200,
    85000.25,
    1,
    'ACTIVE',
    '06:00:00',
    '21:00:00',
    '2026-10-10',
    '2026-11-19 09:45:00'
),
(
    5,
    'WH-PUN-05',
    'Pune Distribution Hub',
    'Pune',
    'Maharashtra',
    5000,
    2500,
    75000.00,
    0,
    'ACTIVE',
    '08:30:00',
    '19:30:00',
    '2026-10-25',
    '2026-11-19 10:00:00'
);


-- Insert warehouse with decimal monthly rent

INSERT INTO warehouses (
    warehouse_id,
    warehouse_code,
    warehouse_name,
    city,
    state,
    capacity_units,
    occupied_units,
    monthly_rent,
    temperature_controlled,
    operational_status,
    opening_time,
    closing_time,
    last_inspection,
    created_at
)
VALUES (
    6,
    'WH-CHN-06',
    'Chennai Storage Hub',
    'Chennai',
    'Tamil Nadu',
    7000,
    3500,
    92500.85,
    0,
    'ACTIVE',
    '08:00:00',
    '20:00:00',
    '2026-10-30',
    '2026-11-19 10:15:00'
);


-- Insert warehouse opening at 06:30:00

INSERT INTO warehouses (
    warehouse_id,
    warehouse_code,
    warehouse_name,
    city,
    state,
    capacity_units,
    occupied_units,
    monthly_rent,
    temperature_controlled,
    operational_status,
    opening_time,
    closing_time,
    last_inspection,
    created_at
)
VALUES (
    7,
    'WH-VJA-07',
    'Vijayawada Early Hub',
    'Vijayawada',
    'Andhra Pradesh',
    4000,
    1800,
    65000.50,
    1,
    'ACTIVE',
    '06:30:00',
    '18:30:00',
    '2026-11-01',
    '2026-11-19 10:30:00'
);


-- C. UPDATE EXERCISES

-- WHS-U1: Add 500 occupied units to Bengaluru

UPDATE warehouses
SET occupied_units = occupied_units + 500
WHERE warehouse_code = 'WH-BLR-01';


-- WHS-U2: Reduce Hyderabad occupancy by 1000

UPDATE warehouses
SET occupied_units = occupied_units - 1000
WHERE warehouse_code = 'WH-HYD-02';


-- WHS-U3: Change Mumbai status to ACTIVE

UPDATE warehouses
SET operational_status = 'ACTIVE'
WHERE warehouse_code = 'WH-MUM-03';


-- WHS-U4: Increase rent of temperature-controlled
-- warehouses by 5.50%

UPDATE warehouses
SET monthly_rent = ROUND(monthly_rent * 1.055, 2)
WHERE temperature_controlled = 1;


-- WHS-U5: Update Kochi inspection date

UPDATE warehouses
SET last_inspection = '2026-11-15'
WHERE warehouse_code = 'WH-KOC-04';


-- WHS-U6: Change operating hours of all ACTIVE warehouses

UPDATE warehouses
SET
    opening_time = '07:00:00',
    closing_time = '21:00:00'
WHERE operational_status = 'ACTIVE';



USE cdg_hyd_jfs_060;

-- A. CREATE EXERCISES

-- SHP-C1: Create shipments table

CREATE TABLE shipments (
    shipment_id INT,
    tracking_number VARCHAR(20),
    sender_name VARCHAR(120),
    recipient_name VARCHAR(120),
    destination_city VARCHAR(80),
    package_weight_kg DECIMAL(8,3),
    shipping_cost DECIMAL(10,2),
    shipped_date DATE,
    shipped_time TIME,
    expected_delivery_date DATE,
    delivered_at DATETIME,
    shipment_status VARCHAR(20),
    priority VARCHAR(10),
    created_at DATETIME
);

-- Inspect table structure
DESCRIBE shipments;

-- Verify table definition
SHOW CREATE TABLE shipments;


-- B. INSERT EXERCISES

-- SHP-I1: Insert first shipment

INSERT INTO shipments (
    shipment_id,
    tracking_number,
    sender_name,
    recipient_name,
    destination_city,
    package_weight_kg,
    shipping_cost,
    shipped_date,
    shipped_time,
    expected_delivery_date,
    delivered_at,
    shipment_status,
    priority,
    created_at
)
VALUES (
    1,
    'TRK26000001',
    'Asha Stores',
    'Nitin Rao',
    'Chennai',
    2.500,
    180.50,
    '2026-11-10',
    '09:30:00',
    '2026-11-14',
    NULL,
    'IN_TRANSIT',
    'NORMAL',
    '2026-11-19 09:00:00'
);


-- SHP-I2: Insert delivered shipment

INSERT INTO shipments (
    shipment_id,
    tracking_number,
    sender_name,
    recipient_name,
    destination_city,
    package_weight_kg,
    shipping_cost,
    shipped_date,
    shipped_time,
    expected_delivery_date,
    delivered_at,
    shipment_status,
    priority,
    created_at
)
VALUES (
    2,
    'TRK26000002',
    'Nova Tech',
    'Isha Sen',
    'Bengaluru',
    0.800,
    250.75,
    '2026-11-11',
    '11:15:00',
    '2026-11-13',
    '2026-11-13 15:30:00',
    'DELIVERED',
    'EXPRESS',
    '2026-11-19 09:15:00'
);


-- SHP-I3: Insert third shipment with explicit values
-- for every column

INSERT INTO shipments (
    shipment_id, tracking_number, sender_name, recipient_name,
    destination_city,package_weight_kg,shipping_cost,
    shipped_date,shipped_time, expected_delivery_date,delivered_at,
    shipment_status, priority,created_at
)
VALUES (
    3,'TRK26000003','Book Nest','Omar Ali', 'Kochi',
    4.200,220.00, '2026-11-12', '14:00:00', '2026-11-17',
    NULL,  'CREATED', 'NORMAL', '2026-11-19 09:30:00'
);


-- SHP-I4: Insert remaining two shipments using
-- one multi-row INSERT statement

INSERT INTO shipments (
    shipment_id,tracking_number, sender_name, recipient_name,
    destination_city, package_weight_kg, shipping_cost,shipped_date,
    shipped_time,expected_delivery_date,delivered_at,
    shipment_status,priority,created_at
)
VALUES
(
    4,'TRK26000004','Green Foods','Meera Das','Hyderabad',
    12.000,550.50,'2026-11-12', '08:45:00','2026-11-15',
    NULL,'IN_TRANSIT','EXPRESS','2026-11-19 09:45:00'
),
(
    5, 'TRK26000005','Test Sender', 'Test Receiver',
    'Pune', 1.000, 100.25, '2026-11-13', '16:30:00', '2026-11-16',
    NULL, 'CANCELLED', 'NORMAL', '2026-11-19 10:00:00'
);


-- Insert another shipment with package weight 0.750 kg

INSERT INTO shipments (
    shipment_id, tracking_number, sender_name, recipient_name,
    destination_city,package_weight_kg,shipping_cost,shipped_date,
    shipped_time,expected_delivery_date,delivered_at,shipment_status,
    priority,created_at
)
VALUES (
    6,'TRK26000006','Fresh Mart','Rahul Kumar','Vijayawada',
    0.750,125.50,'2026-11-14', '12:00:00', '2026-11-18',
    NULL,'CREATED', 'NORMAL', '2026-11-19 10:15:00'
);


-- C. UPDATE EXERCISES

-- SHP-U1: Change first shipment to DELIVERED
-- and set delivery datetime

UPDATE shipments
SET
    shipment_status = 'DELIVERED',
    delivered_at = '2026-11-14 16:30:00'
WHERE tracking_number = 'TRK26000001';


-- SHP-U2: Change CREATED to IN_TRANSIT

UPDATE shipments
SET shipment_status = 'IN_TRANSIT'
WHERE tracking_number = 'TRK26000003';


-- SHP-U3: Increase shipping cost of EXPRESS
-- shipments by 50

UPDATE shipments
SET shipping_cost = shipping_cost + 50.00
WHERE priority = 'EXPRESS';


-- SHP-U4: Postpone expected delivery date

UPDATE shipments
SET expected_delivery_date = '2026-11-18'
WHERE tracking_number = 'TRK26000004';


-- SHP-U5: Change dispatch time

UPDATE shipments
SET shipped_time = '10:30:00'
WHERE tracking_number = 'TRK26000003';


-- SHP-U6: Update delivered datetime

UPDATE shipments
SET delivered_at = '2026-11-13 17:00:00'
WHERE tracking_number = 'TRK26000002';


USE cdg_hyd_jfs_060;

-- A. CREATE EXERCISES

-- SUB-C1: Create subscriptions table

CREATE TABLE subscriptions (
    subscription_id INT,subscription_code VARCHAR(16),subscriber_name VARCHAR(120),
    subscriber_email VARCHAR(120),plan_name VARCHAR(60),billing_cycle VARCHAR(20),
    amount DECIMAL(10,2),start_date DATE,end_date DATE,renewal_time TIME,
    last_payment_at DATETIME,auto_renew INT,subscription_status VARCHAR(20),
    created_at DATETIME
);

-- Inspect table structure
DESCRIBE subscriptions;

-- Verify table definition
SHOW CREATE TABLE subscriptions;

-- B. INSERT EXERCISES

-- SUB-I1: Insert first two subscriptions

INSERT INTO subscriptions (
    subscription_id,subscription_code, subscriber_name, subscriber_email,
    plan_name, billing_cycle, amount, start_date, end_date,renewal_time,
    last_payment_at,auto_renew,subscription_status,created_at
)
VALUES
(
    1,'SUB260001','Aarav Nair', 'aarav@example.com','Standard',
    'MONTHLY',499.00,'2026-11-01','2026-11-30','01:00:00',
    '2026-11-01 01:05:00',1,'ACTIVE','2026-11-19 09:00:00'
),
(
    2,'SUB260002','Diya Shah','diya@example.com','Premium',
    'YEARLY',4999.50,'2026-01-15', '2027-01-14','02:00:00',
    '2026-11-15 02:10:00', 1, 'ACTIVE',  '2026-11-19 09:15:00'
);


-- SUB-I2: Insert SUB260003 with all columns explicitly supplied

INSERT INTO subscriptions (
    subscription_id,subscription_code, subscriber_name,
    subscriber_email,plan_name,billing_cycle,
    amount,start_date,end_date,renewal_time,last_payment_at,
    auto_renew,subscription_status, created_at
)
VALUES (
    3, 'SUB260003', 'Kabir Rao','kabir@example.com',
    'Basic','MONTHLY',199.00,'2026-11-10',
    '2026-12-09','03:00:00','2026-11-10 03:05:00',
    1,'ACTIVE', '2026-11-19 09:30:00'
);


-- SUB-I3: Insert remaining two subscriptions

INSERT INTO subscriptions (
    subscription_id,subscription_code, subscriber_name,
    subscriber_email,plan_name,billing_cycle,amount,
    start_date, end_date,renewal_time, last_payment_at,
    auto_renew,subscription_status, created_at
)
VALUES
(
    4,'SUB260004', 'Meera Bose', 'meera@example.com',
    'Premium', 'QUARTERLY', 1399.75, '2026-10-01',
    '2026-12-31', '04:00:00', '2026-10-01 04:15:00',
    0,'PAUSED','2026-11-19 09:45:00'
),
(
    5,'SUB260005', 'Rohan Das',  'rohan@example.com', 'Standard',
    'MONTHLY',499.00, '2026-08-01', '2026-08-31', '01:30:00',
    '2026-08-01 01:35:00', 0, 'CANCELLED', '2026-11-19 10:00:00'
);


-- Insert another subscription with decimal amount

INSERT INTO subscriptions (
    subscription_id,subscription_code,subscriber_name,
    subscriber_email, plan_name, billing_cycle,
    amount, start_date, end_date, renewal_time,
    last_payment_at, auto_renew, subscription_status,created_at
)
VALUES (
    6,'SUB260006', 'Ananya Rao', 'ananya@example.com',
    'Premium','MONTHLY', 899.75, '2026-11-15',
    '2026-12-14','04:00:00','2026-11-15 04:05:00',
    1,'ACTIVE', '2026-11-19 10:15:00'
);


-- Insert subscription with renewal time 05:30:00

INSERT INTO subscriptions (
    subscription_id, subscription_code,subscriber_name,
    subscriber_email,plan_name, billing_cycle,amount,
    start_date,end_date,renewal_time,last_payment_at,
    auto_renew, subscription_status,created_at
)
VALUES (
    7,'SUB260007','Vikram Reddy','vikram@example.com', 'Basic',
    'MONTHLY', 299.50,'2026-11-18','2026-12-17','05:30:00',
    '2026-11-18 05:35:00',1,'ACTIVE','2026-11-19 10:30:00'
);


-- C. UPDATE EXERCISES

-- SUB-U1: Upgrade SUB260001 to Premium

UPDATE subscriptions
SET
    plan_name = 'Premium',
    amount = 799.50
WHERE subscription_code = 'SUB260001';


-- SUB-U2: Activate SUB260004 and enable auto-renewal

UPDATE subscriptions
SET
    subscription_status = 'ACTIVE',
    auto_renew = 1
WHERE subscription_code = 'SUB260004';


-- SUB-U3: Increase amount of MONTHLY ACTIVE
-- subscriptions by 5%

UPDATE subscriptions
SET amount = ROUND(amount * 1.05, 2)
WHERE billing_cycle = 'MONTHLY'
  AND subscription_status = 'ACTIVE';


-- SUB-U4: Cancel SUB260003, disable auto-renew,
-- and update end date

UPDATE subscriptions
SET
    subscription_status = 'CANCELLED',
    auto_renew = 0,
    end_date = '2026-11-30'
WHERE subscription_code = 'SUB260003';


-- SUB-U5: Change renewal time of YEARLY subscriptions

UPDATE subscriptions
SET renewal_time = '02:30:00'
WHERE billing_cycle = 'YEARLY';


-- SUB-U6: Update last payment datetime

UPDATE subscriptions
SET last_payment_at = '2026-11-19 02:30:00'
WHERE subscription_code = 'SUB260002';


USE cdg_hyd_jfs_060;

-- A. CREATE TABLE

CREATE TABLE events (
    event_id INT,event_code VARCHAR(15),event_name VARCHAR(150),
    venue VARCHAR(150),city VARCHAR(80),start_date DATE,
    end_date DATE,start_time TIME,end_time TIME,capacity INT,
    registration_fee DECIMAL(10,2),event_type VARCHAR(20),
    event_status VARCHAR(20),created_at DATETIME
);

DESCRIBE events;

SHOW CREATE TABLE events;

-- B. INSERT

-- EVT-I1: Insert first event

INSERT INTO events (
    event_id, event_code, event_name, venue, city,
    start_date, end_date, start_time, end_time,
    capacity, registration_fee, event_type, event_status, created_at
)
VALUES (
    1, 'EVT-JAVA-01', 'Java Developer Meetup', 'Tech Hall', 'Bengaluru',
    '2026-12-10', '2026-12-10', '09:00:00', '17:00:00',
    250, 500.00, 'OFFLINE', 'OPEN', '2026-11-19 10:00:00'
);


-- EVT-I2: Insert webinar and summit using multi-row INSERT

INSERT INTO events (
    event_id, event_code, event_name, venue, city,
    start_date, end_date, start_time, end_time,
    capacity, registration_fee, event_type, event_status, created_at
)
VALUES
(
    2, 'EVT-CLOUD-02', 'Cloud Fundamentals Webinar', 'Online Platform', 'Online',
    '2026-12-12', '2026-12-12', '10:00:00', '12:00:00',
    1000, 0.00, 'ONLINE', 'OPEN', '2026-11-19 10:05:00'
),
(
    3, 'EVT-DATA-03', 'Data Engineering Summit', 'Convention Centre', 'Hyderabad',
    '2027-01-05', '2027-01-06', '09:30:00', '18:00:00',
    600, 2500.50, 'HYBRID', 'PLANNED', '2026-11-19 10:10:00'
);


-- EVT-I3: Insert UI workshop with all columns explicitly supplied

INSERT INTO events (
    event_id, event_code, event_name, venue, city,
    start_date, end_date, start_time, end_time,
    capacity, registration_fee, event_type, event_status, created_at
)
VALUES (
    4, 'EVT-UI-04', 'UI Design Workshop', 'Creative Hub', 'Chennai',
    '2026-12-20', '2026-12-20', '14:00:00', '17:30:00',
    80, 1200.75, 'OFFLINE', 'PLANNED', '2026-11-19 10:15:00'
);


-- EVT-I4: Insert Python bootcamp

INSERT INTO events (
    event_id, event_code, event_name, venue, city,
    start_date, end_date, start_time, end_time,
    capacity, registration_fee, event_type, event_status, created_at
)
VALUES (
    5, 'EVT-PY-05', 'Python Bootcamp', 'Learning Centre', 'Pune',
    '2027-01-10', '2027-01-12', '09:00:00', '16:00:00',
    100, 1800.00, 'OFFLINE', 'OPEN', '2026-11-19 10:20:00'
);


-- Insert additional event with registration fee 999.99

INSERT INTO events (
    event_id, event_code, event_name, venue, city,
    start_date, end_date, start_time, end_time,
    capacity, registration_fee, event_type, event_status, created_at
)
VALUES (
    6, 'EVT-EXTRA-06', 'SQL Workshop', 'Training Hall', 'Hyderabad',
    '2027-01-15', '2027-01-15', '10:00:00', '16:00:00',
    150, 999.99, 'OFFLINE', 'OPEN', '2026-11-19 10:25:00'
);


-- C. UPDATE EXERCISES

-- EVT-U1: Increase summit capacity to 750

UPDATE events
SET capacity = 750
WHERE event_code = 'EVT-DATA-03';


-- EVT-U2: Change UI workshop status to OPEN

UPDATE events
SET event_status = 'OPEN'
WHERE event_code = 'EVT-UI-04';


-- EVT-U3: Increase fee of every paid offline event by 10%

UPDATE events
SET registration_fee = ROUND(registration_fee * 1.10, 2)
WHERE event_type = 'OFFLINE'
  AND registration_fee > 0;


-- EVT-U4: Reschedule both dates of cloud webinar one day later

UPDATE events
SET start_date = DATE_ADD(start_date, INTERVAL 1 DAY),
    end_date = DATE_ADD(end_date, INTERVAL 1 DAY)
WHERE event_code = 'EVT-CLOUD-02';


-- EVT-U5: Change Java meetup start time

UPDATE events
SET start_time = '10:00:00'
WHERE event_code = 'EVT-JAVA-01';


-- EVT-U6: Update created_at for one selected event

UPDATE events
SET created_at = '2026-11-19 22:00:00'
WHERE event_code = 'EVT-PY-05';



USE cdg_hyd_jfs_060;

-- A. CREATE TABLE

CREATE TABLE events (
    event_id INT,event_code VARCHAR(15), event_name VARCHAR(150),
    venue VARCHAR(150),city VARCHAR(80),start_date DATE,
    end_date DATE,start_time TIME,end_time TIME,capacity INT,
    registration_fee DECIMAL(10,2), event_type VARCHAR(20),
    event_status VARCHAR(20), created_at DATETIME
);

DESCRIBE events;

SHOW CREATE TABLE events;

-- B. INSERT EXERCISES

-- EVT-I1: Insert first event

INSERT INTO events (
    event_id, event_code, event_name, venue, city,
    start_date, end_date, start_time, end_time,
    capacity, registration_fee, event_type, event_status, created_at
)
VALUES (
    1, 'EVT-JAVA-01', 'Java Developer Meetup', 'Tech Hall', 'Bengaluru',
    '2026-12-10', '2026-12-10', '09:00:00', '17:00:00',
    250, 500.00, 'OFFLINE', 'OPEN', '2026-11-19 10:00:00'
);


-- EVT-I2: Insert webinar and summit using multi-row INSERT

INSERT INTO events (
    event_id, event_code, event_name, venue, city,
    start_date, end_date, start_time, end_time,
    capacity, registration_fee, event_type, event_status, created_at
)
VALUES
(
    2, 'EVT-CLOUD-02', 'Cloud Fundamentals Webinar', 'Online Platform', 'Online',
    '2026-12-12', '2026-12-12', '10:00:00', '12:00:00',
    1000, 0.00, 'ONLINE', 'OPEN', '2026-11-19 10:05:00'
),
(
    3, 'EVT-DATA-03', 'Data Engineering Summit', 'Convention Centre', 'Hyderabad',
    '2027-01-05', '2027-01-06', '09:30:00', '18:00:00',
    600, 2500.50, 'HYBRID', 'PLANNED', '2026-11-19 10:10:00'
);


-- EVT-I3: Insert UI workshop with all columns explicitly supplied

INSERT INTO events (
    event_id, event_code, event_name, venue, city,
    start_date, end_date, start_time, end_time,
    capacity, registration_fee, event_type, event_status, created_at
)
VALUES (
    4, 'EVT-UI-04', 'UI Design Workshop', 'Creative Hub', 'Chennai',
    '2026-12-20', '2026-12-20', '14:00:00', '17:30:00',
    80, 1200.75, 'OFFLINE', 'PLANNED', '2026-11-19 10:15:00'
);


-- EVT-I4: Insert Python bootcamp

INSERT INTO events (
    event_id, event_code, event_name, venue, city,
    start_date, end_date, start_time, end_time,
    capacity, registration_fee, event_type, event_status, created_at
)
VALUES (
    5, 'EVT-PY-05', 'Python Bootcamp', 'Learning Centre', 'Pune',
    '2027-01-10', '2027-01-12', '09:00:00', '16:00:00',
    100, 1800.00, 'OFFLINE', 'OPEN', '2026-11-19 10:20:00'
);


-- Insert additional event with registration fee 999.99

INSERT INTO events (
    event_id, event_code, event_name, venue, city,
    start_date, end_date, start_time, end_time,
    capacity, registration_fee, event_type, event_status, created_at
)
VALUES (
    6, 'EVT-EXTRA-06', 'SQL Workshop', 'Training Hall', 'Hyderabad',
    '2027-01-15', '2027-01-15', '10:00:00', '16:00:00',
    150, 999.99, 'OFFLINE', 'OPEN', '2026-11-19 10:25:00'
);


-- C. UPDATE EXERCISES

-- EVT-U1: Increase summit capacity to 750

UPDATE events
SET capacity = 750
WHERE event_code = 'EVT-DATA-03';


-- EVT-U2: Change UI workshop status to OPEN

UPDATE events
SET event_status = 'OPEN'
WHERE event_code = 'EVT-UI-04';


-- EVT-U3: Increase fee of every paid offline event by 10%

UPDATE events
SET registration_fee = ROUND(registration_fee * 1.10, 2)
WHERE event_type = 'OFFLINE'
  AND registration_fee > 0;


-- EVT-U4: Reschedule both dates of cloud webinar one day later

UPDATE events
SET start_date = DATE_ADD(start_date, INTERVAL 1 DAY),
    end_date = DATE_ADD(end_date, INTERVAL 1 DAY)
WHERE event_code = 'EVT-CLOUD-02';


-- EVT-U5: Change Java meetup start time

UPDATE events
SET start_time = '10:00:00'
WHERE event_code = 'EVT-JAVA-01';


-- EVT-U6: Update created_at for one selected event

UPDATE events
SET created_at = '2026-11-19 22:00:00'
WHERE event_code = 'EVT-PY-05';



USE cdg_hyd_jfs_060;

-- A. CREATE TABLE

CREATE TABLE restaurants (
    restaurant_id INT, restaurant_code VARCHAR(12),
    restaurant_name VARCHAR(120),cuisine_type VARCHAR(80),
    city VARCHAR(80),phone VARCHAR(15),
    seating_capacity INT,average_cost_for_two DECIMAL(10,2),
    rating DECIMAL(3,2),opening_time TIME,
    closing_time TIME,opened_date DATE,
    last_review_at DATETIME, opening_status VARCHAR(25)
);

DESCRIBE restaurants;

SHOW CREATE TABLE restaurants;

-- B. INSERT EXERCISES

-- RES-I1: Insert first restaurant

INSERT INTO restaurants (
    restaurant_id, restaurant_code, restaurant_name, cuisine_type,
    city, phone, seating_capacity, average_cost_for_two,
    rating, opening_time, closing_time, opened_date,
    last_review_at, opening_status
)
VALUES (
    1, 'RES-BLR-001', 'Spice Courtyard', 'Indian',
    'Bengaluru', '9876601001', 80, 1200.50,
    4.40, '11:00:00', '23:00:00', '2018-06-15',
    '2026-11-19 10:00:00', 'OPEN'
);


-- RES-I2: Insert next two restaurants using multi-row INSERT

INSERT INTO restaurants (
    restaurant_id, restaurant_code, restaurant_name, cuisine_type,
    city, phone, seating_capacity, average_cost_for_two,
    rating, opening_time, closing_time, opened_date,
    last_review_at, opening_status
)
VALUES
(
    2, 'RES-CHE-002', 'Green Banana Leaf', 'South Indian',
    'Chennai', '9876601002', 60, 700.75,
    4.60, '08:00:00', '22:00:00', '2020-02-10',
    '2026-11-19 10:05:00', 'OPEN'
),
(
    3, 'RES-MUM-003', 'Coastal Plate', 'Seafood',
    'Mumbai', '9876601003', 100, 1800.00,
    4.20, '12:00:00', '23:30:00', '2017-09-21',
    '2026-11-19 10:10:00', 'OPEN'
);


-- RES-I3: Insert Hyderabad restaurant with all columns explicitly supplied

INSERT INTO restaurants (
    restaurant_id, restaurant_code, restaurant_name, cuisine_type,
    city, phone, seating_capacity, average_cost_for_two,
    rating, opening_time, closing_time, opened_date,
    last_review_at, opening_status
)
VALUES (
    4, 'RES-HYD-004', 'Urban Bowl', 'Fusion',
    'Hyderabad', '9876601004', 45, 950.50,
    4.00, '10:00:00', '22:30:00', '2026-01-12',
    '2026-11-19 10:15:00', 'OPEN'
);


-- RES-I4: Insert Pune restaurant

INSERT INTO restaurants (
    restaurant_id, restaurant_code, restaurant_name, cuisine_type,
    city, phone, seating_capacity, average_cost_for_two,
    rating, opening_time, closing_time, opened_date,
    last_review_at, opening_status
)
VALUES (
    5, 'RES-PUN-005', 'The Coffee Table', 'Cafe',
    'Pune', '9876601005', 35, 450.25,
    4.30, '07:00:00', '21:00:00', '2022-05-01',
    '2026-11-19 10:20:00', 'OPEN'
);


-- Insert another restaurant with rating 3.85

INSERT INTO restaurants (
    restaurant_id, restaurant_code, restaurant_name, cuisine_type,
    city, phone, seating_capacity, average_cost_for_two,
    rating, opening_time, closing_time, opened_date,
    last_review_at, opening_status
)
VALUES (
    6, 'RES-EXTRA-006', 'Food Junction', 'Multi Cuisine',
    'Hyderabad', '9876601006', 55, 850.00,
    3.85, '09:00:00', '22:00:00', '2023-08-15',
    '2026-11-19 10:25:00', 'OPEN'
);

-- C. UPDATE EXERCISES

-- RES-U1: Change rating of RES-BLR-001 to 4.55

UPDATE restaurants
SET rating = 4.55
WHERE restaurant_code = 'RES-BLR-001';


-- RES-U2: Increase average cost by 10% for Mumbai restaurants

UPDATE restaurants
SET average_cost_for_two = ROUND(average_cost_for_two * 1.10, 2)
WHERE city = 'Mumbai';


-- RES-U3: Change rating of RES-HYD-004 to 4.25

UPDATE restaurants
SET rating = 4.25
WHERE restaurant_code = 'RES-HYD-004';


-- RES-U4: Change opening time of every OPEN restaurant to 10:00:00

UPDATE restaurants
SET opening_time = '10:00:00'
WHERE opening_status = 'OPEN';


-- RES-U5: Update last review datetime of RES-CHE-002

UPDATE restaurants
SET last_review_at = '2026-11-19 22:00:00'
WHERE restaurant_code = 'RES-CHE-002';


-- RES-U6: Increase seating capacity by 10 for restaurants
-- having fewer than 60 seats

UPDATE restaurants
SET seating_capacity = seating_capacity + 10
WHERE seating_capacity < 60;



USE cdg_hyd_jfs_060;

-- A. CREATE TABLE

CREATE TABLE insurance_policies (
    policy_id INT,policy_number VARCHAR(14),policyholder_name VARCHAR(120),
    policy_type VARCHAR(20),coverage_amount DECIMAL(14,2),
    premium_amount DECIMAL(10,2), start_date DATE, end_date DATE,
    payment_frequency VARCHAR(20), payment_time TIME,
    last_payment_at DATETIME,nominee_name VARCHAR(120),
    policy_status VARCHAR(20),created_at DATETIME
);

DESCRIBE insurance_policies;

SHOW CREATE TABLE insurance_policies;


-- B. INSERT EXERCISES

-- POL-I1: Insert health and vehicle policies

INSERT INTO insurance_policies (
    policy_id, policy_number, policyholder_name, policy_type,
    coverage_amount, premium_amount, start_date, end_date,
    payment_frequency, payment_time, last_payment_at,
    nominee_name, policy_status, created_at
)
VALUES
(
    1, 'POL00000000001', 'Aditi Rao', 'HEALTH',
    1000000.00, 18000.50, '2026-01-01', '2026-12-31',
    'ANNUAL', '09:00:00', '2026-01-01 09:05:00',
    'Rohan Rao', 'ACTIVE', '2026-11-19 10:00:00'
),
(
    2, 'POL00000000002', 'Dev Kapoor', 'VEHICLE',
    800000.00, 22000.75, '2026-04-15', '2027-04-14',
    'QUARTERLY', '10:00:00', '2026-10-15 10:15:00',
    NULL, 'ACTIVE', '2026-11-19 10:05:00'
);


-- POL-I2: Insert life policy

INSERT INTO insurance_policies (
    policy_id, policy_number, policyholder_name, policy_type,
    coverage_amount, premium_amount, start_date, end_date,
    payment_frequency, payment_time, last_payment_at,
    nominee_name, policy_status, created_at
)
VALUES (
    3, 'POL00000000003', 'Meera Nair', 'LIFE',
    5000000.00, 36000.00, '2026-06-01', '2046-05-31',
    'ANNUAL', '11:00:00', '2026-06-01 11:05:00',
    'Arun Nair', 'ACTIVE', '2026-11-19 10:10:00'
);


-- POL-I3: Insert remaining two policies

INSERT INTO insurance_policies (
    policy_id, policy_number, policyholder_name, policy_type,
    coverage_amount, premium_amount, start_date, end_date,
    payment_frequency, payment_time, last_payment_at,
    nominee_name, policy_status, created_at
)
VALUES
(
    4, 'POL00000000004', 'Kabir Shah', 'TRAVEL',
    500000.00, 4500.50, '2026-10-01', '2026-10-31',
    'MONTHLY', '08:30:00', '2026-10-01 08:35:00',
    NULL, 'ACTIVE', '2026-11-19 10:15:00'
),
(
    5, 'POL00000000005', 'Sara Das', 'HOME',
    2000000.00, 15000.25, '2025-01-01', '2025-12-31',
    'ANNUAL', '12:00:00', '2025-01-01 12:05:00',
    NULL, 'CANCELLED', '2026-11-19 10:20:00'
);


-- Insert another fictional policy with decimal premium

INSERT INTO insurance_policies (
    policy_id, policy_number, policyholder_name, policy_type,
    coverage_amount, premium_amount, start_date, end_date,
    payment_frequency, payment_time, last_payment_at,
    nominee_name, policy_status, created_at
)
VALUES (
    6, 'POL00000000006', 'Ananya Sharma', 'HEALTH',
    1500000.00, 12550.75, '2026-11-01', '2027-10-31',
    'MONTHLY', '09:30:00', '2026-11-01 09:35:00',
    'Rahul Sharma', 'ACTIVE', '2026-11-19 10:25:00'
);


-- Insert a policy with payment time 15:30:00

INSERT INTO insurance_policies (
    policy_id, policy_number, policyholder_name, policy_type,
    coverage_amount, premium_amount, start_date, end_date,
    payment_frequency, payment_time, last_payment_at,
    nominee_name, policy_status, created_at
)
VALUES (
    7, 'POL00000000007', 'Vikram Reddy', 'VEHICLE',
    900000.00, 18500.50, '2026-11-01', '2027-10-31',
    'QUARTERLY', '15:30:00', '2026-11-01 15:35:00',
    'Priya Reddy', 'ACTIVE', '2026-11-19 10:30:00'
);

-- C. UPDATE EXERXISES

-- POL-U1: Increase coverage to 1250000.00

UPDATE insurance_policies
SET coverage_amount = 1250000.00
WHERE policy_number = 'POL00000000001';


-- POL-U2: Add nominee Sara Kapoor

UPDATE insurance_policies
SET nominee_name = 'Sara Kapoor'
WHERE policy_number = 'POL00000000002';


-- POL-U3: Increase premiums of active vehicle policies by 5%

UPDATE insurance_policies
SET premium_amount = ROUND(premium_amount * 1.05, 2)
WHERE policy_type = 'VEHICLE'
  AND policy_status = 'ACTIVE';


-- POL-U4: Change payment frequency to ANNUAL

UPDATE insurance_policies
SET payment_frequency = 'ANNUAL'
WHERE policy_number = 'POL00000000004';


-- POL-U5: Update last payment datetime of life policy

UPDATE insurance_policies
SET last_payment_at = '2026-11-19 11:30:00'
WHERE policy_number = 'POL00000000003';


-- POL-U6: Change end date of vehicle policy

UPDATE insurance_policies
SET end_date = '2027-05-14'
WHERE policy_number = 'POL00000000002';



USE cdg_hyd_jfs_060;

-- A. CREATE TABLE

CREATE TABLE job_postings (
    job_id INT, job_code VARCHAR(15),job_title VARCHAR(150),
    department VARCHAR(100),location VARCHAR(100),
    employment_type VARCHAR(20), minimum_salary DECIMAL(12,2),
    maximum_salary DECIMAL(12,2),vacancies INT,posted_date DATE,
    closing_date DATE,interview_start_time TIME,interview_end_time TIME,
    last_updated_at DATETIME,job_status VARCHAR(20)
);

DESCRIBE job_postings;

SHOW CREATE TABLE job_postings;


-- B. INSERT EXERCISES

-- JOB-I1: Insert Java and QA positions

INSERT INTO job_postings (
    job_id, job_code, job_title, department, location,
    employment_type, minimum_salary, maximum_salary, vacancies,
    posted_date, closing_date, interview_start_time,
    interview_end_time, last_updated_at, job_status
)
VALUES
(
    1, 'JOB-JAVA-001', 'Java Developer', 'Engineering', 'Bengaluru',
    'FULL_TIME', 700000.00, 1200000.00, 3,
    '2026-11-01', '2026-12-01', '10:00:00', '12:00:00',
    '2026-11-19 10:00:00', 'OPEN'
),
(
    2, 'JOB-QA-002', 'QA Automation Engineer', 'Quality Assurance', 'Hyderabad',
    'CONTRACT', 600000.50, 900000.00, 2,
    '2026-11-02', '2026-11-25', '14:00:00', '16:00:00',
    '2026-11-19 10:05:00', 'OPEN'
);


-- JOB-I2: Insert internship with all columns explicitly supplied

INSERT INTO job_postings (
    job_id, job_code, job_title, department, location,
    employment_type, minimum_salary, maximum_salary, vacancies,
    posted_date, closing_date, interview_start_time,
    interview_end_time, last_updated_at, job_status
)
VALUES (
    3, 'JOB-INT-003', 'Software Intern', 'Engineering', 'Chennai',
    'INTERNSHIP', 180000.00, 240000.00, 5,
    '2026-11-03', '2026-11-20', '09:00:00', '11:00:00',
    '2026-11-19 10:10:00', 'OPEN'
);


-- JOB-I3: Insert remaining positions

INSERT INTO job_postings (
    job_id, job_code, job_title, department, location,
    employment_type, minimum_salary, maximum_salary, vacancies,
    posted_date, closing_date, interview_start_time,
    interview_end_time, last_updated_at, job_status
)
VALUES
(
    4, 'JOB-HR-004', 'HR Coordinator', 'Human Resources', 'Mumbai',
    'PART_TIME', 300000.00, 450000.75, 1,
    '2026-11-04', '2026-11-28', '11:00:00', '13:00:00',
    '2026-11-19 10:15:00', 'DRAFT'
),
(
    5, 'JOB-OLD-005', 'Cancelled Test Role', 'Training', 'Pune',
    'FULL_TIME', 250000.00, 350000.00, 1,
    '2026-10-01', '2026-10-15', '15:00:00', '17:00:00',
    '2026-11-19 10:20:00', 'CANCELLED'
);


-- Insert additional job with decimal salary values

INSERT INTO job_postings (
    job_id, job_code, job_title, department, location,
    employment_type, minimum_salary, maximum_salary, vacancies,
    posted_date, closing_date, interview_start_time,
    interview_end_time, last_updated_at, job_status
)
VALUES (
    6, 'JOB-DEV-006', 'Software Engineer', 'Engineering', 'Hyderabad',
    'FULL_TIME', 550000.50, 850000.75, 2,
    '2026-11-05', '2026-12-05', '10:00:00', '12:00:00',
    '2026-11-19 10:25:00', 'OPEN'
);


-- Insert job with interview schedule 09:30 to 11:30

INSERT INTO job_postings (
    job_id, job_code, job_title, department, location,
    employment_type, minimum_salary, maximum_salary, vacancies,
    posted_date, closing_date, interview_start_time,
    interview_end_time, last_updated_at, job_status
)
VALUES (
    7, 'JOB-TEST-007', 'Junior Developer', 'Engineering', 'Chennai',
    'FULL_TIME', 400000.00, 600000.00, 3,
    '2026-11-06', '2026-12-06', '09:30:00', '11:30:00',
    '2026-11-19 10:30:00', 'OPEN'
);

-- C. UPDATE EXERCISES

-- JOB-U1: Increase maximum salary of Java Developer

UPDATE job_postings
SET maximum_salary = 1300000.00
WHERE job_code = 'JOB-JAVA-001';


-- JOB-U2: Increase QA vacancies from 2 to 4

UPDATE job_postings
SET vacancies = 4
WHERE job_code = 'JOB-QA-002';


-- JOB-U3: Change HR Coordinator status from DRAFT to OPEN

UPDATE job_postings
SET job_status = 'OPEN'
WHERE job_code = 'JOB-HR-004';


-- JOB-U4: Increase both salary limits of open engineering jobs by 8%

UPDATE job_postings
SET minimum_salary = ROUND(minimum_salary * 1.08, 2),
    maximum_salary = ROUND(maximum_salary * 1.08, 2)
WHERE department = 'Engineering'
  AND job_status = 'OPEN';


-- JOB-U5: Change closing date of Software Intern

UPDATE job_postings
SET closing_date = '2026-11-30'
WHERE job_code = 'JOB-INT-003';


-- JOB-U6: Change Java Developer interview timings

UPDATE job_postings
SET interview_start_time = '14:00:00',
    interview_end_time = '16:00:00'
WHERE job_code = 'JOB-JAVA-001';


-- JOB-U7: Update last_updated_at of one selected job

UPDATE job_postings
SET last_updated_at = '2026-11-19 22:00:00'
WHERE job_code = 'JOB-QA-002';
