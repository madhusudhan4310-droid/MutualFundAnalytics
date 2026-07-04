# BlueStock Mutual Fund Analytics - Data Dictionary

## Dimension Tables

### dim_fund

| Column | Type | Description |
|--------|------|-------------|
| fund_id | INTEGER | Primary Key |
| amfi_code | TEXT | AMFI Fund Code |
| scheme_name | TEXT | Mutual Fund Name |
| fund_house | TEXT | AMC Name |
| category | TEXT | Fund Category |
| plan | TEXT | Direct / Regular |

---

### dim_date

| Column | Type | Description |
|--------|------|-------------|
| date_id | INTEGER | Primary Key |
| nav_date | DATE | NAV Date |
| day | INTEGER | Day |
| month | INTEGER | Month |
| year | INTEGER | Year |

---

## Fact Tables

### fact_nav

| Column | Type | Description |
|--------|------|-------------|
| nav_id | INTEGER | Primary Key |
| fund_id | INTEGER | Foreign Key |
| date_id | INTEGER | Foreign Key |
| nav_value | NUMERIC | Net Asset Value |

---

### fact_transactions

| Column | Type | Description |
|--------|------|-------------|
| transaction_id | INTEGER | Primary Key |
| fund_id | INTEGER | Foreign Key |
| date_id | INTEGER | Foreign Key |
| transaction_type | TEXT | SIP/Lumpsum/Redemption |
| amount | NUMERIC | Transaction Amount |
| units | NUMERIC | Units Purchased |
| nav | NUMERIC | NAV at Transaction |

---

### fact_performance

| Column | Type | Description |
|--------|------|-------------|
| return_1yr_pct | NUMERIC | One Year Return |
| return_3yr_pct | NUMERIC | Three Year Return |
| return_5yr_pct | NUMERIC | Five Year Return |
| benchmark_3yr_pct | NUMERIC | Benchmark Return |
| alpha | NUMERIC | Alpha |
| beta | NUMERIC | Beta |
| sharpe_ratio | NUMERIC | Sharpe Ratio |
| sortino_ratio | NUMERIC | Sortino Ratio |
| std_dev_ann_pct | NUMERIC | Annual Standard Deviation |
| max_drawdown_pct | NUMERIC | Maximum Drawdown |
| expense_ratio_pct | NUMERIC | Expense Ratio |

---

### fact_aum

| Column | Type | Description |
|--------|------|-------------|
| aum_id | INTEGER | Primary Key |
| fund_id | INTEGER | Foreign Key |
| date_id | INTEGER | Foreign Key |
| aum_crore | NUMERIC | Assets Under Management (Crores) |