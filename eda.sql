
-- 1) genres aggregated
Select g.id,g.name, count(*) as movies_count
from movies_updated m
inner join genres g on g.id = m.genre_id
group by 1,2
order by 3 desc;

-- 2) most popular films in each original language
with most_pop as (Select  title , popularity, original_language
from movies
order by 2 desc)

,rankings as(Select * , rank() over(partition by original_language order by popularity desc) as ranking
from most_pop)

Select original_language, title,popularity from rankings
where ranking = 1;

-- 3) movie average inisghts by year, (first we removed the duplcaited to not have inflated results )

with unique_movies as(Select distinct title,release_date, revenue, vote_count,popularity,budget
from movies_updated)

Select year(release_date) as year,count(*) as movie_counts, round(avg(revenue),2) as average_revenue,
round(avg(budget),2) as avg_budget,
avg(vote_count) as avg_vote_count
,round(avg(popularity),2) as avg_popularity
from unique_movies
group by 1 
order by 1 desc;
 

-- 4) movies ROI  net profit/ cost of investment * 100

with profit as(select distinct title as title,id,(revenue - budget) as profit, revenue, budget 
from movies_updated)

Select id,title,  round((profit/budget) * 100,2) as ROI
from profit
order by 3 desc;

-- 5) correlation of number of genres to revenue and popularity
with genre_count as(Select distinct id, title, count(distinct genre_id) as genre_counts,revenue
from movies_updated
group by 1,2,4)

Select genre_counts, round(avg(g.revenue),2) as avg_revenue
from genre_count g
inner join movies_updated m on g.id = m.id
group by 1	
order by 2 desc;

-- 6) classifying movies into 3 categories short films, regular films, long films and comparing insights
Select min(runtime), max(runtime), avg(runtime) --  understand the distribution
from movies_updated;

with movie_types as (Select distinct id, title, revenue,vote_average,popularity,runtime, case 
	when runtime >= 120 then 'big movie'
    when runtime >= 90 then 'regular movie'
    else 'short movie' end as movie_type
from movies_updated)
Select movie_type,count(*) movie_counts, round(avg(revenue),2) as average_revenue, round(avg(popularity),2) average_popularity
,round(avg(vote_average),2) average_vote_rating
from movie_types
group by 1
order by average_revenue desc;
-- 7)  rolling count of movies released from 2000 to 2017 partitoned by year and month
with movies_unique as(
Select distinct id, title,year(release_date) as release_year, month(release_date) as release_month
from movies_updated
where year(release_date) between 2000 and 2017
group by 1,2

)
, year_month_counts as(
Select release_year,release_month, count(*) as movie_counts
from movies_unique
group by 1,2
order by 1 asc,2 asc)
Select *, sum(movie_counts) over(partition by release_year order by release_month ) as rolling_count
from year_month_counts;

-- 8) Runtime Distribution
with unique_movies as( Select distinct id, title,runtime 
from movies_updated)
Select floor(runtime/10)* 10 as runtime_bins, count(*) movie_count
from unique_movies
group by 1
order by 1;















