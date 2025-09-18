-- aggregations_and_window_functions.sql

-- 1) Aggregation: total orders per user
SELECT u.id AS user_id, u.username, COUNT(o.id) AS total_orders
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.username
ORDER BY total_orders DESC;

-- 2) Window function: rank dresses by number of order_items (popularity)
SELECT dress_id, dress_name, order_count,
       RANK() OVER (ORDER BY order_count DESC) AS dress_rank
FROM (
  SELECT d.id AS dress_id, d.name AS dress_name, COUNT(oi.id) AS order_count
  FROM dresses d
  LEFT JOIN order_items oi ON d.id = oi.dress_id
  GROUP BY d.id, d.name
) t;
