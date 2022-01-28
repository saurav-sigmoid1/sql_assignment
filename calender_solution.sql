-- 1.
select DateDiff(MAX(date),Min(date))  as time_period,max(date),min(date) from calender;
-- 2.
select count(k.listing_id) from (select  listing_id from calender group by listing_id having count(listing_id)>1) as k;
select distinct listing_id from calender;
-- 3.
select listing_id,SUM(CASE WHEN available = 't' THEN 1 ELSE 0 END) AS available_days,SUM(CASE WHEN available = 'f' THEN 1 ELSE 0 END) AS not_available_days, SUM(CASE WHEN available = 't' THEN 1 ELSE 0 END)/count(available) as fraction   from calender group by listing_id; 
-- 4.
select sum(if(p.percent>50,1,0)) as ">50%",sum(if(p.percent>75,1,0)) as ">75%" from (select listing_id,(sum(if(available='f',1,0))/count(*))*100 as "percent" from calender group by listing_id) as p;
-- 5.
select listing_id, Max(price) as maximum_price,Min(price) as minimum_price,AVG(price) as average_price from calender group by listing_id;
-- 6.
select listing_id, Avg(price) as average_price from calender group by listing_id having Avg(price)>500;




