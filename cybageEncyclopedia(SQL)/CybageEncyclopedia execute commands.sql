---commands-----------------


execute bookAdd 121,'To Kill a Mockingbird',1,103,20,1250,30,30
execute bookAdd 121,'Harry Potter and the Sorcerer''s Stone',1,102,10,1500,25,25
execute bookAdd 121,'The Great Gatsby',1,101,20,1500,30,30
execute bookAdd 121,'1984',1,105,30,1500,25,25
execute bookAdd 121,'The Catcher in the Rye',1,102,40,1250,30,30
execute bookAdd 121,'The Da Vinci Code',1,104,10,1500,20,20
execute bookAdd 121,'The Hobbit',1,101,50,2000,30,30
execute bookAdd 121,'The Lord of the Rings trilogy',5,102,20,1250,20,20
execute bookAdd 121,'The Hunger Games',5,103,10,1500,25,25
execute bookAdd 121,'The Girl on the Train',5,104,30,2000,30,30
execute bookAdd 121,'Gone Girl',5,102,20,1250,30,30
execute bookAdd 121,'The Fault in Our Stars',5,105,10,1500,25,25
execute bookAdd 122,'Pride and Prejudice',5,104,40,1250,30,30
execute bookAdd 122,'The Road',5,102,30,2000,20,20
execute bookAdd 122,'The Stand',5,101,10,1250,30,30
execute bookAdd 122,'The Girl with All the Gifts',5,105,20,1250,25,25
execute bookAdd 122,'The Handmaid''s Tale',5,102,50,1500,30,30
execute bookAdd 122,'Eleanor Oliphant Is Completely Fine',2,101,10,1250,20,20
execute bookAdd 122,'Educated',2,104,40,2000,30,30
execute bookAdd 122,'Where the Crawdads Sing',2,102,30,1250,25,25
execute bookAdd 122,'Becoming',2,101,10,1500,30,30
execute bookAdd 122,'The Silent Patient',2,104,50,1250,30,30
execute bookAdd 122,'The Night Circus',3,102,20,2000,25,25
execute bookAdd 122,'Sapiens: A Brief History of Humankind',3,103,30,1250,25,25
execute bookAdd 122,'The Subtle Art of Not Giving a F*ck',3,105,20,2000,30,30
execute bookAdd 122,'Atomic Habits',3,102,40,1250,25,25
execute bookAdd 122,'The Immortal Life of Henrietta Lacks',3,104,20,1500,30,30
execute bookAdd 122,'Just Mercy',3,101,30,1250,25,25
execute bookAdd 122,'Born a Crime',3,103,10,2000,30,30
execute bookAdd 122,'Little Fires Everywhere',3,102,20,1250,25,25
execute bookAdd 122,'Crazy Rich Asians',3,105,40,1500,30,30
execute bookAdd 122,'The Goldfinch',3,104,20,2000,20,20
execute bookAdd 122,'The Fault in Our Stars',4,101,30,1250,20,20
execute bookAdd 122,'The Girl with the Dragon Tattoo',4,102,50,1500,30,30
execute bookAdd 122,'The Color Purple',4,101,20,1250,25,25
execute bookAdd 122,'The Kite Runner',4,104,40,1250,25,25
execute bookAdd 122,'The Outsiders',4,105,20,2000,30,30
execute bookAdd 122,'Pride and Prejudice',4,102,10,1250,30,30
execute bookAdd 122,'The Road',4,103,20,1500,25,25
execute bookAdd 121,'The Shack',4,101,50,1250,30,30
execute bookAdd 121,'The Help',4,104,30,2000,20,20
execute bookAdd 121,'The Maze Runner',4,102,20,1250,25,25
execute bookAdd 121,'The Girl with the Dragon Tattoo',4,105,40,2000,30,30
execute bookAdd 121,'The Twilight Saga',4,104,20,2000,30,30
execute bookAdd 121,'The Chronicles of Narnia series',1,101,30,1500,25,25
execute bookAdd 121,'Divergent',1,102,50,1500,30,30
execute bookAdd 121,'The Shining',1,101,20,1250,25,25
execute bookAdd 121,'The Color Purple',1,104,40,1250,25,25
execute bookAdd 121,'The Kite Runner',1,105,20,2000,30,30
execute bookAdd 121,'Pride and Prejudice',1,102,10,1250,30,30
execute bookAdd 121,'The Road',1,103,20,1500,25,25
execute bookAdd 121,'The Stand',1,102,20,1250,25,25
execute bookAdd 121,'The Girl with All the Gifts',1,105,40,1500,30,30
execute bookAdd 121,'The Handmaid''s Tale',1,104,20,2000,20,20
execute bookAdd 121,'Eleanor Oliphant Is Completely Fine',4,101,30,1250,20,20
execute bookAdd 121,'Educated',4,102,50,1500,30,30
execute bookAdd 121,'Where the Crawdads Sing',4,101,20,1250,25,25
execute bookAdd 121,'Becoming',4,104,40,1250,25,25
execute bookAdd 121,'The Silent Patient',4,105,20,2000,30,30
execute bookAdd 121,'The Night Circus',4,102,10,1250,30,30
execute bookAdd 121,'Sapiens: A Brief History of Humankind',4,103,20,1500,25,25
execute bookAdd 121,'The Subtle Art of Not Giving a F*ck',4,102,20,1250,25,25
execute bookAdd 121,'Atomic Habits',4,105,40,1500,30,30
execute bookAdd 121,'The Immortal Life of Henrietta Lacks',4,104,20,2000,20,20
execute bookAdd 121,'Just Mercy',1,101,30,1250,20,20


select * from books

-------------------------------------------------------------------------------------------
execute IssueBook 121, 1002, 51, '2018-05-20', '2018-05-30', NULL, NULL;
execute IssueBook 122, 1005, 54, '2015-08-10', '2015-08-20', NULL, NULL;
execute IssueBook 121, 1008, 53, '2016-03-15', '2016-03-25', NULL, NULL;
execute IssueBook 122, 1012, 52, '2014-07-02', '2014-07-12', NULL, NULL;
execute IssueBook 121, 1018, 55, '2017-09-28', '2017-10-08', NULL, NULL;
execute IssueBook 122, 1025, 51, '2018-11-10', '2018-11-20', NULL, NULL;
execute IssueBook 121, 1030, 52, '2016-06-05', '2016-06-15', NULL, NULL;
execute IssueBook 122, 1035, 55, '2015-02-14', '2015-02-24', NULL, NULL;
execute IssueBook 121, 1042, 54, '2014-09-30', '2014-10-10', NULL, NULL;
execute IssueBook 122, 1055, 51, '2017-01-12', '2017-01-22', NULL, NULL;
execute IssueBook 121, 1060, 53, '2019-04-18', '2019-04-28', NULL, NULL;
execute IssueBook 122, 1004, 55, '2015-12-03', '2015-12-13', NULL, NULL;
execute IssueBook 121, 1007, 52, '2016-08-22', '2016-09-01', NULL, NULL;
execute IssueBook 122, 1011, 51, '2018-02-05', '2018-02-15', NULL, NULL;
execute IssueBook 121, 1016, 54, '2014-10-14', '2014-10-24', NULL, NULL;
execute IssueBook 122, 1022, 53, '2017-06-28', '2017-07-08', NULL, NULL;
execute IssueBook 121, 1031, 55, '2015-03-17', '2015-03-27', NULL, NULL;
execute IssueBook 122, 1038, 54, '2016-11-11', '2016-11-21', NULL, NULL;
execute IssueBook 121, 1044, 53, '2014-05-09', '2014-05-19', NULL, NULL;
execute IssueBook 122, 1051, 51, '2019-07-01', '2019-07-11', NULL, NULL;
execute IssueBook 121, 1058, 54, '2017-12-20', '2017-12-30', NULL, NULL;
execute IssueBook 122, 1063, 52, '2018-09-04', '2018-09-14', NULL, NULL;
execute IssueBook 121, 1003, 51, '2015-01-22', '2015-02-01', NULL, NULL;
execute IssueBook 122, 1006, 53, '2016-04-07', '2016-04-17', NULL, NULL;
execute IssueBook 121, 1009, 55, '2014-06-15', '2014-06-25', NULL, NULL;


-- Return Book with 0 Days Difference
execute ReturnBook 5051, '2018-05-30';
execute ReturnBook 5052, '2015-08-20';
execute ReturnBook 5053, '2016-03-25';
execute ReturnBook 5056, '2018-11-20';
execute ReturnBook 5057, '2016-06-15';
execute ReturnBook 5074, '2016-04-17';
execute ReturnBook 5075, '2014-06-25';

-- Return Book with 1 Day Difference
execute ReturnBook 5054, '2014-07-13';
execute ReturnBook 5058, '2015-02-25';
execute ReturnBook 5064, '2018-02-16';

execute ReturnBook 5071, '2017-12-31';
execute ReturnBook 5074, '2016-04-18';
execute ReturnBook 5075, '2014-06-26';

-- Return Book with 2 Days Difference
execute ReturnBook 5051, '2018-06-04';
execute ReturnBook 5056, '2018-11-27';

execute ReturnBook 5073, '2015-02-12';
execute ReturnBook 5076, '2022-02-01';

-- Return Book with 3 Days Difference
execute ReturnBook 5060, '2017-01-25';
execute ReturnBook 5066, '2017-07-11';
execute ReturnBook 5070, '2019-07-14';
execute ReturnBook 5072, '2018-09-17';

-- Return Book with 4 Days Difference
execute ReturnBook 5053, '2016-03-29';
execute ReturnBook 5055, '2017-10-19';
execute ReturnBook 5059, '2014-10-18';

execute ReturnBook 5071, '2018-01-10';
execute ReturnBook 5073, '2015-02-14';

select * from booktransaction


