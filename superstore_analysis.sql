-- ============================================================
-- PROJECT 2: SALES & REVENUE PERFORMANCE ANALYSIS
-- Dataset: Sample - Superstore
-- Database: superstore_analytics.db
-- SQL dialect: SQLite
-- ============================================================

-- ------------------------------------------------------------
-- 00. DATA CHECKS
-- ------------------------------------------------------------

-- Check total number of rows
SELECT COUNT(*) AS total_rows
FROM "Sample - Superstore";

-- Inspect table columns and data types
PRAGMA table_info("Sample - Superstore");


-- ------------------------------------------------------------
-- 01. TOTAL SALES BY CATEGORY
-- ------------------------------------------------------------
SELECT
    Category,
    SUM(Sales) AS total_sales
FROM "Sample - Superstore"
GROUP BY Category
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 02. TOP 10 MOST PROFITABLE SUB-CATEGORIES
-- ------------------------------------------------------------
SELECT
    "Sub-Category",
    SUM(Profit) AS total_profit
FROM "Sample - Superstore"
GROUP BY "Sub-Category"
ORDER BY total_profit DESC
LIMIT 10;


-- ------------------------------------------------------------
-- 03. SALES, PROFIT, AND PROFIT MARGIN BY REGION
-- ------------------------------------------------------------
SELECT
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    100.0 * SUM(Profit) / SUM(Sales) AS profit_margin_pct
FROM "Sample - Superstore"
GROUP BY Region
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 04. TOP 10 SUB-CATEGORIES BY SALES
-- ------------------------------------------------------------
SELECT
    "Sub-Category",
    SUM(Sales) AS total_sales
FROM "Sample - Superstore"
GROUP BY "Sub-Category"
ORDER BY total_sales DESC
LIMIT 10;


-- ------------------------------------------------------------
-- 05. AVERAGE ORDER VALUE BY REGION
-- ------------------------------------------------------------
SELECT
    Region,
    SUM(Sales) AS total_sales,
    COUNT(DISTINCT "Order ID") AS unique_orders,
    1.0 * SUM(Sales) / COUNT(DISTINCT "Order ID") AS average_order_value
FROM "Sample - Superstore"
GROUP BY Region
ORDER BY average_order_value DESC;


-- ------------------------------------------------------------
-- 06. SALES AND PROFIT BY CATEGORY
-- ------------------------------------------------------------
SELECT
    Category,
    SUM(Profit) AS total_profit,
    SUM(Sales) AS total_sales
FROM "Sample - Superstore"
GROUP BY Category
ORDER BY total_profit DESC;


-- ------------------------------------------------------------
-- 07. PROFIT MARGIN BY SUB-CATEGORY (LOWEST FIRST)
-- ------------------------------------------------------------
SELECT
    "Sub-Category",
    SUM(Profit) AS total_profit,
    SUM(Sales) AS total_sales,
    100.0 * SUM(Profit) / SUM(Sales) AS profit_margin_pct
FROM "Sample - Superstore"
GROUP BY "Sub-Category"
ORDER BY profit_margin_pct ASC;


-- ------------------------------------------------------------
-- 08. AVERAGE PROFIT AND SALES BY DISCOUNT LEVEL
-- ------------------------------------------------------------
SELECT
    Discount,
    AVG(Profit) AS avg_profit,
    AVG(Sales) AS avg_sales
FROM "Sample - Superstore"
GROUP BY Discount
ORDER BY Discount DESC;


-- ------------------------------------------------------------
-- 09. TOP 10 STATES BY SALES
-- ------------------------------------------------------------
SELECT
    State,
    SUM(Profit) AS total_profit,
    SUM(Sales) AS total_sales
FROM "Sample - Superstore"
GROUP BY State
ORDER BY total_sales DESC
LIMIT 10;


-- ------------------------------------------------------------
-- 10. STATES WITH NEGATIVE TOTAL PROFIT (LARGEST LOSSES FIRST)
-- ------------------------------------------------------------
SELECT
    State,
    SUM(Profit) AS total_profit
FROM "Sample - Superstore"
GROUP BY State
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC;


-- ------------------------------------------------------------
-- 11. TOTAL SALES BY YEAR
-- ------------------------------------------------------------
SELECT
    strftime('%Y', "Order Date") AS order_year,
    SUM(Sales) AS total_sales
FROM "Sample - Superstore"
GROUP BY order_year
ORDER BY order_year ASC;


-- ------------------------------------------------------------
-- 12. SALES, PROFIT, AND ORDER COUNT BY SHIPPING MODE
-- ------------------------------------------------------------
SELECT
    "Ship Mode",
    SUM(Profit) AS total_profit,
    SUM(Sales) AS total_sales,
    COUNT(DISTINCT "Order ID") AS order_count
FROM "Sample - Superstore"
GROUP BY "Ship Mode"
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 13. SALES AND PROFIT BY CUSTOMER SEGMENT
-- ------------------------------------------------------------
SELECT
    Segment,
    SUM(Profit) AS total_profit,
    SUM(Sales) AS total_sales,
    AVG(Profit) AS avg_profit
FROM "Sample - Superstore"
GROUP BY Segment
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 14. TOP 10 CUSTOMERS BY SALES
-- ------------------------------------------------------------
SELECT
    "Customer Name",
    SUM(Profit) AS total_profit,
    SUM(Sales) AS total_sales
FROM "Sample - Superstore"
GROUP BY "Customer Name"
ORDER BY total_sales DESC
LIMIT 10;
