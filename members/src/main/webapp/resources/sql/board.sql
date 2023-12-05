-- board 테이블 생성
CREATE TABLE board(
    bno        NUMBER PRIMARY KEY,
    title      VARCHAR2(100) NOT NULL,
    content    CLOB NOT NULL,
    createdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modifydate TIMESTAMP,
    hit        NUMBER DEFAULT 0,
    filename   VARCHAR2(50),
    id         VARCHAR2(20) NOT NULL,
    FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE
);

CREATE SEQUENCE seq_bno NOCACHE;

INSERT INTO board(bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목', '글내용', 'khit');

SELECT * FROM board;

COMMIT;

DROP TABLE board;
DROP SEQUENCE seq_bno;