-- subqueries.sql

-- 1) Non-correlated subquery:
-- Find dresses whose average rating > 4.0
SELECT d.id, d.name
FROM dresses d
WHERE (
  SELECT AVG(r.rating)
  FROM reviews r
  WHERE r.dress_id = d.id
) > 4.0;

-- 2) Correlated subquery:
-- Find users who have placed more than 3 orders
SELECT u.id, u.username, u.email
FROM users u
WHERE (
  SELECT COUNT(*) FROM orders o WHERE o.user_id = u.id
) > 3;
