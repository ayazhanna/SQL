SELECT 
  student_id, 
 test_grade, course_id,
  CASE 
    WHEN test_grade <= 4 THEN 'bad'
    WHEN test_grade >= 5 AND test_grade <= 7 THEN 'average'
    ELSE 'great'
  END AS grade
FROM 
  teacher_1.student_grade;
