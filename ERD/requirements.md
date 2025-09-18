# Requirements for Benareyo Bridal Market Backend

## Functional Requirements
- Users can register, login, and manage profiles.
- Designers can add, update, and manage their dresses and collections.
- Users can browse collections and dresses (dresses, jewelry, shoes, suits).
- Users can perform virtual try-on (AR) and save sessions.
- Users can view live and recorded fashion shows.
- Users can add items (dresses, jewelry, etc.) to a cart; cart supports mixed product types.
- Users can checkout to create orders; orders are linked to payments.
- Users can review products and book appointments for fittings.

## Non-Functional Requirements
- Database: PostgreSQL
- API Authentication: JWT (secure, role-based)
- API Documentation: Swagger/OpenAPI
- Performance: Indexing on frequently queried columns (price, designer_id, collection_id)
- Security: Encrypted sensitive data, HTTPS, rate limiting
- Scalability: Design must support concurrent users and many products
- Maintainability: Clean code, modular structure, and clear documentation

## Relationships Summary
- One Designer → Many Dresses
- One Collection → Many Dresses & Fashion Shows
- One User → One Cart
- One Cart → Many Cart Items
- One User → Many Orders
- One Order → Many Order Items
- One User → Many Virtual Try-Ons, Reviews, Appointments
- One Order → One Payment
