1. Discount Levels vs Margins
  Goal: Analyze how discount percentages affect profit margins

SELECT Discount, Sales, Profit, ROUND(Profit * 1.0 / Sales, 2) AS ProfitMargin
FROM superstore;

2. Regional Performance
  Goal: Identify regional trends
SELECT Region, substr("Order Date", -4) AS year, ROUND(SUM(Sales),1) AS Sales, ROUND(SUM(Profit),1) AS Profit, SUM(Profit) * 1.0 / SUM(Sales) AS ProfitMargin
FROM superstore
GROUP BY Region, year
ORDER BY year, Region;

3. Segment Profitability
  Goal: Identify which Segments are driving the most profit
SELECT Segment, Region, SUM(Profit) AS Profit, ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS ProfitMargin
FROM superstore
GROUP BY Segment, Region;


4. Subcategory Profit
  Goal: Identify which Sub-Categories are losing and driving profit
SELECT "Sub-Category", SUM(Profit) AS Profit
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Profit DESC;

5. Subcategory Margins
  Goal: Identify profit margins by Sub-Category
SELECT Category, "Sub-Category", SUM(Sales) AS Sales, SUM(Profit) AS Profit, ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS ProfitMargin
FROM superstore
GROUP BY Category, "Sub-Category"
ORDER BY ProfitMargin;


6. Revenue by Subcategory
  Goal: Identify if high revenue correlates with high profit
SELECT "Sub-Category", SUM(Sales) AS Sales, SUM(Profit) AS Profit, ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS ProfitMargin
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Sales DESC;
