create database assign2;

use assign2;

CREATE TABLE worker (
    worker_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary INT,
    joining_date DATETIME,
    department VARCHAR(50)
);

#Insert data into the Worker table

INSERT INTO worker VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

# 1. Write an SQL query to print all Worker details from the Worker table order by
# FIRST_NAME Ascending and DEPARTMENT Descending.

# FIRST_NAME Ascending

SELECT * FROM Worker
ORDER BY first_name ASC;

# DEPARTMENT Descending

SELECT * FROM Worker
ORDER BY department DESC;

# 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”
# from the Worker table.

SELECT * FROM Worker
WHERE first_name IN ('Vipul', 'Satish');

# 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and
# contains six alphabets.

SELECT * FROM Worker
WHERE FIRST_NAME LIKE '_____h';

# 4. Write an SQL query to print details of the Workers whose SALARY lies between 1.

SELECT * FROM Worker
WHERE SALARY BETWEEN 1 AND 100000;

# 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT SALARY, DEPARTMENT, COUNT(*) AS DuplicateCount FROM Worker
GROUP BY SALARY, DEPARTMENT
HAVING COUNT(*) > 1;

# 6. Write an SQL query to show the top 6 records of a table.

SELECT * FROM Worker
LIMIT 6;

# 7. Write an SQL query to fetch the departments that have less than five people in them.

SELECT DEPARTMENT FROM Worker
GROUP BY DEPARTMENT HAVING COUNT(*) < 5;

# 8. Write an SQL query to show all departments along with the number of people in there.

SELECT DEPARTMENT, COUNT(*) AS NumberOfPeople FROM Worker
GROUP BY DEPARTMENT;

# 9. Write an SQL query to print the name of employees having the highest salary in each department. 

SELECT DEPARTMENT, FIRST_NAME, LAST_NAME, SALARY FROM Worker AS w1
WHERE SALARY = (
    SELECT MAX(SALARY)
    FROM Worker AS w2
    WHERE w1.DEPARTMENT = w2.DEPARTMENT
);
