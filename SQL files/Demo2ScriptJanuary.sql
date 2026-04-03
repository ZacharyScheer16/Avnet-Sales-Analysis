SELECT * FROM avnet_sales_db.sales_january_2019_raw_electronics;

Select `Order ID`, `Product`, `Quantity Ordered`, `Price Each`, `Order Date`, `Purchase Address`
from avnet_sales_db.sales_january_2019_raw_electronics
WHERE `Order Date` LIKE '01/%'
    AND `Order ID` is not null
ORDER BY `Order Date` desc;

SELECT `Product`, SUM(`Quantity Ordered` *  `Price Each`) AS total_revenue, COUNT(`Order ID`)
FROM avnet_sales_db.sales_january_2019_raw_electronics
WHERE `Order Date` LIKE '01/%'
group by `Product`
ORDER by total_revenue desc

