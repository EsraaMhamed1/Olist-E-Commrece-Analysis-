--1. Customers by State
go 

select * from customers ; 
go 

select customer_state , count(distinct customer_unique_id) as total_customers
from customers 
group by customer_state 
order by total_customers desc; 
go 

