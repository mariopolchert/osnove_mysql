DROP DATABASE IF EXISTS library;

CREATE DATABASE IF NOT EXISTS library DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;


-- Select the database
USE library;

-- Create genres table
CREATE TABLE IF NOT EXISTS genres (
    genre_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- Create books table
CREATE TABLE IF NOT EXISTS books (
    book_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    isbn VARCHAR(50) NOT NULL UNIQUE, -- Ensure isbn is unique and indexed
    publisher VARCHAR(100) NOT NULL,
    year CHAR(4) NOT NULL,
    quantity CHAR(14) NOT NULL,
    genre_id INT UNSIGNED,
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
) ENGINE=InnoDB;

-- Create bookCopy table
CREATE TABLE IF NOT EXISTS bookCopy (
    BookCopy_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    book_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
) ENGINE=InnoDB;

-- Create members table
CREATE TABLE IF NOT EXISTS members (
    member_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    MemberCardNumber CHAR(14) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    phone VARCHAR(12),
    email VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Create borrows table
CREATE TABLE IF NOT EXISTS borrows (
    borrow_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    borrow_date DATE NOT NULL,
    return_date DATE NOT NULL,
    fine DECIMAL(10,2) NOT NULL,
    BookCopy_id INT UNSIGNED,
    MemberCardNumber CHAR(14),
    FOREIGN KEY (BookCopy_id) REFERENCES bookCopy(BookCopy_id),
    FOREIGN KEY (MemberCardNumber) REFERENCES members(MemberCardNumber)
) ENGINE=InnoDB;
