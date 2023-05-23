-- https://www.programiz.com/sql/online-compiler/

-- 1) Find the amount and list of poeple with haveing status pending.

select amount, first_name , status
from orders as o 
left join shippings as p 
on o.customer_id = p.customer
left join customers as c
on c.customer_id = o.customer_id
group by first_name
having status = "Pending"
order by amount desc

-- 2) List of customers with their total purchase detials having age 25 and above 

select c.customer_id, age , first_name, last_name, sum(amount)
from customers as c
left join orders as o 
on c.customer_id = o.customer_id 
where age >= 25 
group by first_name, last_name
having amount != 0
order by amount desc

-- 3) Countries and their number of orders 


select country, count(*) as No_of_Orders
from customers as c
left join orders as o 
on c.customer_id = o.customer_id 
group by country 
order by No_of_Orders desc

-- 4) Name of customer with the highest amount of order 

select first_name, last_name , amount , item
from customers as c
left join orders as o 
on c.customer_id = o.customer_id 
order by amount desc
limit 1

-- 5) List of items ordered 

select item , count(*) as no_of_orders
from orders 
group by item

-- 6) Name of the customer who have ordered more than once 

select first_name, last_name , count(o.item) as No_of_orders 
from customers as c
left join orders as o
on c.customer_id = o.customer_id 
group by first_name, last_name
having No_of_orders > 1

-- 7) Shipping Detials of customers 

select c.customer_id, first_name , last_name, status 
from customers as c 
left join shippings as s
on c.customer_id = s.customer

-- 8) Order detials of customers including shipping status 

select c.customer_id, first_name , last_name, item, amount, status 
from customers as c 
left join shippings as s
on c.customer_id = s.customer 
left join orders as o
on c.customer_id = o.customer_id
where amount !=0
order by amount desc

-- 9) Detials of orders which is pending 

select o.customer_id, item, amount, status 
from shippings as s
left join orders as o
on s.customer = o.customer_id
where amount !=0 and status = "Pending"
order by amount desc

-- 10) Detials of order whose order name is john 

select * 
from customers as c
left join orders as o
on c.customer_id = o.customer_id
where first_name is "John"
order by amount desc
