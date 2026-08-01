
--1. Top Selling Products
-------------------------
go 

select * from orders ; 
go 

select * from order_items ;
go 

select top(10) oi.product_id ,count(oi.product_id) as products_sold 
from orders o 
join order_items oi 
on o.order_id = oi.order_id
where order_status = 'delivered' 
group by oi.product_id 
order by products_sold desc ; 
go 



-------------------------------------

--3. Products with No Sales
---------------------------


--4. Product Category Distribution
----------------------------------


--5. Product Size & Weight Analysis
-----------------------------------
