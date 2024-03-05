# day1

# server used to store huge amount of data
# in server we have softwear and hardwear . 
# hardwear for store the data , we have to instruct softwear - like which data we want . 
# but , softwear don't undrstand human language . so , we have to use sql .
# for writing sql we are using mysql application . 

# 80 % people use mysql application
# remaining 20 % people use on-sql . other people will there to do no-sql . 

# database is collection of tables 
# table is collection of informations


# data analyst no need to do normalisation , some other will do .
# just know the concept with example . may interviewer ask
# they are 3 types basicaly 
# first normalisation - if you have multiple values , dont put in single row . add another row and put .
# second normalisation - try to maintaine different tables - dont put all in one table . 
# third normalisation - create table to explain what data mean in another table . 
# see screenshots for examples for normalisation .


# 5 types of sql commands are there : 
# DDL , DML , DQL , TCL , DCL 
# DDL ( data definition language ) - create , drop , alter , truncate
# DML ( Data manipulating language ) - insert , update , delete 
# DQL ( Data query language ) - select
# TCL ( transaction control language ) - control , rollback , save point 
# DCL ( Data control language ) - grant , revoke
 
# only DQL is required for Data analyst profile .

# remaining done by others , just know concept with example . may interviwer ask . 

# DCL not in the part of syllabus 

 
# what is the difference between drop , delete , truncate . ( imp question ask by interviewer ) ?

# drop - delete data(records) and table( table structure)
# delete - table( table structure ) will be there - condition base deleting the data(records) or delete all data(records) in one shot , you can retrive the deleted data - this done the data administrator , slower than truncate 
# truncate - table( table structure ) will be there - but your records will be get deleted in one shot, not able to retrive the data - if you delete data by using truncate , faster than delete    

#....................................................................................................................................................................................................... 

# day 2

# DDL ( data definition language ) - create ,truncate , alter , drop 
# DML ( Data manipulating language ) - insert 

# show databases;
## ctrl + enter = for execution


create database augsql7am;
## click  on refresh symbol , in navigator - schemas . or show databases . 

use augsql7am;	
## augsql7am database is highlighted in schemas tab , that indicate database in use augsql7am . 


# show tables;


create table Sample ( sno int , sname char(10));
desc Sample;
select * from Sample;


insert into Sample values (1,"raj"),(2,"rao"),(3,"kiran"),(4,"Laxmi"),(5,"Jay");


truncate table Sample;

alter table Sample add column age tinyint;
alter table Sample modify column sname varchar(20);
alter table Sample change column sname student_name varchar(20);
# (or)  alter table Sample change column sname `student name` varchar(20);
# to get space in between use "`" . ( "`" is called backend pointer )
alter table Sample drop column age;
rename table Sample to example;
desc example;
show tables;
alter table example rename to Sample; 

drop table Sample;
drop database augsql7am;


# for saving the file - click beside option of total_execute thunder button . 

# for open the file - click below edit - sql_folder icon .  

# safe update - click Edit , click preferences,click sql editor ,scroll to last and uncheck safe update , ok , close workbench , open workbench . 

#....................................................................................................................................................................................................... 

# day 3

# DML ( Data manipulating language ) - delete , update 

delete	from Sample
where sno=2;

select * from Sample;

delete from Sample;


update Sample
set age=20
where sno<=3;

select * from Sample;

update Sample
set age=30
where age is null;

#........................................................................................ 

# select - distinct - count , min , max , sum , average
# order by - asc - desc , 
# where - comparison_operations(>,>=,<,<=,<>,!=,=) - logical_operators(and,or,not) - in - is null - between - like 
# group by - 
# having -

# select 
# order by 

# select 
# where

# select 
# group by 

# having
# order by 


# DQL ( Data query language ) - select

# for importing the flat file data , file in CSV format 
# and date in format of ( year , month , day)

# select the database , right click , click table data import Wizard , browse file(superstore_ud_ql) location ,click next ,click create new table,rename table name, next ,next,next,next,finish , refresh in schemas tab - it reflect in Tables . 

# it remove error rows , and load in sql . 


# desc superstore;

# alter table superstore modify column `Order Date` Date; 		# changing data type text to date
# alter table superstore modify column `Ship Date` Date;
# alter table superstore change column `Grand total` Sales int;

 
select * from  superstore;
select Country from superstore;
select Country,segment from superstore;
select City , Country , Sales from superstore;
select * , Country from superstore; 

select distinct Country from superstore; 
select distinct Country,segment from superstore; 

select sum(Sales) from superstore;
select avg(Sales) from superstore;
select min(Sales) from superstore;
select max(Sales) from superstore;
select count(Sales) from superstore;


select distinct Country , segment from superstore 
order by Country asc; 
select distinct Country , segment from superstore 
order by Country desc;  
select distinct Country , segment from superstore 
order by Country;   
select  Country , segment , Sales from superstore
order by Country , segment desc , Sales desc ;


select Country , Sales from superstore
where Country = "germany" or Country = "france";
select Country,Sales from superstore
where Country <> "france";       										# except
select Country , Sales from superstore
where Country != "france" and Country != "france";

select Country , Sales from superstore
where Sales>=500 and Country="germany"
order by Sales;

select Country ,Sales from superstore
where Country in ("germany","france");

select Country , (profit/sales) from superstore
where (profit/sales) is null
order by sales;

select Country , Sales , profit , (Sales - profit) as cost from superstore
where Country in ( "france" , "spain") and (Sales - profit) between 300 and 500 
order by cost ;

select Country , Sales from superstore				# start with f 
where Country like "f%";
select Country , Sales from superstore				# ends with d 
where Country like "%d";
select Country , Sales from superstore				# a in anywhere in word
where Country like "%a%";
select Country , Sales from superstore				# start with a , end with a 
where Country like "a%a";
select Country , Sales from superstore				# second character is a 
where Country like "_a%";
select distinct `customer name` from superstore		# after space s character
where `customer name` like "% s%";
select distinct Country from superstore		# 6 or more than that characters country
where Country like "______%";
select distinct Country from superstore		# less than 6 characters country
where Country not like "______%";


select Country , sum(Sales) from superstore
group by Country;
select Country ,segment, sum(Sales) from superstore
group by Country,segment;
select country , category, sum(Sales) , sum(profit) , count(segment) from superstore
group by country,category;


select country , category, sum(Sales)total , sum(profit) , count(segment) from superstore
where category= "Furniture" and country not in ("France" , "Sweden")  and profit>0 							# where should be first statement
group by country,category
having total>10000																							# if where come after calculation(group by) then use having inplace of where
order by total;																								# order by should be in last

select Country , `ship mode` , `Sub-Category` , sum(profit - sales)cost from superstore 
where Country in ( "France" , "Spain" , "Germany")  and `ship mode` != "Same Day" and `Sub-Category` like "s%" and profit >0  
group by Country , `ship mode` , `Sub-Category`
having sum(profit - sales) between 5000 and 20000;
#....................................................................................................................................................................................................... 

# day 5

# string functins - upper, lower, left, right, mid, substring, reverse, locate, poistion, replace, concat,  substring index,
#.....ltrim,rtrim,trim,

# mid and substring both are same 

# replace() is case sensitive

select distinct country , upper(country) , lower(country) ,left(country,2) , right(country , 3) , mid(country , 3 ,1),substring(country,3,1)  from superstore;

select distinct country , length(country) , reverse(country) , locate("a",country) , position("a" in country ) , replace(country , "a" ,"@") , replace(lower(country) , "a", "@") , concat(city,",", state) from superstore;

select "    excelr    " , length("    excelr    "),
ltrim("    excelr    " ), length(ltrim("    excelr    ")),
rtrim("    excelr    " ), length(rtrim("    excelr    ")),
trim("    excelr    " ), length(trim("    excelr    "));


select distinct `Customer Name` from superstore;

select distinct `Customer Name` , left(`Customer Name` , locate(" ",`Customer Name`)-1) from superstore;
select distinct `Customer Name` , mid(`Customer Name` ,1, locate(" ",`Customer Name`)-1) from superstore;
select distinct `Customer Name` , substring(`Customer Name` ,1, locate(" ",`Customer Name`)-1) from superstore;

select distinct `Customer Name` , right(`Customer Name` ,length(`Customer Name`)- locate(" ",`Customer Name`)) from superstore;
select distinct `Customer Name` , mid(`Customer Name` ,locate(" ",`Customer Name`)+1,length(`Customer Name`)) from superstore;
select distinct `Customer Name` , substring(`Customer Name` ,locate(" ",`Customer Name`)+1,length(`Customer Name`)) from superstore;

select "excelr     r" ,length("excelr     r"),
replace(replace("excelr     r","  ","!"),"!","");

select distinct `Customer Name` , reverse(`Customer Name`),
left(reverse(`Customer Name`),locate(" ",reverse(`Customer Name`))-1),
reverse(left(reverse(`Customer Name`),locate(" ",reverse(`Customer Name`))-1)) from superstore;

select distinct `Product Name` from superstore;
select distinct `Product Name` , left(`Product Name`,locate(" ",`Product Name`)-1),
reverse(left(reverse(`Product Name`),locate(" ",reverse(`Product Name`))-1)) from superstore;

select distinct `Product name` , substring_index(`product name`," ",1) , substring_index(`product name`," ",-1) from superstore;

select distinct `Product name` , substring_index(substring_index(`product name`," ",2)," ",-1) from superstore;

select distinct `Product name` , replace(substring_index(substring_index(`product name`," ",-2)," ",1),",","") from superstore;

#....................................................................................................................................................................................................... 

# day 6

# ceiling,floor

select ceiling(1.351414);

select floor(1.999);


# datediff() -- now() , current_date() , "1999-01-23"
# date_add() -- ex: interval 2/-2 week/month/quarter
# date_format()
# timestampdiff() 

select datediff("1999-01-23",now());
select datediff(now(),"1999-01-23");
select datediff(current_date(),"1999-01-23");

select date_add(now() , interval 2 week);
select date_add(now() , interval 2 month);
select date_add(now() , interval 2 quarter);
select date_add(now() , interval -2 week);

select date_format(now() , "%d");
select date_format(now() , "%m");
select date_format(now() , "%y");
select date_format(now() , "%w");
select date_format(now() , "%h");
select date_format(now() , "%m");
select date_format(now() , "%s");
select date_format(now(),"%h:%m:%s");
select date_format(now(),"%W,%d/%m/%y,%a,%b,%Y,%M");

select timestampdiff(month , "1999-01-23",now());
select timestampdiff(day , "1999-01-23",now());
select timestampdiff(year , "1999-01-23",now());
select timestampdiff(week , "1999-01-23",now());
select timestampdiff(quarter , "1999-01-23",now());
select timestampdiff(hour , "1999-01-23",now());
select timestampdiff(minute , "1999-01-23",now());
select timestampdiff(second , "1999-01-23",now());


# day() , dayname() , dayofweek() , dayofmonth() , dayofyear() 
# month() , monthname() , quarter()
# year() , yearweek() , weekofyear()
# week() , weekday()

select `order date` , day(`order date`) , dayname(`order date`) , dayofweek(`order date`) , dayofmonth(`order date`) , dayofyear(`order date`)
from superstore;

select `order date` , month(`order date`) , monthname(`order date`) , quarter(`order date`)
from superstore;

select distinct `order date` , year(`order date`) , yearweek(`order date`) , weekday(`order date`) , dayname(`order date`) , dayofweek(`order date`) , week(`order date`) , weekofyear(`order date`)
from superstore
order by `order date`;

select distinct `order date` , week(`order date`) , weekday(`order date`)  
from superstore
order by `order date`;


# year wise sales
# month wise sales
# week wise sales
# weekend , weekday sales 
# quarter wise sales
# year & month wise sales -- by using sub-query 

# year wise sales
select year(`order date`)yrs , sum(sales) from superstore
group by yrs
order by yrs;

# month wise sales
select month(`order date`)mnu, monthname(`order date`)mno , sum(sales) from superstore
group by mno , mnu
order by mnu;

# week wise sales
select weekday(`order date`)w ,dayname(`order date`)d , sum(sales) from superstore
group by w,d 
order by w;


# .......... weekday , weekend sales ..............

select weekday(`order date`)sno , dayname(`order date`)mna , sum(sales) 
from superstore
group by sno, mna;

select if((weekday(`order date`)>=5),"weekend","weekday")sno, sum(sales) 
from superstore
group by sno;

# if weekend is saturday,sunday,wednesday 

select if(weekday(`order date`)>=5,"weekend",
if((weekday(`order date`)=2),"weekend","weekday"))sno, sum(sales) 
from superstore
group by sno;

#	(or) 

select if(weekday(`order date`)>=5 or weekday(`order date`)=2,"weekend","weekday")sno, sum(sales) 
from superstore
group by sno;

select dayname(`order date`)mna , if(weekday(`order date`)>=5 or weekday(`order date`)=2,"weekend","weekday")sno, sum(sales) 
from superstore
group by sno,mna;


# quarter wise sales
select concat("Qtr-",quarter(`order date`))q , sum(sales) from superstore
group by q 
order by q;

# year & month wise sales -- by using sub-query 
select yrs,mna,total from																						# sub-query , write query - store in  table - then write query(sub-query) for that table . 
(select year(`order date`)yrs , month(`order date`)mno, monthname(`order date`)mna , sum(sales)total 
from superstore 
group by yrs,mno,mna)abcd
order by yrs,mno;

#....................................................................................................................................................................................................... 

# day 7

# based of indian financial year sales
# we can achieve by 2 ways - by using "if" and "case"

select 
if (month(`order date`)>3,month(`order date`)-3,month(`order date`)+9)mnu, monthname(`order date`)mno , sum(sales) from superstore
group by mno , mnu
order by mnu;

select 
case 
when month(`order date`)>3 then month(`order date`)-3
else month(`order date`)+9
end 
mno , monthname(`order date`)mna , sum(sales) 
from superstore
group by mno , mna
order by mno;


# ............if  nov to oct .... the financial year

select 
if (month(`order date`)>10,month(`order date`)-10,month(`order date`)+2)mnu, monthname(`order date`)mno , sum(sales) from superstore
group by mno , mnu
order by mnu;


# ...... financial years wise sales .......

select year(`order date`)yrs , month(`order date`)mno,monthname(`order date`)mna , sum(sales) total 
from superstore
group by yrs,mno,mna
order by yrs,mno;

select year(`order date`)yrs , month(`order date`)mno,monthname(`order date`)mna ,
case
when month(`order date`)>3 then year(`order date`) else year(`order date`)-1 end fyi
,  sum(sales) total 
from superstore
group by yrs,mno,mna,fyi
order by yrs,mno;

select 
case
when month(`order date`)>3 then year(`order date`) else year(`order date`)-1 end fyi
,  sum(sales) total 
from superstore
group by fyi
order by fyi;


#.... country , segment , sales , profit 
#.... sum of sales > 200000 and profit > 20000  then sales*120%
#.... sum of sales >100000 or profit > 10000 then sales*110%
#.... remaining cases sales*90%

select country,segment, sum(sales)total , sum(profit)margin 
from superstore
group by country,segment
order by Total desc;

select country,segment, sum(sales)total , sum(profit)margin ,
if( sum(sales)>200000 and sum(profit)>20000 , sum(sales)*1.2,
if( sum(sales)>100000 and sum(profit)>10000 , sum(sales)*1.1,sum(sales)*0.9))results
from superstore
group by country,segment
order by Total desc;

select country,segment, sum(sales)total , sum(profit)margin ,
case
when sum(sales)>200000 and sum(profit)>20000 then sum(sales)*1.2
when sum(sales)>100000 and sum(profit)>10000 then sum(sales)*1.1
else sum(sales)*0.9
end
results
from superstore
group by country,segment
order by Total desc;


#.... years , qtr sales .... for physical and financial year sales

select year(`order date`)yrs , concat("qtr--",quarter(`order date`))qno , sum(sales) total
from superstore
group by yrs,qno
order by yrs,qno;

select year(`order date`)yrs , concat("qtr--",quarter(`order date`))qno ,
if(month(`order date`)>3,year(`order date`),year(`order date`)-1)fyi
,sum(sales) total
from superstore
group by yrs,qno,fyi
order by yrs,qno;

select year(`order date`)yrs , concat("qtr--",quarter(`order date`))qno ,
if(month(`order date`)>3,year(`order date`),year(`order date`)-1)fyi,
concat("qtr-",if(quarter(`order date`)=1,4,quarter(`order date`)-1))fq
,sum(sales) total
from superstore
group by yrs,qno,fyi,fq
order by yrs,qno;

#....................................................................................................................................................................................................... 

# day 8

# top 5 countrys according to alphabitical order
select country , sum(sales)total 
from superstore
group by country
order by country limit 5;


# top 5 countrys according to sum of sales
select country , sum(sales)total 
from superstore
group by country
order by total desc limit 5;


# 4th highest country according to sales
# we can achive by sub-query , from 3rd character - next character 
select * from (
select country , sum(sales)total 
from superstore
group by country
order by total desc limit 4)abcd
order by total asc limit 1;

select country , sum(sales)total 
from superstore
group by country
order by total desc limit 3,1;


# windows fuctions 

select country , sum(sales)total , row_number() over()sno		# row_number is windows fuction , while using windows fuctions - we have to use "over" clause
from superstore
group by country;
# default order by is row wise(while entering data)

# order by sum(sales) desc , then write this query in over clause
select country, sum(sales)total , row_number() over(order by sum(sales) desc )sno
from superstore
group by country;

# top 5 countrys based on sum of sales . 
# by using windows fuction 
select * from (
select country, sum(sales)total , row_number() over(order by sum(sales) desc )sno
from superstore
group by country)abcd1
where sno<=5;

# top 1st,7th,9th countrys based on sum of sales .
# by using "limit" - we unable to get it . so , we are using windows fuctions
select * from (
select country, sum(sales)total , row_number() over(order by sum(sales) desc )sno
from superstore
group by country)abcd1
where sno in (1,7,9);

# least 3rd , 5th country based on sum of sales
select * from (
select country, sum(sales)total , row_number() over(order by sum(sales))sno
from superstore
group by country)abcd1
where sno in (3,5);


create table empdetails
(Empid char(8) , empname varchar(20) , department varchar(20) , salary int );

insert into empdetails values 
("XLR-1001","Raj","HR",50000),
("XLR-1002","kiran","HR",60000),
("XLR-1003","jaya","HR",65000),
("XLR-1004","vijaya","HR",80000),
("XLR-1005","laxmi","marketing",50000),
("XLR-1006","Rajesh","marketing",70000),
("XLR-1007","Ramesh","marketing",60000),
("XLR-1008","kamlesh","marketing",75000),
("XLR-1009","kishore","marketing",55000),
("XLR-1010","ajay","sales",50000),
("XLR-1011","mohan","sales",60000),
("XLR-1012","omar","sales",70000),
("XLR-1013","ali","sales",80000),
("XLR-1014","john","sales",85000),
("XLR-1015","naveen","sales",50000),
("XLR-1016","avinash","finance",50000),
("XLR-1017","jagdesh","finance",70000),
("XLR-1018","priya","finance",90000);

select * from empdetails;

# highest salary
select empname , salary 
from empdetails
order by salary desc limit 1;
# using limit

select *
from (select empname,salary , row_number() over(order by salary desc)sno from empdetails )abc
where sno=1;
# using row_number() 

select * from empdetails
where salary=(select max(salary) from empdetails);
#using max() 


# top 3 value(salary)

select * 
from empdetails
order by salary desc;

select * from empdetails
order by salary desc limit 3;
# it giving only 3 values , but another person also with same salary 

select * from(
select * , row_number() over(order by salary desc)sno from empdetails)abcd2
where sno<=3;
# it giving only 3 values , but another person also with same salary 

select * from (
select *,rank() over(order by salary desc)rk
from empdetails ) abcd3
where rk<=3;


# top 4 value(value interms of salary || duplicates of top 4 salaries)

select * 
from empdetails
order by salary desc;

select * from (
select *,rank() over(order by salary desc)rk
from empdetails ) abcd3
where rk<=4;
# not coming required answer. if rank get repeated - next rank get skipped . 

select *,dense_rank() over(order by salary desc)rk
from empdetails;

select * from (
select *,dense_rank() over(order by salary desc)rk
from empdetails ) abcd3
where rk<=4;


# difference b/t row_number , rank , dense_rank 

select country , sum(sales) total ,
row_number() over(order by sum(sales))rn ,
rank() over(order by sum(sales))r ,
dense_rank() over(order by sum(sales))dr 
from superstore
group by country;


# in each department max salary 

select * from empdetails;

select *,row_number() over(order by salary desc)sno 
from empdetails;

select *,row_number() over(partition by department order by salary desc)sno 
from empdetails;

select * from (
select *,row_number() over(partition by department order by salary desc)sno 
from empdetails)abcd3
where sno=1;


# if salary is same , rank get repeated . 

# entering same salary rows 

insert into empdetails values
("XLR-1016","yash","marketing",70000),
("XLR-1017","haresh","sales",85000),
("XLR-1018","yaseen","hr",65000),
("XLR-1019","yash","finance",70000);

select * from empdetails;

# top 3 value(value interms of salary || duplicates of top 3 salaries)

select * from empdetails;

select empname , department , salary ,
row_number() over(partition by department order by salary)rn ,
rank() over(partition by department order by salary)r ,
dense_rank() over(partition by department order by salary)dr 
from empdetails; 
# so , use dense_rank only

select * from (
select empname , department , salary ,
dense_rank() over(partition by department order by salary)dr 
from empdetails)abcd4
where dr<=3;


select country , segment , sum(sales)total , dense_rank() over(partition by country order by sum(sales) desc)sno
from superstore
group by country , segment;

select country , category, `sub-category` , sum(sales)total , dense_rank() over(partition by country , category order by sum(sales) desc)sno
from superstore
group by country , category, `sub-category`;
# rank based on country and category -- because that only using in partition by

select * from (
select country , category, `sub-category` , sum(sales)total , dense_rank() over(partition by country , category order by sum(sales) desc)sno
from superstore
group by country , category, `sub-category`)abcd5
where sno=1;


# for each category - which country is leading in sales

select category, country, sum(sales)total , dense_rank() over(partition by category order by sum(sales) desc)sno
from superstore
group by category, country;

select * from (
select category,country, sum(sales)total , dense_rank() over(partition by category order by sum(sales) desc)sno
from superstore
group by category,country)abcd5
where sno=1;

select * from (
select country , category, `sub-category` , sum(sales)total , dense_rank() over(partition by category order by sum(sales) desc)sno
from superstore
group by country , category, `sub-category`)abcd5
where sno=1;

#....................................................................................................................................................................................................... 

# day 9

# windows function : lag and lead 


select year(`order date`)yrs , sum(sales)cy
from superstore
group by yrs;

# if you want to compare current year sales with previous year sales , then use lag 

select year(`order date`)yrs , sum(sales)cy ,
lag(sum(sales)) over(order by year(`order date`))py
from superstore
group by yrs;

select * , py-cy as diff from (
select year(`order date`)yrs , sum(sales)cy ,
lag(sum(sales)) over(order by year(`order date`))py
from superstore
group by yrs)abcd6;

select * , py-cy as diff , (py-cy)/py from (
select year(`order date`)yrs , sum(sales)cy ,
lag(sum(sales)) over(order by year(`order date`))py
from superstore
group by yrs)abcd6;

select * , py-cy as diff , ((py-cy)/py)*100  from (
select year(`order date`)yrs , sum(sales)cy ,
lag(sum(sales)) over(order by year(`order date`))py
from superstore
group by yrs)abcd6;

select * , py-cy as diff , round(((py-cy)/py)*100,2) from (
select year(`order date`)yrs , sum(sales)cy ,
lag(sum(sales)) over(order by year(`order date`))py
from superstore
group by yrs)abcd6;

select * , py-cy as diff , concat(round(((py-cy)/py)*100,2),"%") as Yet2complete from (
select year(`order date`)yrs , sum(sales)cy ,
lag(sum(sales)) over(order by year(`order date`))py
from superstore
group by yrs)abcd6;

select * , py-cy as diff , concat(round(((py-cy)/py)*100,2),"%") as Yet2complete , concat(100-round(((py-cy)/py)*100,2),"%") as completed from (
select year(`order date`)yrs , sum(sales)cy ,
lag(sum(sales)) over(order by year(`order date`))py
from superstore
group by yrs)abcd6;


# if you want to compare sales after n no.of year ( that n no.of years also called provision years)
 
select * , py-cy as diff , concat(round(((py-cy)/py)*100,2),"%") as Yet2complete , concat(100-round(((py-cy)/py)*100,2),"%") as completed from (
select year(`order date`)yrs , sum(sales)cy ,
lag(sum(sales),2) over(order by year(`order date`))py
from superstore
group by yrs)abcd6;
# then 3rd year sales compare with 1st year sales . like that  


# lead is opposite to lag 

select year(`order date`)yrs , sum(sales)cy ,
lag(sum(sales),1) over(order by year(`order date`))py
from superstore
group by yrs;

# instead of having NULL in 1st value py , we want in last value - then use lead 

select year(`order date`)yrs , sum(sales)cy ,
lead(sum(sales),1) over(order by year(`order date`))next_year
from superstore
group by yrs;

# lead used for finding forcasting 


/* joins : 
	inner join or join 
    outer join ;
			left 
            right
            full -- in mysql full outer join doesn't work 
	cross join 
*/

# load join1,join2,join3 files as table01,table02,table03

select * from table01;
alter table table01 change column `ï»¿Name` name varchar(10);
# select that column header , right click , click copy field name 

select * from table02;
alter table table02 change column `ï»¿Name` name varchar(10);

select * from table03;
alter table table03 change column `ï»¿Name` name varchar(10);


select table01.name ,table01.score , table02.city  			# if type only name, name column in both table, from which table system has to pick , so use table_name.column_name
from table01 join table02									# left side of join - the table is left_table , right side of join - the table is right_table
on table01.name=table02.name;								# based on what element the tables has to join ( common column between the tables )


select table01.name ,table01.score ,table02.name, table02.city  
from table01 left join table02									
on table01.name=table02.name;
 
select table01.name ,table01.score ,table02.name, table02.city  
from table01 right join table02									
on table01.name=table02.name; 


select table01.name ,table01.score ,table02.name, table02.city  
from table01 right join table02									
on table01.name=table02.name
where table01.name is null; 

select table01.name ,table01.score ,table02.name, table02.city  
from table01 right join table02									
on table01.name=table02.name
where table01.name is not null; 


select * from table03;
# names get repeated no of times || duplicate values

select a.name , a.score , b.name , b.city 
from table03 as a join table02 as b
on a.name=b.name;

select a.name ,sum(a.score), b.name , b.city 
from table03 as a join table02 as b
on a.name=b.name
group by a.name ,b.name , b.city ;

select a.name ,sum(a.score), b.name , b.city 
from table03 as a left join table02 as b
on a.name=b.name
group by a.name ,b.name , b.city ;

select a.name ,sum(a.score), b.name , b.city 
from table03 as a right join table02 as b
on a.name=b.name
group by a.name ,b.name , b.city ;


# load country_list file 

select * from Country_list;
alter table Country_list change column `ï»¿Country` country varchar(30);
delete from Country_list where Zone="Zone";

#........group,segment,sub-category,sum of sales 

select a.group,b.segment,b.`sub-category`,sum(b.sales)total 
from superstore as b join Country_list as a
on a.country=b.country
group by a.group , b.segment , b.`sub-category`;

select a.group,b.segment,b.`sub-category`,sum(b.sales)total 
from superstore as b left join Country_list as a
on a.country=b.country
group by a.group , b.segment , b.`sub-category`;

select a.group,b.segment,b.`sub-category`,sum(b.sales)total 
from superstore as b right join Country_list as a
on a.country=b.country
group by a.group , b.segment , b.`sub-category`;

# which coutries are missing from left join and right join 
# not how many 


#....................................................................................................................................................................................................... 

# day 10

select a.group , b.sales
from superstore as b join country_list as a
on a.country=b.country;

select distinct country from superstore;
select distinct country from country_list;

select distinct a.country , b.country
from superstore as a join country_list as b
on a.country=b.country;


select distinct a.country , b.country
from superstore as a left join country_list as b
on a.country=b.country;

select distinct a.country , b.country
from superstore as a left join country_list as b
on a.country=b.country
where b.country is null;


select distinct a.country , b.country
from superstore as a right join country_list as b
on a.country=b.country;

select distinct a.country , b.country
from superstore as a right join country_list as b
on a.country=b.country
where a.country is null;


#.... country,segment , ship date ,year ,cost ,group ,cc rank
#.... except france and spain , ship mode --same date and lastest year
#.... sum of cost>10000

select a.country , a.segment , a.`ship mode` , a.`order date`, b.group , b.`cc rank` ,(a.sales-a.profit) cost 
from superstore as a join country_list as b 
on a.country=b.country;

select a.country , a.segment , a.`ship mode` , year(a.`order date`)yrs , b.group , b.`cc rank` ,sum(a.sales-a.profit) cost 
from superstore as a join country_list as b 
on a.country=b.country
group by a.country , a.segment , a.`ship mode` , yrs , b.group , b.`cc rank`;


select a.country , a.segment , a.`ship mode` , year(a.`order date`)yrs , b.group , b.`cc rank` ,sum(a.sales-a.profit) cost 
from superstore as a join country_list as b 
on a.country=b.country
where a.country not in ("france","spain") and a.`ship mode`="Same day" and year(a.`order date`)=2022
group by a.country , a.segment , a.`ship mode` , yrs , b.group , b.`cc rank`;

select year(max(`order date`)) from superstore;


select a.country , a.segment , a.`ship mode` , year(a.`order date`)yrs , b.group , b.`cc rank` ,sum(a.sales-a.profit) cost 
from superstore as a join country_list as b 
on a.country=b.country
where a.country not in ("france","spain") and a.`ship mode`="Same day" and year(a.`order date`)=(select year(max(`order date`)) from superstore)
group by a.country , a.segment , a.`ship mode` , yrs , b.group , b.`cc rank`
having cost>500
order by cost desc;

# do joins , group by , where , .. like that. do step by step , not in one shot 


# load city_list file

select * from city_list;

alter table city_list change column `ï»¿City` city varchar(40);

alter table city_list change column manger manager varchar(20);

select a.manager , b.sales 
from superstore as b join city_list as a
on a.city=b.city;

select a.manager , sum(b.sales) 
from superstore as b join city_list as a
on a.city=b.city
group by a.manager;

 
# which and how many cities are not matching
 
select distinct a.city , b.city 
from superstore as a left join city_list as b
on a.city=b.city
where b.city is null;

select count(*) from (
select distinct a.city as a1 , b.city as a2
from superstore as a left join city_list as b
on a.city=b.city
where b.city is null)abcd8;

select distinct a.city , b.city 
from superstore as a right join city_list as b
on a.city=b.city
where a.city is null;


# joining multiple tables...........................

# ..... from superstore .... country , segment 
#...    from country list .... group cc rank
#....   from city list .... manager

select a.country,a.segment,b.group ,b`cc rank` , a.sales
from superstore as a join country_list as b
on a.country=b.country;

select a.country,a.segment,b.group ,b.`cc rank`,c.manager, a.sales
from superstore as a join country_list as b
on a.country=b.country
join city_list as c
on a.city=c.city;

select a.country,a.segment,b.group ,b.`cc rank`,c.manager,sum(a.sales)
from superstore as a join country_list as b
on a.country=b.country
join city_list as c
on a.city=c.city
group by a.country,a.segment,b.group ,b.`cc rank`,c.manager;


# load manager_list 

select * from manager_list;

alter table manager_list change column `ï»¿Manager` manager varchar(20);


# gender wise sales

select a.manager , b.sales 
from superstore as b join city_list as a
on a.city=b.city;

select a.manager ,c.gender, b.sales 
from superstore as b join city_list as a
on a.city=b.city
join manager_list as c
on a.manager=c.manager;

select a.manager ,c.gender, sum(b.sales)total 
from superstore as b join city_list as a
on a.city=b.city
join manager_list as c
on a.manager=c.manager
group by a.manager,c.gender;

select c.gender, sum(b.sales)total 
from superstore as b join city_list as a
on a.city=b.city
join manager_list as c
on a.manager=c.manager
group by c.gender;

# for female gender not getting sales 
# because , records are not matched . in city_list not have rani as manager , and we are taking managers from city_list

select c.gender, sum(b.sales)total 
from superstore as b join city_list as a
on a.city=b.city
left join manager_list as c
on a.manager=c.manager
group by c.gender;

select ifnull(c.gender,"female")abc, sum(b.sales)total 
from superstore as b join city_list as a
on a.city=b.city
left join manager_list as c
on a.manager=c.manager
group by abc;


select * from superstore;
select * from city_list;
select distinct manager from city_list;

# manager and gender from manager_list , sales from superstore 

select c.manager,c.gender, sum(b.sales)total 
from superstore as b join city_list as a
on a.city=b.city
join manager_list as c
on a.manager=c.manager
group by c.gender,c.manager;
# not getting

select c.manager,c.gender, sum(b.sales)total 
from superstore as b join city_list as a
on a.city=b.city
right join manager_list as c
on a.manager=c.manager
group by c.gender,c.manager;
# getting , but sales is null. 

select a.manager , b.manager  from 
city_list as a left join manager_list as b
on a.manager=b.manager; 

select distinct a.manager , b.manager  from 
city_list as a left join manager_list as b
on a.manager=b.manager; 

select ifnull(a2,"Rani")A2 ,A1 from (
select distinct a.manager as A1 , b.manager as a2  from 
city_list as a left join manager_list as b
on a.manager=b.manager)abcd0;

select ifnull(a2,"Rani")A2 ,A1,total from (
select a.manager as A1 , b.manager as a2 , sum(c.sales)total from 
city_list as a left join manager_list as b
on a.manager=b.manager
join superstore as c
on a.city = c.city
group by A1,a2
)abcd0;

select ifnull(a2,"Rani")A2 ,A1,total,gender from (
select a.manager as A1 , b.manager as a2 ,b.gender , sum(c.sales)total from 
city_list as a left join manager_list as b
on a.manager=b.manager
join superstore as c
on a.city = c.city
group by A1,a2 , b.gender)abcd0;

select ifnull(a2,"Rani")A2 ,A1,total,ifnull(gender,"female") from (
select a.manager as A1 , b.manager as a2 ,b.gender , sum(c.sales)total from 
city_list as a left join manager_list as b
on a.manager=b.manager
join superstore as c
on a.city = c.city
group by A1,a2 , b.gender)abcd0;


# gender wise sales 

select ifnull(gender,"female"),total from (
select a.manager as A1 , b.manager as a2 ,b.gender , sum(c.sales)total from 
city_list as a left join manager_list as b
on a.manager=b.manager
join superstore as c
on a.city = c.city
group by A1,a2 , b.gender)abcd0;

select ifnull(gender,"female")m,sum(total) from (
select a.manager as A1 , b.manager as a2 ,b.gender , sum(c.sales)total from 
city_list as a left join manager_list as b
on a.manager=b.manager
join superstore as c
on a.city = c.city
group by A1,a2 , b.gender)abcd0
group by m;

#....................................................................................................................................................................................................... 

# day 11

# more than 1 null value(genders) 

select * from manager_list;

# mohan replace with rajesh
# open manager_list csv , inplace of mohan type rajesh , save with name as manager_list2, load manager_list2 csv in workbench 

select * from manager_list2;

select distinct a.manager , b.manager
from city_list as a left join manager_list2 as b
on a.manager=b.manager;

# if rao -- put rani
# if mohan -- put rajesh

select distinct a.manager ,
if(a.manager="rao","rani",if(a.manager="Mohan","rajesh",b.manager))
from city_list as a left join manager_list2 as b
on a.manager=b.manager;

select distinct a.manager ,
if(a.manager="rao","rani",if(a.manager="Mohan","rajesh",b.manager)),
c.sales
from city_list as a left join manager_list2 as b
on a.manager=b.manager
join superstore as c
on a.city=c.city;

select distinct a.manager as mm,
if(a.manager="rao","rani",if(a.manager="Mohan","rajesh",b.manager))cm,
sum(c.sales)
from city_list as a left join manager_list2 as b
on a.manager=b.manager
join superstore as c
on a.city=c.city
group by cm,mm;

select distinct a.manager as mm,
if(a.manager="rao","rani",if(a.manager="Mohan","rajesh",b.manager))cm, b.gender,
sum(c.sales)
from city_list as a left join manager_list2 as b
on a.manager=b.manager
join superstore as c
on a.city=c.city
group by cm,mm,b.gender;

# ...............................................more than 1 null value(genders) 

select distinct a.manager as mm,
if(a.manager="rao","rani",if(a.manager="Mohan","rajesh",b.manager))cm, 
if(a.manager="rao","Female",if(a.manager="Mohan","Male",b.manager))G,
sum(c.sales)
from city_list as a left join manager_list2 as b
on a.manager=b.manager
join superstore as c
on a.city=c.city
group by cm,mm,G;

select 
if(a.manager="rao","rani",if(a.manager="Mohan","rajesh",b.manager))cm, 
if(a.manager="rao","Female",if(a.manager="Mohan","Male",b.manager))G,
sum(c.sales)
from city_list as a left join manager_list2 as b
on a.manager=b.manager
join superstore as c
on a.city=c.city
group by cm,G;


# tablular form 

select country , segment, sum(sales)
from superstore
group by country, segment;

# sql give only in table form , 
# you can convert table into matrix form

select country , sum(sales)consumer
from superstore
where segment ="consumer"
group by country;

select country , sum(sales)corporate
from superstore
where segment ="corporate"
group by country;

select country , sum(sales)Home_Office 
from superstore
where segment ="Home Office"
group by country;
# backend pointer use only in column,table,database names .  if you have space in between the name . 

# we are getting seperate seperately , join them 
select a.country , a.consumer , b.corporate from (
select country , sum(sales)consumer
from superstore
where segment ="consumer"
group by country)a
join (
select country , sum(sales)corporate
from superstore
where segment ="corporate"
group by country)b
on a.country=b.country;

select country , sum(sales)Home_Office 
from superstore
where segment ="Home Office"
group by country;

# join another table also 
select a.country , a.consumer , b.corporate ,c.home_office from (
select country , sum(sales)consumer
from superstore
where segment ="consumer"
group by country)a
join (
select country , sum(sales)corporate
from superstore
where segment ="corporate"
group by country)b
on a.country=b.country
join 
( select country , sum(sales)Home_Office 
from superstore
where segment ="Home Office"
group by country )c 
on a.country=c.country;

# for total sales
select a.country , a.consumer , b.corporate ,c.home_office,d.total from (
select country , sum(sales)consumer
from superstore
where segment ="consumer"
group by country)a
join (
select country , sum(sales)corporate
from superstore
where segment ="corporate"
group by country)b
on a.country=b.country
join 
( select country , sum(sales)Home_Office 
from superstore
where segment ="Home Office"
group by country )c 
on a.country=c.country
join 
( select country , sum(sales)total from superstore group by country )d
on a.country=d.country;


# view -- storing the result in a table 

create view T_consumer as
select country , sum(sales)consumer
from superstore
where segment ="consumer"
group by country;

create view T_corporate as
select country , sum(sales)corporate
from superstore
where segment ="corporate"
group by country;

create view T_Home_Office as
select country , sum(sales)Home_Office 
from superstore
where segment ="Home Office"
group by country;

select * from T_consumer;
select * from T_corporate;
select * from T_Home_Office;

select a.country,a.consumer,b.corporate,c.Home_Office
from T_consumer as a join T_corporate as b
on a.country=b.country
join T_Home_Office as c
on c.country=a.country;


# self join 

# load self file

select * from self;

alter table Self change column `ï»¿Emp ID` Empid int;

# Empid connecting within the table with another column element Manager_ID

# under which manager , who are the employees

select a.name as manager , b.name as Employee
from self as a join self as b
on a.empid=b.`manager id`; 

# sir self file manager_id column data is different


# interview question on joins 

create table A_table(sno int);
insert into A_table values
(1),(2),(5),(6),(10);
select * from A_table;

create table B_table(sno int);
insert into B_table values
(1),(3),(5),(7),(10);
select * from B_table;

# try to guess , observe the outputs

select a.sno , b.sno 
from A_table as a join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a left join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a right join B_table as b 
on a.sno=b.sno;

#........................

insert into A_table values
(null),(null);

select * from A_table;

select a.sno , b.sno 
from A_table as a join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a left join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a right join B_table as b 
on a.sno=b.sno;

#........................

insert into B_table values
(null);

select * from B_table;

select a.sno , b.sno 
from A_table as a join B_table as b 
on a.sno=b.sno;
# ................................................when you are using join - nulls never match

select a.sno , b.sno 
from A_table as a left join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a right join B_table as b 
on a.sno=b.sno;

#........................

insert into A_table value 
(1);

select * from A_table;

select a.sno , b.sno 
from A_table as a join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a left join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a right join B_table as b 
on a.sno=b.sno;

#........................

insert into A_table value 
(1);

select * from A_table;

select a.sno , b.sno 
from A_table as a join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a left join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a right join B_table as b 
on a.sno=b.sno;

#........................

insert into B_table value 
(1);

select * from B_table;

select a.sno , b.sno 
from A_table as a join B_table as b 
on a.sno=b.sno;
# .........................whenever using joins , you have repeated element in both the tables , it multiplies .
# three 1's in 1st table , two 1's in 2nd table . so , 3*2=6 
# one 5 in 1st table , one 5 in 2nd table . so , 1*1=1 
# one 10 in 1st table , one 10 in 2nd table . so , 1*1=1 

select a.sno , b.sno 
from A_table as a left join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a right join B_table as b 
on a.sno=b.sno;

#...........................

insert into B_table value 
(1);

select * from B_table;

select a.sno , b.sno 
from A_table as a join B_table as b 
on a.sno=b.sno;
# .........................whenever using joins , you have repeated element in both the tables , it multiplies .
# three 1's in 1st table , three 1's in 2nd table . so , 3*3=9 
# one 5 in 1st table , one 5 in 2nd table . so , 1*1=1 
# one 10 in 1st table , one 10 in 2nd table . so , 1*1=1 

select a.sno , b.sno 
from A_table as a left join B_table as b 
on a.sno=b.sno;
# three 1's in 1st table , three 1's in 2nd table . so , 3*3=9 
# 6 distinct values - 2,5,6,10,null,null 

select a.sno , b.sno 
from A_table as a right join B_table as b 
on a.sno=b.sno;
# three 1's in 1st table , three 1's in 2nd table . so , 3*3=9 
# 5 distinct values - 2,5,6,10,null

# ................................. if they ask full join , same thing - common things multiplies and uncommon things - just count it manually .

insert into A_table value 
(2);

select * from A_table;

insert into B_table value 
(2);

select * from B_table;

select a.sno , b.sno 
from A_table as a join B_table as b 
on a.sno=b.sno;
# .........................whenever using joins , you have repeated element in both the tables , it multiplies .
# three 1's in 1st table , three 1's in 2nd table . so , 3 times * 3 times=9 
# tow 2's in 1st table , one 2 in 2nd table . so , 2 times * 1 times=2 
# one 5 in 1st table , one 5 in 2nd table . so , 1*1=1 
# one 10 in 1st table , one 10 in 2nd table . so , 1*1=1 

select a.sno , b.sno 
from A_table as a left join B_table as b 
on a.sno=b.sno;

select a.sno , b.sno 
from A_table as a right join B_table as b 
on a.sno=b.sno;

#....................................................................................................................................................................................................... 

# day 12

# .. view , procedures

# view - to create temperary tables 
# hiding the information - to not give complete details to employee . ( like salary of other employees because clashes will come )

select * from empdetails;
# it give all details ( empid,name,department,salary)

# we dont want to desclose the salary , so create view with only empid and empname and and department . 
# give that view to employee . so they never able to see other employee salary 

create view Empinfo as 
select empid,empname,department from empdetails;

select * from empinfo;

select * from empinfo
where department="HR";

select * from empdetails;

insert into empdetails values
("XLR-1020","zia","HR",100000);

select * from empdetails;

select * from empinfo;
# data is updating here automaticaly, no need to update view seperately


# stored procedure - performance tunning , it is also called restricted code . 

# click on stored procedure in navigator tab , right click , click on create stored procedure . 
# rename it , write query . click apply , apply , finish . 

# if you want to execute that store procedure , click on thunder button - while moving curser on newly created stored procedure in navigator tab 
# or
# call store_procedure_name 

call new_1;

call new_1
where department="HR";
# it show error , because it restricted code and for perfomance( if there is no condition to check , so result give fast ) 

# second way of creating store procedure  

DELIMITER $$
CREATE PROCEDURE `new_2`()
BEGIN
select empname,department from empdetails;
END$$
DELIMITER ;

call new_2;

DELIMITER $$
CREATE PROCEDURE `new_3`()
BEGIN
select country, sales from superstore;
END$$
DELIMITER ;
# ctrl + enter , refresh schema , click on thunder button on that 

DELIMITER $$
CREATE PROCEDURE `new_4`()
BEGIN
select country, sum(sales) 
from superstore
group by country;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `new_5`(cc varchar(45))			# command line input 
BEGIN
select country, sum(sales) 
from superstore
group by country
having country=cc;
END$$
DELIMITER ;

drop procedure new_5;

DELIMITER $$
CREATE PROCEDURE `new_6`(cc1 varchar(45), cc2 varchar(30))			# command line input 
BEGIN
select country, sum(sales) 
from superstore
group by country
having country =cc1 or country =cc2;										# having country in ( cc1,cc2);
END$$
DELIMITER ;

call new_6("france","germany");

DELIMITER $$
CREATE PROCEDURE `new_7`(cc1 varchar(45), cc2 varchar(30),cc3 int)		
BEGIN
select country,segment,`ship mode`,sum(sales) total
from superstore
where country in ( cc1 , cc2)
group by country , segment,`ship mode`
having total>cc3;									
END$$
DELIMITER ;

call new_7("france","germany",20000);


select country,segment,`ship mode`,sum(sales) total			# it wont work , because case statement wont work in having condition 
from superstore
group by country , segment,`ship mode`
having 
case 
when total>50000 then "excellent" else "ok" end;			 						

select * , case when total>50000 then "excellent" else "ok:" end abc from (
select country,segment,`ship mode`,sum(sales) total	
from superstore
group by country , segment,`ship mode`) a;
		 						
select * , case when total>50000 then "excellent" when total>10000 then "good" else "ok:" end abc from (			# static 
select country,segment,`ship mode`,sum(sales) total	
from superstore
group by country , segment,`ship mode`) a;                               

DELIMITER $$																										# now it is dynemic
CREATE PROCEDURE `new_8`(cc1 int, cc2 int)		
BEGIN
select * , case when total>cc1 then "excellent" when total>cc2 then "good" else "ok:" end abc from (
select country,segment,`ship mode`,sum(sales) total	
from superstore
group by country , segment,`ship mode`) a;   									
END$$
DELIMITER ;

call new_8(50000,10000);


# ... country except those to two which we mention 
# ... segment ( any one from list )
# ... sales need to filter on condition 
# ... total need to filter on condition 

select country,segment,`ship mode`,sum(sales) total													# static
from superstore
where country not in ("france","spain") and segment="Consumer" and sales>100
group by country,segment,`ship mode`
having total > 20000;

DELIMITER $$																								# dynamic 
CREATE PROCEDURE `new_9`(cc1 int, cc2 int ,cc3 varchar(30),cc4 varchar(30),cc5 varchar(30))		
BEGIN
select country,segment,`ship mode`,sum(sales) total	
from superstore
where country not in (cc3,cc4) and segment=cc5 and sales>cc1
group by country,segment,`ship mode`
having total >cc2;
END$$
DELIMITER ;

call new_9(100,50000,"france","spain","consumer");


#....................................................................................................................................................................................................... 

# day 13

# ... constraints ( putting limits ) . not null , primary key , unique , check , default , auto_increment , foregin key 

create table sample2( sno int , sname varchar(20));

desc sample2;
select * from sample2;

insert into sample2 values
(1,"kiran"),(2,"arun"),(3,"santhosh"),(4,"laxman");

select * from sample2;

insert into sample2(sno) values
(5),(6),(7);

select * from sample2;

insert into sample2(sname) values
("jaya"),("vijaya"),("ajay");

select * from sample2;

insert into sample2(sname,sno) values
("ganesh",8),("ali",9);

select * from sample2;

# ................................... not nul ....................

drop table sample2;

create table sample2( sno int not null, sname varchar(20));
desc sample2;

insert into sample2 values
(1,"kiran"),(2,"arun"),(3,"santhosh"),(4,"laxman");

insert into sample2(sno) values
(5),(6),(7);

insert into sample2(sname) values
("jaya"),("vijaya"),("ajay");

insert into sample2(sname,sno) values
("ganesh",8),("ali",9);

insert into sample2(sno) values
(5),(6),(7);

# ......................... primary key ( no duplicate = unique , not null is default no need to mention again) 

drop table sample2;

create table sample2( sno int primary key , sname varchar(20));
desc sample2;

insert into sample2 values
(1,"kiran"),(2,"arun"),(3,"santhosh"),(4,"laxman");

insert into sample2(sno) values
(5),(6),(7);

insert into sample2(sname) values
("jaya"),("vijaya"),("ajay");

insert into sample2(sname,sno) values
("ganesh",8),("ali",9);

insert into sample2(sno) values
(5),(6),(7);

insert into sample2(sno,sname) values
(10,"ganesh"),(11,"ali");

# ......................... unique ( nulls are allowed , if you dont want null use not null and unique at a time ) 

# if you want anonther column also unique value , 
# if you put "primary key" to that column , it show error because . table should contain only 1 primary key . 
# so , use "unique"  

drop table sample2;

create table sample2( sno int primary key , sname varchar(20) unique );
desc sample2;

insert into sample2 values
(1,"kiran"),(2,"arun"),(3,"santhosh"),(4,"laxman");

insert into sample2(sno) values
(5),(6),(7);

insert into sample2(sname) values
("jaya"),("vijaya"),("ajay");

insert into sample2(sname,sno) values
("ganesh",8),("ali",9);

insert into sample2(sno) values
(5),(6),(7);

insert into sample2(sno,sname) values
(10,"ganesh"),(11,"ali");

select * from sample2;

insert into sample2(sno,sname) values
(10,""),(11,"");

insert into sample2(sno,sname) values
(10,"");

insert into sample2(sno,sname) values
(13,null),(14,null);

insert into sample2(sno,sname) values
("","A");

# ......................... check 

drop table sample2;

create table sample2( sno int primary key , sname varchar(20), age tinyint check(age>18));
desc sample2;

insert into sample2(sno,sname) values
(1,"kiran"),(2,"arun"),(3,"santhosh"),(4,"laxman");

insert into sample2(sno) values
(5),(6),(7);

insert into sample2(sname) values
("jaya"),("vijaya"),("ajay");

insert into sample2(sno,sname,age) values
(40,"ganesha",19),(41,"alia",20);

insert into sample2(sname,sno,age) values
("ganesha",19,101),("alia",20,103);

insert into sample2 value 
(12," ",30);
insert into sample2 value 
(13,null,21),(14,null,22);

insert into sample2 values
(null,"A",33),(null,"B",34);

insert into sample2 values
("99","A",99);

# .............................. constraints adding 

drop table sample2;

create table sample2 ( sno int , sname varchar(20) , age tinyint check (age between 19 and 90));

insert into sample2 value 
(1,"ram",23);

select * from sample2;

insert into sample2 value 
(1,"ram",12);

alter table sample2
drop constraint sample2_chk_1;		# constraint name , when you enter wrong value in check constraint , you get constraint name in message in output

insert into sample2 value 
(2,"ram",12);

alter table sample2
add constraint chk_123 				# give any name
check (age >=15 and age <=90);

 insert into sample2 value 
(3,"ram",18);

#....................................................................................................... 

drop table sample2;

create table sample2 ( sno int primary key , sname varchar(30) not null , age tinyint check(age>18) , gender varchar(10) check(gender in ("male","female","m","f")));

desc sample2;

insert into sample2 values
(1,"raj",23,"male");

select * from sample2;

insert into sample2 values
(2,"rani",21,"feemale");

# .............................. default

drop table sample2;

create table sample2 (sno int , sname varchar(30),actions varchar(20) default "yes");

desc sample2;

insert into sample2(sno,sname) values 
(1,"raj");

select * from sample2;
 
drop table sample2;

create table sample2 (sno int , sname varchar(30),actions datetime default now());

desc sample2;

insert into sample2(sno,sname) values 
(1,"raj");

select * from sample2;

insert into sample2(sno,sname) values 
(1,"raj");

# ................... auto-increment  , for number data type ,use with primary_key(not_null and unique) or unique - why because auto-increment is non_repeating(unique) .  
# ...................  increment based on highest value present in table , if highest value is negative number then it start from 1 

drop table sample2;

create table sample2 (sno int primary key auto_increment, sname varchar(30));

desc sample2;

insert into sample2(sname) values 
("kumar"),("rao"),("kiran");

select * from sample2;

# .............................. foregin key is also know as child key 

create table courses ( id int primary key , cname varchar(20),fee int not null);

insert into courses
value
(1,"excel",10000),
(2,"mysql",10000),
(3,"power bi",20000),
(4,"tableau",20000),
(5,"python",15000),
(6,"r",12000),
(7,"sas",25000),
(8,"devops",100000),
(9,"fullstack",110000);

select * from courses;

create table joining 
(sno int primary key , courseid int,sname varchar(30));

insert into joining values 
(1,1,"raj");

select * from joining;

truncate table joining;

alter table joining 
add constraint fk_1
foreign key (courseid)
references courses(id);

insert into joining values 
(1,1,"raj");

insert into joining values 									# in course table , id = 10 , not there so it is not taking that (course).
(1,10,"raj"); 

drop table joining;

create table joining 
(sno int primary key , courseid int,sname varchar(30),foreign key (courseid)
references courses(id));

desc joining;

insert into joining values 
(1,1,"raj");

select * from joining;

insert into joining values 								
(1,10,"raj"); 

# ........ all contraints together 

drop table joining;

create table joining 
(sno int primary key , courseid int,sname varchar(30) not null unique,foreign key (courseid)
references courses(id), age int check(age>18),statuss varchar(20) default "joined");

#....................................................................................................................................................................................................... 

# day 14

#... index(sequence of number) , triggers , union 

# .... index = to increase performance 
# .... index are 2 types . cluster index ( physically we see it , because we are using primary_key or unique ), non-cluster index ( if table doesn't have index , we create index by using another column , it is there , but not able to see )
# .... balance tree index ( like binary search ), hash index ( faster than balance tree index , but it work based on equal and not equal conditions , there is no greater than and less than conditions )
# .... most ofenly we use balance tree index only

desc joining; 

show index from joining;

show index from superstore;								# there is no index , because we dont have primary_ key or unique , cluster key work on primary_key and unique

create index abc on superstore(sales);

select country , segment , sales 
from superstore
where sales between 200 and 400;

drop index abc on superstore;

alter table superstore
drop index abc;

# ................... 

create table byjus ( sno int primary key , sname varchar(20), mobile char(10) check(length(mobile)=10));

select * from byjus;

desc byjus;

show index from byjus;

insert into byjus values
(1,"raj","9100943179");

insert into byjus values
(2,"raj","9100943179");

# name can be repeat , mobile number also repeat if father has more than 1 child , so do index combination of name and mobile number that will not repeat 

select * from byjus;

truncate table byjus;

create unique index uni on byjus(sname,mobile);

show index from byjus;

insert into byjus values
(1,"raj","9100943179");

insert into byjus values
(2,"raj","9100943179");

insert into byjus values
(3,"raja","9100943179");


# ...... triggers 

create table t_sample1(sno int,sname varchar(20));
create table t_sample2(sno int primary key auto_increment ,tot datetime default now(),message varchar(20));

# click on rench symbol on table(t_sample1) in schemas tab , click on trigger tab , click on plus symbol on "after insert" button , write query(insert data into sample2) in b/t start and end , apply , apply , finish . 
# upon adding data into sample1 , data automatically added into sample2 also 
 
insert into t_sample1 values (1,"raj");
select * from t_sample1;
select * from t_sample2;

insert into t_sample1 values (2,"raja");
select * from t_sample1;
select * from t_sample2;

delete from t_sample1 where sno=2;
select * from t_sample1;
select * from t_sample2;					# no trigger , because we didt write action for deleting 

# click on rench symbol on table(t_sample1) in schemas tab , click on trigger tab , click on plus symbol on "after update" button , write query(insert data into sample2) in b/t start and end , apply , apply , finish . 
# upon update data into sample1 , data automatically added into sample2 also 

update t_sample1 set sname="vani" where sno=1;
select * from t_sample1;
select * from t_sample2;

# click on rench symbol on table(t_sample1) in schemas tab , click on trigger tab , click on plus symbol on "after delete" button , write query(insert data into sample2) in b/t start and end , apply , apply , finish . 
# upon delete data into sample1 , data automatically added into sample2 also 

delete from t_sample1 where sno=1;
select * from t_sample1;
select * from t_sample2;

# before-trigger is to calculate how much time it take to complete task (updating , deleting , inserting ) if it is more data 


# union is nothing but making join , union for inner join , union all for full join 

select * from table01;
select * from table03;

select * from table01
union
select * from table03;

select name from table01;

select name from table03;

select name from table01
union
select name from table03;

select * from table02;

select * from table01				# it throw error , columns doesnt match
union
select * from table02;

select name from table01
union
select name from table02;

select name from table01
union all
select name from table02;

select name from table01
union all
select name from table03;

select * from table01
union
select * from table03;

select name , sum(score) as total from (
select * from table01
union
select * from table03) acd
group by name ;

#....................................................................................................................................................................................................... 

# day 15

# functions

# click on functions in schemas tab , right click , click on create function , write function , apply , apply , finish
# click on thunder icon - upon puting curser on function name in schema tab 

select * from sample;

select * , new_010(age) from sample;

select * , new_010(sno) from sample;


create table new1 (sno int ,sname varchar(20),age int , gender varchar(20) check (gender in ("male","female")));

insert into new1 values 
(1,"raj",23,"male");

select * from new1;

insert into new1 values 
(2,"raja",33,"male"),
(3,"kiran",13,"male"),
(4,"jaya",03,"female"),
(5,"rani",23,"female"),
(6,"satya",31,"male"),
(7,"swati",18,"female"),
(8,"umar",30,"male"),
(9,"ali",50,"male"),
(10,"susmitha",25,"female"),
(11,"laxmi",40,"female");

select * from new1;

select *,new_02(age,gender) from new1;


select country , sum(sales) , sum(profit) from superstore 
group by country;

# .. negative sum(profits) = sum(sales)+sum(profit)
# .. sum(profit)>50000=sum(sales)*1.1+profit
# .. sum(sales)

select * ,new_03(total,margin) from (
select country , sum(sales) total , sum(profit) margin from superstore 
group by country)abd;

select * ,new_03(total,margin) from (
select `sub-category` , sum(sales) total , sum(profit) margin from superstore 
group by `sub-category`)abd;

#....................................................................................................................................................................................................... 

# day 16

# error handling

create table payment(clientid int ,payment int not null);

create table fraud(sno int primary key not null auto_increment , client_id int,message varchar(20),tot datetime); 	# tot = turn around time

desc payment;

desc fraud;

select * from payment;

select * from fraud;

insert into payment values 
(1,1000);

select * from payment;

insert into payment values 				# failure transaction 
(1,null);

# errors need to write in procedure format only

# click on stored procedure , right click , click create stored procedure 
# write code 
# execute it

select * from payment;

select * from fraud;												# if you enter null as amount in payment table , that record enter in fraud table



# joins, limit , window , contraints - forein key and primary key relationship -- very important 
# queries -- medium level important
# view and procedure difference -- less importance

# excel is basics , so it is required
# sql is important , 
# power bi -- make it primary skill
# tableau -- make it secondary skill

