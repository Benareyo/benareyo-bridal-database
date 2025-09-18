-- database_index.sql
-- Create indexes on frequently queried columns for Benareyo Bridal

-- Users: index email for fast login lookups
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

-- Orders: index created_at for time-range queries
CREATE INDEX IF NOT EXISTS idx_orders_created_at ON orders(created_at);

-- Order items: index by dress_id for joins/aggregations
CREATE INDEX IF NOT EXISTS idx_order_items_dress ON order_items(dress_id);

-- Dresses: index by collection and designer for filtering
CREATE INDEX IF NOT EXISTS idx_dresses_collection ON dresses(collection_id);
CREATE INDEX IF NOT EXISTS idx_dresses_designer ON dresses(designer_id);

-- Virtual try-ons: index by user and dress
CREATE INDEX IF NOT EXISTS idx_tryons_user ON virtual_tryons(user_id);
CREATE INDEX IF NOT EXISTS idx_tryons_dress ON virtual_tryons(dress_id);
