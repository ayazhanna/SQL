/*
Create procedure that fills job history with data from hire period till today for all employees, jobs should have unique salary and/or job title.
Job history should have from 1 to 5 entries per employee.
*/
CREATE OR REPLACE PROCEDURE task_7
IS
  v_start_date DATE;
  v_end_date DATE := SYSDATE;
  v_job_id NUMBER;
  v_job_title VARCHAR2(50);
  v_salary NUMBER;
BEGIN
  FOR emp IN (SELECT id, hire_date FROM employees_exam)
  LOOP
    v_start_date := emp.hire_date;
    
    FOR i IN 1..DBMS_RANDOM.VALUE(1, 5)
    LOOP
      SELECT job_id, job_title, salary
      INTO v_job_id, v_job_title, v_salary
      FROM jobs_exam
      WHERE employee_id = emp.id
        AND job_id NOT IN (SELECT job_id FROM history_exam WHERE id = emp.id)
        AND job_title NOT IN (SELECT job_title FROM history_exam WHERE id = emp.id)
        AND salary NOT IN (SELECT salary FROM history_exam WHERE id = emp.id)
      ORDER BY DBMS_RANDOM.VALUE;
      
      INSERT INTO history_exam (history_id, id, start_day, end_day, job_id, job_title, salary)
VALUES (history_exam_seq.NEXTVAL, emp.id, v_start_date, v_end_date, v_job_id, v_job_title, v_salary);

      
      v_start_date := ADD_MONTHS(v_start_date, 12);
      EXIT WHEN v_start_date >= v_end_date;
    END LOOP;
  END LOOP;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Job history data inserted into history_exam table.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/

drop procedure task_7;
execute task_7;

select* from history_exam;
