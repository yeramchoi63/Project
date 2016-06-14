------------------------ ������ �Ұ� ���̺� ------------------------
drop table employeetable;
drop sequence employeetable_seq;

create table employeetable (
	emplid varchar2(1000),
	photo varchar2(1000)
);

create sequence employeetable_seq;
------------------------ �������� ------------------------
drop table notice;
drop sequence notice_nonum;

create table notice(
   nonum number,
   notitle varchar2(1000),
   nocontent varchar2(1000),
   noname varchar2(1000),
   nodate date
);

create sequence notice_nonum;

------------------------ �¶��λ��Խ��� ------------------------
drop table onlineboard;
drop sequence onlineboard_onnum;

create table onlineboard(
 	onnum number,
 	ontitle varchar2(1000),
	oncontent varchar2(1000),
	onname varchar2(1000),
	ondate date,
	ongroup number,
	onstep number,
	onindent number
);
   
create sequence onlineboard_onnum;

------------------------ �߰��÷� ��? ------------------------

	alter table counselling add (ongroup number, onstep number, onindent number)
		select * from onlineboard order by ongroup desc , onstep asc          
                         
	select onnum, ontitle, oncontent, onname, ondate, ongroup, onstep, onindent 
		from onlineboard order by ongroup desc, onstep asc

	select onnum, onname, ontitle, oncontent, ongroup, onstep, onindent, ondate  
		from onlineboard order by ongroup desc, onstep asc
		
		
		
		 insert into membertable
      (id, pwd, name, email, phone,gender, birth, addr, mem_date,part)
      values ('No patron', '1111', '없음', ' ', ' ', ' ', ' ',
      ' ', sysdate, ' ');
      
      
       insert into membertable
      (id, pwd, name, email, phone,
      gender, birth, addr, mem_date)
      values ('emp1', '1111', '신상담', 'user@user.com', '010-1234-1234', '여성', '1987-01-01',
      '서울특별시 강남구 대치동 땡떙아파티 1004동 1818동 2828호', sysdate);
      
      insert into membertable
      (id, pwd, name, email, phone,
      gender, birth, addr, mem_date)
      values ('emp2', '1111', '김상담', 'user@user.com', '010-1234-1234', '여성', '1987-01-01',
      '서울특별시 강남구 대치동 땡떙아파티 1004동 1818동 2828호', sysdate);
      
      insert into membertable
      (id, pwd, name, email, phone,
      gender, birth, addr, mem_date)
      values ('user1', '1111', '박내담', 'user@user.com', '010-1234-1234', '여성', '1987-01-01',
      '서울특별시 강남구 대치동 땡떙아파티 1004동 1818동 2828호', sysdate);
      
      insert into membertable
      (id, pwd, name, email, phone,
      gender, birth, addr, mem_date)
      values ('user2', '1111', '진내담', 'user@user.com', '010-1234-1234', '남성', '1987-01-01',
      '서울특별시 강남구 대치동 땡떙아파티 1004동 1818동 2828호', sysdate);
      
   
      insert into membertable
      (id, pwd, name, email, phone,gender, birth, addr, mem_date,part)
      values ('emp3', '1111', '조상담', 'user@user.com', '010-1234-1234', '여성', '1987-01-01',
      '서울특별시 강남구 대치동 땡떙아파티 1004동 1818동 2828호', sysdate, '상담자');
      
      insert into role (id, role_name) values('emp1', 'ROLE_PKEMPLOYEE');
      insert into role (id, role_name) values('emp1', 'ROLE_EMPLOYEE');
      insert into role (id, role_name) values('emp1', 'ROLE_USER');
      insert into role (id, role_name) values('emp2', 'ROLE_PKEMPLOYEE');
      insert into role (id, role_name) values('emp2', 'ROLE_EMPLOYEE');
      insert into role (id, role_name) values('emp2', 'ROLE_USER');
      insert into role (id, role_name) values('emp3', 'ROLE_EMPLOYEE');
      insert into role (id, role_name) values('emp3', 'ROLE_USER');

      insert into role (id, role_name) values('user', 'ROLE_PKUSER');
      insert into role (id, role_name) values('user', 'ROLE_USER');
      insert into role (id, role_name) values('user1', 'ROLE_PKUSER');
      insert into role (id, role_name) values('user1', 'ROLE_USER');
      insert into role (id, role_name) values('user2', 'ROLE_PKUSER');
      insert into role (id, role_name) values('user2', 'ROLE_USER');