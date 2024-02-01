show databases;

create database p2;
use p2;

select * from data1;
desc data1;

# kpi 1 
select Ticker , format(avg(Volume),0) as 'avg volume'
from data1
group by Ticker
order by Ticker;

# kpi 2
select Ticker , format(sum(Beta),0) as 'avg Beta'
from data1
group by Ticker
order by Ticker;

# kpi 3
select Ticker , format(sum(`Dividend Amount`),0) as 'sum of Dividend Amount'
from data1
group by Ticker
order by Ticker;

# kpi 4
select Ticker , format(sum(`PE Ratio`),0) as 'sum of PE Ratio'
from data1
group by Ticker
order by Ticker;

# kpi 5
select Ticker , concat(format(sum(`Market Cap`)/1000000000,0),"B") as 'Market Cap'
from data1
group by Ticker
order by Ticker;

# kpi 6
select left(Date,4) as year ,Ticker , format(max(`52 Week High`),2) as `52 Week High`, format(min(`52 Week Low`),2) as `52 Week Low`
from data1
group by year ,Ticker
order by year desc,Ticker;

# kpi 7
select date , Ticker , `RSI (14 days)` , MACD ,
case 
when `RSI (14 days)` < 45 and MACD > 0 then "Buy" 
when `RSI (14 days)` >= 69 and MACD < 0 then "Sell"
else "Neutral value"
end as buy_sell_ntg
from data1