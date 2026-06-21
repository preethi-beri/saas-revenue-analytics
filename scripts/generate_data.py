import pandas as pd
import random
from datetime import datetime, timedelta

plans = {
    "Basic": 29,
    "Pro": 79,
    "Enterprise": 199
}

records = []

start_date = datetime(2023, 1, 1)

for i in range(10000):

    customer_id = f"CUST{random.randint(1000,9999)}"
    subscription_id = f"SUB{random.randint(10000,99999)}"

    plan_name = random.choice(list(plans.keys()))
    amount = plans[plan_name]

    status = random.choices(
        ["Active", "Canceled"],
        weights=[85, 15]
    )[0]

    transaction_date = start_date + timedelta(
        days=random.randint(0, 900)
    )

    records.append([
        customer_id,
        subscription_id,
        plan_name,
        amount,
        status,
        transaction_date.date()
    ])

df = pd.DataFrame(
    records,
    columns=[
        "customer_id",
        "subscription_id",
        "plan_name",
        "amount",
        "status",
        "transaction_date"
    ]
)

df.to_csv(
    "data/subscription_transactions.csv",
    index=False
)

print("Dataset generated successfully!")
print(df.head())