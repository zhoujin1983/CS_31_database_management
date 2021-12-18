/*    Use the cape_codd database for questions 1-4. */
      USE cape_codd;
   
/* 1. Write an SQL statement to show the SKU, SKU_Description, and WarehouseID for all items stored in a warehouse managed by 'Lucille Smith'. Use a join, but do not use a JOIN ON syntax.*/
      SELECT SKU,SKU_Description,inventory.WarehouseID
      FROM   inventory, warehouse
      WHERE  inventory.WarehouseID=warehouse.WarehouseID AND Manager='Lucille Smith';
                          
/*  2. Write a SQL statement to show the WarehouseID and average QuantityOnHand of all items stored in a warehouse managed by 'Lucille Smith'. Use a join, but do not use a JOIN ON syntax. */
       SELECT inventory.WarehouseID, AVG(QuantityOnHand) AS 'AverageQuantityOnHand'
       FROM   inventory,warehouse
       WHERE  inventory.WarehouseID = warehouse.WarehouseID AND Manager='Lucille Smith';
							  
                              
/*   3. Write a SQL statement to show the SKU, SKU_Description, and WarehouseID for all items stored in a warehouse managed by 'Lucille Smith'. Use a join using JOIN ON syntax. */  
        SELECT SKU, SKU_Description, inventory.WarehouseID
        FROM   inventory JOIN warehouse
        ON     inventory.WarehouseID = warehouse.WarehouseID
        WHERE  Manager='Lucille Smith';
       
                       
/*    4. Write a SQL statement to show the WarehouseID and average QuantityOnHand of all items stored in a warehouse managed by 'Lucille Smith'. Use a join using JOIN ON syntax. */
         SELECT inventory.WarehouseID, AVG(QuantityOnHand) AS "AverageQuantityOnHand"
         FROM   inventory JOIN warehouse
         ON     inventory.WarehouseID = warehouse.WarehouseID
         WHERE  Manager = 'Lucille Smith';
                                
/*     Use the sku_data, order_item, and retail_order tables from the cape_codd database for question 5.  */
       
       
/*	   5. Write a SQL statement to show the Buyer, Department, and SUM of Quantity for all orders made in January 2015. 
          Group by the Buyer and Department. The results should be displayed in descending order by the SUM of the Quantity. 
          Use the JOIN syntax of your choice. You may also combine a JOIN and subquery. 
          HINT: You can use a modification of Query 2_57 in the Chapter_2_Queries.sql file on Canvas. */ 
          SELECT Buyer, Department, SUM(Quantity) AS Number_Of_Items_Sold
          FROM   sku_data JOIN order_item
          ON     sku_data.SKU=order_item.SKU
          WHERE  OrderNumber IN (SELECT OrderNumber
							     FROM   retail_order
                                 WHERE  OrderMonth = 'January'AND OrderYear = 2015)
          GROUP BY Buyer,Department
          ORDER BY Number_Of_Items_Sold DESC;
       

							  