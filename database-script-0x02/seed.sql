-- Sample data for Benareyo Bridal Market

INSERT INTO users (username, email, password, role)
VALUES 
('sara', 'sara@example.com', 'hashedpassword', 'customer'),
('designer1', 'designer1@example.com', 'hashedpassword', 'designer');

INSERT INTO designers (name, bio, contact_info)
VALUES 
('Sofia Laurent', 'Specialist in bridal couture.', 'sofia@example.com'),
('Elena Vasquez', 'Known for timeless classics.', 'elena@example.com');

INSERT INTO collections (name, description)
VALUES 
('Spring Elegance', 'Fresh and floral inspired bridal collection'),
('Timeless Classics', 'Elegant dresses for traditional weddings');

INSERT INTO dresses (name, designer_id, collection_id, price, description, size, stock)
VALUES

