USE ecommerce_db;

-- add new table for category of the products
-- Category product table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT
);

ALTER TABLE Categories AUTO_INCREMENT = 1;

-- modify the data type of category form Varchar to INT
ALTER TABLE PRODUCTS MODIFY Category INT;

-- add foreign key constraint
ALTER TABLE Products
ADD FOREIGN KEY (Category) REFERENCES Categories(CategoryID);

-- Product table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY, 
    ProductName VARCHAR(255) NOT NULL,       
    Description TEXT,                         
    Price INT NOT NULL,            
    StockQuantity INT NOT NULL,               
	Category VARCHAR(100),                    
    DateAdded DATE NOT NULL DEFAULT (CURDATE()),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Verify the Products table structure
DESCRIBE Products;

-- Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL,       
    Email VARCHAR(255) NOT NULL UNIQUE,   
    Password VARCHAR(255) NOT NULL,     
    Address VARCHAR(255),                
    DateRegistered DATE NOT NULL DEFAULT (CURDATE())
);

ALTER TABLE Users
ADD COLUMN City VARCHAR(100) AFTER Address;

DESCRIBE USERS;

-- Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,    
    UserID INT,                             
    OrderDate DATE NOT NULL,                   
    TotalAmount INT NOT NULL,       
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

DESCRIBE ORDERS;

-- Order items table for 
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

DESCRIBE OrderItems;

-- Revies tabel
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,      
    ProductID INT,                           
    UserID INT,                                   
    Rating INT,                                
    ReviewText TEXT,                          
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),        
    CHECK (Rating >= 1 AND Rating <= 5)        
);

DESCRIBE REVIEWS;

-- Payments table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,       
    OrderID INT,                                     
    PaymentMethod VARCHAR(50),                      
    PaymentDate DATE NOT NULL,                      
    Amount INT NOT NULL,                 
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)  
);

DESCRIBE PAYEMENTS;

-- Modify all table to add 2 columns for CreatedAt and UpdatedAt
ALTER TABLE Users
ADD COLUMN CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE Products
ADD COLUMN CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE Categories
ADD COLUMN CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE Orders
ADD COLUMN CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE OrderItems
ADD COLUMN CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE Payments
ADD COLUMN CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE Reviews
ADD COLUMN CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN UpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Cek isi table setelah load dari ETL
SELECT * FROM CATEGORIES;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM ORDERITEMS;
SELECT * FROM REVIEWS;
SELECT * FROM PAYMENTS;
SELECT * FROM USERS;




