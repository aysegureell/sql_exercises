CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department VARCHAR(50),
    budget DECIMAL(10,2),
    start_date DATE,
    end_date DATE
);

INSERT INTO projects (project_id, project_name, department, budget, start_date, end_date) VALUES
(1, 'Cloud Migration', 'IT', 50000.00, '2023-01-01', '2023-12-31'),
(2, 'Market Analysis', 'Marketing', 20000.00, '2023-02-15', '2023-08-15'),
(3, 'Employee Training', 'HR', 15000.00, '2023-05-01', '2023-10-01'),
(4, 'Product Launch', 'Sales', 30000.00, '2023-03-01', '2023-09-01'),
(5, 'Audit Preparation', 'Finance', 25000.00, '2023-04-01', '2023-11-01');




CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INTEGER,
    city VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    department VARCHAR(50)
    );

INSERT INTO employees (id,name, age, city, email, phone_number, department) VALUES
(1,'John Doe', 25, 'New York', 'john.doe@example.com', '555-1234', 'IT'),
(2,'Jane Smith', 30, 'London', 'jane.smith@example.com', '555-5678', 'Finance'),
(3,'Michael Brown', 28, 'Paris', 'michael.brown@mail.com', '555-9876', 'HR'),
(4,'Emily Johnson', 22, 'Berlin', 'emily.johnson@example.com', '555-2222', 'Marketing'),
(5,'David Lee', 35, 'Tokyo', 'david.lee@mail.com', '555-4444', 'IT'),
(6,'Maria Garcia', 27, 'Moscow', 'garcia@mail.com', '555-7777', 'Sales'),
(7,'Christopher Martinez', 29, 'Sydney', 'christopher.martinez@example.com', '555-6666', 'Finance'),
(8,'Sarah White', 26, 'Toronto', 'white@example.com', '555-8888', 'HR'),
(9,'James Taylor', 31, 'Los Angeles', 'james.taylor@example.com', '555-3333', 'IT'),
(10,'Jennifer Adams', 33, 'Rome', 'jennifer.adams@example.com', '555-1111', 'Marketing'),
(11,'Daniel Hernandez', 28, 'Seoul', 'daniel.hernandez@example.com', '555-9999', 'Sales'),
(12,'Amanda Thomas', 24, 'Rio de Janeiro', 'amanda.thomas@example.com', '555-5555', 'Finance'),
(13,'Robert White', 32, 'Mumbai', 'white@example.com', '555-4444', 'IT'),
(14,'Megan Scott', 29, 'Cairo', 'megan.scott@example.com', '555-7777', 'Sales'),
(15,'Kevin Garcia', 27, 'Mexico City', 'garcia@mail.com', '555-2222', 'Marketing');





--1.Hangi çalışanlar "IT" departmanında çalışıyor 
--ve bu departmana ait projelerin bütçesi 40,000'den büyük?


SELECT name
FROM employees e 
WHERE department IN (
                        SELECT department
                        FROM projects p
                        WHERE department ='IT' AND budget > 40000
);



SELECT name 
FROM employees 
WHERE department = 'IT' 
AND 'IT' IN (
    SELECT department 
    FROM projects 
    WHERE budget > 40000
);



SELECT e.name, e.department, p.budget
FROM employees e
JOIN projects p
ON e.departman = p.department
WHERE e.department = 'IT' AND p.budget > 40000;






--2.Her çalışanın çalıştığı departman ile ilgili 
--projelerin isimlerini ve bütçelerini listeleyin.


SELECT e.name,p.project_name, p.budget
FROM employees e
JOIN projects p
ON e.department = p.department;



SELECT Name, project_name, budget
FROM employees e 
WHERE department IN (
                      SELECT department
                      FROM projects p
                    
)



SELECT name, 
       (SELECT project_name 
        FROM projects p 
        WHERE p.department = e.department) AS project_name,
       (SELECT budget 
        FROM projects p 
        WHERE p.department = e.department) AS budget
FROM employees e;






--3.Bütçesi departmandaki ortalama bütçeden fazla olan projelerde
-- çalışan çalışanların isimlerini bulun.


SELECT e.name, p.budget
FROM employees e 
JOIN projects p 
ON p.department = e.department
WHERE p.budget > (
                     SELECT AVG(budget)
					 FROM projects 
					 WHERE e.department = p.department
				  );


--FARKLI SONUÇ VERİYOR

SELECT e.name, p.budget
FROM employees e 
JOIN projects p 
ON p.department = e.department
WHERE p.budget > (
                     SELECT AVG(budget)
					 FROM projects 
					 WHERE department = p.department
				  );




--4.Hangi departmanda çalışanların ortalama yaşı en yüksek?


SELECT TOP 1 department 
FROM employees 
GROUP BY department 
ORDER BY AVG(age) DESC ;


SELECT department 
FROM employees 
GROUP BY department 
ORDER BY AVG(age) DESC 
LIMIT 1;




--5.