-- member 테이블 생성
CREATE TABLE member(
    mno      INT,
    id       VARCHAR2(20) NOT NULL UNIQUE,
    passwd   VARCHAR2(20) NOT NULL,
    name     VARCHAR2(30) NOT NULL,
    email    VARCHAR2(50),
    gender   VARCHAR2(6),
    joindate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(mno)
);

CREATE SEQUENCE seq_mno NOCACHE;

INSERT INTO member(mno, id, passwd, name, email, gender)
VALUES (seq_mno.NEXTVAL, 'khit', 'm1234567', '임예은', 'khit@gmail.com', 'female');

COMMIT;

SELECT * FROM member;

DROP TABLE member;
DROP SEQUENCE seq_mno;