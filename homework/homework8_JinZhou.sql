/*    Use the cape_codd database for questions 1-4. */
      USE cape_codd;
   
/* 1. Write an SQL statement to show the SKU, SKU_Description, WarehouseID for all items stored in a warehouse 
      managed by 'Lucille Smith'. Use a subquery. */
      SELECT SKU,SKU_Description,WarehouseID
      FROM   inventory
      WHERE  WarehouseID IN (SELECT WarehouseID
                             FROM   warehouse
							 WHERE  manager LIKE "Lucille Smith");
                          
/*  2. Write an SQL statement to show the Manager, WarehouseCity, WarehouseState for all warehouses with SKU 101100 in stock. 
       Use a subquery. */
       SELECT Manager, WarehouseCity,WarehouseState,WarehouseID
       FROM   warehouse
       WHERE  WarehouseID IN (SELECT WarehouseID
							  FROM   inventory
                              WHERE  SKU = 101100 AND QuantityOnHand!=0);
                              
/*   3. Write an SQL statement to show the Department and Buyer for all SKUs that are on an order 
        (Hint: order_item table). Eliminate repeat rows. Use a subquery. */  
        SELECT DISTINCT Buyer,Department
        FROM   sku_data
        WHERE  SKU IN (SELECT SKU
                       FROM   order_item
                       WHERE  Quantity=1);
                       
/*    4. Write an SQL statement to show the WarehouseID and average QuantityOnHand of all items stored 
         in a warehouse managed by 'Lucille Smith'. Use a subquery. */
         SELECT WarehouseID, AVG(QuantityOnHand) AS "AverageQuantityOnHand"
         FROM   inventory
         WHERE  WarehouseID IN (SELECT WarehouseID
                                FROM   warehouse
                                WHERE  Manager LIKE 'Lucille Smith');
                                
/*     Use the table_1 database for questions 5 and 6 .  */
       USE  table_1;
       
/*	   5. Use a correlated subquery like we used in class to show OrderDate does NOT determine PartNum. */ 
          SELECT *
          FROM table_1 AS T1A
          WHERE T1A.OrderDate IN(SELECT T1B.OrderDate
                                 FROM   table_1 AS T1B
                                 WHERE  T1A.OrderDate = T1B.OrderDate
                                 AND    T1A.PartNum != T1B.PartNum);
       
/*     6. Use a correlated subquery like we used in class to show Description does determine PartNum. */
          SELECT *
          FROM table_1 AS T1A
          WHERE T1A.Description IN (SELECT T1B.Description
                                    FROM   table_1 AS T1B
                                    WHERE  T1A.Description=T1B.Description
                                    AND    T1A.PartNum != T1B.PartNum);
        
							  