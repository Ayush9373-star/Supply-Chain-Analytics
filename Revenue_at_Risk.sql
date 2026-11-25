USE supply_chain_db;
SELECT 
    category_name,
    COUNT(*) AS total_shipments,
    SUM(CASE WHEN late_risk = 1 THEN 1 ELSE 0 END) AS late_order_count,
    ROUND(SUM(CASE WHEN late_risk = 1 THEN item_value ELSE 0 END), 2) AS revenue_at_risk,
    ROUND((SUM(CASE WHEN late_risk = 1 THEN item_value ELSE 0 END) / SUM(item_value)) * 100, 2) AS leakage_percentage
FROM supply_logistics_record
GROUP BY category_name
ORDER BY revenue_at_risk DESC
LIMIT 5;
