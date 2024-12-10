-- Query 1: Select all the computers from the products table
-- using the products table and the categories table, return the product name and the category name
SELECT 
    p.product_name, 
    c.category_name
FROM 
    products p
JOIN 
    categories c 
ON 
    p.category_id = c.category_id
WHERE 
    c.category_name = 'Computers';

-- ----------------------------------------------------

-- Query 2: Find all product names, product prices, and products ratings that have a rating of 5
SELECT 
    p.product_name, 
    p.price, 
    r.rating
FROM 
    products p
JOIN 
    reviews r 
ON 
    p.product_id = r.product_id
WHERE 
    r.rating = 5;

-- ----------------------------------------------------

-- Query 3: Find the employee with the most total quantity sold
-- Use the sum() function and group by
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    SUM(o.quantity) AS total_quantity_sold
FROM 
    employees e
JOIN 
    orders o 
ON 
    e.employee_id = o.employee_id
GROUP BY 
    e.employee_id, e.first_name, e.last_name
ORDER BY 
    total_quantity_sold DESC
LIMIT 1;

-- ----------------------------------------------------

-- Query 4: Find the name of the department, and the name of the category for Appliances and Games
SELECT 
    d.department_name, 
    c.category_name
FROM 
    departments d
JOIN 
    categories c 
ON 
    d.department_id = c.department_id
WHERE 
    c.category_name IN ('Appliances', 'Games');

-- ----------------------------------------------------

-- Query 5: Find the product name, total # sold, and total price sold
-- for Eagles: Hotel California --You may need to use SUM()
SELECT 
    p.product_name, 
    SUM(o.quantity) AS total_quantity_sold, 
    SUM(o.quantity * p.price) AS total_price_sold
FROM 
    products p
JOIN 
    orders o 
ON 
    p.product_id = o.product_id
WHERE 
    p.product_name = 'Eagles: Hotel California'
GROUP BY 
    p.product_name;

-- ----------------------------------------------------

-- Query 6: Find Product name, reviewer name, rating, and comment on the Visio TV
-- (only return for the lowest rating!)
SELECT 
    p.product_name, 
    r.reviewer_name, 
    r.rating, 
    r.comment
FROM 
    products p
JOIN 
    reviews r 
ON 
    p.product_id = r.product_id
WHERE 
    p.product_name = 'Visio TV'
ORDER BY 
    r.rating ASC
LIMIT 1;

-- ----------------------------------------------------

-- Extra: Employee sales report
-- Return the employeeID, the employee's first and last name, the name of each product, and how many of that product they sold
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    p.product_name, 
    SUM(o.quantity) AS total_quantity_sold
FROM 
    employees e
JOIN 
    orders o 
ON 
    e.employee_id = o.employee_id
JOIN 
    products p 
ON 
    o.product_id = p.product_id
GROUP BY 
    e.employee_id, e.first_name, e.last_name, p.product_name
ORDER BY 
    e.employee_id, p.product_name;
