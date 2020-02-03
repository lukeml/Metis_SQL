-- Exercise: Joins

-- Form the Cartesian product between the activities table and the vendors table for 
-- Company XYZ.

-- a. Select the top 10 rows from the Cartesian product (CP).
select top 10 * from vendors, activities;

	
-- b. Filter the CP to match up the activity ids.  Is your result an example of an explicit or implicit inner join?  Note:  You will need to alias your tables and use the table.column convention in your filter since both tables have an “id” column.  
select * from vendors v, activities a
where v.activity_id = a.id;


-- Perform an explicit inner join using the activities and vendors table by joining on activity id.  
-- c. Display the results as activity name, activity category, vendor name, 
-- and vendor price.
select a.item, a.category, v.vendor_name, v.price
from activities a
inner join
vendors v
on a.id = v.activity_id; 

-- d. Sort this joined table by vendor price to determine which vendor offers
-- the most expensive item.  What activity is it?  What category of activity is it?
select a.item, a.category, v.vendor_name, v.price
from activities a
inner join
vendors v
on a.id = v.activity_id
order by v.price desc; 

-- e. Can you build a potential vendor list for each activity like the one below?  
select a.id, a.item, string_agg(v.vendor_name,';') as vendor_list
from activities a
inner join
vendors v
on a.id = v.activity_id
group by a.item, a.id; 
 
-- Join the activities and vendors tables on activity id in the following ways. 
-- Before executing each command, try to predict which rows will and will not be included.  
-- Where do you expect NULL values?

-- Just change join type: left join, full outer join, right join:
select *
from activities a
full outer join
vendors v
on a.id = v.activity_id
order by v.price desc; 

-- Exercise Subqueries
-- Now that you are familiar with the  tables for Company XYZ (activities and vendors) use information from them to answer the following questions.  Be sure to use a subquery to answer each question in this section.

-- a. Several customers recently tried the wind surfing package but found it to be too action-packed.   
-- We’d like to suggest some other activities that have a lower activity level to them. 
-- Using a subquery to first select for the activity level of wind surfing, which items 
-- does the company offer with a lower activity rating?  
select * from activities
where activity_level < (select activity_level 
from activities where item = 'wind surfing');

-- b. What is the average activity level for all items offered by the company?  
-- (Check:  Is your average really an integer?)  Display the names and activity
-- levels of items with levels that are less than average.  
select item, activity_level from activities
where activity_level < (select avg(cast(activity_level as float)) from activities)

-- c. Which vendors offer packages for activities that are among the top 3 highest 
-- ranked in terms of activity level?
select v.vendor_name, a.activity_level, a.item from activities a
join vendors v
on a.id = v.activity_id
where a.activity_level in (
select top 3 activity_level from activities
order by activity_level desc)