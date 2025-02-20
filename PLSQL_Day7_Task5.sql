DECLARE
CURSOR c_parent IS
SELECT parent_id, first_name, last_name FROM teacher_1.parent;
l_parent c_parent%rowtype;

CURSOR c_student (p_parent_id NUMBER)IS
SELECT first_name, last_name FROM teacher_1.student WHERE parent_id=p_parent_id;

l_student c_student%rowtype;

BEGIN
OPEN c_parent;
LOOP 
FETCH c_parent INTO l_parent;
EXIT WHEN c_parent%notfound;

DBMS_OUTPUT.PUT_LINE('Parent: '||l_parent.first_name||' '||l_parent.last_name);

OPEN c_student(l_parent.parent_id);
LOOP
FETCH c_student INTO l_student;
EXIT WHEN c_student%notfound;

DBMS_OUTPUT.PUT_LINE ('Student:----'||l_student.first_name||' '||l_student.last_name);
END LOOP;
CLOSE c_student;
END LOOP;
CLOSE c_parent;
END;