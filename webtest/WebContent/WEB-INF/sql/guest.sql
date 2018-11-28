CREATE table GUEST
(
    num NUMBER PRIMARY KEY,
    name VARCHAR2(20) NOT NULL,
    created DATE DEFAULT SYSDATE,
    content VARCHAR2(4000) NOT NULL,
    ipAddr VARCHAR2(50)
);
select * from guest;