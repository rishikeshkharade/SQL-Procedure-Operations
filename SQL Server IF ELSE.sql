USE BikeStores;


--The IF statement
BEGIN 
DECLARE @sales INT;
SELECT @sales = SUM(list_price * quantity)
FROM sales.order_items i 
INNER JOIN sales.orders o ON o.order_id = i.order_id
WHERE YEAR(order_date) = 2018;
SELECT @sales;
IF @sales > 1000000
BEGIN 
PRINT 'Great! The sales amount in 2018 is greater than 1,000,000';
END
END


--The IF ELSE statement
BEGIN 
DECLARE @sales INT;
SELECT @sales = SUM(list_price * quantity)
FROM
sales.order_items i 
INNER JOIN sales.orders o ON o.order_id = i.order_id
WHERE YEAR(order_date) = 2017;

SELECT @sales;
IF @sales > 10000000
BEGIN
PRINT 'Great! The sales amount in 2018 is greater than 10,000,000';
END
ELSE
BEGIN
PRINT 'Sales amount in 2017 did not reach 10,000,000';
END
END


--Nested IF...ELSE
BEGIN
DECLARE @x INT = 10,
		@y INT = 20;

IF(@x < @y)
BEGIN 
IF (@x < @y)
PRINT 'x > 0 and x < y';
ELSE
PRINT 'x > 0 and x >= y';
END
END