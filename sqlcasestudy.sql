-- ---------use case domain : Health ----------- --
-- Creation of Patient table
CREATE TABLE Patient (
PatientID INT PRIMARY KEY,
Name VARCHAR(70),
Address VARCHAR(100),
DateOfBirth DATE,
Contact VARCHAR(20)
);
-- Creation of Medical History table
CREATE TABLE MedicalHistory(
MedicalHistoryID INT PRIMARY KEY,
PatientID INT,
Diagnosis VARCHAR(100),
Treatment VARCHAR(100),
Surgery VARCHAR(100),
Medication VARCHAR(100),
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
-- Creation of Labresults Table
CREATE TABLE LabResults(
LabresultsID INT PRIMARY KEY,
PatientID INT,
TestType VARCHAR(100),
TestResult VARCHAR(100),
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
-- Creation of Prescription Table
CREATE TABLE Prescriptions(
PrescriptionID INT PRIMARY KEY,
PatientID INT,
Medicationname VARCHAR(100),
Dosage VARCHAR(50),
Frequency VARCHAR(50),
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
-- Creating the Outcome Table
CREATE TABLE Outcome(
OutcomeID INT PRIMARY KEY,
PatientID INT,
ReadmissionRate FLOAT,
MedicationAdherence FLOAT,
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
-- Details of all patient records
SELECT * FROM Patient;
SELECT * FROM MedicalHistory;
SELECT * FROM LabResults;
SELECT * FROM Prescriptions;
SELECT * FROM Outcome;

-- ---------usecase domain :Library Management System------------ --
-- Creation of Book table
CREATE TABLE Book(
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Publisher VARCHAR(100),
    ISBN VARCHAR(100),
    Genre VARCHAR(100),
    Availability BOOLEAN
);
-- Creation of Borrowers Table
CREATE TABLE Borrowers(
    BorrowerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100)
);
-- Creation of Loans Table
CREATE TABLE Loans(
    LoanID INT PRIMARY KEY,
    BookID INT,
    BorrowerID INT,
    DateBorrowed DATE,
    DueDate DATE,
    DateReturned NULL DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);
-- Creation of Reservation Table
CREATE TABLE Reservation(
    ReservationID INT PRIMARY KEY,
    BookID INT,
    BorrowerID INT,
    DateReserved DATE,
    DateNeeded DATE,
    Status VARCHAR(20)--active, canceled or expired
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);
-- QUERYING THE DATABASE
SELECT * FROM Book where Availability=1;
SELECT Book.Title,Book.Author,Borrowers.Name,Loans.DateBorrowed,Loans.DueDate From Books INNER JOIN Loans ON Book.BookID=Loans.BookID INNER JOIN Borrowers ON Loans.BorrowerID=Borrowers.BorrowerID;
SELECT Books.Title,Book.Author,Borrowers.Name,Reservation.DateReserved,Reservation.DateNeeded FROM Book INNER JOIN Reservation ON Book.BookID=Reservation.BookID