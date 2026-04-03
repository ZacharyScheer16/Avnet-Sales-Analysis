CREATE Database avnetPracticeDB;

CREATE TABLE Products(
product_id INT  Primary KEY auto_increment, 
part_number VARCHAR(100)  UNIQUE,
prodcut_name VARCHAR(200) NOT NULL,
unit_price DECIMAL(10,2)
);

CREATE TABLE Orders(
order_id INT Primary Key auto_increment,
product_id INT,
quantity INT,
order_date DATE
);


ALTER TABLE Products RENAME COLUMN new_name to product_name;

INSERT INTO products
(part_number, product_name, unit_price)
VALUES
('IX-9900', 'Intel Core i9', 499.99),
('A1-SEMCON', 'Semiconductor A1', 15.50),
('X2-CHIP', 'Microchip X2', 42.00);


INSERT INTO Orders (product_id, quantity, order_date)
VALUES 
(1, 10, '2026-03-31'),
(2, 5, '2026-03-31');

INSERT INTO Products (part_number, product_name, unit_price)
VALUES 
('SNSR-101', 'Temperature Sensor', 12.50),
('CONN-45', 'USB-C Connector', 2.10),
('PWR-MUD', 'Power Module 12V', 85.00),
('LED-RGB', 'RGB LED Array', 4.75),
('MCU-ARM', 'ARM Cortex M4', 18.25),
('CAP-CER', 'Ceramic Capacitor', 0.15),
('RES-STK', 'Resistor Pack 10k', 1.50),
('FAN-5V', 'Cooling Fan 5V', 9.00),
('WIFI-MOD', 'ESP32 WiFi Module', 7.50),
('BATT-LIPO', 'LiPo Battery 2000mAh', 22.00);


INSERT INTO Orders (product_id, quantity, order_date)
VALUES 
(4, 50, '2026-04-01'),   -- Temperature Sensors
(5, 500, '2026-04-01'),  -- Connectors (Bulk)
(6, 5, '2026-04-02'),    -- Power Modules
(7, 100, '2026-04-02'),  -- LEDs
(8, 20, '2026-04-03'),   -- MCUs
(9, 1000, '2026-04-03'), -- Capacitors
(10, 500, '2026-04-04'), -- Resistors
(11, 15, '2026-04-04'),  -- Fans
(12, 40, '2026-04-05'),  -- WiFi Modules
(13, 10, '2026-04-05');  -- Batteries


SELECT * FROM orders;


SELECT 
    p.product_name, 
    SUM(o.quantity * p.unit_price) AS total_revenue 
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

Select 
p.product_name, 
COUNT(orders.order_id) AS total_orders, 
AVG(o.quantity) AS avg_quantity_per_order
from Products p
JOIN Orders o on p.prdouct_id = o.product_id
Group by p.product_name
HAVING avg_quantity_per_order > 10;



Select p.product_name,  SUM(o.quantity * p.unit_price) AS total_revenue
FROM products p 
Join Orders o on p.product_id = o.product_id
WHERE p.unit_price > 10
group by p.product_name
HAVING SUM(o.quantity * p.unit_price) > 500