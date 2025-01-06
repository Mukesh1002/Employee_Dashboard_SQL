alter VIEW BooksIssuedView AS
SELECT TransactionId, BookId, MemberId, IssueDate, ReturnDate, ActualReturnDate
FROM BookTransaction;

-- OverdueBooksView
alter VIEW OverdueBooksView AS
SELECT TransactionId, BookId, MemberId, IssueDate, ReturnDate, ActualReturnDate
FROM BookTransaction
WHERE ActualReturnDate IS NULL;

-- MemberTransactionHistoryView
alter VIEW MemberTransactionHistoryView AS
SELECT TransactionId, BookId, IssueDate, ReturnDate, ActualReturnDate, Fine
FROM BookTransaction;

-- CategoryStatisticsView
alter VIEW CategoryStatisticsView AS
SELECT c.CategoryId, c.CategoryName, c.TotalBooksInCategory,b.bookname, ( b.BookBalance) AS AvailableBooks
FROM Categories c
JOIN Books b ON c.CategoryId = b.BookCategory;

-- PublisherStatisticsView
alter VIEW PublisherStatisticsView AS
SELECT p.PublisherId, p.PublisherName, p.TotalBooksOfPublisher,b.bookname, ( b.BookBalance) AS AvailableBooks
FROM Publishers p
JOIN Books b ON p.PublisherId = b.BookPublisher;

-- AuthorStatisticsView
alter VIEW AuthorStatisticsView AS
SELECT a.AuthorId, a.AuthorName, a.TotalBooksOfAuthor,b.bookname, ( b.BookBalance) AS AvailableBooks
FROM Authors a
JOIN Books b ON a.AuthorId = b.BookAuthor


SELECT * FROM BooksIssuedView;
SELECT * FROM OverdueBooksView;
SELECT * FROM MemberTransactionHistoryView;
SELECT * FROM CategoryStatisticsView;
SELECT * FROM PublisherStatisticsView;
SELECT * FROM AuthorStatisticsView;
