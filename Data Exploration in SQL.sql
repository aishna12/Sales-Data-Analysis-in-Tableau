#SELECTING THE sales DATABASE TO BE USED
USE sales;

#EXPLORING ALL THE TABLES
SELECT * FROM customers;
SELECT * FROM date;
SELECT * FROM markets;
SELECT * FROM products;
SELECT * FROM transactions;

#DRAWING SOME BUSINESS INSIGHTS FROM THE GIVEN DATA BASED ON SALES

#TOTAL NUMBER OF TRANSACTIONS 
SELECT 
    COUNT(*) AS total_transacations
FROM
    transactions;

#TOTAL NUMBER OF TRANSACTIONS THAT WERE DONE IN EACH YEAR
SELECT 
    YEAR(order_date) AS year, COUNT(*) AS no_of_transacations
FROM
    transactions
GROUP BY YEAR(order_date);

#NUMBER TRANSACTIONS THAT WERE DONE IN Delhi NCR
SELECT 
    COUNT(*)
FROM
    transactions t
        INNER JOIN
    markets m ON t.market_code = m.markets_code
WHERE
    m.markets_name = 'Delhi NCR'
ORDER BY t.product_code;

#LOOKING AT TRANSATIONS ONLY FROM Mumbai
SELECT 
    t.*
FROM
    transactions t
        JOIN
    markets m ON t.market_code = m.markets_code
WHERE
    m.markets_name = 'Mumbai'
ORDER BY t.product_code;

#TOTAL REVENUE IN EACH YEAR 
SELECT 
    YEAR(order_date) AS year, SUM(sales_amount) AS total_sales
FROM
    transactions
GROUP BY YEAR(order_date);

#REVENUE FOR PARTICULAR CITIES
SELECT 
    m.markets_name, SUM(t.sales_amount) AS total_sales
FROM
    transactions t
        JOIN
    markets m ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY total_sales DESC;

#DRAWING INSIGHTS FROM THE DATA BASED ON PRODUCTS AND MARKETS

#NUMBER OF UNITS SOLD OF EACH PRODUCT
SELECT 
    p.product_code,
    p.product_type,
    COUNT(t.product_code) AS units_sold
FROM
    transactions t
        JOIN
    products p ON t.product_code = p.product_code
GROUP BY t.product_code
ORDER BY units_sold DESC;

#NUMBER OF PRODUCTS SOLD IN EACH MARKET
SELECT 
    m.markets_name, COUNT(t.product_code) AS units_sold
FROM
    transactions t
        JOIN
    products p ON t.product_code = p.product_code
        JOIN
    markets m ON m.markets_code = t.market_code
GROUP BY m.markets_name
ORDER BY units_sold DESC;

#DRAWING INSIGHTS BASED ON CUSTOMERS

#CUSTOMERS WITH  NUMBER OF TRANSACTIONS
SELECT 
    c.custmer_name, COUNT(t.customer_code) AS no_of_transactions
FROM
    transactions t
        JOIN
    customers c ON t.customer_code = c.customer_code
GROUP BY c.custmer_name
ORDER BY no_of_transactions DESC;

SELECT 
    c.custmer_name, SUM(t.profit_margin) AS total_profit
FROM
    transactions t
        JOIN
    customers c ON t.customer_code = c.customer_code
GROUP BY t.customer_code
ORDER BY total_profit DESC
LIMIT 5;

SELECT 
    c.custmer_name, SUM(t.profit_margin) AS total_profit
FROM
    transactions t
        JOIN
    customers c ON t.customer_code = c.customer_code
GROUP BY t.customer_code
ORDER BY total_profit
LIMIT 5;

SELECT 
    t.product_code,
    p.product_type,
    SUM(t.profit_margin) AS total_profit
FROM
    transactions t
        JOIN
    products p ON t.product_code = p.product_code
GROUP BY t.product_code
ORDER BY total_profit DESC
LIMIT 5;

SELECT 
    t.product_code,
    p.product_type,
    SUM(t.profit_margin) AS total_profit
FROM
    transactions t
        JOIN
    products p ON t.product_code = p.product_code
GROUP BY t.product_code
ORDER BY total_profit
LIMIT 5;

SELECT 
    m.markets_name, SUM(t.profit_margin) AS total_profit
FROM
    transactions t
        JOIN
    markets m ON t.market_code = m.markets_code
GROUP BY t.market_code
ORDER BY total_profit DESC
LIMIT 5;

SELECT 
    m.markets_name, SUM(t.profit_margin) AS total_profit
FROM
    transactions t
        JOIN
    markets m ON t.market_code = m.markets_code
GROUP BY t.market_code
ORDER BY total_profit
LIMIT 5;




