drop table member

create table member(
	id			varchar(10)	not null,
	passwd		varchar(20)	not null,
	mname 		varchar(20)	not null,
	tel 		varchar(14)	 null,
	email 		varchar(50)	not null unique,
	zipcode 	varchar(7)	null,
	address1	varchar(150)	 null,
	address2	varchar(50)	null,
	job		    varchar(20)	not null,
	mdate		date 		not null,
	fname 		varchar(50) default 'member.jpg',
	grade 		char(1)		default 'h',
	primary key (id)
	);
	
	
	
	 select passwd
		 from member 
		 where id = 'user2'

insert into MEMBER(id, passwd, mname, tel, email, zipcode, address1, address2, 
					job, mdate, fname, grade)
			values('admin122', '1234','관리자','123-1234','email12@mail.com',
					'123-123','인천시','남동구','A01',sysdate,'man.jsp','h');
insert into MEMBER(id, passwd, mname, tel, email, zipcode, address1, address2, 
					job, mdate, fname, grade)
			values('user21', '1234','개발자2','123-1234','email2@mail.com',
					'123-123','광명시','남동구','A01',sysdate,'man.jpg','H');
insert into MEMBER(id, passwd, mname, tel, email, zipcode, address1, address2, 
					job, mdate, fname, grade)
values('member122', '1234','개발자3','123-1234','email3231@mail.com',
		'123-123','용인시','남동구','A01',sysdate,'myface.jsp','A')
					
					
--중복 아이디 검사 관련 sql
--0:중복 아님, 1:중복
select count(id)
from member 
where id= 'user1' AND passwd=12;
--이메일 중복 확인
select count(email)as cnt
from member
where email='emil3@mail.com';

select * from member
--user1 회원 정보 보기
select id, passwd, mname, tel, email, zipcode, address1, address2,job,
mdate,fname,grade
from member
where id ='user1';
--회원 이미지의 수정
update member set fname="
where id='user1';

--패스워드 변경

update member
set passwd='1234'
where id="";

--회원 정보 수정	
update member set 
passwd='dddd',
tel='123-123',
email='email10',
zipcode='TEST',
	address1='수원',
	address2='팔달구',
	job='TEST',
	grade='A'
where id ='admin';
--user3 회원 삭제
delete from member where id ='user3';

--회원 정보 수정	
update member set 
passwd = '1234'
where id ='admin';

--로그인 관련  sql
select count(id) as cnt
from member where id= 'user1' and passwd='1234';

--list
select id, mname, tel , email, zipcode, address1, address2,fname,r
from(
	select id, mname, tel, email, zipcode,address1, address2, fname,rownum r
			from(select id, mname, tel, email, zipcode, address1, address2,fname from member
				where mname like '%개%'
				order by mdate DESC
				)
	)where r>=1 and r<=5

select * from member



SELECT id, mname, tel, email, zipcode, address1, address2,
fname,  r
from(
SELECT id, mname, tel, email, zipcode, address1, address2,
fname, rownum r
from(
SELECT id, mname, tel, email, zipcode, address1, 
address2, fname
FROM member
where mname like '%홍%'
ORDER BY mdate DESC 
)
)where r >= 1 and r <= 5


select count(id) from member where id='user1';



CREATE TABLE member ( 
    id       VARCHAR(10) NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼  
    passwd   VARCHAR(20) NOT NULL, -- 패스워드, 영숫자 조합 
    mname    VARCHAR(20) NOT NULL, -- 성명, 한글 10자 저장 가능 
    tel      VARCHAR(14)     NULL, -- 전화번호 
    email    VARCHAR(50) NOT NULL UNIQUE, -- 전자우편 주소, 중복 안됨 
    zipcode  VARCHAR(7)      NULL, -- 우편번호, 101-101 
    address1 VARCHAR(150)     NULL, -- 주소 1 
    address2 VARCHAR(50)     NULL, -- 주소 2 
    job      VARCHAR(20) NOT NULL, -- 직업 
    mdate    DATE        NOT NULL, -- 가입일     
    fname    VARCHAR(50) DEFAULT 'member.jpg', -- 회원 사진
    grade    CHAR(1)     DEFAULT 'H', -- 일반회원: H, 정지: Y, 손님:Z 
    PRIMARY KEY (id)               -- 한번 등록된 id는 중복 안됨 
); 