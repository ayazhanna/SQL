select work_email from teacher_1.teacher;
DECLARE
  --email VARCHAR2(100);
  CURSOR c_teachers IS
    SELECT work_email FROM teacher_1.teacher; 
    l_teacher c_teachers%rowtype;
BEGIN
  OPEN c_teachers;
  LOOP
    FETCH c_teachers INTO l_teacher;
    EXIT WHEN c_teachers%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_teacher.work_email);
  END LOOP;
  CLOSE c_teachers;
END;
/