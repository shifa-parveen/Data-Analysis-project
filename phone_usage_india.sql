create database phone;
use phone;

-- 1. Fetch all records from the table.
select * from phone_usage_india;

-- 2. Retrieve users aged between 20 and 30.
select * from phone_usage_india
where Age  between 20 and 30;

-- 3. Find the average screen time of users by gender.
select Gender, avg(`Screen Time (hrs/day)`) as 'avg screen time' from phone_usage_india
group by Gender 
order by `avg screen time` desc;

-- 4. Count the number of users for each primary use category.
select `Primary Use`, count(*) as 'total no of users' from phone_usage_india
group by `Primary Use`
order by `total no of users` desc;
 
-- 5. Retrieve the top 5 locations with the highest number of users.
select Location , count(*) as 'total no of users' from phone_usage_india
group by Location 
order by `total no of users` desc limit 5;

-- 6. Find the maximum data usage among Android users.
select OS, max(`Data Usage (GB/month)`) as'max data usage' from phone_usage_india 
where OS = 'Android';

-- 7. List all users who spend more than 5 hours daily on social media.
select * from phone_usage_india
where `Social Media Time (hrs/day)` > 5;

-- 8. Calculate the total monthly recharge cost for users in Delhi.
select Location, sum(`Monthly Recharge Cost (INR)`) as'total monthly recharge cost'
from phone_usage_india
where Location = 'Delhi';

-- 9. Retrieve the average gaming time for users with more than 100 apps installed.
select avg(`Gaming Time (hrs/day)`) as 'avg gaming time' from phone_usage_india
where `Number of Apps Installed` > 100;

-- 10. Find the phone brand with the highest number of users.
select `Phone Brand`, count(*) as 'no of users' from phone_usage_india
group by `Phone Brand`
order by `no of users` desc limit 1;

-- 11. Retrieve users whose monthly e-commerce spend exceeds their monthly recharge cost.
select * from phone_usage_india 
where `E-commerce Spend (INR/month)` > `Monthly Recharge Cost (INR)`;

-- 12. Find the top 3 cities with the highest average data usage.
select Location, avg(`Data Usage (GB/month)`) as 'avg data usage' from phone_usage_india
group by Location
order by `avg data usage` desc limit 3 ;

-- 13. Count the number of users for each OS.
select OS, count(*) as 'no of users' from phone_usage_india
group by OS;

-- 14. List the users who have the highest streaming time.
select * from phone_usage_india
where `Streaming Time (hrs/day)` = (select max(`Streaming Time (hrs/day)`) 
from phone_usage_india);

-- 15. Retrieve the total gaming time for male user.
select Gender, sum(`Gaming Time (hrs/day)`) as 'total gaming time' from phone_usage_india
where Gender='Male';

-- 16. Find the average e-commerce spend by phone brand.
select `Phone Brand`, avg(`E-commerce Spend (INR/month)`) as 'avg E-commerce spend(INR/month)'
from phone_usage_india
group by `Phone Brand`
order by `avg E-commerce spend(INR/month)` desc;

-- 17. Fetch all unique primary uses.
select distinct `Primary Use` from phone_usage_india;

-- 18. Retrieve the average call duration by agegroup(decade).
select floor(Age/10)*10 as AgeGroup, avg(`Calls Duration (mins/day)`) 
as 'avg call duration(mins/day)' 
from phone_usage_india
group by AgeGroup
order by AgeGroup asc;

-- 19. Find the user with the lowest monthly recharge cost.
select * from phone_usage_india 
where `Monthly Recharge Cost (INR)` = (select min(`Monthly Recharge Cost (INR)`) 
from phone_usage_india);

-- 20. List users who are using iOS and spend less than 2 hours on gaming daily.
select * from phone_usage_india 
where OS = 'iOS' and `Gaming Time (hrs/day)` < 2;

-- 21. Find the average monthly recharge cost by age .
select Age, avg(`Monthly Recharge Cost (INR)`) as 'avg Monthly Recharge Cost (INR)' 
from phone_usage_india
group by Age
order by Age asc;

-- 22. Retrieve users with the highest number of apps installed.
select * from phone_usage_india
where `Number of Apps Installed` = (select max(`Number of Apps Installed`) 
from phone_usage_india);

-- 23. Calculate the total e-commerce spend for users aged above 40.
select sum(`E-commerce Spend (INR/month)`) as 'total e-comerce spend' 
from phone_usage_india
where Age>40;

-- 24. Retrieve the top 5 users with the highest daily screen time.
select * from phone_usage_india
order by `Screen Time (hrs/day)` desc
limit 5;

-- 25. Find the most common primary use of phones.
select `Primary Use`, count(*) as 'no of users' from phone_usage_india
group by `Primary Use`
order by `no of users` desc
limit 1;

-- 26. Calculate the average data usage for iOS users.
select avg(`Data Usage (GB/month)`) as 'avg data usage' from phone_usage_india
where OS ='iOS';

-- 27. Find users who spend more than 3 hours daily on both gaming and social media.
select * from phone_usage_india 
where `Gaming Time (hrs/day)` > 3 and `Social Media Time (hrs/day)` > 3; 

-- 28. Count the number of male and female users
select Gender, count(*) as 'count of gender' from phone_usage_india
group by Gender
order by `count of gender` desc ;

-- 29. Retrieve users with a monthly recharge cost above the average.
select * from phone_usage_india 
where `Monthly Recharge Cost (INR)` > (select avg(`Monthly Recharge Cost (INR)`) 
from phone_usage_india);

-- 30. List the phone brands used by users spending over 4 hours on streaming daily.
select distinct `Phone Brand` from phone_usage_india
where `Streaming Time (hrs/day)` > 4;

-- 31. Calculate the total data usage by gender.
select Gender, sum(`Data Usage (GB/month)`) as 'total data usage (GB/month)'
from phone_usage_india
group by Gender
order by `total data usage (GB/month)` desc;

-- 32. Retrieve users whose primary use is gaming and have over 50 apps installed.
select * from phone_usage_india
where `Primary Use` = 'Gaming' and `Number of Apps Installed` > 50;

-- 33. Find the average streaming time for users in Mumbai.
select avg(`Streaming Time (hrs/day)`) as 'avg streaming time (hrs/day)' 
from phone_usage_india
where Location = 'Mumbai';

-- 34. List users with the lowest daily call duration.
select * from phone_usage_india
where `Calls Duration (mins/day)` = (select min(`Calls Duration (mins/day)`)
from phone_usage_india);

-- 35. Calculate the average number of apps installed by phone brand.
select distinct`Phone Brand`, avg(`Number of Apps Installed`) as 'avg no of apps installed'
 from phone_usage_india
 group by `Phone Brand`
 order by `avg no of apps installed` desc;

-- 36. Find users whose data usage is below 1 GB per month.
select * from phone_usage_india 
where `Data Usage (GB/month)` < 1;

-- 37. Retrieve the total social media time by city.
select distinct`Location`, sum(`Social Media Time (hrs/day)`) as 'total social media time(hrs/day)'
from phone_usage_india
group by `Location`;

-- 38. List users who spend the most time on gaming.
select * from phone_usage_india 
where `Gaming Time (hrs/day)`= (select max(`Gaming Time (hrs/day)`) from phone_usage_india);

-- 39. Find the average monthly recharge cost by phone OS.
select OS, avg(`Monthly Recharge Cost (INR)`) as 'avg monthly recharge cost (INR)'
from phone_usage_india
group by OS;

-- 40. Retrieve the total number of users by their primary use.
select `Primary Use`, count(*) as'total no of users' from phone_usage_india
group by `Primary Use`;


