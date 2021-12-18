/*       Use the cape_codd database for questions 1-6.  */      
         USE cape_codd;

/*    1. Write a SQL query to display the SKU and count of the rows where the QuantityOnHand is 0, grouped by SKU. 
         Use the inventory table. Display the results in descending order of count.*/
         SELECT SKU,COUNT(QuantityOnHand) AS NumLocationsOutOfStock 
         FROM   inventory
         WHERE  QuantityOnHand=0
         GROUP BY SKU
         ORDER BY NumLocationsOutOfStock DESC;

/*    2. Write a SQL query to display the OrderNumber and sum of the ExtendedPrice column, grouped by OrderNumber. 
         Use the order_item table. Display the results in descending order of sum.*/
         SELECT OrderNumber, SUM(ExtendedPrice) AS SubTotal
		 FROM   order_item
         GROUP BY OrderNumber
         ORDER BY SubTotal DESC;
		 

/*    3. Write a SQL statement to display the WarehouseID and the sum of QuantityOnHand, grouped by WarehouseID. 
         Use the inventory table.Name the sum TotalItemsOnHand and display the results in descending order of TotalItemsOnHand.*/
		 SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
		 FROM  inventory 
         GROUP BY WarehouseID
         ORDER BY TotalItemsOnHand DESC;

/*    4. Write a SQL query that displays the number of rows of the inventory table 
         where QuantityOnHand is greater than or equal to 500. 
         Use a column alias of WellStocked for the aggregate column. */
         SELECT COUNT(*) AS WellStocked
         FROM     inventory
         WHERE    QuantityOnHand>=500;
      
/*    5. Write a SQL query that displays the average of the OrderTotal column from the retail_order table. 
         Use a column alias of AverageOrderAmount for the aggregate column.*/      
         SELECT   AVG(OrderTotal) AS AverageOrderAmount
         FROM     retail_order;
         
      
/*    6. Write a SQL query that displays the min and max of the OrderTotal column in the retail_order table. 
         Use a column alias of SmallestOrderAmount for the min and LargestOrderAmount for the max. */ 
	     SELECT   MIN(OrderTotal) AS SmallestOrderAmount,
                  MAX(OrderTotal) AS LargestOrderAmount
         FROM     retail_order ;
         
       
/*       Use the vrg database for questions 7. */
         USE vrg;
       
/*   7.  Write a SQL query that displays the TransactionID column and the difference between the SalesPrice and AcquistionPrice columns from the trans table. 
         Use a column alias of ProfitAmount for the calculated column. 
         Remove rows where the difference between the SalesPrice and AcquisitionPrice is NULL.*/
         SELECT TransactionID, (SalesPrice-AcquisitionPrice) AS ProfitAmount
         FROM trans
         WHERE (SalesPrice-AcquisitionPrice)IS NOT NULL;
        
         
        