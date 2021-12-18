/*    Use the cape_codd database for questions 1-6.  */      
      USE cape_codd;

/*    1. Write a SQL query that displays the SKU and SKU_Description columns from the inventory table 
      with SKU_Description containing the string "mask". Remove all duplicate rows. Use LIKE. */
      SELECT DISTINCT SKU, SKU_Description
      FROM   inventory
      WHERE  SKU_Description LIKE '%mask%';

/*    2. Write a SQL query that displays the SKU and SKU_Description columns from 
      the inventory table with SKU_Description containing the string "mask". 
      Remove all duplicate rows. Use REGEXP. */
      SELECT DISTINCT SKU, SKU_Description
      FROM   inventory
      WHERE  SKU_Description REGEXP 'mask';

/* 3. Write a SQL query to display all columns from the warehouse table 
      with the second letter in the Manager’s first name is "a". Use LIKE. */
      SELECT *
      FROM  warehouse 
      WHERE Manager LIKE'_a%';

/* 4. Write a SQL query to display all columns from the warehouse table 
      with the second letter in the Manager’s first name is "a". Use REGEXP. */
      SELECT *
      FROM     warehouse
      WHERE    Manager  REGEXP '^.a';
      
/* 5. Write a SQL query to display all columns from catalog_sku_2015 table where the CatalogPage is null. */      
      SELECT   *
      FROM     catalog_sku_2015 
      WHERE    CatalogPage IS NULL;
      
/*  6. Write a SQL query to display all columns from catalog_sku_2015 table where the CatalogPage is not null. */ 
	   SELECT   *
       FROM     catalog_sku_2015 
       WHERE    CatalogPage IS NOT NULL;
       
/*    Use the vrg database for questions 7. */
      USE vrg;
       
/*  7. Write a SQL query to display the LastName, FirstName, and EmailAddress columns from the customer table. 
       If the EmailAddress column is NULL, replace the NULL value with 'No email available' or a similar message. */
       SELECT LastName, FirstName, IFNULL(EmailAddress,'No email available')
       FROM   customer;
        