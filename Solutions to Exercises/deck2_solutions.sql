-- Exercises: Queries Part I
-- activities table

-- a. Begin by selecting and viewing the entire activities table.  You should see 5 columns and at least 10 rows of data.
select * from activities;

-- b. Run another query to view only the id, item, and category columns.
select id, item, category from activities;

-- c. Display the item and activity_level columns and sort your data by activity level.  Which items require the highest level of activity?  Which ones have the lowest?
select item, activity_level from activities
order by activity_level desc;

-- d. Which activities are suitable for families?
select * from activities
where family_friendly=1;

-- e. Which activities are rated 3 or higher in terms of activity level?
select * from activities
where activity_level>=3;

-- f. Ordered by activity level, which sport items are also family friendly?
select * from activities
where family_friendly=1
order by activity_level desc;

--vendors table
--a. Query the table to display just the name and city of each vendor.
select vendor_name, city from vendors;

--b. Select all of the vendor data and sort it by price in descending order.
select * from vendors
order by price desc;

--c. Which vendors are available for the French cuisine package (id #4)?
select * from vendors
where activity_id=4;

--d. Which vendors are located in New York, Portland, or Honolulu?  (Did you use an IN clause?)
select * from vendors
where city in ('New York', 'Portland', 'Honolulu');

-- Exercises Part II
--vendors table
--a. Pull the vendor name and location city with a column to classify the vendor’s location as “West” or “East.” (Hint:  Use a CASE statement.)
select vendor_name, city, 
	case
		when city in ('New York') then 'east'
		else 'west'
	end
	as location
	from vendors;
-- b.	Classify activity price as “High” (>=500), “Medium” (<500 & >=300) and “Low” (<300) – name this column “price_level”. 
-- Pull vendor information when “prive_level” is “Medium” or “High”.
select *,
	case
		when price >= 500 then 'High'
		when price >=300 then 'Medium'
		else 'Low'
	end as price_level 
	from vendors
	where price>=300;
	
-- Exercises Part III
-- a. Select and display the 6 items with the lowest activity levels.
select top 6 * from activities
order by activity_level asc;

-- b. Company XYZ wants to score each item using a points system.  
-- Each family-friendly activity gets 20 points and each item gets an increasing number of points 
-- for how active it is, namely, 5 times the activity level.  Create a scoring column following this 
-- formula and name the column “score”.  Sort the items to see which receive the highest scores.
select item, 20 * family_friendly + 5 * activity_level as score 
from inventory
order by score desc;

-- c. Which items are package deals?  (Hint:  Look for the word “package” in the item name.)
select * from activities
where item like '%package%';

-- a. In alphabetical order, what are the top 3 vendors and where are they located?
select top 3 vendor_name, city from vendors
order by vendor_name;

-- b. Vendors in New York are running a 20% off special.  Create a new price column called “discount_price” 
-- to apply the discount.  (Remember:  The special is only valid for NY!)
select vendor_name, city 
	case when city='New York' then price * 0.8 
		else price
	end as discounted_price
from vendors;

-- c. Which vendors start with the letter “L”?  Which vendors explicitly mention “Surfing” in their names?
select * from vendors where vendor_name like 'L%';
select * from vendors where vendor_name like '%Surfing%';


-- Exercise: Aggregates
-- activities table
-- a. What is the average activity level of all of the items offered by the company?  (You may want to cast your result to a new data type for better accuracy.)
select avg(cast(activity_level as float)) as avg_activity_level
from activities;

-- b. What is the average activity level for each category?  
select avg(cast(activity_level as float)) as avg_activity_level, category
from activities
group by category;
	
-- c. Is it appropriate to use a HAVING statement to list the categories where all activities in that category have an activity level of 3 or lower?  If so, perform this query.  If not, write an appropriate query using WHERE.
select category, max(activity_level)
from activities
group by category
having max(activity_level)<=3;


--Exercises Aggregates
-- vendors table

--a. How much would it cost to try every vendor once?
select sum(price) from vendors;

--b. What is the average item price offered by vendors located California?
select avg(price) from vendors
where city in ('San Diego','San Francisco');

--c. What’s the minimum price available for each activity offered by Company XYZ?  (Note:  You do not need to know the name of each activity, only its id.)
select min(price), activity_id
from vendors
group by activity_id;

--d. Which activities have an average price of $300 or less?
select avg(price) as avg_price, activity_id
from vendors
group by activity_id
having avg(price)<=300;