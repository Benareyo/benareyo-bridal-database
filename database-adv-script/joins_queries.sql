-- joins_queries.sql
-- Bridal theme: list orders, dresses, users, reviews using different joins

-- 1) INNER JOIN: get all orders with the user who made them
SELECT o.id AS order_id, u.id AS user_id, u.username, o.total_amount, o.status, o.created_at
FROM orders o
INNER JOIN users u ON o.user_id = u.id
ORDER BY o.created_at DESC;

-- 2) LEFT JOIN: list all dresses and any reviews (include dresses with no reviews)
SELECT d.id AS dress_id, d.name AS dress_name, r.rating, r.comment
FROM dresses d
LEFT JOIN reviews r ON d.id = r.dress_id
ORDER BY d.name;



-- 3) FULL OUTER JOIN (simulate in Postgres/MySQL via UNION)
-- Show all users and all orders; some users might have no orders and some orders might not match a user.
-- (Postgres supports FULL OUTER JOIN; MySQL can use UNION of left and right joins)
-- Postgres version:
-- SELECT u.id AS user_id, u.username, o.id AS order_id, o.total_amount
-- FROM users u
-- FULL OUTER JOIN orders o ON u.id = o.user_id;

-- MySQL-friendly simulation using UNION:
SELECT u.id AS user_id, u.username, o.id AS order_id, o.total_amount
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
UNION
SELECT u.id AS user_id, u.username, o.id AS order_id, o.total_amount
FROM users u
RIGHT JOIN orders o ON u.id = o.user_id;
