/*Take a look at the teacher table
Are there any columns that could benefit from
 * Unique index
 * Function based index
 * bitmap index
If there are any, explain why this particular index would help and write statement, that would create index 
(Index creation will not work because you dont have access right to do so,
and it will only work for one student, others will get an error, that index already exsists)
*/
/*
Take a look at the query
Requirement: I need to find student John Bootcamp email address and social security number
Why it doesn't return any results?
Is it possible to increase query performance, while satisfying requirements? 
*/
SELECT * 
 FROM student_attendance sta
INNER JOIN student stu
  ON sta.student_id = stu.student_id
INNER JOIN course cou
  ON sta.course_id = cou.course_id
INNER JOIN course_schedule cse
  ON sta.course_schedule_id = cse.course_schedule_id
WHERE UPPER(stu.first_name) LIKE 'JOHN';

--Provide optimized query and explain what you added/removed from original one and why
-- compare both query explain plan output



/*
CREATE UNIQUE INDEX teacher_email_idx
ON teacher (email);
by having this index, i cannot have two rows with the same value in the email column

CREATE INDEX teacher_last_name_inx 
ON teacher(last_name);
this statement will be useful for searching by last name and could
potentially speed up certain types of queries. 

CREATE BITMAP INDEX teacher_statis_idx 
ON teacher(status);
by this statement the database can quickly filter and retrieve records based on whether 
a teacher is active or no. it will improve the performance of queries.

*/

/*
This query is missing a condition to filter the result to only show John's information.
This is optimized query

SELECT email, social_security_no
FROM student
WHERE UPPER(first_name) = 'JOHN'
  AND UPPER(last_name) = 'BOOTCAMP';

  as all the required information is available in one student table, i write this query.
  this query is more optimized because unnecessary joins are removed.
  also, i replaced like operation into =.

*/