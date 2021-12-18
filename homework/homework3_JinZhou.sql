/*    Use the cape_codd database for questions 1-5.  */      
      USE cape_codd;

/* 1. Write a SQL statement to display the SKU, SKU_Description, 
      and QuantityOnHand columns from the inventory table with WarehouseID equal to 100. */
      SELECT SKU, SKU_Description, QuantityOnHand
      FROM inventory
      WHERE WarehouseID=100;

/* 2. Is there anything out of stock at the warehouse with WarehouseID equal to 100? 
      If yes, what?  */
      /* 101100,Dive Mask,Small Clear is out of stock. */

/* 3. Write a SQL statement to display the SKU, SKU_Description, and QuantityOnOrder columns 
      from the inventory table with QuantityOnHand equal to 0. */
      SELECT SKU, SKU_Description, QuantityOnOrder
      FROM inventory 
      WHERE QuantityOnHand=0;

/* 4. Write a SQL statement to display the WarehouseCity and WarehouseState columns 
      from the warehouse table with WarehouseID equal to 500? */
      SELECT WarehouseCity,WarehouseState
      FROM warehouse
      WHERE WarehouseID=500;
      
/* 5. Write a SQL statement to display the WarehouseID column from 
      the inventory table that have a QuantityOnHand equal to 0. Remove duplicate rows. */      

      SELECT DISTINCT WarehouseID
      FROM inventory
      WHERE QuantityOnHand=0;
       

/*    Use the vrg database for questions 6 and 7. */
      USE vrg;

/*  6. Write a SQL statement to display the LastName, FirstName, 
       and EmailAddress columns from the customer table. 
       Order by EmailAddress in ascending order. */    
       SELECT LastName,FirstName,EmailAddress
       FROM customer
       ORDER BY EmailAddress;
       
/*  7. Write a SQL statement to display the WorkID and AcquisitionPrice columns 
       from the trans table. Order by WorkID in ascending order and then 
       by AcquisitionPrice in descending order. 
       Restrict the display to only 10 rows.  */
       SELECT WorkID,AcquisitionPrice
       FROM trans
       ORDER BY WorkID, AcquisitionPrice DESC
       LIMIT 10;