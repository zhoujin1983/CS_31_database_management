/*  1. Write a SQL function that has one parameter of type NUMERIC(8, 2) and returns CHAR(18). 
	Use one of the logical statement we discussed in class to implement a function that does the following:

	return 'Small Ticket Item' if the parameter is less than 1000
	return 'Medium Ticket Item' if the parameter is between 1000 and 10000
	return 'Big Ticket Item' if the parameter is greater than 10000
	return 'For Sale' if none of the conditions above are true  */
    
	USE vrg;
	DROP FUNCTION IF EXISTS item_type;

	DELIMITER //
	CREATE FUNCTION item_type(transID INT)
	RETURNS CHAR(18)
	NOT DETERMINISTIC
	READS SQL DATA
	BEGIN
		DECLARE price DECIMAL; 
		SET price = (SELECT SalesPrice 
					  FROM trans
					  WHERE TransactionID=transID);

		IF price < 1000 THEN
			RETURN 'Small Ticket Item';
		ELSEIF price < 10000 AND price > 1000 THEN 
			RETURN 'Medium Ticket Item';
		ELSEIF price > 10000 THEN 
			RETURN 'Big Ticket Item'; 
		ELSE   
			RETURN 'For Sale';
		END IF;
	END//
	DELIMITER ;
    
/*	2. Write a SQL statement to display the TransactionID, SalesPrice, and a call to the function you just wrote with SalesPrice as the argument. 
	Use the trans table.  Display the results in descending order of SalesPrice. */
	SELECT TransactionID, SalesPrice, vrg.item_type(TransactionID)
	FROM   trans
	ORDER BY SalesPrice DESC;
    