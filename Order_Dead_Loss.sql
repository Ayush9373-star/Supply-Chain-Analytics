USE supply_chain_db;
SELECT 
    delivery_status,
    COUNT(*) AS absolute_order_volume,
    ROUND(SUM(item_value), 2) AS capital_value_impact,
    -- Advanced Element: Window Function calculates the exact financial loss share ratio dynamically
    ROUND(
        (SUM(item_value) / SUM(SUM(item_value)) OVER()) * 100, 
        2
    ) AS financial_loss_share_percentage
FROM supply_logistics_record
GROUP BY delivery_status
ORDER BY capital_value_impact DESC;
