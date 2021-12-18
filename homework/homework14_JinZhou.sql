/*  Use the cape_codd database. */
	USE cape_codd;

/*  1. CREATE a VIEW from a SELECT statement that includes a JOIN. SELECT all rows from the VIEW.*/
		CREATE OR REPLACE VIEW manager AS
			SELECT  SKU,SKU_Description, inventory.WarehouseID 
			FROM	inventory JOIN warehouse 
		    ON 		inventory.WarehouseID = warehouse.WarehouseID
			WHERE   Manager = 'Bart Evans';
		SELECT * FROM manager;
        
/*	2.CREATE a VIEW from a SELECT statement that includes aggregate columns. SELECT a subset of rows 
	FROM the VIEW based on evaluating a WHERE condition that refers to the aggregate column. */
    
    CREATE OR REPLACE VIEW quantity AS
    SELECT WarehouseID, SUM(QuantityOnHand) AS SumOfQuantityOnHand
    FROM   inventory
    GROUP BY WarehouseID;
    
    SELECT WarehouseID, SumOfQuantityOnHand
    FROM   quantity
    WHERE  SumOfQuantityOnHand>=1800;
   
        
		
			