-- perfomance.sql
-- Initial complex query: orders + users + order items + dresses + payments

SELECT o.id AS order_id,
       o.created_at,
       u.id AS user_id, u.username, u.email,
       oi.dress_id, d.name AS dress_name, oi.quantity, oi.price,
       p.amount AS payment_amount, p.status AS payment_status
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN order_items oi ON oi.order_id = o.id
JOIN dresses d ON d.id = oi.dress_id
LEFT JOIN payments p ON p.order_id = o.id
WHERE o.created_at >= '2025-01-01'
ORDER BY o.created_at DESC
LIMIT 100;
