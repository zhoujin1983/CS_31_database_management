-- Open the file named DBP-e14-MySQL-Cape-Codd-CreateandInsert-Tables.sql
-- located in the Cape Codd Database module. We will review the CREATE
-- statements for the sku_data, retail_order, and order_item tables.

-- Example syntax for foreign key constraints
/* CONSTRAINT FK_NAME FOREIGN KEY (ChildColumn)
       REFERENCES ParentTable(ParentColumn)
       ON UPDATE ReferenceOption
       ON DELETE ReferenceOption */
-- ReferenceOption can be RESTRICT, CASCADE, SET NULL, NO ACTION
-- If ON UPDATE or ON DELETE clause missing, default is RESTRICT/NO ACTION

-- Parent Actions
-- Changing key of parent - DBMS prohibits
UPDATE sku_data
    SET SKU = 999999
    WHERE SKU = 201000;

-- Deleteing parent - DBMS prohibits
DELETE FROM sku_data
    WHERE SKU = 201000;

-- Child Actions
-- SKU does not match - DBMS prohibits
INSERT INTO ORDER_ITEM VALUES (
1000, 2001000, 1, 300, 300);

-- SKU does not match - DBMS prohibits
UPDATE order_item
    SET SKU = 999999
    WHERE SKU = 201000;