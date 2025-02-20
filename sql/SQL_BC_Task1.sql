/*Using one of the RANK functions
Display list of students and their average test grade, show their rank based on average grade
Best student should be at the top of the list
*/

SELECT 
  student_id, 
  ROUND(AVG(test_grade),2) AS average_grade,
  RANK() OVER (ORDER BY AVG(test_grade) DESC) AS rank
FROM 
  teacher_1.student_grade 
GROUP BY 
  student_id 
ORDER BY 
  rank ASC;
--i can use rank function that will assign the same rank to students with the same avg
--test grade


SELECT 
  student_id, 
  ROUND(AVG(test_grade),2) AS average_grade,
  DENSE_RANK() OVER (ORDER BY AVG(test_grade) DESC) AS rank
FROM 
  teacher_1.student_grade 
GROUP BY 
  student_id 
ORDER BY 
  rank ASC;
--i alco can use denserank that will assign a unique rank to 
--each student
