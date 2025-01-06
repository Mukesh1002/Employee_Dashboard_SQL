---------------------------------------------------------
-------------BOOK INSERT TRIGGER-------------------------
---------------------------------------------------------

create trigger BookInsertTrigger on Books
after insert
as
 declare @category int,@publisher int,@author int

 begin

 set @category=(select bookcategory from inserted)
 set @publisher=(select bookpublisher from inserted)
 set @author=(select bookauthor from inserted)
 

 update categories set totalbooksincategory=isnull(totalbooksincategory,0)+1 where categoryid=@category
 update publishers set totalbooksofpublisher=isnull(totalbooksofpublisher,0)+1 where publisherid=@publisher
 update authors set totalbooksofauthor=isnull(totalbooksofauthor,0)+1 where authorid=@author

 end


---------------------------------------------------------
-------------BOOK DELETE TRIGGER-------------------------
---------------------------------------------------------


create trigger BookDeleteTrigger on books
after delete
as
 declare @category int,@publisher int,@author int

 begin

 set @category=(select bookcategory from deleted)
 set @publisher=(select bookpublisher from deleted)
 set @author=(select bookauthor from deleted)
 

 update categories set totalbooksincategory=isnull(totalbooksincategory,0)-1 where categoryid=@category
 update publishers set totalbooksofpublisher=isnull(totalbooksofpublisher,0)-1 where publisherid=@publisher
 update authors set totalbooksofauthor=isnull(totalbooksofauthor,0)-1 where authorid=@author

 end

 select * from categories
 select * from publishers
 select * from authors
 select * from books






---------------------------------------------------------
-------------BOOK TRANSACTION INSERT TRIGGER-------------------------
---------------------------------------------------------

 create trigger BookTransactionInsertTrigger on BookTransaction
 after insert
 as
 declare @bookbalId int,@transactin_id int
 begin
 set @bookbalId=(select bookid from inserted)
 update books set bookbalance=bookbalance-1 where bookid=@bookbalId

 set @transactin_id=(select TransactionId from inserted);
 print @transactin_id
 print 'Is Your Transaction Id '
 
 end;

 execute IssueBook 121, 1002, 51, '2018-05-20', '2018-05-30', NULL, NULL;

 select * from books

---------------------------------------------------------
-------------BOOK TRANSACTION UPDATE TRIGGER-------------------------
---------------------------------------------------------

 create trigger BookTransactionUpdateTrigger on BookTransaction
 after update
 as
 declare @bookbal int,@bookreturn date,@bookactualretrun date,@datedif int,@booktransID int
  begin
  set @bookbal=(select bookid from inserted)
  update books set bookbalance=bookbalance+1 where bookid=@bookbal
  
  set @bookactualretrun=(select ActualReturnDate from inserted)

  set @bookreturn =(select ReturnDate from inserted)

  set @datedif=datediff(day,@bookreturn,@bookactualretrun)

  set @booktransID=(select TransactionId from inserted)

  print cast(@datedif as varchar(3))+' day(s) is delayed'

  update BookTransaction set Fine=(10*@datedif) where TransactionId=@booktransID;
  end

--------------------------------------------------------
----BOOK INSERT BY A LIBRARIAN PROCEDURE----------------
---------------------------------------------------------

create PROCEDURE bookAdd 
    @memberId       INT,
    @bookname       VARCHAR(255),
    @bookcategory   INT,
    @bookpublish    INT,
    @bookauthor     INT,
    @bookprice      INT,
    @bookquantity   INT,
    @bookbalance    INT
AS
BEGIN
    DECLARE @count INT;

    BEGIN TRANSACTION;

    SET @count = (SELECT COUNT(MemberId) FROM Members WHERE MemberId = @memberId);

  IF (@count = 1 AND @memberId > 100)
  
	BEGIN
        INSERT INTO books ( bookname, bookcategory, bookpublisher, bookauthor, bookprice, bookquantity, bookbalance)
        VALUES ( @bookname, @bookcategory, @bookpublish, @bookauthor, @bookprice, @bookquantity, @bookbalance);

        PRINT 'Insertion successful';
        COMMIT;
    END
    ELSE
    BEGIN
    PRINT 'Cannot be inserted by a member or customer';
    ROLLBACK;
END
END;




select * from categories
 select * from publishers
 select * from authors
 select * from books

-----------------------------------------------------
-----------BOOK DELETE BY A LIBRARIAN----------------
-----------------------------------------------------
 
create PROCEDURE bookDel
    @memberId       INT,
    @bookname       VARCHAR(255)
AS
BEGIN
    DECLARE @count INT;

    BEGIN TRANSACTION;

    SET @count = (SELECT COUNT(MemberId) FROM Members WHERE MemberId = @memberId);

		IF (@count = 1 AND @memberId > 100)
	BEGIN
        delete from books where bookname=@bookname
        PRINT 'Deletion Successful';
        COMMIT;
    END
    ELSE
    BEGIN
    PRINT 'Cannot be Deleted by a member or customer';
    ROLLBACK;
	END
END;

execute bookDel 121,'The Time Machine'

select * from books
select * from categories
select * from publishers
select * from authors
--------------------------------------------------------
----BOOK TRANSACTION BY A LIBRARIAN PROCEDURE----------------
---------------------------------------------------------

create procedure IssueBook 
@member_id int,
@book_id int,
@bookmember_id int,
@issuedate date,
@returndate date,
@actualreturndate date,
@fine int
as
declare @id int
begin
BEGIN TRANSACTION;

    SET @id = (SELECT COUNT(MemberId) FROM Members WHERE MemberId = @member_id);

  IF (@id = 1 AND @member_id > 100)
  begin
   insert into BookTransaction values
   (@book_id,@bookmember_id,@issuedate,@returndate,@actualreturndate,@fine)
   print 'Transaction Done'
   commit;
   end
  else
	begin
	 print 'Transaction cannot be done by a member '
	 rollback;
	end
  end



--------------------------------------------------------
----BOOK UPDATE TRANSACTION BY A LIBRARIAN PROCEDURE----------------
---------------------------------------------------------

	create procedure ReturnBook
	@transaction_id int,
	@actualreturndate date
	as
	begin try
	begin transaction
	begin

		if ((select actualreturndate from Booktransaction where transactionid=@transaction_id) is  null)
		 begin
		  update BookTransaction set ActualReturnDate=@actualreturndate where TransactionId=@transaction_id;
		  commit;
		 end
	   else
		begin
			print 'Book is already recevied'
			rollback;
		end
	 end ;

	 end try
	begin catch
	  print error_message()
	  end catch

execute IssueBook 121,1001,52,'2019-12-15','2019-12-20',null,null

execute ReturnBook 5053,'2019-12-22'

select * from BookTransaction

select * from books


--------------------------------------------------------------
-------Librarians and Members Insertion by Administrator Procedure------------------
--------------------------------------------------------------

create procedure LibrarianAdd
@adminid int,
@memberid int,
@membername varchar(100),
@memberemail varchar(255),
@memphone bigint,
@memDOJ date
as
begin
begin try

 begin transaction
		 if(exists(select memberid from members where memberid=@adminid) and @adminid>1000)
		 begin
			insert into members values 
			(@memberid,@membername,@memberemail,@memphone,@memDOJ)
			commit;
		 end
		else
		begin
		print 'invalid insertion'
		rollback;
		end
end try
begin catch
print error_message();
end catch
end

execute LibrarianAdd 1213,123,'librarian3','lib3@gmail.com',987654987,'2019-02-6'

select * from members

------------------------------------------------------------------
-----------Categoire add by a Admin Procedure-------------------------------
------------------------------------------------------------------

create procedure CategoiresAdd
@adminid int,
@categoriename varchar(255),
@categoriedescription varchar(255)

as
begin
begin try

 begin transaction
		 if(exists(select memberid from members where memberid=@adminid) and @adminid>1000)
		 begin
			insert into categories 
					(categoryname,categorydescription)
			values  (@categoriename,@categoriedescription)
		commit;
		end

		else
		begin
		print 'inavlid insertion';
		rollback;
		end
end try
begin catch
print error_message();
end catch
end



select * from booktransaction







----------------Indexes-------------------
CREATE NONCLUSTERED INDEX Members_MemberEmailAddress
ON Members (MemberEmailAddress);

CREATE NONCLUSTERED INDEX Books_BookName
ON Books (BookName);


CREATE NONCLUSTERED INDEX Authors_AuthorName
ON Authors (AuthorName);

CREATE NONCLUSTERED INDEX Publishers_PublisherName
ON Publishers (PublisherName);
