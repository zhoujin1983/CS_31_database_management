/*    Use the cape_codd database for questions 1-4. */
      USE cape_codd;
   
   
/* 1. Write a SQL statement to display the WarehouseID, Manager, SUM of the QuantityOnHand, and SUM of the QuantityOnOrder. 
      Group by WarehouseID and Manager. Use the warehouse and inventory tables. Display in ascending order of the WarehouseID . 
      Use a LEFT or RIGHT JOIN.*/
      SELECT warehouse.WarehouseID,  Manager, IFNULL(SUM(QuantityOnHand), 0) AS NumItemsInStock, IFNULL(SUM(QuantityOnOrder), 0) AS numItemsOnOrder
      FROM   inventory
      RIGHT JOIN warehouse 
      ON inventory.WarehouseID = warehouse.WarehouseID
      GROUP BY inventory.WarehouseID, Manager
      ORDER BY warehouse.WarehouseID;
      
/*  2. Write a SQL statement to display the Buyer, SUM of the Quantity, and SUM of the ExtendedPrice. 
       Group by Buyer. Use the sku_data and order_item tables. 
       Display in descending order of the SUM of the ExtendedPrice. Use a LEFT or RIGHT JOIN.*/
       SELECT Buyer, IFNULL(SUM(Quantity), 0) AS ItemsSold, IFNULL(SUM(ExtendedPrice), 0) AS Revenue
       FROM   order_item
       RIGHT JOIN sku_data
       ON order_item.SKU = sku_data.SKU
       GROUP BY sku_data.Buyer
	   ORDER BY Revenue DESC;
                             
/*   3. Write a SQL statement to display the SKU and SKU_Description for items in the catalog_sku_2015 table that are not in the sku_data table.
        Use a LEFT or RIGHT JOIN.*/  
        SELECT catalog_sku_2015.SKU, catalog_sku_2015.SKU_Description
        FROM   catalog_sku_2015
        LEFT JOIN sku_data
        ON    catalog_sku_2015.SKU = sku_data.SKU
        WHERE sku_data.SKU IS NULL;
        
                     
/*    4. Write a SQL statement to display the SKU and SKU_Description for items in the catalog_sku_2015 table that are not in the sku_data table. Use a NOT IN subquery. */
         SELECT SKU, SKU_Description
         FROM   catalog_sku_2015
         WHERE  SKU NOT IN (SELECT SKU FROM sku_data);
                                

/*	   5. Write a SQL statement to display the SKU, SKU_Description, and Department of all SKUs that appear in either of the catalog_sku_2013 or catalog_sku_2014 tables. 
          Display in ascending order of the SKU. Use a UNION. You should NOT display duplicate rows. */ 
          SELECT SKU, SKU_Description, Department
          FROM   catalog_sku_2013
          UNION 
          SELECT SKU, SKU_Description, Department
          FROM   catalog_sku_2014
          ORDER BY SKU;
          
       

							  