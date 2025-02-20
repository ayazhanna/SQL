/*
Display a list of students and their grades.
In list, add field that would indicate that the test grade is bad when grade <4, average if the grade is between 5 and 7, 
and if grade higher than that, then the grade is great.
*/
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
