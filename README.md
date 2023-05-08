# Database2Triggers
The goal of this project is creation of before and after triggers to handle insert of data and proccesses such as:

1) Check to make sure that a new employee receives a salary that is somewhere between the minimum and maximum salary of all employees with that job type.
2) Check to see that the new employee is assigned to one of the jobs held by at least one of the existing employees.
3) That the name of the new employee and the job are entered into the database in uppercase.
4) Insert a row into the log_table that records the insertion of row in the emp table.
5) Requirements of the before insert trigger on the emp table.
6) Declarative constraints established when the emp table was created.
