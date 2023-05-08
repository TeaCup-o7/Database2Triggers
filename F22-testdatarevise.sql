insert into emp values (8000, 'ella', 'salesman', 7698, '12-dec-98', 1300, 0, 30);
insert into emp values (8001, 'parker', 'analyst', 7566, '01-jun-99', 2400, 0, 20);
insert into emp values (8002, 'elaina', 'analyst', 7566, '12-jul-96', 3000, 0, 20);
insert into emp values (8003, 'ethan', 'analyst', 7566, '24-nov-07', 3000, 0, 50); --? parent key not found -- department 50 doesn't exist
insert into emp values (8004, 'jake', 'clerk', 7839, '16-mar-06', 1100, 0, 10);
insert into emp values (8005, 'luke', 'clerk', 7839, '20-apr-03', 2000, 0, 10);
insert into emp values (8006, 'raymond', 'director', 7839, '11-oct-07', 2500, 0, 10); --? unhandled exception -- job doesn't exist
insert into emp values (8007, 'ava', 'clerk', 7698, '04-aug-04', 500, 1000, 30);
insert into emp values (8000, 'ella', 'salesman', 7698, '12-dec-98', 1300, 0, 30); --? unique constraint violation id 8000 already exists
-- update emp set sal = 3500 where empno = 8000;
-- update emp set job = 'salesperson' where job = upper('salesman');
insert into emp values (7566, 'ashton', 'manager', 7839, '22-oct-09', 2700, 0, 10); --? unique constraint violated
insert into emp values (8008, 'aiden', 'accountant', 7839, '15-nov-10', 2300, 0, 10);
insert into emp values (8009, '', 'analyst', 7566, '17-nov-09', 3000, 0, 20); -- we need an employee name this doesn't work
insert into emp values (8010, 'callie', 'salesman', 7698, '02-jan-11', 1400, 0, 30);  
select * from emp;
select * from log_table;
select * from dept;
