use cape_codd;
select * from retail_order;
select OrderNumber, SKU from order_item;
select catalogid, SKU from catalog_sku_2014;
select * from catalog_sku_2015 limit 7;
select distinct Buyer, Department from sku_data limit 2;

use vrg;
select * from artist;
select * from trans limit 10;