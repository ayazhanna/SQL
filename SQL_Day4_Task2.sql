SELECT 
  first_name, 
  CASE 
    WHEN education = 'Bsc' THEN 'Bachelor of Science'
    WHEN education = 'M' THEN 'Master of Science'
    WHEN education = 'Phd' THEN 'Doctor of Philosophy'
    WHEN education IS NULL THEN 'Unknown'
    ELSE education
  END AS degree_name
FROM 
  teacher_1.teacher;
