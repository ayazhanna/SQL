--Create anonymous block that would trigger user defined error with proper exception handling.
DECLARE 
  l_first_name teacher_1.user_info.first_name%TYPE;
  l_user_id teacher_1.user_info.user_id%TYPE := &user_id;
BEGIN
  IF l_user_id < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'user_id must be a positive integer');
  END IF;
  SELECT first_name INTO l_first_name
  FROM teacher_1.user_info
  WHERE user_id = l_user_id;
  DBMS_OUTPUT.PUT_LINE(l_first_name);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('user '||l_user_id||' does not exist');
END;
