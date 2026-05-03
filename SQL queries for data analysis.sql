--Data Analysis using SQL

--1.	Retrieve the total number of orders placed.
--select count(*) from dbo.orders;
select count(order_id) as total_orders from dbo.orders;


--2.	Calculate the total revenue generated from pizza sales.
select round(sum(o.quantity * p.price),2) as total_revenue 
from order_details o  join pizzas p on o.pizza_id = p.pizza_id  ;
 


--3.	Identify the highest-priced pizza.
select top 1 name , price from pizza_type pt inner join pizzas p
on pt.pizza_type_id = p.pizza_type_id
order by price desc 

 

--4.	Identify the most common pizza size ordered.
select p.size, count(od.order_details_id) order_count
from pizzas p 
inner join order_details od on od.pizza_id = p.pizza_id

group by p.size
order by order_count desc
 


--5.	List the top 5 most ordered pizza types along with their quantities.
select top 5 pt.name , sum(od.quantity) total_quantity
from pizza_type pt
inner join pizzas p on pt.pizza_type_id = p.pizza_type_id
inner join order_details od on od.pizza_id = p.pizza_id
group by pt.name 
order by total_quantity desc

 

--6.	Join the necessary tables to find the total quantity of each pizza category ordered.
select pt.category , sum(od.quantity) total_pizza_qty
from Pizza_type pt
inner join pizzas p on pt.pizza_type_id = p.pizza_type_id
inner join order_details od on od.pizza_id = p.pizza_id
group by pt.category
order by total_pizza_qty desc 
 

--7.	Determine the distribution of orders by hour of the day.

select datepart(hour,o.time) hour_value, count(o.order_id) as order_count
from orders o
group by datepart(hour,o.time)
order by hour_value

 

--8.	Join relevant tables to find the category-wise distribution of pizzas.

select pt.category, count(pt.name) pizza_count
from pizza_type pt
group by pt.category

 
--9.	Group the orders by date and calculate the average number of pizzas ordered per day.

select avg(cast(total_qty as decimal(10,2))) average
from 
(select o.date, sum(od.quantity) total_qty
from orders o		
inner join order_details od on o.order_id = od.order_id
group by o.date) as total_qty_per_day

 
--10.	Determine the top 3 most ordered pizza based on revenue.

select top 3 pt.name ,  sum(od.quantity * p.price) as revenue 

from pizzas p 
inner join order_details od on p.pizza_id = od.pizza_id
inner join Pizza_type pt on pt.pizza_type_id = p.pizza_type_id
group by pt.name
order by revenue desc

 

--11.	Calculate the percentage contribution of each pizza type to total revenue.

select 
t.category,  
t.revenue,
CAST(revenue * 100.0 / total_revenue AS DECIMAL(10,2)) AS contribution_percent
from
(
select  
pt.category ,  
sum(od.quantity * p.price) as revenue,
sum(sum(od.quantity * p.price)) over() as total_revenue

from pizzas p 
inner join order_details od on p.pizza_id = od.pizza_id
inner join Pizza_type pt on pt.pizza_type_id = p.pizza_type_id
group by pt.category

) t
order by revenue desc

 

--12.	Analyze the cumulative revenue generated over time.

select t.date,
t.revenue,
sum(t.revenue) over(order by t.date) as cumm_revenue
from
(select o.date,
sum( od.quantity * p.price) as revenue

from orders o
inner join order_details od on od.order_id = o.order_id
inner join pizzas p on p.pizza_id = od.pizza_id

group by o.date
)t

 
--13.	Determine the top 3 most ordered pizza types based on revenue for each pizza category.


select * from
(select t.name,
t.category ,
t.revenue,
rank() over(partition by category order by revenue desc) as revenue_by_each_category
from
(
select pt.name, pt.category,
sum(od.quantity * p.price) as revenue
from orders o
inner join order_details od on od.order_id = o.order_id
inner join pizzas p on p.pizza_id = od.pizza_id
inner join Pizza_type pt on pt.pizza_type_id = p.pizza_type_id

group by pt.name, pt.category
)t

) t1
where revenue_by_each_category <= 3

 
