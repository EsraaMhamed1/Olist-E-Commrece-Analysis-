
--1. Monthly Orders Trend
-------------------------
go 

select * from orders ; 
go 

select   count(order_id) as num_of_orders , 
         month(order_purchase_timestamp) as months , 
		 year(order_purchase_timestamp) as years
from orders 
where order_status = 'delivered' 
group by  year(order_purchase_timestamp) ,
          month(order_purchase_timestamp) 
order by year(order_purchase_timestamp) , 
         month(order_purchase_timestamp) asc ;
go 



--2. Orders by Status
---------------------
go 

select * from orders ; 
go 

select order_status , count(order_id)  as orders 
from orders 
group by order_status 
order by orders desc;
go 



--3. Delivery Performance
-------------------------
go 

select * from orders ; 
go 

select  avg(
datediff(hour, order_purchase_timestamp , order_approved_at)) as avg_processing_time_hours 
from orders
where order_approved_at is not null
;
go



--4. On-Time vs Late Deliveries


--5. Average Delivery Delay
