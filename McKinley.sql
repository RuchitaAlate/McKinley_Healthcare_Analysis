-- Create a new database
CREATE DATABASE IF NOT EXISTS McKinley_Healthcare;

-- Use the newly created database
USE McKinley_Healthcare;

-- Create Patient table
CREATE TABLE IF NOT EXISTS Patient (
    Net_ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    DOB DATE,
    Gender VARCHAR(10),
    Contact_Number VARCHAR(20),
    Address VARCHAR(255),
    Email VARCHAR(255),
    Phone_number VARCHAR(20)
);

-- Create Emergency Contact table
CREATE TABLE IF NOT EXISTS Emergency_Contact (
    Contact_ID INT PRIMARY KEY NOT NULL,
    Patient_Net_ID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Relationship VARCHAR(100),
    Contact_Number VARCHAR(20),
    FOREIGN KEY (Patient_Net_ID) REFERENCES Patient(Net_ID) ON DELETE CASCADE
);

-- Create Insurance table
CREATE TABLE IF NOT EXISTS Insurance (
    Insurance_ID INT PRIMARY KEY NOT NULL,
    Net_ID INT NOT NULL,
    Insurance_Provider VARCHAR(100) NOT NULL,
    Policy_Number VARCHAR(50) NOT NULL,
    Coverage_Details VARCHAR(255),
    FOREIGN KEY (Net_ID) REFERENCES Patient(Net_ID) ON DELETE CASCADE
);


-- Create Bills table
CREATE TABLE IF NOT EXISTS Bills (
    Bill_ID INT PRIMARY KEY NOT NULL,
    Net_ID INT NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    Payment_Status VARCHAR(20),
    FOREIGN KEY (Net_ID) REFERENCES Patient(Net_ID) ON DELETE CASCADE
);

-- Create McKinley Health Kits table
CREATE TABLE IF NOT EXISTS McKinley_Health_Kits (
    Health_Kit_ID INT PRIMARY KEY NOT NULL,
    Net_ID INT NOT NULL,
    Health_Kit_Type VARCHAR(100) NOT NULL,
    Date_Taken DATE,
    Quantity_Taken INT,
    FOREIGN KEY (Net_ID) REFERENCES Patient(Net_ID) ON DELETE CASCADE
);

-- Create Medical History table
CREATE TABLE IF NOT EXISTS Medical_History (
    History_ID INT PRIMARY KEY NOT NULL,
    Net_ID INT NOT NULL,
    Medical_Condition VARCHAR(255) NOT NULL,
    Diagnosis_Date DATE,
    Treatment_Plan TEXT,
    FOREIGN KEY (Net_ID) REFERENCES Patient(Net_ID) ON DELETE CASCADE
);

-- Create Lab Screening table
CREATE TABLE IF NOT EXISTS Lab_Screening (
    Screening_ID INT PRIMARY KEY NOT NULL,
    Net_ID INT NOT NULL,
    Test_Name VARCHAR(100) NOT NULL,
    Test_Date DATE,
    Test_Result VARCHAR(255),
    FOREIGN KEY (Net_ID) REFERENCES Patient(Net_ID) ON DELETE CASCADE
);

-- Create Department table
CREATE TABLE IF NOT EXISTS Department (
    Department_ID INT PRIMARY KEY NOT NULL,
    Department_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

-- Create Nurse table
CREATE TABLE IF NOT EXISTS Nurse (
    Nurse_ID INT PRIMARY KEY NOT NULL,
    Department_ID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(20),
    Email VARCHAR(255),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE CASCADE
);

-- Create Doctor table
CREATE TABLE IF NOT EXISTS Doctor (
    Doctor_ID INT PRIMARY KEY NOT NULL,
    Department_ID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(20),
    Email VARCHAR(255),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE CASCADE
);

-- Create Appointment table
CREATE TABLE IF NOT EXISTS Appointment (
    Appointment_ID INT PRIMARY KEY NOT NULL,
    Net_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Appointment_Date DATETIME,
    Appointment_Type VARCHAR(100),
    Appointment_Status VARCHAR(50),
    FOREIGN KEY (Net_ID) REFERENCES Patient(Net_ID) ON DELETE CASCADE,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID) ON DELETE CASCADE
);

-- Create Prescription table
CREATE TABLE IF NOT EXISTS Prescription (
    Prescription_ID INT PRIMARY KEY NOT NULL,
    Net_ID INT NOT NULL,
    Medication_Name VARCHAR(255) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    Frequency VARCHAR(50) NOT NULL,
    Prescription_Date DATE,
    Expiration_Date DATE,
    Appointment_ID INT,
    FOREIGN KEY (Net_ID) REFERENCES Patient(Net_ID) ON DELETE CASCADE,
    FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID) ON DELETE SET NULL
);

Select * from Patient;
-- Inserting into each table
-- Inserting records into the Patient table
INSERT INTO Patient (Net_ID, Name, DOB, Gender, Contact_Number, Address, Email, Phone_number) 
VALUES
(1, 'John Doe', '1990-05-15', 'Male', '123-456-7890', '123 Main St, Anytown, USA', 'john.doe@example.com', '987-654-3210'),
(2, 'Jane Smith', '1985-10-20', 'Female', '987-654-3210', '456 Elm St, Anytown, USA', 'jane.smith@example.com', '123-456-7890'),
(3, 'Alice Johnson', '1978-08-25', 'Female', '555-555-5555', '789 Oak St, Anytown, USA', 'alice.johnson@example.com', '456-789-0123'),
(4, 'Bob Brown', '1982-03-12', 'Male', '111-222-3333', '321 Pine St, Anytown, USA', 'bob.brown@example.com', '789-012-3456'),
(5, 'Emily Wilson', '1995-11-30', 'Female', '444-555-6666', '654 Cedar St, Anytown, USA', 'emily.wilson@example.com', '012-345-6789'),
(6, 'Michael Davis', '1988-07-08', 'Male', '777-888-9999', '876 Maple St, Anytown, USA', 'michael.davis@example.com', '234-567-8901'),
(7, 'Jessica Parker', '1983-12-18', 'Female', '222-333-4444', '543 Birch St, Anytown, USA', 'jessica.parker@example.com', '345-678-9012'),
(8, 'William Turner', '1975-09-22', 'Male', '999-999-9999', '987 Oak St, Anytown, USA', 'william.turner@example.com', '456-789-0123'),
(9, 'Sophia Martinez', '1992-04-01', 'Female', '333-444-5555', '234 Pine St, Anytown, USA', 'sophia.martinez@example.com', '567-890-1234'),
(10, 'David Clark', '1980-01-05', 'Male', '666-777-8888', '678 Elm St, Anytown, USA', 'david.clark@example.com', '678-901-2345'),
(11, 'Olivia Hernandez', '1987-06-14', 'Female', '888-999-0000', '987 Cedar St, Anytown, USA', 'olivia.hernandez@example.com', '789-012-3456'),
(12, 'Daniel Lee', '1979-11-28', 'Male', '444-555-6666', '234 Birch St, Anytown, USA', 'daniel.lee@example.com', '890-123-4567'),
(13, 'Ava Nguyen', '1997-02-17', 'Female', '111-222-3333', '876 Maple St, Anytown, USA', 'ava.nguyen@example.com', '901-234-5678'),
(14, 'James Rodriguez', '1984-07-03', 'Male', '222-333-4444', '765 Oak St, Anytown, USA', 'james.rodriguez@example.com', '012-345-6789'),
(15, 'Isabella Kim', '1998-09-09', 'Female', '555-666-7777', '321 Elm St, Anytown, USA', 'isabella.kim@example.com', '123-456-7890'),
(16, 'Michael Brown', '1993-06-05', 'Male', '333-444-5555', '876 Birch St, Anytown, USA', 'michael.brown@example.com', '234-567-8901'),
(17, 'Emma Garcia', '2012-09-12', 'Female', '444-555-6666', '543 Pine St, Anytown, USA', 'emma.garcia@example.com', '345-678-9012'),
(18, 'Ethan Martinez', '1996-12-25', 'Male', '555-666-7777', '987 Cedar St, Anytown, USA', 'ethan.martinez@example.com', '456-789-0123'),
(19, 'Madison Lee', '1986-03-18', 'Female', '666-777-8888', '654 Oak St, Anytown, USA', 'madison.lee@example.com', '567-890-1234'),
(20, 'Noah Nguyen', '1999-08-30', 'Male', '777-888-9999', '321 Elm St, Anytown, USA', 'noah.nguyen@example.com', '678-901-2345'),
(21, 'Olivia Taylor', '1990-04-15', 'Female', '888-999-0000', '123 Maple St, Anytown, USA', 'olivia.taylor@example.com', '789-012-3456'),
(22, 'William Hernandez', '1980-07-20', 'Male', '999-000-1111', '789 Pine St, Anytown, USA', 'william.hernandez@example.com', '890-123-4567'),
(23, 'Ava Martinez', '2000-01-10', 'Female', '000-111-2222', '567 Cedar St, Anytown, USA', 'ava.martinez@example.com', '901-234-5678'),
(24, 'James Lee', '1975-11-28', 'Male', '111-222-3333', '876 Oak St, Anytown, USA', 'james.lee@example.com', '012-345-6789'),
(25, 'Sophia Nguyen', '1995-08-05', 'Female', '222-333-4444', '654 Elm St, Anytown, USA', 'sophia.nguyen@example.com', '123-456-7890'),
(26, 'Jacob Wilson', '1991-02-14', 'Male', '333-444-5555', '321 Birch St, Anytown, USA', 'jacob.wilson@example.com', '234-567-8901'),
(27, 'Mia Thompson', '1988-05-20', 'Female', '444-555-6666', '987 Cedar St, Anytown, USA', 'mia.thompson@example.com', '345-678-9012'),
(28, 'Ethan Hall', '1994-10-10', 'Male', '555-666-7777', '654 Elm St, Anytown, USA', 'ethan.hall@example.com', '456-789-0123'),
(29, 'Charlotte Martinez', '1997-03-28', 'Female', '666-777-8888', '321 Oak St, Anytown, USA', 'charlotte.martinez@example.com', '567-890-1234'),
(30, 'Alexander Rodriguez', '1992-08-07', 'Male', '777-888-9999', '876 Pine St, Anytown, USA', 'alexander.rodriguez@example.com', '678-901-2345'),
(31, 'Madison Garcia', '1987-12-15', 'Female', '888-999-0000', '543 Maple St, Anytown, USA', 'madison.garcia@example.com', '789-012-3456'),
(32, 'William Clark', '2008-01-02', 'Male', '999-000-1111', '234 Cedar St, Anytown, USA', 'william.clark@example.com', '890-123-4567'),
(33, 'Ava Lopez', '1996-06-19', 'Female', '000-111-2222', '987 Birch St, Anytown, USA', 'ava.lopez@example.com', '901-234-5678'),
(34, 'James Young', '1990-09-25', 'Male', '111-222-3333', '654 Oak St, Anytown, USA', 'james.young@example.com', '012-345-6789'),
(35, 'Sophia Adams', '2010-04-08', 'Female', '222-333-4444', '321 Cedar St, Anytown, USA', 'sophia.adams@example.com', '123-456-7890'),
(36, 'Daniel Martin', '2000-11-13', 'Male', '333-444-5555', '876 Pine St, Anytown, USA', 'daniel.martin@example.com', '234-567-8901'),
(37, 'Olivia Turner', '1994-10-30', 'Female', '444-555-6666', '543 Elm St, Anytown, USA', 'olivia.turner@example.com', '345-678-9012'),
(38, 'Noahi Perez', '1988-07-05', 'Female', '555-666-7777', '234 Birch St, Anytown, USA', 'noah.perez@example.com', '456-789-0123'),
(39, 'Isabella Wright', '1999-12-18', 'Female', '666-777-8888', '987 Maple St, Anytown, USA', 'isabella.wright@example.com', '567-890-1234'),
(40, 'Elijah Scott', '2015-03-22', 'Female', '777-888-9999', '654 Oak St, Anytown, USA', 'elijah.scott@example.com', '678-901-2345');


Select * from Emergency_Contact;
-- Inserting records into the Emergency_Contact table
INSERT INTO Emergency_Contact (Contact_ID, Patient_Net_ID, Name, Relationship, Contact_Number) 
VALUES
(1, 1, 'Mary Doe', 'Spouse', '555-555-5555'),
(2, 2, 'Bob Smith', 'Sibling', '666-666-6666'),
(3, 3, 'Alice Johnson', 'Spouse', '777-777-7777'),
(4, 4, 'Jane Brown', 'Sibling', '888-888-8888'),
(5, 5, 'Michael Wilson', 'Parent', '999-999-9999'),
(6, 6, 'Sarah Davis', 'Spouse', '111-111-1111'),
(7, 7, 'Mark Parker', 'Sibling', '222-222-2222'),
(8, 8, 'Laura Turner', 'Spouse', '333-333-3333'),
(9, 9, 'Chris Martinez', 'Sibling', '444-444-4444'),
(10, 10, 'Emily Clark', 'Parent', '555-555-5555'),
(11, 11, 'Daniel Hernandez', 'Spouse', '666-666-6666'),
(12, 12, 'Lily Lee', 'Parent', '777-777-7777'),
(13, 13, 'Ryan Nguyen', 'Sibling', '888-888-8888'),
(14, 14, 'Sophia Rodriguez', 'Spouse', '999-999-9999'),
(15, 15, 'Michael Kim', 'Sibling', '000-000-0000'),
(16, 16, 'Jessica Brown', 'Spouse', '888-999-0000'),
(17, 17, 'David Garcia', 'Sibling', '999-000-1111'),
(18, 18, 'Sophia Martinez', 'Parent', '000-111-2222'),
(19, 19, 'Andrew Lee', 'Sibling', '111-222-3333'),
(20, 20, 'Emily Nguyen', 'Spouse', '222-333-4444'),
(21, 21, 'Ethan Taylor', 'Parent', '555-666-7777'),
(22, 22, 'Olivia Hernandez', 'Spouse', '666-777-8888'),
(23, 23, 'Emily Martinez', 'Sibling', '777-888-9999'),
(24, 24, 'Emma Lee', 'Child', '888-999-0000'),
(25, 25, 'Noah Nguyen', 'Parent', '999-000-1111');

Select * from Insurance;
-- Inserting records into the Insurance table
INSERT INTO Insurance (Insurance_ID, Net_ID, Insurance_Provider, Policy_Number, Coverage_Details) 
VALUES
(1, 1, 'HealthCare Inc.', 'HC123456', 'Full coverage'),
(2, 2, 'MediCare', 'MC789012', 'Basic coverage'),
(3, 3, 'HealthPlus', 'HP345678', 'Dental and vision coverage'),
(4, 4, 'Wellness Insurance', 'WI901234', 'Wellness programs coverage'),
(5, 5, 'FamilyCare', 'FC567890', 'Family coverage'),
(6, 6, 'HealthGuard', 'HG678901', 'Comprehensive coverage'),
(7, 7, 'MediHealth', 'MH456789', 'Medication and treatment coverage'),
(8, 8, 'CareFirst', 'CF234567', 'Primary care and specialist coverage'),
(9, 9, 'SeniorCare', 'SC123890', 'Elderly care coverage'),
(10, 10, 'WellBeing', 'WB789012', 'Health and wellness coverage'),
(11, 11, 'FamilyHealth', 'FH567123', 'Family medical coverage'),
(12, 12, 'LifeCare', 'LC890456', 'Life-saving treatment coverage'),
(13, 13, 'DentalCare', 'DC123567', 'Dental treatment coverage'),
(14, 14, 'SecureHealth', 'SH456789', 'Secure health coverage'),
(15, 15, 'Guardian Insurance', 'GI789012', 'Comprehensive health coverage'),
(16, 16, 'HealthCare Inc.', 'HC123457', 'Full coverage'),
(17, 17, 'MediCare', 'MC789013', 'Basic coverage'),
(18, 18, 'HealthPlus', 'HP345679', 'Dental and vision coverage'),
(19, 19, 'Wellness Insurance', 'WI901235', 'Wellness programs coverage'),
(20, 20, 'FamilyCare', 'FC567891', 'Family coverage'),
(21, 21, 'FamilyCare', 'FC234567', 'Family coverage'),
(22, 22, 'HealthPlus', 'HP456789', 'Basic coverage'),
(23, 23, 'MediCare', 'MC678901', 'Dental coverage'),
(24, 24, 'Wellness Insurance', 'WI123456', 'Wellness programs coverage'),
(25, 25, 'HealthCare Inc.', 'HC345678', 'Full coverage');

Select * from Bills;
-- Inserting records into the Bills table
INSERT INTO Bills (Bill_ID, Net_ID, Total_Amount, Payment_Status) 
VALUES
(1, 1, 100.00, 'Paid'),
(2, 2, 150.00, 'Unpaid'),
(3, 3, 200.00, 'Paid'),
(4, 4, 120.00, 'Unpaid'),
(5, 5, 180.00, 'Paid'),
(6, 6, 220.00, 'Unpaid'),
(7, 7, 130.00, 'Paid'),
(8, 8, 170.00, 'Unpaid'),
(9, 9, 190.00, 'Paid'),
(10, 10, 210.00, 'Unpaid'),
(11, 11, 140.00, 'Paid'),
(12, 12, 160.00, 'Unpaid'),
(13, 13, 240.00, 'Paid'),
(14, 14, 260.00, 'Unpaid'),
(15, 15, 280.00, 'Paid'),
(16, 16, 150.00, 'Unpaid'),
(17, 17, 200.00, 'Paid'),
(18, 18, 220.00, 'Unpaid'),
(19, 19, 130.00, 'Paid'),
(20, 20, 170.00, 'Unpaid'),
(21, 21, 180.00, 'Unpaid'),
(22, 22, 250.00, 'Paid'),
(23, 23, 200.00, 'Unpaid'),
(24, 24, 300.00, 'Unpaid'),
(25, 25, 150.00, 'Paid');

Select * from McKinley_Health_Kits;
-- Inserting records into the McKinley_Health_Kits table
INSERT INTO McKinley_Health_Kits (Health_Kit_ID, Net_ID, Health_Kit_Type, Date_Taken, Quantity_Taken) 
VALUES
(1, 1, 'First Aid Kit', '2024-04-15', 1),
(2, 2, 'Medicine Kit', '2024-04-16', 2),
(3, 3, 'Home Health Kit', '2024-04-17', 1),
(4, 4, 'Wellness Kit', '2024-04-18', 1),
(5, 5, 'Family Health Kit', '2024-04-19', 3),
(6, 6, 'Emergency Kit', '2024-04-20', 1),
(7, 7, 'Medication Kit', '2024-04-21', 2),
(8, 8, 'Travel Health Kit', '2024-04-22', 1),
(9, 9, 'Senior Health Kit', '2024-04-23', 1),
(10, 10, 'Wellness Kit', '2024-04-24', 2),
(11, 11, 'Family Health Kit', '2024-04-25', 3),
(12, 12, 'Emergency Kit', '2024-04-26', 1),
(13, 13, 'Medicine Kit', '2024-04-27', 2),
(14, 14, 'Home Health Kit', '2024-04-28', 1),
(15, 15, 'First Aid Kit', '2024-04-29', 1),
(16, 16, 'First Aid Kit', '2024-04-30', 1),
(17, 17, 'Medicine Kit', '2024-05-01', 2),
(18, 18, 'Home Health Kit', '2024-05-02', 1),
(19, 19, 'Wellness Kit', '2024-05-03', 1),
(20, 20, 'Family Health Kit', '2024-05-04', 3),
(21, 21, 'Home Health Kit', '2024-05-30', 1),
(22, 22, 'Family Health Kit', '2024-06-01', 2),
(23, 23, 'Wellness Kit', '2024-06-02', 1),
(24, 24, 'First Aid Kit', '2024-06-03', 1),
(25, 25, 'Medicine Kit', '2024-06-04', 3);

Select * from Medical_History;
-- Inserting records into the Medical_History table
INSERT INTO Medical_History (History_ID, Net_ID, Medical_Condition, Diagnosis_Date, Treatment_Plan) 
VALUES
(1, 1, 'Hypertension', '2020-01-01', 'Prescribed medication and regular checkups'),
(2, 2, 'Diabetes', '2018-05-10', 'Insulin therapy and dietary changes'),
(3, 3, 'Asthma', '2019-07-15', 'Inhaler usage and avoiding triggers'),
(4, 4, 'Depression', '2021-03-20', 'Therapy sessions and antidepressant medication'),
(5, 5, 'Allergies', '2017-09-25', 'Avoidance of allergens and antihistamine medication'),
(6, 6, 'High Cholesterol', '2019-02-12', 'Cholesterol-lowering medication and diet changes'),
(7, 7, 'Flu', '2023-12-05', 'Antiviral medication and rest'),
(8, 8, 'Arthritis', '2016-08-30', 'Pain management medication and physical therapy'),
(9, 9, 'Anxiety', '2022-06-17', 'Therapy sessions and anti-anxiety medication'),
(10, 10, 'Migraine', '2015-03-22', 'Migraine medication and lifestyle changes'),
(11, 11, 'Heart Disease', '2019-10-10', 'Cardiac medication and lifestyle modifications'),
(12, 12, 'Eczema', '2018-04-02', 'Topical creams and avoiding triggers'),
(13, 13, 'Dental Cavities', '2023-02-28', 'Dental fillings and oral hygiene practices'),
(14, 14, 'Obesity', '2017-11-15', 'Dietary changes and exercise regimen'),
(15, 15, 'Insomnia', '2020-09-10', 'Sleep hygiene practices and relaxation techniques'),
(16, 16, 'Anemia', '2023-11-10', 'Iron supplements and dietary changes'),
(17, 17, 'Hypothyroidism', '2016-07-05', 'Thyroid hormone replacement therapy'),
(18, 18, 'Gastritis', '2022-05-15', 'Antacids and dietary modifications'),
(19, 19, 'Back Pain', '2015-09-20', 'Physical therapy and pain medication'),
(20, 20, 'Insomnia', '2023-03-25', 'Sleep hygiene practices and relaxation techniques'),
(21, 21, 'Migraine', '2023-10-20', 'Prescription medication and lifestyle modifications'),
(22, 22, 'Diabetes', '2018-05-15', 'Insulin therapy and dietary changes'),
(23, 23, 'Anxiety', '2022-08-25', 'Therapy and medication'),
(24, 24, 'Hypertension', '2017-09-30', 'Medication and lifestyle changes'),
(25, 25, 'Allergies', '2023-04-10', 'Antihistamines and allergen avoidance'),
(26, 26, 'Diabetes', '2023-04-10', 'Insulin therapy and dietary changes'),
(27, 27, 'Diabetes', '2023-09-10', 'Insulin therapy and dietary changes'),
(28, 28, 'Diabetes', '2023-06-10', 'Insulin therapy and dietary changes'),
(29, 29, 'Hypertension', '2023-04-10', 'Medication and lifestyle changes'),
(30, 30, 'Anxiety', '2023-08-10', 'Therapy and medication'),
(31, 31, 'Anxiety', '2023-02-10', 'Therapy and medication'),
(32, 32, 'Migraine', '2023-04-10', 'rescription medication and lifestyle modifications'),
(33, 33, 'Migraine', '2023-06-10', 'rescription medication and lifestyle modifications');


Select * from Lab_Screening;
-- Inserting records into the Lab_Screening table
INSERT INTO Lab_Screening (Screening_ID, Net_ID, Test_Name, Test_Date, Test_Result) 
VALUES
(1, 1, 'Blood Pressure', '2024-04-10', 'Normal'),
(2, 2, 'Blood Sugar', '2024-04-12', 'High'),
(3, 3, 'Lipid Profile', '2024-04-14', 'Normal'),
(4, 4, 'Thyroid Function', '2024-04-16', 'Abnormal'),
(5, 5, 'Allergy Panel', '2024-04-18', 'Positive'),
(6, 6, 'Liver Function Test', '2024-04-20', 'Normal'),
(7, 7, 'Kidney Function Test', '2024-04-22', 'Normal'),
(8, 8, 'Complete Blood Count', '2024-04-24', 'Normal'),
(9, 9, 'Urinalysis', '2024-04-26', 'Normal'),
(10, 10, 'Thyroid Function', '2024-04-28', 'Normal'),
(11, 11, 'Blood Pressure', '2024-04-30', 'High'),
(12, 12, 'Blood Sugar', '2024-05-02', 'Normal'),
(13, 13, 'Lipid Profile', '2024-05-04', 'High'),
(14, 14, 'Thyroid Function', '2024-05-06', 'Normal'),
(15, 15, 'Allergy Panel', '2024-05-08', 'Negative'),
(16, 16, 'Complete Blood Count', '2024-05-10', 'Normal'),
(17, 17, 'Liver Function Test', '2024-05-12', 'Abnormal'),
(18, 18, 'Kidney Function Test', '2024-05-14', 'Normal'),
(19, 19, 'Thyroid Function', '2024-05-16', 'Normal'),
(20, 20, 'Blood Pressure', '2024-05-18', 'High'),
(21, 21, 'Blood Sugar', '2024-06-10', 'Normal'),
(22, 22, 'Cholesterol', '2024-06-12', 'High'),
(23, 23, 'Stress Test', '2024-06-14', 'Normal'),
(24, 24, 'Blood Pressure', '2024-06-16', 'High'),
(25, 25, 'Allergy Test', '2024-06-18', 'Positive');

Select * from Department;
-- Inserting records into the Department table
INSERT INTO Department (Department_ID, Department_Name, Location) 
VALUES
(1, 'Cardiology', 'Main Building, 1st Floor'),
(2, 'Pediatrics', 'East Wing, 2nd Floor'),
(3, 'Dermatology', 'West Wing, 3rd Floor'),
(4, 'Orthopedics', 'North Wing, 4th Floor'),
(5, 'Neurology', 'South Wing, 5th Floor'),
(6, 'Oncology', 'Main Building, 2nd Floor'),
(7, 'Gastroenterology', 'East Wing, 3rd Floor'),
(8, 'Endocrinology', 'West Wing, 4th Floor'),
(9, 'Psychiatry', 'North Wing, 6th Floor'),
(10, 'Pulmonology', 'South Wing, 7th Floor'),
(11, 'Ophthalmology', 'Main Building, 3rd Floor'),
(12, 'Rheumatology', 'East Wing, 4th Floor'),
(13, 'Urology', 'West Wing, 5th Floor'),
(14, 'Dentistry', 'North Wing, 8th Floor'),
(15, 'Radiology', 'South Wing, 9th Floor');

Select * from Nurse;
-- Inserting records into the Nurse table
INSERT INTO Nurse (Nurse_ID, Department_ID, Name, Contact_Number, Email) 
VALUES
(1, 1, 'Sarah Johnson', '111-111-1111', 'sarah.johnson@example.com'),
(2, 2, 'Michael Williams', '222-222-2222', 'michael.williams@example.com'),
(3, 3, 'Emily Brown', '333-333-3333', 'emily.brown@example.com'),
(4, 4, 'Daniel Jones', '444-444-4444', 'daniel.jones@example.com'),
(5, 5, 'Jessica Taylor', '555-555-5555', 'jessica.taylor@example.com'),
(6, 6, 'Jennifer Martinez', '666-666-6666', 'jennifer.martinez@example.com'),
(7, 7, 'Andrew Garcia', '777-777-7777', 'andrew.garcia@example.com'),
(8, 8, 'Stephanie Rodriguez', '888-888-8888', 'stephanie.rodriguez@example.com'),
(9, 9, 'David Hernandez', '999-999-9999', 'david.hernandez@example.com'),
(10, 10, 'Jessica Kim', '000-000-0000', 'jessica.kim@example.com'),
(11, 11, 'Daniel Nguyen', '111-222-3333', 'daniel.nguyen@example.com'),
(12, 12, 'Sophia Lee', '222-333-4444', 'sophia.lee@example.com'),
(13, 13, 'Michael Smith', '333-444-5555', 'michael.smith@example.com'),
(14, 14, 'Emily Johnson', '444-555-6666', 'emily.johnson@example.com'),
(15, 15, 'Daniel Park', '555-666-7777', 'daniel.park@example.com');

Select * from Doctor;
-- Inserting records into the Doctor table
INSERT INTO Doctor (Doctor_ID, Department_ID, Name, Specialization, Contact_Number, Email) 
VALUES
(1, 1, 'Dr. Emily Carter', 'Cardiologist', '333-333-3333', 'emily.carter@example.com'),
(2, 2, 'Dr. James Anderson', 'Pediatrician', '444-444-4444', 'james.anderson@example.com'),
(3, 3, 'Dr. Jessica Brown', 'Dermatologist', '555-555-5555', 'jessica.brown@example.com'),
(4, 4, 'Dr. Michael Smith', 'Orthopedic Surgeon', '666-666-6666', 'michael.smith@example.com'),
(5, 5, 'Dr. Jennifer Lee', 'Neurologist', '777-777-7777', 'jennifer.lee@example.com'),
(6, 6, 'Dr. Andrew Garcia', 'Oncologist', '888-888-8888', 'andrew.garcia@example.com'),
(7, 7, 'Dr. Stephanie Rodriguez', 'Gastroenterologist', '999-999-9999', 'stephanie.rodriguez@example.com'),
(8, 8, 'Dr. David Hernandez', 'Endocrinologist', '000-000-0000', 'david.hernandez@example.com'),
(9, 9, 'Dr. Jessica Kim', 'Psychiatrist', '111-111-1111', 'jessica.kim@example.com'),
(10, 10, 'Dr. Daniel Nguyen', 'Pulmonologist', '222-222-2222', 'daniel.nguyen@example.com'),
(11, 11, 'Dr. Sophia Lee', 'Ophthalmologist', '333-333-3333', 'sophia.lee@example.com'),
(12, 12, 'Dr. Michael Smith', 'Rheumatologist', '444-444-4444', 'michael.smith@example.com'),
(13, 13, 'Dr. Emily Johnson', 'Urologist', '555-555-5555', 'emily.johnson@example.com'),
(14, 14, 'Dr. Daniel Park', 'Dentist', '666-666-6666', 'daniel.park@example.com'),
(15, 15, 'Dr. Jessica Taylor', 'Radiologist', '777-777-7777', 'jessica.taylor@example.com'),
(16, 1, 'Dr. Olivia Wilson', 'Cardiologist', '123-456-7890', 'olivia.wilson@example.com'),
(17, 2, 'Dr. William Martinez', 'Pediatrician', '234-567-8901', 'william.martinez@example.com'),
(18, 3, 'Dr. Sophia Brown', 'Dermatologist', '345-678-9012', 'sophia.brown@example.com'),
(19, 4, 'Dr. Noah Johnson', 'Orthopedic Surgeon', '456-789-0123', 'noah.johnson@example.com'),
(20, 5, 'Dr. Emma Rodriguez', 'Neurologist', '567-890-1234', 'emma.rodriguez@example.com'),
(21, 6, 'Dr. Ethan Garcia', 'Oncologist', '678-901-2345', 'ethan.garcia@example.com'),
(22, 7, 'Dr. Olivia Hernandez', 'Gastroenterologist', '789-012-3456', 'olivia.hernandez@example.com'),
(23, 8, 'Dr. William Kim', 'Endocrinologist', '890-123-4567', 'william.kim@example.com'),
(24, 9, 'Dr. Ava Nguyen', 'Psychiatrist', '901-234-5678', 'ava.nguyen@example.com'),
(25, 10, 'Dr. James Lee', 'Pulmonologist', '012-345-6789', 'james.lee@example.com'),
(26, 11, 'Dr. Sophia Hernandez', 'Ophthalmologist', '123-456-7890', 'sophia.hernandez@example.com'),
(27, 12, 'Dr. Ethan Smith', 'Rheumatologist', '234-567-8901', 'ethan.smith@example.com'),
(28, 13, 'Dr. Olivia Johnson', 'Urologist', '345-678-9012', 'olivia.johnson@example.com'),
(29, 14, 'Dr. William Park', 'Dentist', '456-789-0123', 'william.park@example.com'),
(30, 15, 'Dr. Emma Taylor', 'Radiologist', '567-890-1234', 'emma.taylor@example.com');

Select * from Appointment;
-- Inserting records into the Appointment table
INSERT INTO Appointment (Appointment_ID, Net_ID, Doctor_ID, Appointment_Date, Appointment_Type, Appointment_Status) 
VALUES
(1, 1, 1, '2024-04-20 10:00:00', 'Follow-up', 'Scheduled'),
(2, 2, 1, '2024-04-21 11:00:00', 'Check-up', 'Confirmed'),
(3, 3, 3, '2024-04-22 12:00:00', 'Consultation', 'Scheduled'),
(4, 4, 4, '2024-04-23 13:00:00', 'Procedure', 'Confirmed'),
(5, 5, 5, '2024-04-24 14:00:00', 'Follow-up', 'Scheduled'),
(6, 6, 6, '2024-04-25 15:00:00', 'Check-up', 'Confirmed'),
(7, 7, 7, '2024-04-26 16:00:00', 'Consultation', 'Scheduled'),
(8, 8, 7, '2024-04-27 17:00:00', 'Procedure', 'Confirmed'),
(9, 9, 8, '2024-04-28 18:00:00', 'Follow-up', 'Scheduled'),
(10, 10, 10, '2024-04-29 19:00:00', 'Check-up', 'Confirmed'),
(11, 11, 11, '2024-04-30 20:00:00', 'Consultation', 'Scheduled'),
(12, 12, 12, '2024-05-01 21:00:00', 'Procedure', 'Confirmed'),
(13, 13, 13, '2024-05-02 22:00:00', 'Follow-up', 'Scheduled'),
(14, 14, 14, '2024-05-03 23:00:00', 'Check-up', 'Confirmed'),
(15, 15, 15, '2024-05-04 08:00:00', 'Consultation', 'Scheduled'),
(16, 16, 15, '2024-05-20 10:00:00', 'Follow-up', 'Scheduled'),
(17, 17, 16, '2024-05-21 11:00:00', 'Check-up', 'Confirmed'),
(18, 18, 18, '2024-05-22 12:00:00', 'Consultation', 'Scheduled'),
(19, 19, 19, '2024-05-23 13:00:00', 'Procedure', 'Confirmed'),
(20, 20, 20, '2024-05-24 14:00:00', 'Follow-up', 'Scheduled'),
(21, 21, 26, '2024-06-20 10:00:00', 'Follow-up', 'Scheduled'),
(22, 22, 27, '2024-06-21 11:00:00', 'Check-up', 'Confirmed'),
(23, 23, 18, '2024-06-22 12:00:00', 'Consultation', 'Scheduled'),
(24, 24, 29, '2024-06-23 13:00:00', 'Procedure', 'Confirmed'),
(25, 25, 23, '2024-06-24 14:00:00', 'Follow-up', 'Scheduled');

Select * from Prescription;
-- Inserting records into the Prescription table
INSERT INTO Prescription (Prescription_ID, Net_ID, Medication_Name, Dosage, Frequency, Prescription_Date, Expiration_Date, Appointment_ID) 
VALUES
(1, 1, 'Lisinopril', '10mg', 'Once daily', '2024-04-20', '2024-05-20', 1),
(2, 2, 'Insulin', '10 units', 'Before meals', '2024-04-21', '2024-05-21', 2),
(3, 3, 'Clobetasol', '0.05%', 'Apply twice daily', '2024-04-22', '2024-05-22', 3),
(4, 4, 'Ibuprofen', '400mg', 'As needed', '2024-04-23', '2024-05-23', 4),
(5, 5, 'Sumatriptan', '50mg', 'As needed for migraines', '2024-04-24', '2024-05-24', 5),
(6, 6, 'Simvastatin', '20mg', 'Once daily at bedtime', '2024-04-25', '2024-05-25', 6),
(7, 7, 'Omeprazole', '20mg', 'Once daily before breakfast', '2024-04-26', '2024-05-26', 7),
(8, 8, 'Levothyroxine', '50mcg', 'Once daily before breakfast', '2024-04-27', '2024-05-27', 8),
(9, 9, 'Alprazolam', '0.5mg', 'As needed for anxiety', '2024-04-28', '2024-05-28', 9),
(10, 10, 'Sumatriptan', '100mg', 'As needed for migraines', '2024-04-29', '2024-05-29', 10),
(11, 11, 'Atorvastatin', '20mg', 'Once daily at bedtime', '2024-04-30', '2024-05-30', 11),
(12, 12, 'Hydrocortisone', '1%', 'Apply to affected area', '2024-05-01', '2024-06-01', 12),
(13, 13, 'Fluoride', '1mg', 'Once daily', '2024-05-02', '2024-06-02', 13),
(14, 14, 'Orlistat', '120mg', 'Three times daily with meals', '2024-05-03', '2024-06-03', 14),
(15, 15, 'Zolpidem', '10mg', 'At bedtime as needed', '2024-05-04', '2024-06-04', 15),
(16, 16, 'Ferrous Sulfate', '325mg', 'Once daily', '2024-05-20', '2024-06-20', 16),
(17, 17, 'Levothyroxine', '50mcg', 'Once daily before breakfast', '2024-05-21', '2024-06-21', 17),
(18, 18, 'Omeprazole', '20mg', 'Once daily before breakfast', '2024-05-22', '2024-06-22', 18),
(19, 19, 'Ibuprofen', '400mg', 'As needed', '2024-05-23', '2024-06-23', 19),
(20, 20, 'Zolpidem', '10mg', 'At bedtime as needed', '2024-05-24', '2024-06-24', 20),
(21, 21, 'Sumatriptan', '50mg', 'As needed for migraine attacks', '2024-06-20', '2024-07-20', 21),
(22, 22, 'Insulin', '10 units', 'Before meals', '2024-06-21', '2024-07-21', 22),
(23, 23, 'Sertraline', '50mg', 'Once daily', '2024-06-22', '2024-07-22', 23),
(24, 24, 'Lisinopril', '10mg', 'Once daily', '2024-06-23', '2024-07-23', 24),
(25, 25, 'Cetirizine', '10mg', 'As needed for allergies', '2024-06-24', '2024-07-24', 25);


-- Queries
-- 1. Total number of patients by gender:
SELECT Gender, COUNT(*) AS Total_Patients
FROM Patient
GROUP BY Gender;

-- 2. Average total amount of bills by payment status:
SELECT Payment_Status, AVG(Total_Amount) AS Avg_Bill_Amount
FROM Bills
GROUP BY Payment_Status;

-- 3 . Number of appointments per doctor:
SELECT d.Name AS Doctor_Name, COUNT(a.Appointment_ID) AS Num_Appointments
FROM Doctor d
JOIN Appointment a ON d.Doctor_ID = a.Doctor_ID
GROUP BY d.Name;

-- 4. Top 5 most common medical conditions:
SELECT Medical_Condition, COUNT(*) AS Num_Patients
FROM Medical_History
GROUP BY Medical_Condition
ORDER BY Num_Patients DESC
LIMIT 5;

-- 5. Total quantity of each health kit type distributed:

SELECT Health_Kit_Type, SUM(Quantity_Taken) AS Total_Quantity
FROM McKinley_Health_Kits
GROUP BY Health_Kit_Type
ORDER BY Total_Quantity DESC;

-- 6. Average age of patients at diagnosis:
SELECT AVG(DATEDIFF(Diagnosis_Date, DOB) / 365.25) AS Avg_Age_At_Diagnosis
FROM Medical_History
JOIN Patient ON Medical_History.Net_ID = Patient.Net_ID;



-- 7. Join Appointment with Doctor and Patient to get Appointment Details along with Assigned Doctor and Patient's Name:
SELECT a.Appointment_ID, d.Name AS Doctor_Name, p.Name AS Patient_Name, a.Appointment_Date, a.Appointment_Type, a.Appointment_Status
FROM Appointment a
LEFT JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
LEFT JOIN Patient p ON a.Net_ID = p.Net_ID;



-- 8. Join Patient with Medical History and Lab Screening to get Patient's Details along with their Medical History and Lab Test Results:
SELECT p.Name AS Patient_Name, mh.Medical_Condition, mh.Diagnosis_Date, mh.Treatment_Plan, ls.Test_Name, ls.Test_Date, ls.Test_Result
FROM Patient p
LEFT JOIN Medical_History mh ON p.Net_ID = mh.Net_ID
LEFT JOIN Lab_Screening ls ON p.Net_ID = ls.Net_ID;

-- 9. Patient Count and Average Bill Amount by Insurance Provider:
SELECT 
    i.Insurance_Provider,
    COUNT(DISTINCT p.Net_ID) AS Total_Patients,
    AVG(b.Total_Amount) AS Avg_Bill_Amount
FROM 
    Insurance i
JOIN 
    Patient p ON i.Net_ID = p.Net_ID
LEFT JOIN 
    Bills b ON p.Net_ID = b.Net_ID
GROUP BY 
    i.Insurance_Provider;
    
-- 10. Revenue Generated by Each Department:
SELECT 
    d.Department_Name,
    COALESCE(SUM(b.Total_Amount), 0) AS Total_Revenue_Generated
FROM 
    Department d
LEFT JOIN 
    Doctor dr ON d.Department_ID = dr.Department_ID
LEFT JOIN 
    Appointment a ON dr.Doctor_ID = a.Doctor_ID
LEFT JOIN 
    Bills b ON a.Net_ID = b.Net_ID
GROUP BY 
    d.Department_Name;

-- 11. Busiest departments based on appointment counts
SELECT d.Department_Name, COUNT(*) AS Number_of_Appointments
FROM Department d
JOIN Doctor doc ON d.Department_ID = doc.Department_ID
JOIN Appointment a ON doc.Doctor_ID = a.Doctor_ID
GROUP BY d.Department_Name
ORDER BY Number_of_Appointments DESC;


-- 12.  Modification - UPDATE
UPDATE Patient
SET Address = '456 Elm St'
WHERE Net_ID = '1';

SELECT * FROM Patient 
WHERE Net_ID = '1';


-- 13. Categorize Patients by Age group
-- Step 1: Create the view
CREATE VIEW PatientAgeGroupView AS
SELECT
    CASE
        WHEN DATEDIFF(NOW(), DOB) / 365 <= 18 THEN 'Child'
        WHEN DATEDIFF(NOW(), DOB) / 365 <= 60 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Group,
    COUNT(*) AS Patient_Count
FROM Patient
GROUP BY Age_Group;

-- Step 2: Query the view
SELECT * FROM PatientAgeGroupView;


-- 15. Delete

DELETE FROM Appointment
WHERE Appointment_Date < '2024-04-21';



-- 14. indexing

CREATE USER 'user'@'localhost' IDENTIFIED BY 'abcd1234';
GRANT SELECT ON McKinley_Healthcare.* TO 'user'@'localhost';