drop table bbs purge;

CREATE TABLE bbs ( 
  bbsno   NUMBER(7)     NOT NULL,  -- 글 일련 번호, -9999999 ~ +9999999 
  wname   VARCHAR(20)   NOT NULL,  -- 글쓴이 
  title   VARCHAR(100)  NOT NULL,  -- 제목(*) 
  content VARCHAR(4000) NOT NULL,  -- 글 내용 
  passwd  VARCHAR(15)   NOT NULL,  -- 비밀 번호 
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, 기본값 사용 
  wdate   DATE          NOT NULL,  -- 등록 날짜, sysdate 
  grpno   NUMBER(7)     DEFAULT 0, -- 부모글 번호 
  indent  NUMBER(2)     DEFAULT 0, -- 답변여부,답변의 깊이
  ansnum  NUMBER(5)     DEFAULT 0, -- 답변 순서 
  PRIMARY KEY (bbsno)  
); 
--부모글 삭제 방지
alter table bbs
add(refnum number default 0)

alter table bbs
add(filename varchar(30)),
filesize number(30) default 0 );
alter table bbs drop column filename;
	--create 
	select nvl(max(bbsno),0)+1 as max from bbs;
	select * from bbs;
	
	select bbsno, passwd from bbs;
	
	insert into bbs(bbsno, wname, title, content, passwd, wdate, grpno)
	values((select nvl(max(bbsno),0)+1 as bbsno from bbs), 
	'왕눈이','제목','내용','123',sysdate , (select nvl(max(grpno),0)+1 as bbsno from bbs));
	
	
SELECT bbsno, wname, title,  viewcnt, 
wdate, grpno, indent, ansnum ,r		
	from(	SELECT 
			bbsno, wname, title,  viewcnt, 
			wdate, grpno, indent, ansnum ,rownum as r	
		from(	
			SELECT 
			bbsno, wname, title,  viewcnt, 
			to_char(wdate,'yyyy-mm-dd') as wdate, grpno, indent, ansnum 
			FROM bbs  
			ORDER BY grpno DESC, ansnum
			)
		)where r >=1 and r<=5 
		
		
--조회수 증가
update bbs set viewcnt = viewcnt+1 where bbsno=1;

--read
SELECT 
bbsno, wname, title,
content,  viewcnt, wdate
FROM bbs  
WHERE bbsno = 1; 
 
UPDATE bbs 
SET 
wname='왕눈이', 
title='비오는날', 
content='개구리 연못' 
WHERE bbsno = 1; 

	
	select count(bbsno) as cnt 
	from bbs 
	where bbsno= 1 
	and passwd='123';
	
	delete from bbs
	where bbsno =7;
	
	select bbsno, grpno, indent, ansnum, refnum from bbs order by grpno desc, ansnum
	
	
	
	
	