DECLARE
  v_first_name VARCHAR(50);
BEGIN
  SELECT first_name INTO v_first_name 
  FROM teacher_1.student 
  WHERE student_id = 9999;
  DBMS_OUTPUT.PUT_LINE(v_first_name);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE(' no data found for student with ID 9999');
END;
