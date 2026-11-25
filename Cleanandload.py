import pandas as pd
from sqlalchemy import create_engine

# Load data, pick core columns, and rename them instantly.
cols = {'Order Id': 'order_id', 'Order Country': 'destination_country', 'Delivery Status': 'delivery_status', 'Late_delivery_risk': 'late_risk', 'Days for shipping (real)': 'actual_days', 'Days for shipment (scheduled)': 'scheduled_days', 'Order Item Quantity': 'item_quantity', 'Order Item Total': 'item_value', 'Sales': 'gross_sales', 'Category Name': 'category_name'}
df = pd.read_csv("DataCoSupplyChainDataset.csv", encoding="latin1")[list(cols.keys())].rename(columns=cols)

#  Clean structural data anomalies (drop null IDs and negative numbers).
df = df.dropna(subset=["order_id"]).drop_duplicates(subset=["order_id"])
df = df[df["gross_sales"] >= 0]

# 3. Push to my local MySQL database.
engine = create_engine("mysql+pymysql://root:ayush@localhost:3306/supply_chain_db")
df.to_sql("supply_logistics_record", con=engine, if_exists="append", index=False)

print("Data loaded successfully into the database.")