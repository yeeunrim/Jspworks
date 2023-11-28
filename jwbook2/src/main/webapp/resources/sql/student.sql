-- student 테이블 생성
CREATE TABLE student(
    sid NUMBER PRIMARY KEY,
    username VARCHAR2(20) NOT NULL,
    univ VARCHAR2(40),
    birth VARCHAR2(20),
    email VARCHAR2(40) NOT NULL UNIQUE
);

CREATE SEQUENCE seq_sid NOCACHE;

INSERT INTO student (sid, username, univ, birth, email) 
VALUES (seq_sid.NEXTVAL, '임예은', '가톨릭대학교', '1999-12-15', 'yeeun@naver.com');

SELECT * FROM student;

COMMIT;