create database cybersecurity;
use cybersecurity;
select * from lossfromnetcrime;

-- 1.Retrieve all data from the table.
select * from lossfromnetcrime;

-- 2.Find the total complaints for 2019.
select sum(2019_Complaints) as total_2019_complaints from lossfromnetcrime;

-- 3.Find the average losses for 2020:
select avg(2020_Losses) as avg_loss_of_2020 from lossfromnetcrime;

-- 4.List countries with more than 5,000 complaints in 2021:
select Country from lossfromnetcrime
where 2021_Complaints > 5000;

-- 5.Find the country with the highest losses in 2023:
select Country from lossfromnetcrime
where 2023_Losses = (select max(2023_Losses) from lossfromnetcrime);

-- 6.Calculate the total losses for each year:
select sum(2019_Losses) as total_2019_losses,
sum(2020_Losses) as total_2020_losses,
sum(2021_Losses) as total_2021_losses,
sum(2022_Losses) as total_2022_losses,
sum(2023_Losses) as total_2023_losses,
sum(2024_Losses) as total_2024_losses from lossfromnetcrime;

-- 7.Rank countries by total losses in 2022:
select Country, 2022_Losses,
rank() over(order by 2022_Losses desc) as rank_2020_losses
from lossfromnetcrime;

-- 8.Calculate the percentage increase in complaints from 2019 to 2024 for each country:
select Country, ((2024_Complaints-2019_Complaints)*100/2019_Complaints) as increase_complaints
from lossfromnetcrime;

-- 9.Find countries with losses exceeding $100 million in all year:
select Country from lossfromnetcrime
where 2019_Losses > 100000000 or
2020_Losses > 100000000 or
2021_Losses > 100000000 or
2022_Losses > 100000000 or
2023_Losses > 100000000 or
2024_Losses > 100000000 ;


-- 10.Calculate the total complaints for each year:
select avg(2019_Complaints) as avg_2019_complaints, 
avg(2020_Complaints) as avg_2020_complaints,
avg(2021_Complaints) as avg_2021_complaints,
avg(2022_Complaints) as avg_2022_complaints,
avg(2023_Complaints) as avg_2023_complaints,
avg(2024_Complaints) as avg_2024_complaints
from lossfromnetcrime;

-- 11.List countries with decreasing complaints from 2022 to 2024:
select Country from lossfromnetcrime
where 2024_Complaints<2023_Complaints and 2023_Complaints<2022_Complaints;

-- 12.Identify the country with the largest total losses over all years:
select Country, (2019_Losses+2020_Losses+2021_Losses+2022_Losses+2023_Losses+2024_Losses) as total_losses
from lossfromnetcrime 
order by 'total losses' desc limit 1;

-- 13.Find the total complaints for all years grouped by country:
select Country,
(2019_Complaints+2020_Complaints+2021_Complaints+2022_Complaints+2023_Complaints+2024_Complaints) as total_Complaints
from lossfromnetcrime;

-- 14.List the top 5 countries with the highest complaints in 2024:
select Country, 2024_Complaints from lossfromnetcrime
order by 2024_Complaints desc limit 5;

-- 15.Find the difference in complaints between 2020 and 2019 for each country:
select Country, (2020_Complaints - 2019_Complaints) as df_2020_and_2019_complaints
 from lossfromnetcrime
 order by df_2020_and_2019_complaints desc ;
 
-- 16.Retrieve the countries where losses have consistently increased every year:
select Country from lossfromnetcrime
where 2020_Losses>2019_Losses and 2021_Losses>2020_Losses and 2022_Losses>2021_Losses and 
2023_Losses>2022_Losses and 2024_Losses>2023_Losses ;

-- 17.Group countries by losses into ranges (<$1M, $1M-$10M, >$10M in 2023):
select Country,
   case
     when 2023_Losses<1000000 then '<$1M'
     when 2023_Losses between 1000000 and 10000000 then '$1M-$10M'
     else '>$10M'
	end as Loss_Range
from lossfromnetcrime;
     
-- 18.Calculate the average losses per complaint for each country in 2023:
select Country, (2023_Losses/2023_Complaints) as avg_2023_losses_per_complaints
from lossfromnetcrime;

-- 19.Find the year with the highest total losses across all countries:
with highlosses as(
select '2019' as year, sum(2019_Losses) as total_losses from lossfromnetcrime
union all
select '2020' , sum(2020_Losses) from lossfromnetcrime
union all
select '2021' , sum(2021_Losses) from lossfromnetcrime
union all
select '2022' , sum(2022_Losses)  from lossfromnetcrime
union all
select '2023' , sum(2023_Losses)  from lossfromnetcrime
union all
select '2024' , sum(2024_Losses)  from lossfromnetcrime)
select year, total_losses from highlosses
order by total_losses desc limit 1;

-- 20.Generate a summary of total complaints and losses for each country:
select Country,
(2019_Complaints+2020_Complaints+2021_Complaints+2022_Complaints+2023_Complaints+2024_Complaints) as total_Complaints,
(2019_Losses+2020_Losses+2021_Losses+2022_Losses+2023_Losses+2024_Losses) as  total_Complaints
from lossfromnetcrime;

-- 21.Identify countries where 2024 losses are double the 2019 losses:
select Country from lossfromnetcrime
where 2024_Losses >= 2*2019_Losses ;

-- 22.Calculate the yearly increase in complaints for each country:
select Country,
(2020_Complaints-2019_Complaints) as complaints_increase_2020,
(2021_Complaints-2020_Complaints) as complaints_increase_2021,
(2022_Complaints-2021_Complaints) as complaints_increase_2022,
(2023_Complaints-2022_Complaints) as complaints_increase_2023,
(2024_Complaints-2023_Complaints) as complaints_increase_2024
from lossfromnetcrime;

-- 23.Retrieve the top 3 countries with the lowest losses in 2021:
select Country, 2021_Losses from lossfromnetcrime
order by 2021_Losses desc limit 3;

-- 24.Determine the total complaints and losses in 2024 across all countries:
select Country, sum(2024_Complaints) as total_2024_complaints,
sum(2024_Losses) as total_2024_losses
from lossfromnetcrime
group by Country;

-- 25.List countries where the average loss per complaint in 2023 exceeds $10,000:
select Country from lossfromnetcrime
where (2023_Losses/2023_Complaints) > 10000;

-- 26.Find countries with complaints increasing every year from 2019 to 2024:
select Country from lossfromnetcrime
where 2020_Complaints>2019_Complaints and 2021_Complaints>2020_Complaints and 2022_Complaints>2021_Complaints and 2023_Complaints>2022_Complaints and 2024_Complaints>2023_Complaints;

-- 27.Calculate the cumulative complaints for each year:
select sum(2019_Complaints) as total_2019_complaints,
    sum(2020_Complaints) as total_2020_complaints,
    sum(2021_Complaints) as total_2021_complaints,
    sum(2022_Complaints) as total_2022_complaints,
    sum(2023_Complaints) as total_2023_complaints,
    sum(2024_Complaints) as total_2024_complaints
from lossfromnetcrime;

-- 28.Identify countries where losses decreased from 2023 to 2024:
select Country from lossfromnetcrime
where 2024_Losses<2023_Losses;

-- 29.Find the total losses across all years for countries starting with 'P':
select Country, sum(2019_Losses+2020_Losses+2021_Losses+2022_Losses+2023_Losses+2024_Losses) as total_losses
from lossfromnetcrime
where Country like 'P%'
group by Country;

-- 30.Identify years where total complaints exceeded 100,000:
with exceed as(
select '2019' as year, sum(2019_Complaints) as total_Complaints from lossfromnetcrime
union all
select '2020', sum(2020_Complaints) from lossfromnetcrime
union all
select '2021', sum(2021_Complaints) from lossfromnetcrime
union all
select '2022', sum(2022_Complaints)  from lossfromnetcrime
union all
select '2023', sum(2023_Complaints)  from lossfromnetcrime
union all
select '2024' as year, sum(2024_Complaints)  from lossfromnetcrime)
select year from exceed where total_Complaints > 100000 ;

-- 31.Rank countries by total complaints in 2024:
select Country, 2024_Complaints,
rank() over(order by 2024_complaints desc) as rank_2024_complaints
from lossfromnetcrime;

-- 32.Identify the country with the largest total complaints over all years:
select Country, (2019_Complaints+2020_Complaints+2021_Complaints+2022_Complaints+2023_Complaints+2024_Complaints) as total_Complaints
from lossfromnetcrime
order by total_Complaints desc limit 1;

-- 33.List countries with the highest growth in losses from 2022 to 2023:
select Country, (2023_Losses - 2022_Losses) as loss_growth
from lossfromnetcrime
order by loss_growth desc;

-- 34.Identify the country with the highest average losses per year:
select Country,(2019_Losses+2020_Losses+2021_Losses+2022_Losses+2023_Losses+2024_Losses)/6 as avg_losses_per_year
from lossfromnetcrime
order  by avg_losses_per_year desc limit 1;

-- 35.List countries where losses stayed constant from 2020 to 2024:
select Country from lossfromnetcrime
where 2021_Losses = 2020_Losses AND 2022_Losses = 2021_Losses AND 2023_Losses = 2022_Losses AND 2024_Losses = 2023_Losses;

-- 36.Rank years by total losses in descending order:
with lossbyyear as(
select '2019' as year, sum(2019_Losses) as total_losses from lossfromnetcrime
union all
select '2020' as year, sum(2020_Losses) from lossfromnetcrime
union all
select '2021' as year, sum(2021_Losses) from lossfromnetcrime
union all
select '2022' as year, sum(2022_Losses)  from lossfromnetcrime
union all
select '2023' as year, sum(2023_Losses)  from lossfromnetcrime
union all
select '2024' as year, sum(2024_Losses)  from lossfromnetcrime)
select year, total_losses, rank() over(order by total_losses desc) as 'rank'
from lossbyyear;

-- 37.Find the year with the lowest average complaints:
with lowestavg as(
select '2019' as year, avg(2019_Complaints) as avg_complaints from lossfromnetcrime
union all
select '2020', avg(2020_Complaints)  from lossfromnetcrime
union all
select '2021', avg(2021_Complaints)  from lossfromnetcrime
union all
select '2022', avg(2022_Complaints)  from lossfromnetcrime
union all
select '2023', avg(2023_Complaints)  from lossfromnetcrime
union all
select '2024' , avg(2024_Complaints)  from lossfromnetcrime)
select year, avg_complaints from lowestavg
order by avg_complaints asc limit 1;

-- 38.Determine the average yearly complaints for each country:
select Country, (2019_Complaints+2020_Complaints+2021_Complaints+2022_Complaints+2023_Complaints+2024_Complaints)/6 as avg_Complaints
from lossfromnetcrime;













