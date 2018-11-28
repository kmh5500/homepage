CREATE TABLE memo( 
  memono  NUMBER(6)     NOT NULL,  -- 일련번호, -999999 ~ +999999 
  title   VARCHAR(100)  NOT NULL,  -- 메모 제목, 한글 50자 
  content VARCHAR(4000) NOT NULL,  -- 내용  
  wdate   DATE          NOT NULL,  -- 등록 날짜  
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, -99999 ~ +99999    
  PRIMARY KEY(memono)              -- 고유한 값, 중복 안됨    
); 
--답변용 컬럼 추가
alter table memo
add(grpno number default 0,
	indent number default 0,
	ansnum number default 0)
 --추가컬럼확인
select memono, grpno, indent,ansnum from memo  


delete from memo

-- SEQUENCE 객체 삭제 
drop sequence memo_seq;

-- SEQUENCE 객체 생성 
CREATE SEQUENCE memo_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 

-- dual: 가상 테이블, SQL형식 맞출경우 임시 테이블 사용, 변경하면 안됨
select memo_seq.nextval from dual;


-- 현재 sequence 확인(Run SQL Command Line 에서 실행);
select memo_seq.currval from dual;

       
-- create 
-- memo_seq.nextval: 일련번호 자동 생성하여 할당 
--                   (MySQL은 컬럼명을 명시하지 않음). 
-- sysdate: 현재 날짜와 시간(MySQL: now()) 
insert into memo(memono,title,content,wdate)
values(memo_seq.nextval,'오늘의 메모','이전주 토익 시험 준비',sysdate);

-- select list, 자주 읽는 메모 먼저 출력  
-- DESC: Descending, ASC: Ascending 
select memono, title,wdate,viewcnt
from memo
order by memono ASC;
select * from memo;
insert into memo(memono,title,content,wdate)
values(memo_seq.nextval,'읽을 도서','가메출판사 오라클 11g',sysdate);
insert into memo(memono, title, content,wdate)
values(memo_seq.nextval,'수업 복습','메모 제작',sysdate);

insert into memo
values(memo_seq.nextval,'도서구입','JSP Web Programming',sysdate,0);
 