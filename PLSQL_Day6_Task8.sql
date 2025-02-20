--Create anonymous block that would trigger too_many_rows error with proper exception handling.
DECLARE
  v_student_name teacher_1.user_info.first_name%TYPE;
  l_user_id teacher_1.user_info.user_id%type:=10;
BEGIN
  SELECT first_name INTO v_student_name
  FROM teacher_1.student 
  WHERE student_id <l_user_id; 

  DBMS_OUTPUT.PUT_LINE('Student name: ' || v_student_name);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No data found for the given condition');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Too many rows returned');
END;

