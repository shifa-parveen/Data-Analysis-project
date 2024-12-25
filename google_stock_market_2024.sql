create database google_stock;
use google_stock;
select * from cleaned_google_stock_market_2024;

-- 1. Find the total number of trading days in the dataset.
select count(Distinct Date)  as total_trading_days 
   from cleaned_google_stock_market_2024;
   
   -- 2. Calculate the average closing price.
   select avg(Close)  as average_closing_price
   from cleaned_google_stock_market_2024 ;
   
-- 3. Identify the day with the highest trading volume.
select Date, Volume from cleaned_google_stock_market_2024
where Volume = (select max(Volume) from cleaned_google_stock_market_2024);

-- 4. Find the highest stock price recorded in the dataset.
select max(High) as highest_stock_price 
from cleaned_google_stock_market_2024;

-- 5. List all days where the closing price was above $140.
select Date, Close from cleaned_google_stock_market_2024
where Close > 140;

-- 6. Calculate the total trading volume for the entire dataset.
select sum(Volume) as total_trading_volume
 from cleaned_google_stock_market_2024;
 
-- 7. Determine the average daily high price for the dataset.
select avg(High) as average_high_price from cleaned_google_stock_market_2024;

-- 8. Find the date and price of the lowest adjusted closing price.
select Date, Adj_Close 
from cleaned_google_stock_market_2024
where Adj_Close= (select min(Adj_Close) from cleaned_google_stock_market_2024);

-- 9. Identify the days where the opening price was higher than the closing price.
select Date, Open,Close from cleaned_google_stock_market_2024
where Open > Close;

-- 10. Calculate the percentage change between the highest and lowest prices.
select ((max(High)-min(Low))/min(Low))*100 as percentage_change 
from cleaned_google_stock_market_2024;

-- 11. Find the top 5 days with the highest closing prices.
select Date, Close from cleaned_google_stock_market_2024
order by Close desc limit 5; 

-- 12. Determine the number of days where the volume was below 10 million.
select count(*) as Volume_days_below_10million 
from cleaned_google_stock_market_2024
where Volume < 10000000;

-- 13. Calculate the average adjusted closing price for January 2024.
select avg(Adj_Close) as average_Adj_Close_Price
from cleaned_google_stock_market_2024
 where Date between '2024-01-01' and '2024-01-31';
 
-- 14. Find the date with the largest single-day price range (High - Low).
select Date, (High-Low) as price_range from cleaned_google_stock_market_2024 
order by price_range desc limit 1;

-- 15. List the dates where the stock closed higher than it opened.
select Date,Close,Open from cleaned_google_stock_market_2024 
where Close > Open;

-- 16. 14. Find the last date in the dataset.
select max(Date) as last_date from cleaned_google_stock_market_2024;

-- 17. Identify the month with the highest average trading volume.
select extract(month from Date) as month, 
extract(year from Date) as year, 
avg(Volume) as average_trading_volume 
from cleaned_google_stock_market_2024 
group by month,year
order by average_trading_volume desc
limit 1;

-- 18. Count the number of trading days where the adjusted closing price was below the average.
select count(Date) as trading_days from
cleaned_google_stock_market_2024 where Adj_Close < (select avg(Adj_Close) 
from cleaned_google_stock_market_2024);

-- 19. List all dates where the closing price was exactly equal to the opening price.
select Date,Close,Open from cleaned_google_stock_market_2024 where Close = Open;

-- 20. Calculate the average daily price change (|Close - Open|).
select avg(abs(Close - Open)) as average_daily_price_change 
from cleaned_google_stock_market_2024;

-- 21. Identify the days where the high and low prices were equal.
select count(Date) from cleaned_google_stock_market_2024 where High = Low;

-- 22. Find the first date in the dataset.
select min(Date) as first_date from cleaned_google_stock_market_2024;

-- 23. Find the average daily high price for January 2024.
select avg(High) as avg_high_jan_price
FROM cleaned_google_stock_market_2024 
where Date like '2024-01%';


