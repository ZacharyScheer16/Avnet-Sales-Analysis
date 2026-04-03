SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employee,
    e.job_title,
    COUNT(o.id) AS Total_Orders
FROM northwind.employees e
LEFT JOIN northwind.orders o ON e.id = o.employee_id
GROUP BY Employee, e.job_title
ORDER BY Total_Orders DESC;


SELECT 
    ProductName, 
    UnitsInStock, 
    ReorderLevel
FROM northwind.products
WHERE UnitsInStock <= ReorderLevel;

DESC northwind.employees;