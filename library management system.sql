-- Create Authors Table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Biography TEXT
);

-- Create Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublishedYear INT,
    CopiesAvailable INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Members Table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MembershipDate DATE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Create Loans Table
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Create Categories Table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

-- Create BookCategories Table for M-M relationship
CREATE TABLE BookCategories (
    BookID INT,
    CategoryID INT,
    PRIMARY KEY (BookID, CategoryID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);


-- Inserting Sample Data into Authors
INSERT INTO Authors (FirstName, LastName, Biography) VALUES
('Robert', 'Glover', 'English novelist and essayist, journalist and critic.'),
('Robert', 'Greene', 'English novelist who rose to fame with his 1998 debut book, The 48 Laws of Power, which became a bestseller .');

-- Inserting Sample Data into Categories
INSERT INTO Categories (CategoryName) VALUES
('psychology'),
('self-development'),
('Science Fiction');

-- Inserting Sample Data into Books
INSERT INTO Books (Title, AuthorID, ISBN, PublishedYear, CopiesAvailable) VALUES
('No more mr nice guy', 1, '1234567890123', 2000, 5),
('48 laws of power', 2, '1234567890124', 1998, 3);

-- Inserting Sample Data into Members
INSERT INTO Members (FirstName, LastName, MembershipDate, Email) VALUES
('John', 'Muthoni', '2023-01-15', 'john565@gmail.com'),
('Hellen', 'Muraya', '2023-02-20', 'murayah72@gmail.com');

-- Inserting Sample Data into Loans
INSERT INTO Loans (MemberID, BookID, LoanDate, ReturnDate) VALUES
(1, 1, '2023-10-01', NULL),
(2, 2, '2023-10-02', '2023-10-08');

-- Inserting Sample Data into BookCategories
INSERT INTO BookCategories (BookID, CategoryID) VALUES
(1, 1),
(2, 1),
(2, 2);