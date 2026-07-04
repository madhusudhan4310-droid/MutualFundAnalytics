-- =====================================================
-- BlueStock Mutual Fund Analytics Database Schema
-- =====================================================

CREATE TABLE dim_fund (
    fund_id SERIAL PRIMARY KEY,
    amfi_code VARCHAR(20) UNIQUE,
    scheme_name TEXT,
    fund_house TEXT,
    category TEXT,
    plan TEXT
);

CREATE TABLE dim_date (
    date_id SERIAL PRIMARY KEY,
    nav_date DATE,
    day INTEGER,
    month INTEGER,
    year INTEGER
);

CREATE TABLE fact_nav (
    nav_id SERIAL PRIMARY KEY,
    fund_id INTEGER REFERENCES dim_fund(fund_id),
    date_id INTEGER REFERENCES dim_date(date_id),
    nav_value NUMERIC
);

CREATE TABLE fact_transactions (
    transaction_id SERIAL PRIMARY KEY,
    fund_id INTEGER REFERENCES dim_fund(fund_id),
    date_id INTEGER REFERENCES dim_date(date_id),
    transaction_type VARCHAR(50),
    amount NUMERIC,
    units NUMERIC,
    nav NUMERIC
);

CREATE TABLE fact_performance (
    performance_id SERIAL PRIMARY KEY,
    fund_id INTEGER REFERENCES dim_fund(fund_id),
    return_1yr_pct NUMERIC,
    return_3yr_pct NUMERIC,
    return_5yr_pct NUMERIC,
    benchmark_3yr_pct NUMERIC,
    alpha NUMERIC,
    beta NUMERIC,
    sharpe_ratio NUMERIC,
    sortino_ratio NUMERIC,
    std_dev_ann_pct NUMERIC,
    max_drawdown_pct NUMERIC,
    expense_ratio_pct NUMERIC
);

CREATE TABLE fact_aum (
    aum_id SERIAL PRIMARY KEY,
    fund_id INTEGER REFERENCES dim_fund(fund_id),
    date_id INTEGER REFERENCES dim_date(date_id),
    aum_crore NUMERIC
);