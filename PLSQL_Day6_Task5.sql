--Create anonymous block with custom record definition, print out all teacher information with this record.

DECLARE
  TYPE teacher_type IS RECORD (
    teacher_id NUMBER(10),
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    date_of_birth DATE,
    social_security_no VARCHAR2(50),
    education VARCHAR2(20),
    phone_no VARCHAR2(50),
    email VARCHAR2(100),
    work_email VARCHAR2(100),
    date_of_joining DATE,
    status VARCHAR(10)
  );
  v_teacher teacher_type;
BEGIN
  SELECT teacher_id, first_name, last_name, date_of_birth, social_security_no,education, phone_no, email, work_email, date_of_joining, status
  INTO v_teacher.teacher_id, v_teacher.first_name, v_teacher.last_name,
    v_teacher.date_of_birth, v_teacher.social_security_no, v_teacher.education,
    v_teacher.phone_no, v_teacher.email, v_teacher.work_email, v_teacher.date_of_joining, v_teacher.status
  FROM teacher_1.teacher
  WHERE teacher_id = 2;
  DBMS_OUTPUT.PUT_LINE('Teacher ID: ' || v_teacher.teacher_id);
  DBMS_OUTPUT.PUT_LINE('First Name: ' || v_teacher.first_name);
  DBMS_OUTPUT.PUT_LINE('Last Name: ' || v_teacher.last_name);
  DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || v_teacher.date_of_birth);
  DBMS_OUTPUT.PUT_LINE('Social Security No: ' || v_teacher.social_security_no);
  DBMS_OUTPUT.PUT_LINE('Education: ' || v_teacher.education);
  DBMS_OUTPUT.PUT_LINE('Phone Number: ' || v_teacher.phone_no);
  DBMS_OUTPUT.PUT_LINE('Email: ' || v_teacher.email);
  DBMS_OUTPUT.PUT_LINE('Work Email: ' || v_teacher.work_email);
  DBMS_OUTPUT.PUT_LINE('Date of Joining: ' || v_teacher.date_of_joining);
  DBMS_OUTPUT.PUT_LINE('Status: ' || v_teacher.status);
END;