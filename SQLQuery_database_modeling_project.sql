-- Create Jobs table
CREATE TABLE Jobs (
    JobCode INT PRIMARY KEY,
    Position VARCHAR(50),
    PayrateCAD DECIMAL(8, 2)
)
-- Insert values into Jobs table
INSERT INTO Jobs (JobCode, Position, PayrateCAD)
VALUES
(3000, 'Stockperson', 12.99),
(5000, 'Butcher', 18),
(2000, 'Cashier', 11.99),
(1000, 'Greeter', 10.25),
(7000, 'Pharmacist', 30),
(8000, 'Assistant Baker', 15.5),
(4000, 'Baker', 17.5),
(6000, 'Cleaner', 13.5)

-- Create Supervisor table
CREATE TABLE Supervisor (
    SupervisorID INT PRIMARY KEY,
    Supervisor VARCHAR(50),
    SupervisorCell VARCHAR(12)
)
-- Insert values into Supervisor table
INSERT INTO Supervisor (SupervisorID, Supervisor, SupervisorCell) VALUES
(1, 'Abu Muktadir', '306.304.4545'),
(2, 'Joseph Herbert', '306.304.1212'),
(3, 'Melissa Jones', '306.304.8878'),
(4, 'James Snowdale', '306.304.9091')

-- Create Employees table
CREATE TABLE Employees (
    EmpId INT PRIMARY KEY,
    SIN VARCHAR(9),
    Last VARCHAR(50),
    First VARCHAR(50),
    Street VARCHAR(100),
    City VARCHAR(50),
    Prov VARCHAR(2),
    Postal VARCHAR(7),
    JobCode INT,
    IncTax CHAR(1),
    BirthDate DATE,
    HireDate DATE,
    SupervisorID INT,
    FOREIGN KEY (JobCode) REFERENCES Jobs(JobCode),
    FOREIGN KEY (SupervisorID) REFERENCES Supervisor(SupervisorID) 
)
-- Insert values into Employees table
INSERT INTO Employees (EmpId, SIN, Last, First, Street, City, Prov, Postal, IncTax, BirthDate, HireDate,JobCode,SupervisorID)
VALUES
(97319, 516303417, 'Novak', 'Gerry', '6803 Park Ave.', 'Moose Jaw', 'SK', 'S6H 1X7', 'N', '1986-08-24', '2003-07-07',3000,1),
(33982, 867481381, 'Boychuk', 'Robin', '117 East Broadway', 'Moose Jaw', 'SK', 'S6H 3P5', 'Y', '1971-03-04','1998-10-11',5000,2),
(51537, 112893584, 'Smith', 'Kim', '9745 University Drive', 'Regina', 'SK', 'S4P 7A3', 'Y', '1982-11-29','2001-12-02',2000,3),
(41822, 717505366, 'Miller', 'Chris', '72 Railway Ave.', 'Pense', 'SK', 'S0T 1K4', 'Y', '1968-11-15','1985-02-19',2000,3),
(3571, 374853129, 'Hashimoto', 'Jo', '386 High Street', 'Tuxford', 'SK', 'S0L 8V6', 'Y', '1956-06-23','1980-03-20',1000,3),
(85833, 466128562, 'Singh', 'Lindsey', '1216 Willow Cres.', 'Pasqua', 'SK', 'S0H 5T8', 'Y', '1975-03-15','2002-07-27',7000,4),
(81216, 615917448, 'Hansen', 'Jaimie', '95 Lakeshore Blvd.', 'Caronport', 'SK', 'S0T 3S7', 'Y', '1983-03-04','2002-05-21',8000,2),
(32177, 306114858, 'DaSilva', 'Robbie', '4319 Main St.', 'Moose Jaw', 'SK', 'S6H 2M2', 'Y', '1951-02-18','1983-07-07',4000,2),
(52421, 936654021, 'O Day', 'Shelley', '27 High St.', 'Tuxford', 'SK', 'S0L 8V6', 'Y', '1963-07-31','1997-11-08',6000,1),
(72690, 655971502, 'Wong', 'Jodie', '59 Oslo Square', 'Moose Jaw', 'SK', 'S6H 2H9', 'N', '1987-01-01','2003-08-26',6000,1),
(72201, 635111876, 'Ramirez', 'Kelly', '1015 Brunswick Lane', 'Moose Jaw', 'SK', 'S6H 4T5', 'N', '1986-09-29','2003-08-26',3000,1)

-- Create Committee table
CREATE TABLE Committee (
    CommitteeId INT PRIMARY KEY,
    CommitteeName VARCHAR(50),
    MeetingNight VARCHAR(3)
)
-- Insert values into Committee table
INSERT INTO Committee (CommitteeId, CommitteeName, MeetingNight) VALUES
(1, 'OH&S', 'Fri'),
(2, 'Party Committee', 'Wed'),
(3, 'Social Res. Com.', 'Mon')

-- Create EmployeeToCommittee table
CREATE TABLE EmployeeToCommittee (
    EmpComID INT PRIMARY KEY,
    EmpId INT,
    CommitteeId INT,
    FOREIGN KEY (EmpId) REFERENCES Employees(EmpId),
    FOREIGN KEY (CommitteeId) REFERENCES Committee(CommitteeId)
)
-- Insert values into EmployeeToCommittee table
INSERT INTO EmployeetoCommittee (EmpComId,EmpId, CommitteeId) VALUES
(1, 97319, 1),
(2, 72201, 1),
(3, 33982, 1),
(4, 32177, 1),
(5, 72690, 2),
(6, 51537, 2),
(7, 81216, 2),
(8, 41822, 2),
(9, 41822, 3),
(10, 32177, 3),
(11, 72690, 3),
(12, 97319, 3)

-- Create PayWeekEndDate table
CREATE TABLE PayWeekEndDate (
    PayWeekEndID INT PRIMARY KEY,
    PayWeekEndDate DATE,
    DaysAvailable INT
)
-- Insert values into PayWeekEndDate table
INSERT INTO PayWeekEndDate (PayWeekEndID, PayWeekEndDate, DaysAvailable) VALUES
(1, '2013-05-23', 7),
(2, '2013-05-30', 6)

-- Create Payroll table
CREATE TABLE Payroll (
    PayId INT PRIMARY KEY,
    EmpId INT,
    PayWeekEndID INT,
    Hours DECIMAL(5, 2),
    OT DECIMAL(5, 2),
    FOREIGN KEY (EmpId) REFERENCES Employees(EmpId),
    FOREIGN KEY (PayWeekEndID) REFERENCES PayWeekEndDate(PayWeekEndID)
)
INSERT INTO Payroll (PayId, EmpId, PayWeekEndID, Hours, OT) VALUES
(1, 33982, 1, 40.00, 0.00),
(2, 33982, 2, 38.25, 0.00),
(3, 51537, 1, 27.00, 0.00),
(4, 41822, 1, 40.00, 0.00),
(5, 41822, 2, 38.00, 1.25),
(6, 3571, 1, 40.00, 0.00),
(7, 3571, 2, 40.00, 0.00),
(8, 85833, 1, 37.50, 0.50),
(9, 85833, 2, 22.00, 0.00),
(10, 81216, 1, 40.00, 0.00),
(11, 32177, 1, 40.00, 3.70),
(12, 32177, 2, 40.00, 2.25),
(13, 52421, 1, 22.00, 0.00),
(14, 52421, 2, 40.00, 4.50),
(15, 72690, 1, 36.00, 0.00),
(16, 72201, 2, 18.00, 0.00)

--Q-1 
Select 
E.EmpId as [employee ID],
Concat(Last,' ',First) as [Full name],
S.Supervisor as [Supervisor Name],
P.Hours as [Hours]
from Employees E
Join Payroll P on E.EmpId = P.EmpId
Join Supervisor S on E.SupervisorID = S.SupervisorID
Where P.Hours>25 and Last like '%s%'

--Q-2
SELECT 
E.JobCode AS 'Job Code',
S.Supervisor AS 'Manager Name',
S.SupervisorCell AS 'Manager Cell Number'
FROM Employees E
JOIN Supervisor S ON E.SupervisorID = S.SupervisorID
WHERE E.EmpId = 3571

--Q-3
SELECT E.EmpId, 
CONCAT(E.First, ' ', E.Last) AS [FullName], 
J.Position AS JobDescription
FROM Employees E
JOIN EmployeeToCommittee EC ON E.EmpId = EC.EmpId
JOIN Jobs J ON E.JobCode = J.JobCode
JOIN Committee C ON EC.CommitteeId = C.CommitteeId
WHERE C.CommitteeName = 'OH&S'

--Q-4
SELECT E.EmpId, 
CONCAT(E.First, ' ', E.Last) AS [FullName], 
E.JobCode AS [JobCode]
FROM Employees E
JOIN Supervisor S ON E.SupervisorID = S.SupervisorID
JOIN Jobs J ON E.JobCode = J.JobCode
WHERE S.Supervisor LIKE '%Muktadir%'

--Q-5
CREATE VIEW MondayCommitteeView AS
SELECT DISTINCT
E.EmpId AS EmployeeID,
CONCAT(E.First, ' ', E.Last) AS FullName,
C.CommitteeId,
C.MeetingNight,
C.CommitteeName,
E.SupervisorID,
S.Supervisor AS SupervisorName
FROM Employees E
JOIN EmployeeToCommittee EC ON E.EmpId = EC.EmpId
JOIN Committee C ON EC.CommitteeId = C.CommitteeId
JOIN Supervisor AS S ON E.SupervisorID = S.SupervisorID
WHERE C.MeetingNight = 'Mon'
Select * from MondayCommitteeView