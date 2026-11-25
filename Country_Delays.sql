USE supply_chain_db;
SELECT 
    destination_country,
    COUNT(*) AS total_orders,
    ROUND(AVG(actual_days), 1) AS avg_actual_transit_days,
    ROUND(AVG(actual_days - scheduled_days), 1) AS avg_days_behind_schedule,
    ROUND(SUM(gross_sales), 2) AS total_market_sales
FROM supply_logistics_record
WHERE delivery_status = 'Late delivery'
GROUP BY destination_country
HAVING total_orders > 50
ORDER BY avg_days_behind_schedule DESC
LIMIT 5;
