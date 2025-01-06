--categories table
create table categories (
    categoryid int  constraint categories__categoryid_pk primary key identity(1,1),
    categoryname varchar(100),
    categorydescription varchar(100),
    totalbooksincategory int default 0,  
);


create table publishers (
    publisherid int constraint publishers_publisherid_pk primary key identity(101,1),
    publishername varchar(100),
    publisheraddress varchar(100),
    totalbooksofpublisher int default 0,
);

--authors
create table authors (
    authorid int constraint authors_authorid_pk primary key identity(10,10),
    authorname varchar(100),
    totalbooksofauthor int default 0,
);

create table books (
    bookid int constraint books_bookid_pk primary key identity(1001,1),
    bookname varchar(100),
    bookcategory int foreign key references categories(categoryid),
    bookpublisher int constraint books_bookpublisher_fk foreign key  references publishers(publisherid),
    bookauthor int constraint books_bookauthor_fk foreign key (bookauthor) references authors(authorid),
    bookprice decimal(10,2) constraint books_bookprice_chk check (bookprice>0) not null,
    bookquantity int constraint books_bookquantity_chk check (bookquantity >= 0),
    bookbalance int constraint books_bookbalance check (bookbalance >= 10),    
);


CREATE TABLE Members (
    MemberId INT  CONSTRAINT Members_MemberId_pk PRIMARY KEY,
    MemberName VARCHAR(100),
    MemberEmailAddress VARCHAR(100) UNIQUE,
    MemberPhone bigint,
    MemberDateOfRegistration DATE,
);



CREATE TABLE BookTransaction (
    TransactionId INT CONSTRAINT BookTransaction_TransactionId_pk PRIMARY KEY identity(5051,1),
    BookId INT CONSTRAINT BookTransaction_BookId_fk FOREIGN KEY REFERENCES Books(BookId),
    MemberId INT CONSTRAINT BookTransaction_MemberId_fk FOREIGN KEY (MemberId) REFERENCES Members(MemberId),
    IssueDate DATE,
    ReturnDate DATE,
    ActualReturnDate DATE default null,
    Fine decimal(10,2),  
);


insert into categories 
(categoryname,categorydescription)
values
('sci-fi','science_fiction'),
('rom-com','romance and comedy'),
('drama','dramatic'),
('history','social'),
('archeology','archetectural science')

insert into publishers (publishername,publisheraddress)
values
('ACK publishers','hyd'),
('rolltime_india publishers','mumbai'),
('cengage publishers','pune'),
('cambridge publishers','delhi'),
('penguin publishers','banglore')

insert into authors (authorname)
values
('tejaswini'),
('KumarVarma'),
('Nelsom'),
('sukumar'),
('krish.K')



 insert into Members
 values
(1211,'Adminstrator1','admin1@gmail.com',9874563214,'2021-10-25'),
(1212,'Adminstrator2','admiin2@gmail.com',9638527410,'2002-1-25'),
(121,'Librarrian1','lib1@gmail.com',9874868214,'2001-9-2'),
(122,'Librarrian2','lib2@gmail.com',9874444444,'2000-12-5'),
(51,'Member1','mem1@gmail.com',874564,'2005-10-2'),
(52,'Member2','mem2@gmail.com',745614,'2007-10-5'),
(53,'Member3','mem3@gmail.com',9843214,'2006-10-25'),
(54,'Member4','mem4@gmail.com',98714,'2004-10-2'),
(55,'Member5','mem5@gmail.com',94314,'2008-10-25')


--drop table BookTransaction
--drop table Members
--drop table books
--drop table authors
--drop table categories
--drop table publishers