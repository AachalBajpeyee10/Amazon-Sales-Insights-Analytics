CREATE TABLE Amazon_Orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate DATE,
    
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(100),
    
    ProductID VARCHAR(20),
    ProductName VARCHAR(150),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Tax DECIMAL(10,2),
    ShippingCost DECIMAL(10,2),
    TotalAmount DECIMAL(12,2),
    
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(50),
    
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    
    SellerID VARCHAR(20)
);

SELECT * FROM AMAZON_ORDERS;

						#REVENUE & GROWTH TRENDS
-- MONTHLY REVENUE AND VOLUME ORDERS
SELECT 
    TO_CHAR(OrderDate, 'YYYY-MM') AS Month,
    SUM(TotalAmount) AS Revenue,
    COUNT(*) AS Orders
FROM Amazon_Orders
GROUP BY Month
ORDER BY Month;

					   #TOP SELLING PRODUCTS & CATEGORIES
--TOP PRODUCTS BY REVENUE
SELECT 
    ProductName,
    SUM(TotalAmount) AS Revenue
FROM Amazon_Orders
GROUP BY ProductName
ORDER BY Revenue DESC
LIMIT 10;

--TOP CATEGORIES FOR SALE VOLUME
SELECT 
	ProductName,
	SUM(QUANTITY)AS TotalUnits_sold
FROM Amazon_Orders
GROUP BY ProductName
ORDER BY TotalUnits_sold DESC;

						#CUSTOMER BEHAVIOUR INSIGHT
--REPATED CUSTOMERS
SELECT
	CustomerID,
	COUNT(*) AS order_count,
    SUM(TotalAmount) AS total_spent
FROM Amazon_Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 1
ORDER BY total_spent DESC;

--REPEAT VS NEW CUSTOMERS
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'New'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customers
FROM (
    SELECT CustomerID, COUNT(*) AS order_count
    FROM Amazon_Orders
    GROUP BY CustomerID
) sub
GROUP BY customer_type;

--AVERAGE ORDER VALUE(AOV)
SELECT 
	 AVG(TotalAmount) AS TotalAmount_Value
FROM Amazon_Orders;

							#DISCOUNT IMPACT ANALYSIS
--DISCOUNT VS REVENUE 
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.10 THEN 'Low (0-10%)'
        WHEN Discount <= 0.20 THEN 'Medium (10-20%)'
        ELSE 'High (>20%)'
    END AS discount_level,
    COUNT(*) AS orders,
    ROUND(AVG(TotalAmount), 2) AS avg_order_value
FROM Amazon_Orders
GROUP BY discount_level;

						#LOCATIONBASED TRENDS
--SALES BY STATE
SELECT
	STATE,
	SUM(TotalAmount) AS Revenue
FROM Amazon_Orders
GROUP BY STATE
ORDER BY Revenue DESC ;

--SALES BY CITY
SELECT
	CITY,
	SUM(TotalAmount) AS Revenue
FROM Amazon_Orders
GROUP BY CITY
ORDER BY Revenue DESC 
lIMIT 10;

SELECT 
    State,
    COUNT(*) AS orders,
    SUM(TotalAmount) AS revenue,
    ROUND(AVG(TotalAmount), 2) AS avg_order_value
FROM Amazon_Orders
GROUP BY State
ORDER BY revenue DESC;

					#SHIPPING COSTY&EFFIENCY
--SHIPPING COST Vs ORDER VALUE
SELECT
	AVG(ShippingCost) AS Avg_Shippingcost,
	AVG(TotalAmount) AS Avg_Order_value
FROM Amazon_Orders;

SELECT 
    CASE 
        WHEN TotalAmount < 200 THEN 'Low Value'
        WHEN TotalAmount BETWEEN 200 AND 800 THEN 'Medium Value'
        ELSE 'High Value'
    END AS order_type,
    ROUND(AVG(ShippingCost), 2) AS avg_shipping
FROM Amazon_Orders
GROUP BY order_type;

--PAYMENTMETHOD TRENDS
SELECT 
    PaymentMethod,
    COUNT(*) AS orders,
    SUM(TotalAmount) AS revenue,
    ROUND(AVG(TotalAmount), 2) AS avg_order_value
FROM Amazon_Orders
GROUP BY PaymentMethod
ORDER BY revenue DESC;

--ORDER & STATUS RETURN
SELECT
	ORDERSTATUS,
	COUNT(OrderID)AS Totalorders
FROM Amazon_Orders
GROUP BY ORDERSTATUS
ORDER BY Totalorders DESC;

						#PROFITABILITY ANALYSIS
--PROFIT PER ORDER
SELECT
	OrderID,
	TotalAmount-(Shippingcost+Tax+Discount)AS Profit
FROM Amazon_Orders;

--MOST PROFITABLE PRODUCTS
SELECT 
	ProductName,
	SUM(TotalAmount-(Shippingcost+Tax+Discount))AS TotalProfit
From Amazon_Orders
GROUP BY ProductName
ORDER BY TotalProfit DESC
LIMIT 10;

SELECT 
    ProductName,
    SUM(UnitPrice * Quantity) AS gross_revenue,
    SUM(TotalAmount) AS net_revenue,
    SUM(UnitPrice * Quantity) - SUM(TotalAmount) AS discount_impact
FROM Amazon_Orders
GROUP BY ProductName
ORDER BY net_revenue DESC
LIMIT 10;

--Top 20% Customers 
SELECT 
    CustomerID,
    SUM(TotalAmount) AS Total_Spent
FROM Amazon_Orders
GROUP BY CustomerID
ORDER BY Total_Spent DESC
LIMIT 10;
