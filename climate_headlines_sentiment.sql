create database climate;
use climate;
select * from climate_headlines_sentiment;

-- Count the total number of articles in the dataset.
select count(*) as total_number_of_articles from climate_headlines_sentiment;

-- Count the number of positive, negative, and neutral sentiments.
select Sentiment ,
count(*) as sentiment_count
from climate_headlines_sentiment
group by Sentiment;

--  Retrieve headlines with the most negative sentiment.
select Headline,Sentiment
from climate_headlines_sentiment order by Sentiment asc limit 10;

select Headline,Sentiment from climate_headlines_sentiment
where Sentiment=(select min(Sentiment) from climate_headlines_sentiment);

--  Find the percentage of articles with neutral sentiment.
select count(*) * 100 / (select count(*) as total from climate_headlines_sentiment)
  as neutal_articles_percentage
from climate_headlines_sentiment where Sentiment = 0;

-- Retrieve the longest headline in terms of character count.
select Headline, char_length(Headline) as character_count
from climate_headlines_sentiment 
order by character_count desc 
limit 1;

-- Analyze the average sentiment score across all articles.
select avg(Sentiment) as average_sentiment
from climate_headlines_sentiment;

-- Determine the distribution of sentiment scores grouped by sentiment.
select Sentiment, count(*) as total_article
from climate_headlines_sentiment
group by Sentiment;

--  Identify the most common source based on the Link domain.
select SUBSTRING_INDEX(Link, '/', 3) as link_domain, 
count(*) as total_article
from climate_headlines_sentiment
group by link_domain
order by total_article desc 
limit 1;

--  What is the average sentiment score for each source domain?
select SUBSTRING_INDEX(Link, '/' ,3) as link_domain,
avg(Sentiment) as average_sentiment
from climate_headlines_sentiment
group by link_domain
order by average_sentiment desc;

-- How many articles have a positive, negative, and neutral sentiment?
select 
CASE
WHEN Sentiment > 0  THEN 'Positive'
WHEN Sentiment < 0 THEN 'Negative'
ELSE 'Neutral'
END AS sentiment_category,
count(*) as total_article
from climate_headlines_sentiment
group by sentiment_category
order by total_article;


--  What are the top 5 sources with the most articles related to climate change?
select SUBSTRING_INDEX(Link, '/' , 3)  as link_domain,
count(*) as total_article
from climate_headlines_sentiment
where Content LIKE '%climate change%'
group by link_domain
order by total_article desc
 limit 5;




