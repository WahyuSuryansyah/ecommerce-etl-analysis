Use ecommerce_db;

-- Total penjualan per kategori
SELECT 
    c.CategoryName,
    SUM(oi.Price * oi.Quantity) AS TotalSales
FROM OrderItems oi
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Categories c ON p.Category = c.CategoryID
GROUP BY c.CategoryName
ORDER BY TotalSales DESC;

-- produk terlaris
SELECT 
    p.ProductName,
    SUM(oi.Quantity) AS TotalUnitsSold
FROM OrderItems oi
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalUnitsSold DESC
LIMIT 3;

-- Rata-rata Rating Produk
SELECT 
    p.ProductName,
    ROUND(AVG(r.Rating), 2) AS AverageRating,
    COUNT(r.ReviewID) AS TotalReviews
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY AverageRating DESC;

-- User dengan Total Pembelian Tertinggi
SELECT 
    u.UserName,
    u.Email,
    SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
WHERE o.TotalAmount IS NOT NULL
GROUP BY u.UserID
ORDER BY TotalSpent DESC
LIMIT 5;


