-- !Ups

INSERT INTO "user" (name, email, password, provider_id, provider_key, city, address) VALUES
('John Doe', 'john@example.com', '$2a$10$DaWzqeQqmNJBxPvPH1X9SO.yUr6zy6ETKqXrwqZZqVQz4YkfOgrm.', 'credentials', 'john@example.com', 'New York', '123 Main St'),
('Jane Smith', 'jane@example.com', '$2a$10$DaWzqeQqmNJBxPvPH1X9SO.yUr6zy6ETKqXrwqZZqVQz4YkfOgrm.', 'credentials', 'jane@example.com', 'Los Angeles', '456 Oak Ave'),
('Google User', 'google@example.com', '', 'google', 'google@example.com', 'San Francisco', '789 Google St'),
('Navya', 'N@gmail.com', '12345678', 'google', 'google@example.com', 'San Francisco', '789 Google St');

INSERT INTO "oAuth2Info" (providerId, providerKey, accessToken, tokenType, expiresIn) VALUES
('google', 'google@example.com', 'dummy-access-token-1', 'Bearer', 3600),
('facebook', 'facebook@example.com', 'dummy-access-token-2', 'Bearer', 3600);

INSERT INTO "passwordInfo" (providerId, providerKey, hasher, password, salt) VALUES
('credentials', 'john@example.com', 'bcrypt', '$2a$10$DaWzqeQqmNJBxPvPH1X9SO.yUr6zy6ETKqXrwqZZqVQz4YkfOgrm.', NULL),
('credentials', 'jane@example.com', 'bcrypt', '$2a$10$DaWzqeQqmNJBxPvPH1X9SO.yUr6zy6ETKqXrwqZZqVQz4YkfOgrm.', NULL);

INSERT INTO "category" (name, parent_category_id) VALUES
('Electronics', NULL),
('Computers', 1),
('Laptops', 2),
('Smartphones', 1),
('Clothing', NULL),
('Men''s Wear', 5),
('Women''s Wear', 5);

INSERT INTO "product" (name, description, price, category_id) VALUES
('MacBook Pro', 'Latest Apple laptop', 1299.99, 3),
('Dell XPS', 'Premium Windows laptop', 999.99, 3),
('iPhone 13', 'Apple smartphone', 799.99, 4),
('Samsung S21', 'Android flagship phone', 699.99, 4),
('Men''s T-Shirt', 'Cotton casual t-shirt', 29.99, 6),
('Women''s Dress', 'Summer collection dress', 49.99, 7);

INSERT INTO "cartitem" (user_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1);

INSERT INTO "wishlist" (user_id, name) VALUES
(1, 'Tech Wishlist'),
(2, 'Fashion Wishlist');

INSERT INTO "wishlistitem" (wishlist_id, product_id) VALUES
(1, 1),
(1, 3),
(2, 5),
(2, 6);

INSERT INTO "authtokentable" (user_id) VALUES
(1),
(2);

-- !Downs
DELETE FROM "authtokentable";
DELETE FROM "wishlistitem";
DELETE FROM "wishlist";
DELETE FROM "cartitem";
DELETE FROM "product";
DELETE FROM "category";
DELETE FROM "passwordInfo";
DELETE FROM "oAuth2Info";
DELETE FROM "user";