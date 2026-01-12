/*
Note:
This file contains analysis queries only.
The original dataset is excluded due to licensing and privacy considerations.
*/

-- total records import from csv
select COUNT(*) as total_rows from products;
-- output: 16312 rows

-- check to see if there is any missing price for products
select * 
from products
where clean_price IS NULL;
-- output: 0

-- average price by brand
Select brand, round(Avg(clean_price), 2) as avg_price
from products
where clean_price is not null
group by brand
order by avg_price asc
limit 10;
-- output: COREBASE	18.39 Subset	18.88 PEARLS OF AFRICA	21.40 Honest Basics	22.10 Project Três	23.44 Three Brothers	23.88
-- Primal Soles	24.00 Bikini Season	24.77 TIZZ & TONIC	24.80 ZD ZERO DEFECTS	25.45


-- most expensive products
select title, brand, clean_price
from products
where clean_price is not null
order by clean_price DESC
limit  1;
-- output MIllion Pound Bag from elvis and kressse with the price 1136363.64 euros

-- top 10  products count from each brand
select brand, count(*) as product_count
from products
where clean_price is not null
group by brand
order by product_count desc
limit 10;
-- output: 
/*
Shop Like You Give a Damn	3979
Frija Omina	925
Mejuri	466
COILEX	458
LANIUS	411
GAÂLA	373
Jyoti - Fair Works	333
Paguro Upcycle	307
Brava Fabrics	305
Silverstick	300
*/


-- price distribution
select 
	case 
		when clean_price < 50 then '<50'
        when clean_price between 50 and 100 then '50-100'
		else '100+'
	end as price_range,
    count(*) as count
from products
where clean_price is not null
group by price_range;

-- output
/*
price_range  count
100+	     4736
<50	         6329
50-100	     5247
*/ 