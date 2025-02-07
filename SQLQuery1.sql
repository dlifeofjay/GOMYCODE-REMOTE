create database Library_management_studio;

Use Library_management_studio;

Create Table Books (
id INT Primary key,
Name varchar (50) not null,
ISBN varchar (20),
Genre varchar (10));

Create Table Members (
id INT Primary key,
name varchar (50) not null
);

create Table Loans (
id int primary key,
book_id int not null,
member_id int not null,
date_of_borrow varchar (10),
date_of_return varchar (10)

Foreign key (book_id) References Books(id),
Foreign key (member_id) References Members(id));

insert into BOOKS (id, name, ISBN, genre)
Values
(1, 'python basics', '123-rty-iop', 'prog'),
(2, 'data science 101', '890-poi-ytr', 'tech'),
(3, 'database System', '678-789-ert', 'tech');

insert into MEMBERS (id, name)
Values
(1, 'dlifeof-jay'),
(2, 'just-jay'),
(3, 'the-reply-guy');

insert into Loans (id, book_id, member_id, date_of_borrow, date_of_return)
Values
(1, 1, 1, '1-2-2025', '5-5-2025'),
(2, 2, 2, '4-6-2024', '9-11-2025'),
(3, 3, 3, '3-5-2025', '7-8-2025');



select name from Books

--count the number of books by genre
select genre, count(*) AS number_of_books
from books
group by genre;

--find members who have not  returned books
select M.Name, B.name, l.date_of_borrow
from loans l
join members M on l.member_id = m.id
join books B on l.book_id = b.id
where l.date_of_return is null;

--list all books borrowed after a specific date
select M.Name, B.name, l.date_of_borrow
from loans l
join members M on l.member_id = m.id
join books B on l.book_id = b.id
where l.date_of_borrow < '4-6-2024';

--update data (e.g. book return)
update loans
set date_of_return = '4-6-2024'
where id = 3;

select * from loans