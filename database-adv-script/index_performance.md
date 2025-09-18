# Index Performance Notes

Steps to measure index impact:
1. Run a slow query before indexing:
   EXPLAIN ANALYZE SELECT * FROM orders WHERE created_at BETWEEN '2025-01-01' AND '2025-12-31';

2. Create indexes (see database_index.sql).

3. Run the same query after indexing:
   EXPLAIN ANALYZE SELECT * FROM orders WHERE created_at BETWEEN '2025-01-01' AND '2025-12-31';

4. Compare the execution times and cost estimates in EXPLAIN output.

Notes:
- Indexes speed up reads but can slow down writes (INSERT/UPDATE).
- Only add indexes on columns used frequently in WHERE, JOIN, ORDER BY.
