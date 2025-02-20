--Create anonymous block that divides 128 by 2 till number reaches 1 using while loop, print out all steps in between.
DECLARE
  num NUMBER := 128;
BEGIN
  WHILE num > 1 LOOP
    DBMS_OUTPUT.PUT_LINE(num);
    num := num / 2;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(num);
END;
