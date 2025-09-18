-- partitioning.sql (PostgreSQL example)
-- Create a partitioned orders table by year (requires Postgres 10+)

-- 1) Create master partitioned table (if starting new)
CREATE TABLE IF NOT EXISTS orders_partitioned (
  id SERIAL PRIMARY KEY,
  user_id INT,
  total_amount NUMERIC(12,2),
  status VARCHAR(50),
  created_at TIMESTAMPTZ NOT NULL
) PARTITION BY RANGE (created_at);

-- 2) Create year partitions (examples)
CREATE TABLE IF NOT EXISTS orders_2024 PARTITION OF orders_partitioned
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE IF NOT EXISTS orders_2025 PARTITION OF orders_partitioned
  FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Note: to migrate existing data, copy/insert from orders into orders_partitioned, then drop original table.
