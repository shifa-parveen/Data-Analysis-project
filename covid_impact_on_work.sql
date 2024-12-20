create database covid;
use covid;
select * from impact_works;

-- 1. What is the average Hours_Worked_Per_Day for each Sector?
select Sector, avg(Hours_Worked_Per_Day) as average_Hours_Worked_Per_Day
from impact_works group by Sector order by average_Hours_Worked_Per_Day desc;

-- 2. How many employees reported Health_Issue in each Sector?
select Sector, count(Health_Issue) as reported_health_issue
from impact_works where Health_Issue = 1
group by Sector order by reported_health_issue desc;

-- 3. What percentage of employees work from home in each sector?
select Sector, round(sum(Work_From_Home)*100 / count(*),2) as Work_From_Home_Percentage
 from impact_works group by Sector
 order by Work_From_Home_Percentage desc;
 
 -- 4. What is the average Productivity_Change for employees working from home vs. on-site?
 select Work_From_Home, avg(Productivity_Change) as average_Productivity_Change
 from impact_works group by Work_From_Home;
 
 -- 5. Which sector experienced the most Salary_Changes due to COVID-19?
 select Sector, count(Salary_Changes) as most_salary_change from impact_works
 group by Sector order by most_salary_change desc;
 
 -- 6. What is the average number of Meetings_Per_Day for employees who reported Increased_Work_Hours?
select Increased_Work_Hours, avg(Meetings_Per_Day) as average_Meetings_Per_Day
from impact_works where Increased_Work_Hours =1
 group by Increased_Work_Hours;

-- 7. Which sectors report the highest Job_Security concerns?
select Sector, count(Job_Security) as job_security_concerns from impact_works 
where Job_Security = 0 
group by Sector order by job_security_concerns desc;

-- 8. How many employees face Childcare_Responsibilities while working from home?
select count(*) as childcare_responsibilities_face_by_employees
from impact_works
where Work_From_Home = 1 and Childcare_Responsibilities = 1 ;

-- 9. What is the correlation between Technology_Adaptation and Team_Collaboration_Challenges?
select Technology_Adaptation, avg(Team_Collaboration_Challenges) 
as average_Team_Collaboration_Challenges
from impact_works group by Technology_Adaptation;

-- 10. How many employees in each sector were affected by COVID-19?
select Sector, count(Affected_by_Covid) as affected_by_covid_19 from impact_works 
 group by Sector
order by affected_by_covid_19 desc;

-- 11. What is the average Salary_Changes for employees by Sector?
select Sector, avg(Salary_Changes) as average_salary_changes
from impact_works group by Sector order by average_salary_changes desc;

-- 12. How does Increased_Work_Hours impact Job_Security?
select Increased_Work_Hours , avg(Job_Security) as average_job_security
 from impact_works group by Increased_Work_Hours order by average_job_security desc;
 
 -- 13. What percentage of employees in each sector face Team Collaboration Challenges?
 select Sector, round(sum(Team_Collaboration_Challenges)*100/count(*),2) 
 as Team_Collaboration_Challenges_Percentage
 from impact_works group by Sector order by Team_Collaboration_Challenges_Percentage desc;
 
 -- 14. What is the distribution of Stress_Level across sectors?
 select Sector,Stress_Level, count(*) as stress_level_count
 from impact_works group by Sector,Stress_Level
 order by stress_level_count desc;
 
 -- 15. Which sectors have the highest percentage of employees adapting to technology?
 select Sector, round(sum(Technology_Adaptation)*100/count(*),2)
 as percentage_adapting_technology
 from impact_works
 group by Sector 
 order by percentage_adapting_technology desc;
 







