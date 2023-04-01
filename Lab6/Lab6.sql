
CREATE TABLE BRANCH
(
    branch_id varchar2(10),
    loc varchar2(15),
    year_of_establishment char(4),
    CONSTRAINT pk_branch_id PRIMARY KEY (branch_id)
);


CREATE TABLE EMPLOYEE_TYPE
(
    name varchar2(10),
    base_salary varchar2(10),
    house_allowance varchar2(10),
    CONSTRAINT pk_employeetype_name PRIMARY KEY (name)
);


CREATE TABLE SHIFT
(
    shift_id varchar2(10),
    day varchar2(10),
    start_time TIMESTAMP,
    duration varchar2(10),
    CONSTRAINT pk_shift PRIMARY KEY (shift_id,day,start_time,duration)
);


CREATE TABLE ISSUE
(
    issue_id varchar2(10),
    issue_date DATE,
    duration INT DEFAULT 15,
    CONSTRAINT pk_issue_id PRIMARY KEY (issue_id)
);


CREATE TABLE USERS
(
    username varchar2(10),
    DOB DATE,
    hometown varchar2(15),
    occupation varchar2(15),
    issue_id varchar2(10),
    CONSTRAINT pk_user_username PRIMARY KEY (username),
    CONSTRAINT fk_issue_id FOREIGN KEY (issue_id) REFERENCES ISSUE(issue_id)
);



CREATE TABLE BOOK
(
    ISBN char(13),
    name varchar2(20),
    author varchar2(20),
    genre varchar2(20),
    price varchar2(15),
    copies INT,
    publisher_id varchar2(10),
    CONSTRAINT pk_book_isbn PRIMARY KEY (ISBN),
    CONSTRAINT fk_book_publisherid FOREIGN KEY (publisher_id) REFERENCES PUBLISHER(publisher_id)
);

ALTER TABLE PUBLISHER ADD publisher_id varchar2(10);
ALTER TABLE BOOK ADD CONSTRAINT fk_book_publisherid FOREIGN KEY (publisher_id) REFERENCES PUBLISHER(publisher_id);

CREATE TABLE BOOK_USERS
(
    ISBN char(13),
    username varchar2(10),
    CONSTRAINT pk_book_users PRIMARY KEY (ISBN,username),
    CONSTRAINT fk_bookusers_isbn FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN),
    CONSTRAINT fk_bookusers_username FOREIGN KEY (username) REFERENCES USERS(username)
);


CREATE TABLE BOOK_BRANCH
(
    ISBN char(13),
    branch_id varchar2(10),
    CONSTRAINT pk_book_branch PRIMARY KEY (ISBN,branch_id),
    CONSTRAINT fk_bookbranch_isbn FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN),
    CONSTRAINT fk_bookusers_branchid FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id)
);


CREATE TABLE PUBLISHER
(
    publisher_id varchar2(10),
    name varchar2(20),
    city varchar2(20),
    year_of_establishment char(4),
    CONSTRAINT pk_publisher PRIMARY KEY (publisher_id,name,city)
);


CREATE TABLE EMPLOYEE
(
    NID varchar2(10),
    name varchar2(15),
    blood_group char(2),
    DOB DATE,
    emp_type varchar2(10),
    branch_id varchar2(10),
    shift_id varchar2(10),
    issue_id varchar2(10),
    CONSTRAINT pk_employee_nid PRIMARY KEY (NID),
    CONSTRAINT fk_branch_id FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id),
    CONSTRAINT fk_employee_emp_type FOREIGN KEY (emp_type) REFERENCES EMPLOYEE_TYPE(name),
    CONSTRAINT fk_shift FOREIGN KEY (shift_id) REFERENCES SHIFT(shift_id),
    CONSTRAINT fk_issue FOREIGN KEY (issue_id) REFERENCES ISSUE(issue_id)
);




