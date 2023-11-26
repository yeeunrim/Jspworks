-- addrbook table 생성
CREATE TABLE addrbook(
    bnum NUMBER PRIMARY KEY,
    username VARCHAR2(20) NOT NULL,
    tel VARCHAR2(20),
    email VARCHAR2(30) UNIQUE, -- 중복 방지
    gender VARCHAR2(6),
    regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 시간과 날짜 (자동)
);

CREATE SEQUENCE seq_bnum NOCACHE; -- 순번 (자동-시퀀스)

INSERT INTO addrbook(bnum, username, tel, email, gender) 
VALUES (seq_bnum.NEXTVAL, '임예은', '010-1111-2222', 'yeeun@naver.com', 'female');
-- 이메일 중복 체크 (확인)
INSERT INTO addrbook(bnum, username, tel, email, gender) 
VALUES (seq_bnum.NEXTVAL, '손흥민', '010-1111-2222', 'yeeun@naver.com', 'male');

COMMIT;

DROP TABLE addrbook;
DROP SEQUENCE seq_bnum;

SELECT * FROM addrbook;

-- 이메일 yeeun@naver.com 찾기
SELECT email FROM addrbook
WHERE email = 'yeeun@naver.com';

-- 주소 삭제
DELETE FROM addrbook WHERE bnum = 2;

-- 주소 수정
UPDATE addrbook 
SET username = 'Lia', tel = 010-1234-5678, gender = 'male'
WHERE bnum = 2;