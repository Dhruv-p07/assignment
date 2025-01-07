create database assign1 ;
use assign1 ;
#1) Statement to create the Contact table.
create table contact
(
ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12)
);   
#2) Statement to create the Employee table.
create table employee  (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

#3) Statement to create the ContactEmployee table 
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
#4) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800
insert into employee value
(
15, "lesley", "bland", 15000.00, '2003-05-15',
 "data", "lesley@gmail.com", "7737942845"
);

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

#5) In the Company table, the statement that changes the name of “Urban 
#Outfitters, Inc.” to “Urban Outfitters”

create table company
(
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);
insert into company value
(100, "urban outfitters inc",'5000 Broad St', 'Philadelphia', 'PA', '19112');

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';
 
#6) In ContactEmployee table, the statement that removes Dianne Connor’s contact
#event with Jack Lee (one statement).

# insert 'jack lee' employee's data in employee table
insert into Employee values
(1616,"Jack Lee", "Jong",5000.00, '2021-05-01', "UX Design","jacklee10@gmail.com", "9789978789");

# insert 'Dianne Connor' contact data in contact table
INSERT INTO contact VALUES 
('3', '2345', 'Dianne Connor', 'Dianne Connor’s', 'bal kunj', 'Jaypur', 'RJ', '381010', '1', 'dianne.connor@urbanoutfiller.com', '7707342845');

# insert 'Dianne Connor' contacted 'jack lee' data in to contact employee table
INSERT INTO contactemployee VALUES 
('3', '3', '1616', '2022-05-10', 'positive');

# finally apply delete query to delete 'Dianne Connor’s contact data from 
# contactemployee table
delete from contactemployee where contactid =
(select ContactID from contact where firstname = "Dianne Connor") and
employeeid = (select employeeid from employee where firstname = 'jack lee');

#7) Write the SQL SELECT query that displays the names of the employees that
#have contacted Toll Brothers (one statement). Run the SQL SELECT query in
#MySQL Workbench. Copy the results below as well. 

select * from employee e, company c, contactemployee ce, contact ct where
(e.employeeid = ce.employeeid) and (ce.contactid = ct.contactid)  and
(c.companyName = "Toll brothers");


#8) What is the significance of “%” and “_” operators in the LIKE statement? 
/*
The % and _ are wildcards used with the LIKE operator in SQL:

%: Matches zero or more characters.
Example: 'a%' matches "apple," "ant," or "a."

_: Matches exactly one character.
Example: 'a_c' matches "abc" or "arc" but not "abcc."
*/

#9) Explain normalization in the context of databases. 
/*
Normalization in databases is the process of organizing data to reduce redundancy and improve data integrity. It involves dividing a database into smaller tables and defining relationships between them. The goal is to:

Eliminate duplicate data.
Ensure data consistency.
Simplify data maintenance.
Normalization follows different levels, called normal forms (1NF, 2NF, 3NF, etc.), each with specific rules.
*/

#10) What does a join in MySQL mean? 
/*
A JOIN in MySQL is used to combine rows from two or more tables based on a related column between them.
It helps retrieve data that is spread across multiple tables in a relational database.
*/

#11) 19.What do you understand about DDL, DCL, and DML in MySQL? 
/*
DDL (Data Definition Language): Commands like CREATE, ALTER, and DROP to define or modify database structure.
DML (Data Manipulation Language): Commands like INSERT, UPDATE, and DELETE to manipulate data in tables.
DCL (Data Control Language): Commands like GRANT and REVOKE to control access and permissions.
*/

#12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
/*
Common Types of Joins:
INNER JOIN: Returns rows with matching values in both tables.
LEFT JOIN: Returns all rows from the left table and matching rows from the right table (or NULL if no match).
RIGHT JOIN: Returns all rows from the right table and matching rows from the left table (or NULL if no match).
FULL JOIN: Combines results of both LEFT and RIGHT joins (not directly supported in MySQL but can be simulated).
*/