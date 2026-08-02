
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


--2. Highest & Lowest Priced Products
--------------------------------------
go 
  
select * from orders ; 
go 

select * from order_items ; 
go 

select top (10)
    oi.product_id , round( max(oi.price) ,2)as price
from orders o
join order_items oi
    on o.order_id = oi.order_id
where order_status = 'delivered'
group by oi.product_id 
order by price desc
;
go 
  

  
--3. Products with No Sales
---------------------------
go 

select * from products ; 
go 

select * from order_items; 
go 
  
select p.product_id
from products p
left join order_items oi
on p.product_id = oi.product_id
where oi.product_id is null;
go


--4. Product Category Distribution
----------------------------------


--5. Product Size & Weight Analysis
-----------------------------------
