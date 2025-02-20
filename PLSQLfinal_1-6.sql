--1)Create table that stores jobs with values job title, min salary, max salary.
CREATE TABLE jobs_exam (
  job_title VARCHAR2(50),
  min_salary NUMBER,
  max_salary NUMBER
);


ALTER TABLE jobs_exam
ADD job_id NUMBER PRIMARY KEY;

--2)Create table that stores employees with first and last name, hire date, email, job id and salary.
CREATE TABLE employees_exam (
  id NUMBER,
  first_name VARCHAR2(50),
  last__name VARCHAR2(50),
  hire_date DATE,
  email VARCHAR(50),
  salary NUMBER,
  job_id NUMBER,
  CONSTRAINT pk_employees_exam PRIMARY KEY (id),
  CONSTRAINT fk_job_id_employees_exam
  FOREIGN KEY (job_id) REFERENCES jobs_exam (job_id),
  CONSTRAINT uk_salary UNIQUE (salary)
);

--3)Create table that stores job history with employee id, start and end date, job id and salary.
CREATE TABLE history_exam(
history_id NUMBER,
id NUMBER,
start_day DATE,
end_day DATE,
job_id NUMBER,
salary NUMBER,
CONSTRAINT pk_history_exam PRIMARY KEY (history_id),

CONSTRAINT fk_id_history_exam FOREIGN KEY (id) REFERENCES employees_exam (id),

CONSTRAINT fk_salary_history_exam FOREIGN KEY (salary) REFERENCES employees_exam (salary),

CONSTRAINT fk_job_id_history_exam FOREIGN KEY (job_id) REFERENCES jobs_exam (job_id)
);

--4)Create package for exam work.

CREATE OR REPLACE PACKAGE exam_work AS
  PROCEDURE add_job(p_job_title VARCHAR2,
  p_min_salary NUMBER,
  p_max_salary NUMBER
  );
  
  FUNCTION get_job(
    p_id NUMBER
  ) RETURN jobs_exam%ROWTYPE;
  
  PROCEDURE delete_job(
    p_id NUMBER
  );

END exam_work;
/


--5)Create procedure that generates at least 5 unique rows in jobs table.
CREATE OR REPLACE PROCEDURE task_5_1
IS
  TYPE job_array IS VARRAY(10) OF VARCHAR2(100);
  v_job_titles job_array;
  v_min_salaries job_array;
  v_max_salaries job_array;
  v_id_id job_array;
BEGIN
  v_job_titles := job_array('Manager', 'Developer', 'Designer', 'Accountant', 'Salesperson', 'Engineer');
  v_min_salaries := job_array(5000, 4000, 3000, 2000, 2500, 3500);
  v_max_salaries := job_array(10000, 8000, 7000, 5000, 6000, 9000);
  v_id_id:= job_array(1,2,3,4,5);
  
  FOR i IN 1..5 LOOP
    INSERT INTO jobs_exam (job_id, job_title, min_salary, max_salary) 
    VALUES (v_id_id(i), v_job_titles(i), v_min_salaries(i), v_max_salaries(i));
  END LOOP;
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('5 jobs inserted into jobs_exam table.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/

EXECUTE task_5_1;

select* from jobs_exam;

--6)Create procedure that generates at least 10 unique rows in employees with different jobs and random salaries within given job range and hire date from 5 to 10 years ago.
CREATE OR REPLACE PROCEDURE task_6_2
IS
  TYPE job_array IS VARRAY(10) OF VARCHAR2(100);
  v_job_titles job_array;
  v_min_salaries job_array;
  v_max_salaries job_array;
   v_id_id job_array;
  v_random_salary NUMBER;
  v_job_id NUMBER;
  v_employee_id NUMBER := 1;
BEGIN
  v_job_titles := job_array('Manager', 'Developer', 'Designer', 'Accountant', 'Salesperson', 'Engineer');
  v_min_salaries := job_array(5000, 4000, 3000, 2000, 2500, 3500);
  v_max_salaries := job_array(10000, 8000, 7000, 5000, 6000, 9000);
   v_id_id := job_array(1,2,3,4,5,6);
  
  FOR i IN 1..10 LOOP
    v_job_id := v_id_id(DBMS_RANDOM.VALUE(1, v_id_id.COUNT));
    v_random_salary := TRUNC(DBMS_RANDOM.VALUE(v_min_salaries(v_job_id), v_max_salaries(v_job_id)));
    INSERT INTO employees_exam (id, first_name, last_name, hire_date, email, salary, job_id) 
    VALUES (v_employee_id, 'Employee '||v_employee_id, 'Lastname '||v_employee_id, ADD_MONTHS(SYSDATE, -TRUNC(DBMS_RANDOM.VALUE(60, 121))), 'email'||v_employee_id||'@company.com', v_random_salary, v_job_id);
    v_employee_id := v_employee_id + 1;
  END LOOP;
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('10 employees inserted into employees_exam table.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/

execute task_6_2;



