CREATE DATABASE supply_chain_db;

USE supply_chain_db;

-- 2. Create the  table .
CREATE TABLE IF NOT EXISTS supply_logistics_record (
    order_id INT NOT NULL,
    destination_country VARCHAR(100) NOT NULL,
    delivery_status VARCHAR(50) NOT NULL,
    late_risk INT NOT NULL,
    actual_days INT NOT NULL,
    scheduled_days INT NOT NULL,
    item_quantity INT NOT NULL,
    item_value DECIMAL(10, 2) NOT NULL,
    gross_sales DECIMAL(10, 2) NOT NULL,
    category_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (order_id)
);


SELECT COUNT(*) AS total_rows_stored 
FROM supply_logistics_record;
