select id,name
from vgsales;

-- show how many games each publisher made
select publisher, count(Publisher) as no
from vgsales 
group by publisher
order by no desc;

-- show games that sold over 10 million copies globally
select name, platform, publisher, Global_Sales
from vgsales 
where global_sales > 10;

select name, platform, publisher, Global_Sales, (eu_sales + jp_sales + other_sales) as non_US_sales
from vgsales ;

-- sales per publisher yearly

select year, publisher, sum(global_sales) as total_sales
from vgsales
group by year,publisher
order by 1;

-- show genre sales yearly
SELECT Year, Genre, sum(global_sales)
FROM vgsales
WHERE Genre = "Shooter" or Genre = "Sport"
GROUP BY year,genre
ORDER BY year;

-- all mario games
SELECT *
from vgsales
where name like '%mario %';

-- which games sold more compared to all others
SELECT *, 
CASE 
	WHEN NA_Sales > (eu_sales + jp_sales + other_sales) then "US dominant"
    WHEN EU_Sales > (na_sales + jp_sales + other_sales) then "EU dominant"
    WHEN JP_Sales > (eu_sales + na_sales + other_sales) then "JP dominant"
    WHEN OTHER_Sales > (eu_sales + jp_sales + na_sales) then "other country dominant"
    ELSE " "
END AS TopSellerLocation
FROM vgsales;

-- show years the gaming industry grossed over 300 million
SELECT Year, sum(global_sales)
FROM vgsales
group by year
having sum(global_sales) > 300
order by year;