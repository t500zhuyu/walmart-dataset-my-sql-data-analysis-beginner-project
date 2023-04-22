
# use the database_walmart
use walmart_dataset;
# Column info:
	# Store: Store Numbers ranging from 1 to 45
	# Date: The Week of Sales. It is in the format of dd-mm-yyyy. The date starts from 05-02-2010
	# Weekly_Sales: The sales of the given store in the given week
	# Holiday_Flag: If the week has a special Holiday or not. 1-The week has a Holiday 0-Fully working week Holiday events is given in
	# Temperature: Average Temperature of the week of sales
	# Fuel_Price: Price of the Fuel in the region of the given store
	# CPI: Customer Price Index
	# Unemployment: Unemployment of the given store region (%)

# show the table
SELECT * FROM walmart_dataset.walmart_sales;

# Show if the week has a special Holiday (1)
select * from walmart_sales
where Holiday_Flag > 0;

# Show the max value of weekly_Sales column
select MAX(weekly_Sales) from walmart_sales;
# Order the entire table by weekly_Sales DESC mode
select *from walmart_sales order by weekly_Sales DESC;
# Show the table with the top 5 Weekly_Sales
SELECT weekly_Sales FROM walmart_sales ORDER BY weekly_Sales DESC LIMIT 5;
SELECT * FROM walmart_sales ORDER BY weekly_Sales DESC LIMIT 5;

# Show the store with bigger weekly sales, just in the single column 'weekly_Sales'
select weekly_Sales
from walmart_sales
order by weekly_Sales desc;

# two criteria store and weekly_Sales
SELECT store, weekly_Sales
FROM walmart_sales
ORDER BY weekly_Sales DESC, store ASC
LIMIT 5;

# Show, analysis the greater values of the CPI
# The CPI is one of the most popular measures of inflation and deflation.
select CPI
from walmart_sales
order by CPI desc;

# Select Unique/Distinct of a Column
# display, show unique values of the store column
select distinct store from walmart_sales;

# show the values of temperature bigger than 32 F°, and
# just for stores 5 & 10
# order by Store, Temperature (priority order)
select * from walmart_sales
where Temperature > 32 and Store= 5 or Store= 10
order by Store, Temperature desc;

# *********************************
# disable (or enable) Safe Updates
SET SQL_SAFE_UPDATES=0;
# ALTER TABLE walmart_sales MODIFY Sale_date VARCHAR(255);

# How to convert text datatype to datetime in mysql?
# convert DD-MM-YYYY to YYYY-MM-DD
# convert txt to date datatype
UPDATE walmart_sales  
SET Sale_date = STR_TO_DATE(Sale_date, '%d-%m-%Y');
# convert date time style from DD-MM-YY to YY-MM-DD
alter table walmart_sales
modify Sale_date date;
# *************************************

# Queries about datetime

# Select sales equal or after 2012-02-05
select * from walmart_sales
where Sale_date >= '2012-02-05';
# Select sales equal or after 2012 format (2012-01-01)
select * from walmart_sales
where Sale_date >= '2012-01-01';

# query of two criteria 
 # weekly_sales or than 1000000 (1 millon) and Sale_date equal or after 2010-01-01
select * from walmart_sales
where Weekly_Sales > 1000000 and Sale_date >= '2010-01-01';
# query of two criteria
# select weekly_sales bigger than 1500000
select Sale_date, Weekly_Sales from walmart_sales
where Weekly_Sales > 1500000 and year(Sale_date) = 2011
order by Weekly_Sales desc;

# show the different dates of Sale_date
select distinct Sale_date from walmart_sales;

# query more expensive fuel price per store
SELECT store, MAX(Fuel_Price)
FROM walmart_sales
GROUP BY store;

# query more expensive fuel price per store
SELECT store, MIN(Fuel_Price)
FROM walmart_sales
GROUP BY store;

# query select the top more expensive fuel_price, top 15 of all stores
SELECT store, Fuel_Price
FROM walmart_sales
ORDER BY Fuel_Price DESC, store ASC
LIMIT 15;

# top sales per store
SELECT store, MAX(Weekly_Sales)
FROM walmart_sales
GROUP BY store;

# top sales per store in year 2011
SELECT store, MAX(Weekly_Sales)
FROM walmart_sales
GROUP BY store;

select store, MAX(Weekly_Sales) from walmart_sales
where Sale_date = '2010-01-01'
order by store desc;

select store, Weekly_Sales from walmart_sales
where Weekly_Sales > 1000000 and year(Sale_date) = 2010
order by store desc;

# top sales per store in 2011
select store, MAX(Weekly_Sales) from walmart_sales
where year(Sale_date) = 2011
GROUP BY store;

# top sales in 2010 store number 5
select store, MAX(Weekly_Sales) from walmart_sales
where store= 5 and year(Sale_date) = 2010;

# top sales in 2011 store number 5
select store, MAX(Weekly_Sales) from walmart_sales
where store= 5 and year(Sale_date) = 2011;

# top sales in 2012 store number 5
select store, MAX(Weekly_Sales) from walmart_sales
where store= 5 and year(Sale_date) = 2012;








