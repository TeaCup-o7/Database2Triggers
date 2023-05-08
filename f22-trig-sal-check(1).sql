--before
--1d check to make sure that a new employee receives a salary that is somewhere between the minimum and maximum salary of all employees with that job type
--2d check to see that the new employee is assigned to one of the jobs held by at least one of the existing employees
--3d that the name of the new employee and the job are entered into the database in uppercase
--4 Should an attempt be made to insert a salary that is outside the range of all employees with a particular job, 
--an appropriate error message should be displayed using the raise_application_error procedure.
--should an attempt be made to insert an invalid job type, an error message should be displayed using the raise_application_error procedure.

create or replace trigger salary_check
before insert on emp for each row
declare
minsal number;
maxsal number;
salary_out_of_range exception;
no_data_found1 exception;
begin
begin
if inserting then
    :new.ename := upper(:new.ename);
    :new.job := upper(:new.job);
    select min(sal), max(sal) into minsal, maxsal from emp where job = upper(:new.job);
    if minsal is null then
        raise no_data_found1;      -- indicates that the job does not exist
    elsif minsal > :new.sal or maxsal < :new.sal then
        raise salary_out_of_range; -- salary below/above min/max
  end if;
end if;
end;
exception
    WHEN salary_out_of_range THEN
        raise_application_error(-20002, 'Salary out of range.');
    WHEN no_data_found1 THEN
        raise_application_error(-20001, 'Job ' || :new.job || ' does not exist. We cant have that!');
end;
/

create or replace trigger emp_log
after insert or update or delete on emp for each row
declare
operation varchar2(20);
message varchar2(256);
time date := to_char(sysdate);
begin
if inserting then
    operation := 'insert';
    message := operation || ' a row for ' || :new.ename;
    insert into log_table values (:new.empno, operation, message, time);
elsif updating then
    operation := 'update';
    message := operation || ' a row for ' || :new.ename;
    insert into log_table values (:new.empno, operation, message, time);
elsif deleteing then
    operation := 'delete';
    message := operation || ' a row for ' || :new.ename;
    insert into log_table values (:new.empno, operation, message, time);
end if;
end;
/

select * from log_table;

--The After Insert Trigger on the Emp Table
--The purpose of this trigger is to insert a row into the log_table that records the insertion 
--of row in the emp table for an insert statement that satisfies 
--(a) the requirements of the before insert trigger on the emp table
--(b) the declarative constraints established when the emp table was created.  
--For example, see the row for ELLA (empno 8000) in the log_table shown on page 5. 
--Note that ELLA’s name is in uppercase in both the emp table (see page 5) and in the log_table (see page 5).  
--This trigger is going to be somewhat similar to the some of the triggers we talked about in class on Tuesday.  

