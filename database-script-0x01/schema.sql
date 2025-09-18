-- Schema for Benareyo Bridal Market

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);

CREATE TABLE designers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT,
    contact_info VARCHAR(150)
);

CREATE TABLE collections (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE dresses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    designer_id INT REFERENCES designers(id),
    collection_id INT REFERENCES collections(id),
    price DECIMAL(10,2),
    description TEXT,
    size VARCHAR(20),
    stock INT DEFAULT 0
);

CREATE TABLE fashion_shows (
    id SERIAL PRIMARY KEY,
    collection_id INT REFERENCES collections(id),
    title VARCHAR(100) NOT NULL,
    designer_id INT REFERENCES designers(id),
    scheduled_at TIMESTAMP
);

CREATE TABLE virtual_tryons (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    dress_id INT REFERENCES dresses(id),
    photo_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE carts (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(id),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    cart_id INT REFERENCES carts(id),
    dress_id INT REFERENCES dresses(id),
    quantity INT DEFAULT 1
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    dress_id INT REFERENCES dresses(id),
    quantity INT,
    price DECIMAL(10,2)
);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    dress_id INT REFERENCES dresses(id),
    rating INT,
    comment TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    dress_id INT REFERENCES dresses(id),
    date_time TIMESTAMP,
    status VARCHAR(20)
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT UNIQUE REFERENCES orders(id),
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
