DECLARE
  TYPE t_course IS RECORD(
    course_id teacher_1.course.course_id%type,
    name teacher_1.course.name%type,
    description teacher_1.course.description%type);
  l_course t_course;
  
  CURSOR c_course IS SELECT course_id, name, description FROM teacher_1.course;
BEGIN
  OPEN c_course;
  LOOP 
    FETCH c_course INTO l_course;
    EXIT WHEN c_course%notfound;
    DBMS_OUTPUT.PUT_LINE(l_course.course_id || '- ' || l_course.name || '- ' || l_course.description);
  END LOOP;
  CLOSE c_course;
END;
