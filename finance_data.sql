create database finance;
use finance;
select * from finance_data;

-- 1. List all columns and rows from the dataset.
select * from finance_data;

-- 2. Find the distinct genders in the dataset.
select distinct gender from finance_data;

-- 3. Retrieve all records where the age is greater than 30.
select * from finance_data where age>30;

-- 4. Count the number of respondents for each gender.
select gender, count(*) as respondents from finance_data
group by gender;

-- 5. Find the average age of each respondents.
select avg(age) as average_age, count(*) as respondents from finance_data
group by age order by respondents desc;

-- 6. Find all respondents who prefer 'Mutual Fund' as their investment avenue.
select * from finance_data where Avenue ='Mutual Fund';

-- 7. Retrieve records where the expected return is between 10% and 20%.
select * from finance_data where Expect = '10%-20%';

-- 8. Calculate the total number of investments in Mutual Funds.
select sum(Mutual_Funds) as total_MF from finance_data;

-- 9. Find the maximum investment in Gold.
select max(Gold) as max_Gold from finance_data;

-- 10. Get the count of respondents by their investment monitoring frequency.
select Invest_Monitor, count(*) as respondents from finance_data
group by Invest_Monitor;

-- 11. Find the top 3 investment purposes based on frequency.
select Purpose,count(Invest_Monitor) as frequency from finance_data 
group by Purpose order by Purpose  desc limit 3;

-- 12. Identify respondents investing more than 5 units in both Gold and Mutual Funds.
select count(*) as respondents from finance_data 
where Gold>5 and Mutual_Funds>5;

-- 13. List respondents whose reason for choosing equity is 'Capital Appreciation' and  older than 25.
select * from finance_data where
Reason_Equity = 'Capital Appreciation'and age>25;

-- 14. Find the sum of investments across all types for each respondent.
select gender,age, sum(Mutual_Funds + Equity_Market + 
Debentures + Government_Bonds + Fixed_Deposits + PPF + Gold) as total_investment 
from finance_data
group by gender,age
order by total_investment desc;

-- 15. Rank respondents based on their Fixed Deposits investment.
select gender,age,Fixed_Deposits ,rank() over(order by Fixed_Deposits desc)
as respondents_rank from finance_data;

-- 16. List respondents whose savings objective includes retirement.
select Gender,age,count(*) as frequency
 from finance_data
 where `What are your savings objectives?`= 'Retirement Plan'
 group by Gender,age
 order by frequency desc;

-- 17. Calculate the total investment in Fixed Deposits, grouped by gender and age.
select gender,age, sum(Fixed_Deposits) as total_FD from finance_data 
group by gender,age
order by total_FD desc;

-- 18. Identify the top 5 respondents by Gold investment.
select * from finance_data order by Gold desc limit 5;

-- 19. Find respondents who invest in Equity Market but not Mutual Funds
select * from finance_data where 
Equity_Market > 0 and Mutual_Funds = 0;

-- 20. Retrieve respondents who have high scores (above 6) in at Mutual_Funds investment avenue.
select * from finance_data 
where Mutual_Funds > 6 ;


-- 21.Calculate the percentage of respondents for each savings objective.
select `What are your savings objectives?`,
 (count(*) / (select count(*) from finance_data) ) * 100 as percentage
 from finance_data
 group by `What are your savings objectives?`;


-- 22.List all respondents who expect returns between 20%-30%.
select * from finance_data where Expect = '20%-30%';

-- 23. Find the maximum and minimum age of respondents.
select max(age) as max_age,min(age) as min_age from finance_data;

-- 24. Display records with a Fixed Deposit score greater than 5.
select * from finance_data where Fixed_Deposits > 5;

-- 25. Retrieve respondents who prefer equity for Capital Appreciation.
select * from finance_data
 where Avenue = 'Equity' and Reason_Equity = 'Capital Appreciation';

-- 26. Count the total number of records.
select count(*) as total_records from finance_data;

-- 27. Find the total investment in Mutual Funds by gender.
select gender,sum(Mutual_Funds) as total_MF from finance_data
group by gender
order by total_MF desc;

-- 28. Retrieve respondents who monitor their investments daily.
select * from finance_data where Invest_Monitor = 'Daily';

-- 29. Find the average Mutual Funds score for each age group.
select age, avg(Mutual_Funds) as avg_MF
 from finance_data
 group by age 
 order by avg_MF desc;

-- 30. Count the number of respondents for each investment duration.
select Duration,count(*) as respondents
 from finance_data 
 group by Duration
 order by respondents desc;

-- 31. Find the average investment by gender.
select gender,round(avg(Mutual_Funds+Equity_Market+PPF+Gold+Government_Bonds+Fixed_Deposits
+Debentures),2)
as avg_investment
 from finance_data 
 group by gender
 order by avg_investment desc;
 
-- 32. Find the correlation between duration and investment in the Gold.
select Duration, avg(Gold) as avg_Gold 
from finance_data 
group by Duration
order by avg_Gold desc;

-- 33. List customers who have invested in both gold and mutual funds.
select * from finance_data 
where Gold>0 and Mutual_Funds>0;

-- 34. Rank customers by their total investments.
select Gender,age,sum(Mutual_Funds + Equity_Market + 
Debentures + Government_Bonds + Fixed_Deposits + PPF + Gold) as total_investment,
 rank() over(order by sum(Mutual_Funds + Equity_Market + 
Debentures + Government_Bonds + Fixed_Deposits + PPF + Gold) desc) as rank_TI 
from finance_data
group by Gender,age
order by total_investment desc;

-- 35. Analyze the monthly contribution to mutual funds.
select sum(Mutual_Funds) as sum_MF 
from finance_data where Invest_Monitor = 'Monthly';

-- 36. Determine the average duration of investments for each purpose.
select Purpose,avg(Mutual_Funds + Equity_Market + 
Debentures + Government_Bonds + Fixed_Deposits + PPF + Gold) as Total_investment_avg
from finance_data 
group by Purpose;

-- 37. Calculate the maximum investment in government securities.
select max(Government_Bonds) as max_gov_securities from finance_data;

-- 38. Calculate the standard deviation of expectations across all customers.
select stddev(Expect) as Expect_std 
from finance_data;

-- 39. Identify objectives with no investments in specific avenues.
select Objective from finance_data where Avenue is null;

-- 40. Calculate the correlation between monthly investments and expectations.
select Invest_Monitor, avg(Expect) as Expect_avg,
avg(Mutual_Funds + Equity_Market + 
Debentures + Government_Bonds + Fixed_Deposits + PPF + Gold) as Total_investment_avg
from finance_data 
group by Invest_Monitor;

-- 41. Find customers with the highest expectations for savings.
select gender,age,Expect from finance_data
order by Expect desc;

-- 42. Determine reasons for fixed deposits by frequency.
select Reason_FD, count(*) as frequency from finance_data 
group by Reason_FD 
order by frequency desc;

-- 43. Identify customers with diversified investment objectives.
select Gender, age ,count(distinct Objective) as objective_count
 from finance_data
 group by Gender,age
 having objective_count > 1;
 
 -- 44. Analyze reasons for investing in bonds.
 select Reason_Bonds, count(*) as frequency
 from finance_data 
 group by Reason_Bonds
 order by frequency desc;
 
 -- 45. Determine the most popular investment objectives.
 select Objective,count(*) as frequency 
 from finance_data
 group by Objective
 order by frequency desc;
 
 -- 46. Rank customers by the variety of investment reasons.
 select Gender,age,
 count(distinct Reason_Equity || Reason_Mutual || Reason_Bonds || Reason_FD) as reason_count
 from finance_data
 group by Gender,age
 order by reason_count desc;
 
 -- 47. Determine the most common source of funds.
 select Source,count(*) as frequency
 from finance_data
 group by Source
 order by frequency;
 
 -- 48. Compare investment trends by source of funds..
 select Source,sum(Mutual_Funds + Equity_Market + 
Debentures + Government_Bonds + Fixed_Deposits + PPF + Gold) as total_investment
from finance_data 
group by Source
order by total_investment desc;

-- 49. Analyze trends in mutual fund investments by month.
select Invest_Monitor,
sum(Mutual_Funds) as total_MF
from finance_data 
where Invest_Monitor = 'Monthly'
group by Invest_Monitor
order by total_MF;

-- 50. Compare savings objectives by total expectations.
select `what are your savings objectives?`, 
sum(Expect) AS total_expectation
from finance_data
group by `what are your savings objectives?`;

-- 51. Determine the total investment split by savings objectives.
select `What are your savings objectives?`,
sum(Mutual_Funds + Equity_Market + 
Debentures + Government_Bonds + Fixed_Deposits + PPF + Gold) as total_investment
from finance_data
group by `What are your savings objectives?`
order by total_investment desc;

-- 52. Find the total investment for each reason in equity markets.
select Reason_Equity,
sum(Mutual_Funds + Equity_Market + 
Debentures + Government_Bonds + Fixed_Deposits + PPF + Gold) as total_investment
from finance_data
group by Reason_Equity
order by total_investment desc;

 -- 53. Identify the relationship between savings objectives and investment avenues.
 select `What are your savings objectives?`,
 Avenue,count(*) as frequency
 from finance_data
 group by  `What are your savings objectives?`,Avenue
 order by frequency desc;
 
 -- 54. Find the most common reasons for investing in mutual funds.
 select * from finance_data;
 select Reason_Mutual,
 count(*) as frequency
 from finance_data 
 group by Reason_Mutual
 order by frequency desc;

 














