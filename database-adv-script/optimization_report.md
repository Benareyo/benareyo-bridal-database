# Optimization Report

1) Run EXPLAIN ANALYZE on perfomance.sql to get the query plan and execution time.
2) Look for expensive operations: sequential scans, large sorts, nested loops.
3) Possible optimizations:
   - Add indexes on join/filter columns (users.email, orders.created_at, order_items.order_id, order_items.dress_id).
   - Limit SELECT to only needed columns (avoid SELECT *).
   - Use pagination (LIMIT/OFFSET) for large result sets.
4) After changes, re-run EXPLAIN ANALYZE and record improvements (time, cost).
5) Document before/after results here (copy the EXPLAIN output snippets and explain).
