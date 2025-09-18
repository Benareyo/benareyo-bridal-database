-- Example JOIN queries for Benareyo Bridal database

-- INNER JOIN: Get all bookings and the users who made them
SELECT users.name, bookings.booking_id, bookings.date
FROM users
INNER JOIN bookings ON users.id = bookings.user_id;

-- LEFT JOIN: Get all properties and their reviews (even if no reviews exist)
SELECT properties.name, reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

-- FULL OUTER JOIN (if supported): Get all users and all bookings
-- NOTE: MySQL doesn’t support FULL OUTER JOIN directly
SELECT users.name, bookings.booking_id

FROM users
RIGHT JOIN bookings ON users.id = bookings.user_id;
