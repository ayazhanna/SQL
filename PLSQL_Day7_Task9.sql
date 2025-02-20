DECLARE
  CURSOR c_classes IS
    SELECT DISTINCT study_class FROM teacher_1.student;  
  l_class teacher_1.student.study_class%TYPE;
  
  CURSOR c_students(p_class IN teacher_1.student.study_class%TYPE) IS
    SELECT first_name, last_name , MIN(final_grade) AS lowest_grade
    FROM teacher_1.student s
    INNER JOIN teacher_1.student_course sc ON s.student_id = sc.student_id
    WHERE s.study_class = p_class
    GROUP BY first_name, last_name;
  
  l_student c_students%ROWTYPE;
BEGIN
  OPEN c_classes;
  LOOP
    FETCH c_classes INTO l_class;
    EXIT WHEN c_classes%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Class ' || l_class);
    OPEN c_students(l_class);
    LOOP
      FETCH c_students INTO l_student;
      EXIT WHEN c_students%NOTFOUND;
      
    DBMS_OUTPUT.PUT_LINE(l_student.first_name || ' ' || l_student.last_name || ': ' || l_student.lowest_grade);
    END LOOP;
    CLOSE c_students;
    
    DBMS_OUTPUT.NEW_LINE;
  END LOOP;
  CLOSE c_classes;
END;
