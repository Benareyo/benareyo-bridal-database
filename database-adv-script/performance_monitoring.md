# Performance Monitoring

Tools & commands:
- EXPLAIN and EXPLAIN ANALYZE (Postgres) to see query plans and real execution times.
- pg_stat_statements extension (Postgres) for aggregated query stats.
- Monitor slow queries log in database config.

Example:
EXPLAIN ANALYZE SELECT * FROM orders WHERE created_at BETWEEN '2025-01-01' AND '2025-12-31';

Interpretation:
- Look for Seq Scan (sequential scan) vs Index Scan.
- Check "actual time" and "rows" to see if the plan matches data volume.
- Add index or refactor queries based on the findings.
