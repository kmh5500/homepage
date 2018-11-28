create table img(
no			number(6)			not null,
title		varchar(100)		not null,
passwd		varchar(100)		not null,
fname		varchar(100)		not null,
content		varchar(1000)		not null,
wdate		date				not null,
viewcnt		number(5)			default 0,
grpno		number(6)			default 0,
indent		number(6)			default 0,
ansnum		number(6)			default 0,

primary key(no)
);
select * from img
--create
insert into img(no, title,passwd, fname, content, wdate)
values((select nvl(max(no),0)+1 as no from img), '테스트1', '1234', '이미지1', '내용1', sysdate);
insert into img(no, title,passwd, fname, content, wdate)
values((select nvl(max(no),0)+1 as no from img), '테스트2', '1234', '이미지2', '내용2', sysdate);
insert into img(no, title,passwd, fname, content, wdate)
values((select nvl(max(no),0)+1 as no from img), '테스트3', '1234', '이미지3', '내용3', sysdate);
insert into img(no, title,passwd, fname, content, wdate)
values((select nvl(max(no),0)+1 as no from img), '테스트4', '1234', '이미지4', '내용4', sysdate);
insert into img(no, title,passwd, fname, content, wdate)
values((select nvl(max(no),0)+1 as no from img), '테스트5', '1234', '이미지5', '내용5', sysdate);
insert into img(no, title,passwd, fname, content, wdate)
values((select nvl(max(no),0)+1 as no from img), '테스트6', '1234', '이미지6', '내용6', sysdate);
insert into img(no, title,passwd, fname, content, wdate)
values((select nvl(max(no),0)+1 as no from img), '테스트7', '1234', '이미지7', '내용7', sysdate);

update img set fname='이미지1.jpg' where no =1;
update img set fname='이미지2.jpg' where no =2;
update img set fname='이미지3.jpg' where no =3;
update img set fname='이미지4.jpg' where no =4;
update img set fname='이미지5.jpg' where no =5;
update img set fname='이미지6.jpg' where no =6;
update img set fname='이미지7.jpg' where no =7;

--read
select no, title, content, wdate, viewcnt from img 
where no = 1

select * from img;

--조회수증가
update img
set viewcnt = viewcnt + 1
where no = 1;


--list
select no, fname, title, viewcnt, wdate, 
		grpno, indent, ansnum, r
from(
	select no, fname, title, viewcnt, wdate, 
		grpno, indent, ansnum, rownum as r
	from(
		select no, fname, title, viewcnt, to_char(wdate,'yyyy-mm-dd') as wdate, 
		grpno, indent, ansnum
		from img
		order by grpno desc, ansnum
	)
)where r>=6 and r<=10



select no, fname, title, viewcnt, wdate,                                 
		grpno, indent, ansnum, r                                          
from(                                                                       
	select no, fname, title, viewcnt, wdate,                               
		grpno, indent, ansnum, rownum as r                                   
	from(                                                                 
		select no, fname, title, viewcnt, to_char(wdate,'yyyy-mm-dd') as wdate, 
		grpno, indent, ansnum                                              
		from img                                                                                                                       
           where  title like  '%미지%'                             
		order by wdate desc                                                 
	)                                                                       
)where r>=1 and r<=5                                              
