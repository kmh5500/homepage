DROP TABLE board CASCADE CONSTRAINTS PURGE; 
 
CREATE TABLE board ( 
       num                  NUMBER(6) NOT NULL,      -- 글 일련 번호 
       name                 VARCHAR(10) NOT NULL,    -- 글쓴이 성명 
       subject              VARCHAR(100) NOT NULL,   -- 제목 
       content              VARCHAR(4000) NOT NULL,  -- 내용 
       ref                  NUMBER(5) NOT NULL,      -- 부모글 번호(그룹번호) 
       indent               NUMBER(2) DEFAULT 0 NOT NULL, -- 답변여부,깊이 
       ansnum               NUMBER(5) DEFAULT 0 NOT NULL, -- 답변 순서(최신답변은 부모글 바로 아래 달려집니다.) 
       regdate              DATE NOT NULL,           -- 글 등록일 
       passwd               VARCHAR(15) NOT NULL,    -- 패스워드 
       count                NUMBER(5) DEFAULT 0 NOT NULL,      -- 조회수  
       ip                   VARCHAR(15) NOT NULL,    -- 글쓴이 IP  
       filename             VARCHAR(50) NULL,        -- 파일명  
       filesize             NUMBER(7) NULL,          -- 파일 사이즈 
       refnum               NUMBER    DEFAULT 0,          -- 답변확인 컬럼 
       PRIMARY KEY (num) 
); 
--일련번호
select nvl(max(num),0)+1 from board
--부모글생성
select nvl(max(ref),0)+1 from BOARD
--create 
insert into board(num, name, subject, content, regdate,passwd,ip, filename, filesize,ref)
values(
(select nvl(max(num),0)+1 from board),
'홍길동','제목','내용',sysdate,'1234','127.0.0.1','test.txt',90,
(select nvl(max(ref),0)+1 from BOARD)
)
--read
select * from BOARD
where num = 1

--update
update BOARD set name='김길동',
subject ='제목변경',
content='내용 변경 했음',
filename='test2.txt',
filesize='40'
where num=1

----
update BOARD set
ansnum ='1',
indent='1',
refnum='1'

where num=1

--delete
delete from BOARD
where num = 1

--list

select num,name,subject,regdate,count,indent ,r
	from(
			select num,name,subject,regdate,count,indent,rownum r
			from(
				select num,name,subject,regdate,count,indent
				from board
				where name like '%홍%'
				order by ref desc,ansnum
				)
		)where r>=1 and r<=5

		
--total
select count(*) from board
where name like '%홍%'
--조회수
update board set count=count+1
where num=1

--답변 체크 refnum  check 1은 부모글번호
select count(refnum)from board
where refnum = 1

--답변 read 
select num, subject, ref, indent, ansnum
from board
where num = 1
 

--ansnum 업데이트 1부모글번호 2 답변글 번호
update board set ansnum = ansnum + 1
where ref= 1 and ansnum > 2

--답변등록/ 1,1,1,2 
	--	부모의 ref 부모의 indent+1 , 부모의 ansnum+1,부모의 글번호
insert into board(num, name, subject, content,
regdate,passwd,ip, filename, filesize,ref
,indent,ansnum,refnum)
values(
(select nvl(max(num),0)+1 from board),
'홍길동','제목','내용',sysdate,'1234','127.0.0.1','test.txt',90,
1,1,1,2)

--passwd check
select count(*) from board
where num =1
and passwd='1234'




select * from BOARD