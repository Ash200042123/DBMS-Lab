CREATE USER ash200042123 IDENTIFIED BY cse4308;

GRANT ALL PRIVILEGES TO ash200042123;

 CREATE TABLE STUDENT
    (
    ID varchar2(10) NOT NULL,
    NAME varchar2(10) NOT NULL,
    DEPT_NAME varchar2(20) NOT NULL,
    TOT_CRED varchar2(5)
    )
    ;

INSERT INTO STUDENT VALUES ('00128','Zhang', 'Comp. Sci', '102');
INSERT INTO STUDENT VALUES ('12345','Shankar', 'Comp. Sci', '32');
INSERT INTO STUDENT VALUES ('19991','Brandt', 'History', '80');
INSERT INTO STUDENT VALUES ('23121','Chavez', 'Finance', '110');
INSERT INTO STUDENT VALUES ('44553','Peltier', 'Physics', '56');
INSERT INTO STUDENT VALUES ('45678','Levy', 'Physics', '46');
INSERT INTO STUDENT VALUES ('54321','Williams', 'Comp. Sci', '5');
INSERT INTO STUDENT VALUES ('55739','Sanchez', 'Music', '38');
INSERT INTO STUDENT VALUES ('70557','Snow', 'Physics', '0');
INSERT INTO STUDENT VALUES ('76543','Brown', 'Comp. Sci', '58');
INSERT INTO STUDENT VALUES ('76653','Aoi', 'Elec. Eng.', '60');
INSERT INTO STUDENT VALUES ('98765','Bourikas', 'Elec. Eng.', '9');
INSERT INTO STUDENT VALUES ('98988','Tanaka', 'Biology', '120');

 SELECT * FROM STUDENT;

 SELECT ID, NAME FROM STUDENT;

 SELECT NAME, dept_name FROM STUDENT where tot_cred > 100;

 SELECT NAME, dept_name FROM STUDENT where tot_cred >= 80 and tot_cred <= 120;

 SELECT ID, NAME FROM STUDENT where dept_name = 'Comp. Sci';

 SELECT NAME, tot_cred FROM STUDENT where dept_name = 'Physics';

 SELECT ID, NAME FROM STUDENT where dept_name = 'Comp. Sci' or tot_cred < 10;

 SELECT DISTINCT dept_name FROM STUDENT;