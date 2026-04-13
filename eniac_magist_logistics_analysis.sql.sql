use magist;

-- How many orders are there in the dataset?
select count(*) from orders;
-- 99441

-- Are orders actually delivered?
select order_status, count(*) as orders from orders group by order_status;

-- Is Magist having user growth?
select year(order_purchase_timestamp) as year_,
month(order_purchase_timestamp) as month_,
round(sum(price),2) as revenue_month,
count(distinct customer_id) as cutomers_month
from orders
join order_items using (order_id) 
join customers using (customer_id)
group by year_, month_
order by year_, month_;


-- 4. How many products are there in the products table?
select  count(distinct product_id) from products;
-- 32951

-- Which are the categories with most products?
select product_category_name_english, count(distinct product_id) from products
join product_category_name_translation using (product_category_name) 
group by product_category_name_english 
order by product_category_name_english desc;
-- 1.bed_bath_table 2.sports_leisure 3.furniture_decor 4.health_beauty 5.housewares

-- How many of those products were present in actual transactions?
select count(distinct order_id)
from order_items oi
join orders o using (order_id);
-- 98666

-- What’s the price for the most expensive and cheapest products?
select max(price),
min(price) 
from order_items;
-- max = 6735 min = 0.85

--  What are the highest and lowest payment values?
select max(payment_value),
min(payment_value)
from order_payments;
-- max = 13664.1 min = 0



select order_status,  
order_purchase_timestamp,
order_delivered_customer_date
from orders
order by order_purchase_timestamp;


-- how many orders were unavailibal?
select count(order_status) 
from orders
where order_status like 'un%';
-- unavailibal = 609

-- how many orders were there?
select count(order_status) 
from orders;
-- 99441

-- do they sell high tech products or iphone accessories?
select distinct pc.product_category_name_english
from products p 
join product_category_name_translation  pc using (product_category_name);
-- audio, electronics, computers_accessories, pc _gamer, computers

-- how many tech products were sold and what is the percentage ?
select count(*) as total_sold
from products p
join product_category_name_translation pc using (product_category_name)
join order_items oi using (product_id)
where product_category_name_english in ('audio', 'electronics', 'computers_accessories', 'pc _gamer', 'computers');
-- 11161 from 99441 meaning 11.22%

-- What’s the average price of the products being sold?
select round(avg(price), 2)
from order_items;
-- avg_price = 120.65

-- are expensive tech products popular?
select count(*)
from products
join product_category_name_translation pc using (product_category_name)
join order_items oi using (product_id)
where product_category_name_english in ('audio', 'electronics', 'computers_accessories', 'pc _gamer', 'computers')
and price >120.65;
-- 3180 from 11161 been sold meaning 28.49% so not really

-- how many month of data are included in the dataset?
select timestampdiff(month, min(order_purchase_timestamp),
 max(order_purchase_timestamp)) as total_months_from_the_dataset 
 from orders;
 -- 25 month
 
 -- how many sellers are there?
 select count(*) 
 from sellers;
 
-- there are 3095 sellers

-- How many Tech sellers are there? What percentage of overall sellers are Tech sellers?
select count(distinct s.seller_id) as total_tech_sellers
from order_items oi
join sellers s on oi.seller_id = s.seller_id
join products p on oi.product_id = p.product_id
join product_category_name_translation pc on  p.product_category_name = pc.product_category_name
where product_category_name_english in ('audio', 'electronics', 'computers_accessories', 'pc _gamer', 'computers');
-- tech sellers are 386 from 3095 meaning 12.47%

 
-- What is the total amount earned by all sellers?
select round(sum(price), 2) as total_amount_earned_by_all_sellers
from order_items oi
join sellers s on oi.seller_id = s.seller_id
join products p on oi.product_id = p.product_id
join product_category_name_translation pc on  p.product_category_name = pc.product_category_name;
-- total amount is 13591643.7

 -- What is the total amount earned by all Tech sellers?
select round(sum(price), 2) as total_amount_earned_by_all_tech_sellers
from order_items oi
join sellers s on oi.seller_id = s.seller_id
join products p on oi.product_id = p.product_id
join product_category_name_translation pc on  p.product_category_name = pc.product_category_name
where product_category_name_english in ('audio', 'electronics', 'computers_accessories', 'pc _gamer', 'computers');
-- total amount is 1345852.69

-- how many categories are there 
select count(distinct product_category_name_english)
from product_category_name_translation;
-- 74 meaning 6,75%

-- how much is the avg income of all sellers?

SELECT 
    ROUND(AVG(total_income), 2) AS avg_income_tech_sellers
FROM (
    SELECT 
        s.seller_id,
        SUM(oi.price) AS total_income
    FROM order_items oi
    JOIN sellers s 
        ON oi.seller_id = s.seller_id
    JOIN products p 
        ON oi.product_id = p.product_id
    JOIN product_category_name_translation pc 
        ON p.product_category_name = pc.product_category_name
    GROUP BY s.seller_id
) AS seller_totals;
-- avg income of all sellers is 4391.48

-- how much is the average monthly income of Tech sellers?
SELECT 
    ROUND(AVG(total_income), 2) AS avg_income_all_sellers
FROM (
    SELECT 
        s.seller_id,
        SUM(oi.price) AS total_income
    FROM order_items oi
    JOIN sellers s 
        ON oi.seller_id = s.seller_id
    JOIN products p 
        ON oi.product_id = p.product_id
    JOIN product_category_name_translation pc 
        ON p.product_category_name = pc.product_category_name
    WHERE pc.product_category_name_english IN 
        ('audio', 'electronics', 'computers_accessories', 'pc_gamer', 'computers')
    GROUP BY s.seller_id
) AS seller_totals;
-- the avg incoem of tech sellers is 4391.48

-- how many orders were unavailibal?
select count(order_status) 
from orders
where order_status like 'un%';
-- unavailibal = 609 like 6.12%


-- how can we calculate avg deliverey time with sql
select 
round(avg(timestampdiff(day, order_purchase_timestamp, order_delivered_customer_date))) as average_delivery_time
from orders
where order_delivered_customer_date is not null ;
-- avg delivery time = 12 days

-- How many orders are delivered on time vs orders delivered with a delay?
select count(*) as number_of_orders, 
case  when order_delivered_customer_date <= order_estimated_delivery_date 
then 'on time'
else 'delayed' 
end as delivery_status 
from orders
where order_delivered_customer_date is not null
group by delivery_status;
-- on time = 88649. delayed = 7827 meaning 7.87% of the time is delayed

select count(distinct order_id) from orders;

-- is there a pattern like big products 
select count(*) as number_of_orders, avg(product_weight_g), avg(product_length_cm), avg(product_height_cm), avg(product_width_cm),
case  when order_delivered_customer_date <= order_estimated_delivery_date 
then 'on time'
else 'delayed' 
end as delivery_status 
from orders o 
join order_items oi using (order_id)
join products p using (product_id)
where order_delivered_customer_date is not null 
group by delivery_status;

-- how many good reviews did they have 4/5? 4 = 12971. 5 = 36175
select review_score,
count(review_score),
review_comment_message
from order_reviews
group by review_score, review_comment_message
having review_score = 5 or review_score = 4;
-- 4 = 12971. 22.65% 5 = 36175. 63.18%



-- how many bad reviews did they have 1/2? 
select review_score,
count(review_score),
review_comment_message
from order_reviews
group by review_score, review_comment_message
having review_score = 1 or review_score = 2;
-- 1 = 2603. 4.54%.  2 = 986. 1.7% 

-- how many normal reviews did they have 3? 
select review_score,
count(review_score),
review_comment_message
from order_reviews
group by review_score, review_comment_message
having review_score = 3;
-- 3 = 4515. 7.88%

-- ORDER OVERVIEW
select * from orders;

-- DELIVERY PERFORMANCE
select count(*) as number_of_orders, avg(product_weight_g), avg(product_length_cm), avg(product_height_cm), avg(product_width_cm),
case  when order_delivered_customer_date <= order_estimated_delivery_date 
then 'on time'
else 'delayed' 
end as delivery_status 
from orders o 
join order_items oi using (order_id)
join products p using (product_id)
join product_category_name_translation using (product_category_name)
where order_delivered_customer_date is not null and product_category_name_english in ('audio', 'electronics', 'computers_accessories', 'pc_gamer', 'computers')
group by delivery_status;


