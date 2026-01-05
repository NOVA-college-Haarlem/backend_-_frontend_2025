-- ====================================
-- DATABASE 8: BIJOUTERIE (JEWELRY STORE)
-- ====================================
CREATE TABLE jewelry (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    material VARCHAR(50),
    price DECIMAL(8,2),
    stock INT,
    gender VARCHAR(20),
    brand VARCHAR(50),
    karat INT,
    vintage BOOLEAN,
    on_sale BOOLEAN
);

INSERT INTO jewelry (product_name, category, material, price, stock, gender, brand, karat, vintage, on_sale) VALUES
('Classic Gold Wedding Ring', 'Rings', '14k Gold', 450.00, 12, 'Unisex', 'Local Jeweler', 14, false, false),
('Silver Pearl Stud Earrings', 'Earrings', 'Sterling Silver', 85.00, 25, 'Women', 'Pandora', 0, false, true),
('Diamond Engagement Ring', 'Rings', '18k White Gold', 2150.00, 3, 'Women', 'Tiffany & Co', 18, false, false),
('Vintage Butterfly Brooch', 'Brooches', 'Gold Plated', 125.00, 8, 'Women', 'Antique', 0, true, false),
('Men\'s Automatic Watch', 'Watches', 'Stainless Steel', 320.00, 15, 'Men', 'Seiko', 0, false, true),
('Silver Charm Bracelet', 'Bracelets', 'Sterling Silver', 95.00, 18, 'Women', 'Pandora', 0, false, false),
('Gold Figaro Chain', 'Necklaces', '14k Gold', 280.00, 9, 'Men', 'Local Jeweler', 14, false, false),
('Vintage Cufflinks', 'Cufflinks', 'Silver', 75.00, 6, 'Men', 'Antique', 0, true, true),
('Rose Gold Drop Earrings', 'Earrings', '14k Rose Gold', 165.00, 14, 'Women', 'Michael Kors', 14, false, false),
('Modern Titanium Ring', 'Rings', 'Titanium', 120.00, 20, 'Men', 'Modern Design', 0, false, true);
