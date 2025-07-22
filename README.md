# E-Commerce Data Pipeline: MySQL Database Design, ETL, and SQL Analytics
by Mochammad Wahyu Suryansyah

A side project from designing a database schema with MySQL to building an ETL pipeline with Jupyter Notebook for data analysis and optimization.

## 📌 Project Overview
This project demonstrates an end-to-end ETL pipeline and SQL-based analysis for an e-commerce dataset. The pipeline extracts data from multiple CSV files, transforms and cleans the data in Python, loads it into a MySQL relational database, and then performs insightful business analyses via SQL queries.

In addition to data processing, this project incorporates SQL query optimization techniques to improve performance for analytical queries on potentially large datasets.

## 🎯 Key Skills Demonstrated
- Relational Database Design (MySQL)
- ETL Process Development in Python
- SQL Querying for Business Insights
- Data Quality & Consistency Handling
- SQL Query Optimization Techniques

## 🔗 Project Workflow
**1. Database Schema Design**
Designed normalized relational database schemas for entities such as Users, Products, Categories, Orders, Payments, Reviews, and OrderItems.

**2. ETL Process**
- Extract: Loaded data from multiple CSV files.
- Transform: Cleaned the data, converted data types, handled missing values, calculated totals, and established foreign key relationships.
- Load: Populated the MySQL database with the transformed data.

**3. SQL-Based Analysis**
Performed various business analyses including:

- Total sales per product category
- Best-selling products
- Average product ratings
- Top spending users

**4. Query Optimization**
To ensure the analysis remains performant, I added indexes to frequently joined or filtered columns like ProductID.