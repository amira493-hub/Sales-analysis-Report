create view Country_Level as

select  country, round(sum( Quantity* UnitPrice), 0) total_sales, 
case 
    when sum( Quantity* UnitPrice)> 100000 then 'vip country'
    when sum( Quantity* UnitPrice)> 50000 then 'average country' 
    else 'Normal country'
end as Country_Levels

from dbo.adding
group by country

select Country_Levels, count(country) as country_count 
from Country_Level
group by Country_Levels
order by country_count desc



