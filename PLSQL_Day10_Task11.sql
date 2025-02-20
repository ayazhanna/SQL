CREATE OR REPLACE PROCEDURE task_11 AS
BEGIN
  FOR job IN (SELECT job_title FROM jobs_exam)
  LOOP
    DBMS_OUTPUT.PUT_LINE(job.job_title);
    FOR emp IN (SELECT e.first_name, e.last_name, j.job_title, e.salary
                FROM employees_exam e
                JOIN jobs_exam j ON e.job_id = j.job_id
                WHERE j.job_title = job.job_title
                ORDER BY e.salary DESC)
    LOOP
      EXIT WHEN emp.job_title != job.job_title;
      DBMS_OUTPUT.PUT_LINE(emp.first_name || ' ' || emp.last_name || ', ' || emp.job_title || emp.salary);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
  END LOOP;
END;

execute task_11;