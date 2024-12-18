/* Creating Tables */
CREATE TABLE ModuleDescriptor (
    descrpt_id int NOT NULL,
    d_description varchar(255) NOT NULL,
    PRIMARY KEY (descrpt_id )
);
CREATE TABLE Module(
    module_id int NOT NULL,
    m_description varchar(50) NOT NULL,
    descrpt_id int NOT NULL,
    PRIMARY KEY (module_id ),
    FOREIGN KEY (descrpt_id) REFERENCES ModuleDescriptor(descrpt_id)
);
CREATE TABLE Answer(
     answer_id varchar(4) NOT NULL,
     m_description varchar(50) NOT NULL,
     PRIMARY KEY (answer_id )
);
CREATE TABLE QuestionPart(
    part_id int NOT NULL,
    p_description varchar(50) NOT NULL,
    p_marks int NOT NULL,
    PRIMARY KEY (part_id) 
);
CREATE TABLE Question(
    question_id int NOT NULL,
    q_description varchar(50) NOT NULL,
    answer_id varchar(4) NOT NULL,
    part_id int NOT NULL,
    PRIMARY KEY (question_id ),
    FOREIGN KEY (answer_id) REFERENCES Answer(answer_id),
    FOREIGN KEY (part_id) REFERENCES QuestionPart(part_id)
);
CREATE TABLE Student(
    student_id int NOT NULL,
    student_fname varchar(50) NOT NULL,
    student_lname varchar(50),
    dob varchar(50) NOT NULL,
    PRIMARY KEY (student_id) 
);
CREATE TABLE Exam(
    exam_id int NOT NULL,
    exam_date varchar(20) NOT NULL,
    exam_marks int NOT NULL,
    exam_duration int NOT NULL,
    exam_start_at varchar(20) NOT NULL,
    question_id int NOT NULL,
    PRIMARY KEY (exam_id ),
    FOREIGN KEY (question_id) REFERENCES Question(question_id)
);
CREATE TABLE Enrollment(
    enroll_id int NOT NULL,
    enroll_date varchar(20) NOT NULL,
    enroll_fee int NOT NULL,
    module_id int NOT NULL,
    student_id int NOT NULL,
    PRIMARY KEY (enroll_id ),
    FOREIGN KEY (module_id) REFERENCES Module(module_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
CREATE TABLE ExamConduction(
    conduction_id int NOT NULL,
    stud_ans varchar(100),
    obt_marks int NOT NULL,
    enroll_id int NOT NULL,
    module_id int NOT NULL,
    student_id int NOT NULL,
    exam_id int NOT NULL,
    PRIMARY KEY (conduction_id ),
    FOREIGN KEY (enroll_id) REFERENCES Enrollment(enroll_id),
    FOREIGN KEY (module_id) REFERENCES Module(module_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id)
);
/* end Tables */

/*intersing data into tatbles */
INSERT INTO ModuleDescriptor (descrpt_id , d_description )
VALUES (100,'basically about circuits');
INSERT INTO ModuleDescriptor (descrpt_id , d_description )
VALUES (101,'course of programming');
INSERT INTO ModuleDescriptor (descrpt_id , d_description )
VALUES (102,'mathematics world');
INSERT INTO ModuleDescriptor (descrpt_id , d_description )
VALUES (103,'about the social sciences');

INSERT INTO Module (module_id , m_description,descrpt_id  )
VALUES (200,'DLD',100);
INSERT INTO Module (module_id , m_description,descrpt_id  )
VALUES (201,'Java',101);
INSERT INTO Module (module_id , m_description,descrpt_id  )
VALUES (202,'Calculus',102);
INSERT INTO Module (module_id , m_description,descrpt_id  )
VALUES (203,'History',103);

INSERT INTO Answer(answer_id , m_description )
VALUES ('AB00','A');
INSERT INTO Answer(answer_id , m_description )
VALUES ('AB01','B');
INSERT INTO Answer(answer_id , m_description )
VALUES ('AB02','C');
INSERT INTO Answer(answer_id , m_description )
VALUES ('AB03','D');

INSERT INTO QuestionPart( part_id ,p_description, p_marks )
VALUES (5000,'what is Python',10);
INSERT INTO QuestionPart( part_id ,p_description, p_marks )
VALUES (5001,'why Python',20);
INSERT INTO QuestionPart( part_id ,p_description, p_marks )
VALUES (5002,'how you can work',5);
INSERT INTO QuestionPart( part_id ,p_description, p_marks )
VALUES (5003,'what is nlp',20);

INSERT INTO Question( question_id  ,q_description, answer_id,part_id )
VALUES (3001,'Explain it','A100',5000);
INSERT INTO Question( question_id  ,q_description, answer_id,part_id )
VALUES (3002,'tic correct','A100',5001);
INSERT INTO Question( question_id  ,q_description, answer_id,part_id )
VALUES (3003,'all true','A101',5002);
INSERT INTO Question( question_id  ,q_description, answer_id,part_id )
VALUES (3004,'all false','A102',5003);

INSERT INTO Student( student_id ,student_fname, student_lname, dob )
VALUES (1,'john','allen','20/06/1998');
INSERT INTO Student( student_id ,student_fname, student_lname, dob )
VALUES (2,'paul','warren','2/12/2015');
INSERT INTO Student( student_id ,student_fname, student_lname, dob )
VALUES (3,'Ali','khan','12/12/2000');
INSERT INTO Student( student_id ,student_fname, student_lname, dob )
VALUES (4,'Ahsan','khan','15/08/1990');

INSERT INTO Exam( exam_id,exam_date, exam_marks,exam_duration, exam_start_at, question_id )
VALUES (90,'24/05/2021',100, 30, 9, 3001);
INSERT INTO Exam( exam_id,exam_date, exam_marks,exam_duration, exam_start_at, question_id )
VALUES (91,'24/05/2021',100, 60, 9, 3001);
INSERT INTO Exam( exam_id,exam_date, exam_marks,exam_duration, exam_start_at, question_id )
VALUES (92,'24/05/2021',100, 30, 9, 3002);
INSERT INTO Exam( exam_id,exam_date, exam_marks,exam_duration, exam_start_at, question_id )
VALUES (93,'24/05/2021',100, 60, 9, 3003);
INSERT INTO Exam( exam_id,exam_date, exam_marks,exam_duration, exam_start_at, question_id )
VALUES (94,'24/05/2021',100, 60, 9, 3004);

INSERT INTO Enrollment( enroll_id,enroll_date, enroll_fee,module_id, student_id )
VALUES (600, '20/04/2021', 1000, 200, 1);
INSERT INTO Enrollment( enroll_id,enroll_date, enroll_fee,module_id, student_id )
VALUES (601, '20/04/2021', 1500, 201, 2);
INSERT INTO Enrollment( enroll_id,enroll_date, enroll_fee,module_id, student_id )
VALUES (602, '20/04/2021', 2000, 202, 3);
INSERT INTO Enrollment( enroll_id,enroll_date, enroll_fee,module_id, student_id )
VALUES (603, '20/04/2021', 1000, 203, 4);

INSERT INTO ExamConduction( conduction_id, stud_ans,obt_marks, enroll_id,module_id, student_id , exam_id )
VALUES (75, 'A', 10, 600, 200,1,90);
INSERT INTO ExamConduction( conduction_id, stud_ans,obt_marks, enroll_id,module_id, student_id , exam_id )
VALUES (76, 'B', 5, 601, 201,2,91);
INSERT INTO ExamConduction( conduction_id, stud_ans,obt_marks, enroll_id,module_id, student_id , exam_id )
VALUES (77, 'C', 10, 602, 202,3,92);
INSERT INTO ExamConduction( conduction_id, stud_ans,obt_marks, enroll_id,module_id, student_id , exam_id )
VALUES (78, 'D', 5, 603, 203,4,93);
/*end inserts*/

/*Select all from Student*/
select * from student;

/*combines result sets of two or more SELECT statements into a single result set*/
SELECT d_description FROM ModuleDescriptor 
UNION
SELECT m_description FROM Module
ORDER BY d_description ;

/*compares the result of two queries and returns the distinct rows*/
SELECT d_description FROM ModuleDescriptor 
INTERSECT
SELECT m_description FROM Module
ORDER BY d_description ;

/*selects records that have matching values in both tables*/
SELECT ModuleDescriptor.descrpt_id, Module. m_description
FROM ModuleDescriptor
INNER JOIN Module ON ModuleDescriptor.descrpt_id =  Module.descrpt_id;


/*returns all records when there is a match in left (table1) or right (table2) table*/
SELECT ModuleDescriptor.descrpt_id, Module. m_description
FROM ModuleDescriptor
FULL OUTER JOIN Module ON ModuleDescriptor.descrpt_id =  Module.descrpt_id
ORDER BY ModuleDescriptor.descrpt_id;

/*select specific values in tables*/
SELECT  d_description
FROM ModuleDescriptor 
WHERE descrpt_id = (SELECT descrpt_id
FROM Module
WHERE descrpt_id = 100);


/*return all rows in the first SELECT statement that are not returned by the second SELECT statement*/
SELECT 
    student_id, SUM(student_id)
FROM
    Student
GROUP BY student_id;

SELECT
	 module_id
FROM
	Module
MINUS 
SELECT
	descrpt_id
FROM
	ModuleDescriptor;
