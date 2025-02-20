DECLARE
  num NUMBER := 128;
BEGIN
  WHILE num > 1 LOOP
    DBMS_OUTPUT.PUT_LINE(num);
    num := num / 2;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(num);
END;