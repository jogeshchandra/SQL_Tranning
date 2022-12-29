SELECT * FROM sql_day1.employee;
use sql_day1;
#1) select the Employee with the top three salaries
select name,salary from employee order by salary desc limit 3;
+----------------+--------+
| name           | salary |
+----------------+--------+
| TARA  CUMMINGS |  99475 |
| PAUL VINCENT   |  94791 |
| ADAM WAYNE     |  94324 |
+----------------+--------+
3 rows in set (0.00 sec)

2)select the employee with the least salary

mysql> select name,salary from employee order by salary limit 1;
+-------------+--------+
| name        | salary |
+-------------+--------+
| JOHN HELLEN |  15380 |
+-------------+--------+
1 row in set (0.00 sec)

3)select the employee who does not have a manager in the deptartment table
mysql>  select * from employee e left join dept d on e.dep_id=d.dept_id where dep_manager=null;
Empty set (0.00 sec)

4)select the employee who is also a manager

mysql>  select e.e_id,e.name,d.dept_id,d.dep_manager from employee e left join dept d on e.dep_id=d.dept_id where e.name=d.dep_manager;
+-------+-----------------+---------+-----------------+
| e_id  | name            | dept_id | dep_manager     |
+-------+-----------------+---------+-----------------+
| A178  | BRUCE WILLS     | D03     | BRUCE WILLS     |
| A120  | TIM ARCHER      | D01     | TIM ARCHER      |
| A187  | ADAM JUSTIN     | D02     | ADAM JUSTIN     |
| A 187 | ROBERT SWIFT    | D04     | ROBERT SWIFT    |
| A165  | NATASHA STEVENS | D05     | NATASHA STEVENS |
+-------+-----------------+---------+-----------------+
5 rows in set (0.00 sec)

5)select the employee who is a manager and has least salary

mysql>  select * from employee e left join dept d on e.dep_id=d.dept_id where e.name=d.dep_manager order by e.salary limit 1;
+-------+--------------+--------+--------+------------+---------+-----------+--------------+
| E_ID  | NAME         | DEP_ID | SALARY | MANAGER_ID | DEPT_ID | DEP_NAME  | DEP_MANAGER  |
+-------+--------------+--------+--------+------------+---------+-----------+--------------+
| A 187 | ROBERT SWIFT | D04    |  27700 | A298       | D04     | INSURANCE | ROBERT SWIFT |
+-------+--------------+--------+--------+------------+---------+-----------+--------------+
1 row in set (0.00 sec)

6)select the total number of employee in communications dept

mysql> select count(e.e_id) from employee e left join dept d on e.dep_id=d.dept_id where d.dep_name='COMMUNICATION';
+---------------+
| count(e.e_id) |
+---------------+
|             6 |
+---------------+
1 row in set (0.01 sec)

7)SELECT the employee in finance department who has the least salary
mysql> select * from employee e left join dept d on e.dep_id=d.dept_id where d.dep_name='FINANCE' ORDER BY e.salary desc limit 1;
+------+------------+--------+--------+------------+---------+----------+-----------------+
| E_ID | NAME       | DEP_ID | SALARY | MANAGER_ID | DEPT_ID | DEP_NAME | DEP_MANAGER     |
+------+------------+--------+--------+------------+---------+----------+-----------------+
| A128 | ADAM WAYNE | D05    |  94324 | A165       | D05     | FINANCE  | NATASHA STEVENS |
+------+------------+--------+--------+------------+---------+----------+-----------------+
1 row in set (0.00 sec)

8)select the employye in producct dept who has the least salary
mysql> select * from employee e left join dept d on e.dep_id=d.dept_id where d.dep_name='PRODUCT' ORDER BY e.salary limit 1;
+------+-------------+--------+--------+------------+---------+----------+-------------+
| E_ID | NAME        | DEP_ID | SALARY | MANAGER_ID | DEPT_ID | DEP_NAME | DEP_MANAGER |
+------+-------------+--------+--------+------------+---------+----------+-------------+
| A156 | NICK MARTIN | D03    |  50174 | A178       | D03     | PRODUCT  | BRUCE WILLS |
+------+-------------+--------+--------+------------+---------+----------+-------------+
1 row in set (0.00 sec)

9)select the count of emp in health with max salary










10) select the employee who report to natasha stevens

mysql> select * from employee e left join dept d on e.dep_id=d.dept_id where d.dep_manager='NATASHA STEVENS';
+------+-----------------+--------+--------+------------+---------+----------+-----------------+
| E_ID | NAME            | DEP_ID | SALARY | MANAGER_ID | DEPT_ID | DEP_NAME | DEP_MANAGER     |
+------+-----------------+--------+--------+------------+---------+----------+-----------------+
| A128 | ADAM WAYNE      | D05    |  94324 | A165       | D05     | FINANCE  | NATASHA STEVENS |
| A129 | JOSEPH ANGELIN  | D05    |  44280 | A165       | D05     | FINANCE  | NATASHA STEVENS |
| A165 | NATASHA STEVENS | D05    |  31377 | A298       | D05     | FINANCE  | NATASHA STEVENS |
+------+-----------------+--------+--------+------------+---------+----------+-----------------+
3 rows in set (0.00 sec)

============================================================================================================================================

11)display the employee name,employee count,dep name, dep manager in health depatment

mysql> select e.name,d.dep_name,d.dep_manager,COUNT(e.e_id) from employee e left join dept d on e.dep_id=d.dept_id where d.dep_name='HEALTH' group by e.name,d.dep_name,d.dep_manager;
+----------------+----------+-------------+---------------+
| name           | dep_name | dep_manager | COUNT(e.e_id) |
+----------------+----------+-------------+---------------+
| MARTIN TREDEAU | HEALTH   | TIM ARCHER  |             1 |
| PAUL VINCENT   | HEALTH   | TIM ARCHER  |             1 |
| TIM ARCHER     | HEALTH   | TIM ARCHER  |             1 |
| BRAD MICHAE L  | HEALTH   | TIM ARCHER  |             1 |
| EDWARD CANE    | HEALTH   | TIM ARCHER  |             1 |
| JOHN HELLEN    | HEALTH   | TIM ARCHER  |             1 |
+----------------+----------+-------------+---------------+
6 rows in set (0.00 sec)

============================================================================================================================================

12)display the department id,emp id and manager id for the communication dept/?

mysql> select d.dept_id,e.e_id,e.manager_id from employee e left join dept d on e.dep_id=d.dept_id where d.dep_name='COMMUNICATION';
+---------+------+------------+
| dept_id | e_id | manager_id |
+---------+------+------------+
| D02     | A116 | A187       |
| D02     | A198 | A187       |
| D02     | A187 | A298       |
| D02     | A121 | A187       |
| D02     | A194 | A187       |
| D02     | A133 | A187       |
+---------+------+------------+
6 rows in set (0.00 sec)

13) select the avg expenses for each dept with deptid and deptname;

mysql> select d.dept_id,d.dep_name,avg(e.salary) from employee e left join dept d on e.dep_id=d.dept_id group by d.dept_id,d.dep_name;
+---------+---------------+---------------+
| dept_id | dep_name      | avg(e.salary) |
+---------+---------------+---------------+
| D01     | HEALTH        |    54527.6667 |
| D02     | COMMUNICATION |    48271.3333 |
| D03     | PRODUCT       |    58517.5000 |
| D04     | INSURANCE     |    51913.3333 |
| D05     | FINANCE       |    56660.3333 |
+---------+---------------+---------------+
5 rows in set (0.00 sec)

14)select the total expensess for the department finance;

mysql> select sum(e.salary) from employee e left join dept d on e.dep_id=d.dept_id where d.dep_name='FINANCE';
+---------------+
| sum(e.salary) |
+---------------+
|        169981 |
+---------------+
1 row in set (0.00 sec)

15)SELECT the department which spends the least with deptid and dept name;

mysql> select d.dept_id,d.dep_name,sum(e.salary) from employee e left join dept d on e.dep_id=d.dept_id group by  d.dept_id,d.dep_name order by sum(e.salary);
+---------+---------------+---------------+
| dept_id | dep_name      | sum(e.salary) |
+---------+---------------+---------------+
| D03     | PRODUCT       |        117035 |
| D04     | INSURANCE     |        155740 |
| D05     | FINANCE       |        169981 |
| D02     | COMMUNICATION |        289628 |
| D01     | HEALTH        |        327166 |
+---------+---------------+---------------+
5 rows in set (0.01 sec)

mysql> select d.dept_id,d.dep_name,sum(e.salary) from employee e left join dept d on e.dep_id=d.dept_id group by  d.dept_id,d.dep_name order by sum(e.salary) limit 1;
+---------+----------+---------------+
| dept_id | dep_name | sum(e.salary) |
+---------+----------+---------------+
| D03     | PRODUCT  |        117035 |
+---------+----------+---------------+
1 row in set (0.00 sec)

16)select the count of employee in each dept;

mysql> select d.dep_name,count(e.e_id) from employee e left join dept d on e.dep_id=d.dept_id group by d.dep_name;
+---------------+---------------+
| dep_name      | count(e.e_id) |
+---------------+---------------+
| HEALTH        |             6 |
| COMMUNICATION |             6 |
| PRODUCT       |             2 |
| INSURANCE     |             3 |
| FINANCE       |             3 |
+---------------+---------------+
5 rows in set (0.00 sec)

17)select the count of emp in ecah dep having salary <10000;

mysql> select d.dep_name,e.salary,count(e.e_id) from employee e left join dept d on e.dep_id=d.dept_id group by d.dep_name,e.salary having e.salary<10000;
Empty set (0.00 sec)

18)select the count of employee in deptid D04;
mysql> select count(e.e_id) as 'Number of emp' from employee e left join dept d on e.dep_id=d.dept_id where d.dept_id='D04';
+---------------+
| Number of emp |
+---------------+
|             3 |
+---------------+
1 row in set (0.00 sec)

19) select all department details of the dept with maximun employee;	

mysql> select d.dept_id,d.dep_name, d.dep_manager,count(d.dept_id) as emp_count from dept d left join employee e on d.dept_id=e.dep_id group by d.dept_id,d.dep_name, d.dep_manager 
	 order by emp_count desc limit 1;
+---------+----------+-------------+-----------+
| dept_id | dep_name | dep_manager | emp_count |
+---------+----------+-------------+-----------+
| D01     | HEALTH   | TIM ARCHER  |         6 |
+---------+----------+-------------+-----------+
1 row in set (0.00 sec)

20)select the employee who has tim cook as manager;

mysql> select * from employee e left join dept d on e.dep_id=d.dept_id where d.dep_manager='Tim Cook';
Empty set (0.00 sec)






 