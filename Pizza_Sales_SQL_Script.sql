-- Database and Table Setup

CREATE DATABASE PIZZA;

CREATE TABLE Orders(
Order_ID INT NOT NULL,
Order_Date DATE NOT NULL,
Order_Time TIME,
PRIMARY KEY(Order_ID));

SELECT * FROM Orders;

CREATE TABLE Orders_Details(
Order_Details_ID INT NOT NULL,
Order_ID INT NOT NULL,
Pizza_ID Text NOT NULL,
Quantity INT NOT NULL,
PRIMARY KEY(Order_Details_ID));

SELECT * FROM Orders_Details;

-- SQL Query 

-- Retrieve the total number of orders placed.

SELECT 
    COUNT(Order_ID) AS Total_Orders
FROM
    Orders;
    
-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(pizzas.price * orders_details.Quantity),
            2) AS Total_Revenue
FROM
    pizzas
        JOIN
    orders_details 
    ON pizzas.pizza_id = orders_details.Pizza_ID;
    
-- Identify the highest-priced pizza.

SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY price DESC
LIMIT 1;

-- Identify the most common pizza size ordered.

SELECT 
    pizzas.size,
    COUNT(orders_details.Order_Details_ID) AS Order_Count
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.Pizza_ID
GROUP BY pizzas.size
ORDER BY ORDER_COUNT DESC;

-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizza_types.name, SUM(orders_details.Quantity) AS Total
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.Pizza_ID = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY Total DESC
LIMIT 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pizza_types.category,
    SUM(orders_details.Quantity) AS Total_Quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.Pizza_ID = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY Total_Quantity DESC;

-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(Order_Time) AS Hour_Of_Day,
    COUNT(Order_ID) AS No_Of_Order
FROM
    orders
GROUP BY Hour_Of_Day
ORDER BY Hour_Of_Day;
 
 -- Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(name) As Total_Type
FROM
    pizza_types
GROUP BY category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(Total_Pizza_Orders), 0) AS AVG_Pizza_Order_Per_Day
FROM
    (SELECT 
        orders.Order_Date,
            SUM(orders_details.Quantity) AS Total_Pizza_Orders
    FROM
        orders
    JOIN orders_details ON orders.Order_ID = orders_details.Order_ID
    GROUP BY Order_Date) AS Order_Quantity;
    
-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pizza_types.name,
    ROUND(SUM(orders_details.Quantity * pizzas.price),0) AS Total_Revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.Pizza_ID = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY Total_Revenue DESC
LIMIT 3;

-- Calculate the percentage contribution of each pizza category type to total revenue.
SELECT 
    pizza_types.category,
    ROUND((SUM(orders_details.quantity * pizzas.price) / 
    (SELECT 
        SUM(orders_details.quantity * pizzas.price)
     FROM 
        orders_details
     JOIN 
        pizzas ON pizzas.pizza_id = orders_details.pizza_id)) * 100, 2) AS Total_Percentage
FROM
    pizza_types
JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY total_percentage DESC;

-- Analyze the cumulative revenue generated over time.

SELECT Order_Date, 
ROUND(SUM(Revenue) OVER (ORDER BY Order_Date),2) AS Cum_Revenue
FROM
(SELECT orders.Order_Date,
SUM(orders_details.Quantity * pizzas.price) AS Revenue
FROM orders JOIN orders_details
ON orders.Order_ID = orders_details.Order_ID
JOIN pizzas
ON pizzas.pizza_id = orders_details.Pizza_ID
GROUP BY orders.Order_Date) AS Sales;