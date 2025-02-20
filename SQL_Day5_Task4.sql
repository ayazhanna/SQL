/*
Write a query which shows teacher names, surnames and the number of days of how long has each of the teachers worked at
the school, split the respective result in 3 parts: 0-3 years, 3-5 years, 5+ years – show both the numeric result and the according to group.
*/
SELECT 
  first_name, last_name,
  ROUND((SYSDATE - date_of_joining), 0) AS days,
  CASE 
    WHEN MONTHS_BETWEEN(SYSDATE, date_of_joining) <= 36 THEN '0-3 years'
    WHEN MONTHS_BETWEEN(SYSDATE, date_of_joining) <= 60 THEN '3-5 years'
    ELSE '5+ years'
  END AS years
FROM teacher_1.teacher;
