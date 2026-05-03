--DATA CLEANING
--check for null values
SELECT * FROM pizzas
WHERE pizza_id IS NULL;

SELECT * FROM pizza_type
WHERE pizza_type_id IS NULL;

SELECT * FROM orders
WHERE order_id IS NULL;

SELECT * FROM order_details
WHERE order_details_id IS NULL;

--There are no null values for id columns in all four tables.


--***************************************************************************

--Check Data type

--Check if data type is appropriate
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'pizzas'
select * from pizzas 

-- price column is having varchar datatype
-- change data type of price column from varchar to decimal
ALTER TABLE pizzas
ALTER COLUMN price DECIMAL(10,2);
 

--Now the data type is changed to decimal with two decimal places 

--Check orders table:
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'orders'
select * from dbo.Orders 

-- date and time column is having varchar datatype

--Set appropriate data type for date and time column: alter data type for  date and time column
ALTER TABLE orders
ALTER COLUMN date date

ALTER TABLE orders
ALTER COLUMN time time;




 


