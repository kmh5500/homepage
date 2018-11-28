--create 
insert into address
(no,name,phone,zipcode,address,address2)
values(
	(select nvl(max(no),0)+1 from address),'김태리','010-7878-7878','12345',
	'서울시 종로구 관철동','종로코아빌딩 5층'
)

select * from address
alter table address
add
(	grpno number default 0,
	indent number default 0, 
	ansnum number  default 0,
	refnum number default 0)

--read
select * from address 

--update
update address set phone ='010-4444-4444',
				zipcode ='98765',
				address='경상도',
				address2='구미시 진주읍 5리'
				where no= 1

--delete
delete from address where no = 1

--list

select no,name, phone from address order by no desc



create table address(
	no 		number		   not null,
	name	varchar(20)    not null,
	phone 	varchar(30)	   not null,
	zipcode varchar(6)	   not null,
	address varchar(1000)  not null,
	address2 varchar(1000) null,
	primary key(no)

)