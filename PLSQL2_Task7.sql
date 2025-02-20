--Create anonymous block that would print for each student - name, surname, max, min and average grade across all courses.
DECLARE
  CURSOR c_students IS 
    SELECT s.first_name, s.last_name, MAX(sc.final_grade) AS max_grade, 
    MIN(sc.final_grade) AS min_grade, AVG(sc.final_grade) AS avg_grade
    FROM teacher_1.student s
    JOIN teacher_1.student_course sc ON s.student_id = sc.student_id
    GROUP BY s.first_name, s.last_name;
  l_first_name teacher_1.student.first_name%TYPE;
  l_last_name teacher_1.student.last_name%TYPE;
  l_max_grade teacher_1.student_course.final_grade%TYPE;
  l_min_grade teacher_1.student_course.final_grade%TYPE;
  l_avg_grade NUMBER(5,2);
  
  
BEGIN
  OPEN c_students;
  LOOP
    FETCH c_students INTO l_first_name, l_last_name, l_max_grade, l_min_grade, l_avg_grade;
    EXIT WHEN c_students%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_first_name || ' ' || l_last_name || ': max - ' || l_max_grade || ', min - ' || l_min_grade || ', average' || l_avg_grade);
  END LOOP;
  CLOSE c_students;
END;


