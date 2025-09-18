# Normalization Steps (3NF)

We applied normalization to ensure the database design avoids redundancy and maintains data integrity.

## 1NF (First Normal Form)
- All tables have atomic values (no repeating groups or multi-valued attributes).
- Example: Instead of storing multiple dresses in one field, we have a `dresses` table where each row represents one dress.

## 2NF (Second Normal Form)
- All non-key attributes depend on the full primary key.
- Example: In `order_items`, quantity and price depend on the combination of `order_id` and `dress_id`, not partially on one.

## 3NF (Third Normal Form)
- No transitive dependencies (non-key attributes depending on other non-key attributes).
- Example: Designer information is stored in `designers` and not repeated in `dresses`.
- Collection details are stored in `collections` instead of repeating for each dress.

## Conclusion
Our schema is normalized to **3NF**:
- Reduced redundancy
- Maintains data consistency
- Easier to scale and maintain
