alter table team;
drop table team;
create table team(
	no 		number 			not null,
	name		varchar(30)		not null,
	gender		varchar(6)		not null,
	hobby		varchar(300)	not null,
	skills		varchar(300)	not null,
	phone 		varchar(30)		not null,
	zipcode		varchar(5),
	address 	varchar(800),
	address2	varchar(800),
	primary key(no)
);

delete from team;
alter table team
add(refnum number default 0)

add(grpno number default 0,
	indent number default 0,
	ansnum number default 0)

select nvl(max(no),0)+1 from team
insert into team(no,name,gender,hobby,skills,phone,zipcode,address,address2)
values( (select nvl(max(no),0)+1 from team),'홍길동','남자','영화','Java,JSP','010-1111-5222','12345','서울시 종로구 관철동','123 코아빌딩 5층'
)
insert into team(no,name,gender,hobby,skills,phone,zipcode,address,address2)
values( (select nvl(max(no),0)+1 from team),'가길동','남자','영화','Java,JSP','010-1111-5222','12345','서울시 종로구 관철동','123 코아빌딩 5층'
)
insert into team(no,name,gender,hobby,skills,phone,zipcode,address,address2)
values( (select nvl(max(no),0)+1 from team),'나길동','남자','영화','Java,JSP','010-1111-5222','12345','서울시 종로구 관철동','123 코아빌딩 5층'
)


--read
select * from team where no=1
select * from team 
update team 
set 
	name= '라길동' ,
	gender= '여자',	
	hobby='게임' , 
	skills= 'Java,JSP,MVC' ,
	phone= '010-9999-8888',
	zipcode='00000' ,
	address='서울시 서초구 ' , 
	address2='12345'
where no=1


delete from team where no=1
--list
select no,name,gender,skills,phone 
from team 
order by no desc

select * From team;



