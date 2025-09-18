# Partition Performance Notes

Why partition:
- Queries that filter by date (e.g., a single year) will scan only the relevant partition.
- This reduces I/O and improves query speed on very large tables.

How to test:
1. Run a date-range query on original orders table and record EXPLAIN ANALYZE.
2. Migrate to partitioned table and run the same query.
3. Compare execution time and I/O.

Caveats:
- Partitioning adds management overhead (new partitions each year).
- Best for very large tables with clear partition keys (dates).
