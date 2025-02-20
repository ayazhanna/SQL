/*
Write a query which shows student name, surname, average grade from all subjects, highest average grade in the class, ranking in class
*/
SELECT 
  s.first_name, s.last_name, 
  AVG(sc.final_grade) AS avg_grade, 
  MAX(AVG(sc.final_grade))OVER () AS highest,
  RANK() OVER (ORDER BY AVG(sc.final_grade) DESC) AS rank,
  
  DENSE_RANK() OVER (ORDER BY AVG(sc.final_grade) DESC) AS dense_rank
  
FROM 
  teacher_1.student s 
  JOIN teacher_1.student_course sc ON s.student_id = sc.student_id
GROUP BY 
  s.student_id, s.first_name, s.last_name;

/*
I decided to show two different rank: RANK to leave gaps in the ranking sequence,
DENSE to avoid gaps and have a more compact ranking sequence
*/

