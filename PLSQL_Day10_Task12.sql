CREATE OR REPLACE PROCEDURE task_12 IS
  total_salary NUMBER(10,2) := 0;
BEGIN
  FOR emp IN (SELECT first_name, last_name, salary
              FROM employees_exam
              WHERE hire_date <= SYSDATE)
  LOOP
    DBMS_OUTPUT.PUT_LINE(emp.first_name || ' ' || emp.last_name || ': ' || emp.salary);
    total_salary := total_salary + emp.salary;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('Total: ' || total_salary);
END;
execute task_12;