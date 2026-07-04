-- ==========================================================
-- Query 1: Top 5 Mutual Funds by AUM
-- ==========================================================

SELECT
    df.scheme_name,
    fa.aum_crore
FROM fact_aum fa
JOIN dim_fund df
ON fa.fund_id = df.fund_id
ORDER BY fa.aum_crore DESC
LIMIT 5;


-- ==========================================================
-- Query 2: Average NAV by Month
-- ==========================================================

SELECT
    d.year,
    d.month,
    ROUND(AVG(n.nav_value), 2) AS avg_nav
FROM fact_nav n
JOIN dim_date d
ON n.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;


-- ==========================================================
-- Query 3: Top 5 Funds by 5-Year Return
-- ==========================================================

SELECT
    df.scheme_name,
    fp.return_5yr_pct
FROM fact_performance fp
JOIN dim_fund df
ON fp.fund_id = df.fund_id
ORDER BY fp.return_5yr_pct DESC
LIMIT 5;


-- ==========================================================
-- Query 4: Average Expense Ratio by Category
-- ==========================================================

SELECT
    df.category,
    ROUND(AVG(fp.expense_ratio_pct), 2) AS avg_expense_ratio
FROM fact_performance fp
JOIN dim_fund df
ON fp.fund_id = df.fund_id
GROUP BY df.category
ORDER BY avg_expense_ratio;


-- ==========================================================
-- Query 5: Top 5 Funds with Highest Sharpe Ratio
-- ==========================================================

SELECT
    df.scheme_name,
    fp.sharpe_ratio
FROM fact_performance fp
JOIN dim_fund df
ON fp.fund_id = df.fund_id
ORDER BY fp.sharpe_ratio DESC
LIMIT 5;


-- ==========================================================
-- Query 6: Top 5 Funds with Lowest Expense Ratio
-- ==========================================================

SELECT
    df.scheme_name,
    fp.expense_ratio_pct
FROM fact_performance fp
JOIN dim_fund df
ON fp.fund_id = df.fund_id
ORDER BY fp.expense_ratio_pct ASC
LIMIT 5;


-- ==========================================================
-- Query 7: Top 5 Funds by Alpha
-- ==========================================================

SELECT
    df.scheme_name,
    fp.alpha
FROM fact_performance fp
JOIN dim_fund df
ON fp.fund_id = df.fund_id
ORDER BY fp.alpha DESC
LIMIT 5;


-- ==========================================================
-- Query 8: Funds with Lowest Maximum Drawdown
-- ==========================================================

SELECT
    df.scheme_name,
    fp.max_drawdown_pct
FROM fact_performance fp
JOIN dim_fund df
ON fp.fund_id = df.fund_id
ORDER BY fp.max_drawdown_pct DESC
LIMIT 5;


-- ==========================================================
-- Query 9: Average 5-Year Return by Category
-- ==========================================================

SELECT
    df.category,
    ROUND(AVG(fp.return_5yr_pct), 2) AS avg_return_5yr
FROM fact_performance fp
JOIN dim_fund df
ON fp.fund_id = df.fund_id
GROUP BY df.category
ORDER BY avg_return_5yr DESC;


-- ==========================================================
-- Query 10: Performance Summary of All Funds
-- ==========================================================

SELECT
    df.scheme_name,
    fp.return_1yr_pct,
    fp.return_3yr_pct,
    fp.return_5yr_pct,
    fp.sharpe_ratio,
    fp.expense_ratio_pct
FROM fact_performance fp
JOIN dim_fund df
ON fp.fund_id = df.fund_id
ORDER BY fp.return_5yr_pct DESC;