-- ====================================
-- DATABASE 6: BOOKSTORE
-- ====================================
CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50),
    publication_year INT,
    price DECIMAL(8,2),
    pages INT,
    isbn VARCHAR(20),
    in_stock INT,
    bestseller BOOLEAN
);

INSERT INTO books (title, author, genre, publication_year, price, pages, isbn, in_stock, bestseller) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 14.99, 376, '978-0061120084', 25, true),
('1984', 'George Orwell', 'Dystopian', 1949, 13.99, 328, '978-0452284234', 18, true),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925, 12.99, 180, '978-0743273565', 22, true),
('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Fantasy', 1997, 16.99, 309, '978-0439708180', 30, true),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 13.49, 277, '978-0316769174', 15, false),
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 11.99, 432, '978-0141439518', 20, true),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 15.99, 310, '978-0547928227', 28, true),
('Dune', 'Frank Herbert', 'Science Fiction', 1965, 18.99, 688, '978-0441172719', 12, true),
('The Hunger Games', 'Suzanne Collins', 'Young Adult', 2008, 14.49, 374, '978-0439023528', 35, true),
('Sapiens', 'Yuval Noah Harari', 'Non-fiction', 2011, 19.99, 443, '978-0062316097', 8, true);