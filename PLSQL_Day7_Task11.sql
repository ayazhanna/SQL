DECLARE
  CURSOR c_students IS 
    SELECT s.first_name || ' ' || s.last_name AS full_name, 
    AVG(sg.test_grade)as avg_grade
    FROM teacher_1.student s
    INNER JOIN teacher_1.student_grade sg ON s.student_id = sg.student_id
    GROUP BY s.first_name, s.last_name;
  l_full_name teacher_1.student.first_name%TYPE;
  l_avg_grade NUMBER(4,2);
BEGIN
  OPEN c_students;
  LOOP
    FETCH c_students INTO l_full_name, l_avg_grade;
    EXIT WHEN c_students%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_full_name || ': ' || l_avg_grade);
  END LOOP;
  CLOSE c_students;
END;
