Create database Ecommerce;
use Ecommerce;
create table Shipping_analysis(
id int,
warehouse_block varchar(10),
mode_of_shipmment varchar(20),
customer_care_calls int,
customer_rating int,
cost_of_the_product int,
prior_purchases int,
product_importance varchar(20),
gender varchar(10),
discount_offered int, 
weight_in_gms int,
reached_on_time_Y_N int); 
select * from Shipping_analysis;
select count(*) from Shipping_analysis;

--- 1. Which shipment mode has the highest average product cost?   

select mode_of_shipmment, 
avg(cost_of_the_product) as avg_product_cost
from Shipping_analysis
group by mode_of_shipmment
order by avg_product_cost DESC;

--- 2. How many male and female customers are there?
select gender, count(*) as customer_count
from Shipping_analysis
group by gender;

--- 3. Which product importance category has the highest average customer rating?

select product_importance, 
avg(customer_rating) as avg_customer_rating
from Shipping_analysis 
group by product_importance
order by avg_customer_rating DESC;

--- 4. What is the average discount offered for delayed deliveries?

select avg(discount_offered) 
as avg_discount_offered
from shipping_analysis
where reached_on_time_Y_N = 1;

--- 5. Which shipment mode has the highest delay percentage?

select mode_of_shipmment,
count(case when reached_on_time_Y_N = 1 then 1 end) / count(*)*100
as delay_percentage
from Shipping_analysis
group by mode_of_shipmment
order by delay_percentage desc;










