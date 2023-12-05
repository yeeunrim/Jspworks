-- reply 테이블 생성
CREATE TABLE reply(
    rno      NUMBER PRIMARY KEY, -- 댓글번호
    bno      NUMBER NOT NULL, -- 게시글 번호
    rcontent VARCHAR2(2000)NOT NULL, -- 댓글내용
    replyer  VARCHAR2(20) NOT NULL, -- 댓글 작성자
    rdate    TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 댓글작성일
    rupdate  TIMESTAMP, -- 댓글 수정일
    FOREIGN KEY(bno) REFERENCES board(bno)ON DELETE CASCADE -- 외래키FK
);

CREATE SEQUENCE seq_rno NOCACHE;

-- 1번 댓글 검색
SELECT * FROM reply WHERE bno=1;

-- 1번 게시글에 댓글달기
INSERT INTO reply(rno, bno, rcontent, replyer)
VALUES(seq_rno.NEXTVAL, 1, 'first comment', 'today');

INSERT INTO reply(rno, bno, rcontent, replyer)
VALUES(seq_rno.NEXTVAL, 1, 'second comment', 'hello');

-- 3번rno 댓글 지우기
DELETE FROM reply WHERE rno = 3;

COMMIT;

SELECT * FROM reply;