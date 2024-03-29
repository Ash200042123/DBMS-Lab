SET SERVEROUTPUT ON SIZE 1000000

DECLARE 
    stud_id NUMBER := 200042123;
BEGIN
    DBMS_OUTPUT . PUT_LINE ('My student ID is:' || stud_id);
END;
/






SET SERVEROUTPUT ON SIZE 1000000

DECLARE
MYNAME VARCHAR2 (100);
BEGIN
MYNAME := '&myname';
DBMS_OUTPUT . PUT_LINE ( ' My name is ' || MYNAME || ' and length is '|| LENGTH(MYNAME));
END ;
/







SET SERVEROUTPUT ON SIZE 1000000

DECLARE
num1 NUMBER;
num2 NUMBER;
result NUMBER;

BEGIN
num1 := '&number1';
num2 := '&number2';
result := num1+num2;
DBMS_OUTPUT . PUT_LINE ( ' Sum is ' || result);
END ;
/











SET SERVEROUTPUT ON SIZE 1000000

DECLARE
D DATE := SYSDATE ;
BEGIN
DBMS_OUTPUT . PUT_LINE(TO_CHAR(SYSDATE,'HH24:MI:SS'));
END ;
/






SET SERVEROUTPUT ON SIZE 1000000

DECLARE
X NUMBER ;
BEGIN
X := '&number';
IF (MOD(X,2) = 0) THEN
DBMS_OUTPUT . PUT_LINE ( 'THE NUMBER IS EVEN.');
ELSE
DBMS_OUTPUT . PUT_LINE ('THE NUMBER IS ODD.');
END IF;
END ;
/







SET SERVEROUTPUT ON SIZE 1000000

CREATE OR REPLACE
PROCEDURE FIND_PRIME( NUM IN NUMBER,flag OUT VARCHAR2)
AS
BEGIN
    flag:='Prime';
    for i in 2..(NUM/2)
    loop
      if(MOD(NUM,i)=0) THEN
      flag:='Not Prime';
      exit;
      end if;
    end loop;
    
END ;
/

DECLARE
num NUMBER;
flag VARCHAR2(10);
BEGIN
num:='&number'
FIND_PRIME(num,flag);
DBMS_OUTPUT.PUT_LINE(flag);
END ;
/








SET SERVEROUTPUT ON SIZE 1000000

CREATE OR REPLACE
PROCEDURE FIND_BRANCHES(NUM IN NUMBER)
AS
ROW NUMBER(5);
BEGIN
    SELECT MAX(ROWNUM) INTO ROW 
    FROM (SELECT * FROM BRANCH ORDER BY ASSETS DESC);

    IF(NUM>ROW) THEN 
        DBMS_OUTPUT . PUT_LINE ('Input exceeds number of entries');
        RETURN;
    END IF;

    FOR i IN (SELECT * FROM (SELECT * FROM BRANCH ORDER BY ASSETS DESC) WHERE ROWNUM<=NUM) LOOP
        DBMS_OUTPUT . PUT_LINE (i.BRANCH_NAME || ' ' || i.BRANCH_CITY || ' ' || i.ASSETS);
    END LOOP;

END;
/

DECLARE
    NUM NUMBER(5);
BEGIN 
    NUM := '& number';
    FIND_BRANCHES(NUM);

END;
/