DECLARE
  first_name_parent VARCHAR2(40);
  last_name_parent VARCHAR2(40);
BEGIN
  FOR parent IN (
    SELECT first_name, last_name FROM teacher_1.parent
  ) 
  LOOP
    first_name_parent := parent.first_name;
    last_name_parent := parent.last_name;
    DBMS_OUTPUT.PUT_LINE(first_name_parent || ' ' || last_name_parent);
  END LOOP;
END;
