Use ecommerce_db;

-- 1. Total penjualan per kategori

-- Analyze execution plan of this query (BEFORE)
EXPLAIN SELECT 
    c.CategoryName,
    SUM(oi.Price * oi.Quantity) AS TotalSales
FROM OrderItems oi
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Categories c ON p.Category = c.CategoryID
GROUP BY c.CategoryName
ORDER BY TotalSales DESC;

-- adding INDEX to category and productID column
CREATE INDEX idx_products_category ON Products(Category);
CREATE INDEX idx_orderitems_productid ON OrderItems(ProductID);

-- Analyze the improvement after adding index (AFTER)
EXPLAIN SELECT 
    c.CategoryName,
    SUM(oi.Price * oi.Quantity) AS TotalSales
FROM OrderItems oi
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Categories c ON p.Category = c.CategoryID
GROUP BY c.CategoryName
ORDER BY TotalSales DESC;


-- 2. Rata-rata Rating Produk

-- Analyze execution plan of this query (BEFORE)
EXPLAIN SELECT 
    p.ProductName,
    ROUND(AVG(r.Rating), 2) AS AverageRating,
    COUNT(r.ReviewID) AS TotalReviews
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY AverageRating DESC;

-- adding INDEX to productID column
CREATE INDEX idx_reviews_productid ON Reviews(ProductID);

-- Analyze the improvement after adding index (AFTER)
EXPLAIN SELECT 
    p.ProductName,
    ROUND(AVG(r.Rating), 2) AS AverageRating,
    COUNT(r.ReviewID) AS TotalReviews
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY AverageRating DESC;

