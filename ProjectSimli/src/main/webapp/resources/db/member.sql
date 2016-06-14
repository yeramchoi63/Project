drop table membertable;
drop table role;	

drop sequence membertable_seq;
drop sequence role_seq;
		
select*from membertable;
select*from role;

create table membertable(
	id varchar2(30) not null  primary key,
	pwd varchar2(30) not null,
	name varchar2(30) not null ,
	email varchar2(50) not null ,
	phone varchar2(30) not null ,
	gender varchar2(10) not null ,
	birth varchar2(30) not null ,
	addr varchar2(100) not null ,
	therapy1 varchar2(30),
	therapy2 varchar2(30),
	therapy3 varchar2(30),
	part varchar2(100),
	mem_date date
);
create sequence membertable_seq;

create table role(
	id varchar2 (30),
	role_name varchar2 (30)
);
create sequence role_seq;

		insert into membertable
		(id, pwd, name, email, phone,
		gender, birth, addr, mem_date)
		values ('admin', '1111', '관리자', 'admin@admin.com', '010-1234-1234', '양성', '1987-01-01',
		'서울특별시 강남구 대치동 땡떙아파티 1004동 1818동 2828호', sysdate);

		insert into membertable
		(id, pwd, name, email, phone,
		gender, birth, addr, mem_date)
		values ('employee', '1111', 'employee', 'employee@employee.com', '010-1234-1234', '양성', '1987-01-01',
		'서울특별시 강남구 대치동 땡떙아파티 1004동 1818동 2828호', sysdate);
		
		insert into membertable
		(id, pwd, name, email, phone,
		gender, birth, addr, mem_date)
		values ('user', '1111', 'user', 'user@user.com', '010-1234-1234', '양성', '1987-01-01',
		'서울특별시 강남구 대치동 땡떙아파티 1004동 1818동 2828호', sysdate);
		
		insert into role (id, role_name) values('admin', 'ROLE_ADMIN');
		insert into role (id, role_name) values('admin', 'ROLE_EMPLOYEE');
		insert into role (id, role_name) values('admin', 'ROLE_USER');
		
		insert into role (id, role_name) values('employee', 'ROLE_PKEMPLOYEE');
		insert into role (id, role_name) values('employee', 'ROLE_EMPLOYEE');
		insert into role (id, role_name) values('employee', 'ROLE_USER');
		
		insert into role (id, role_name) values('user', 'ROLE_PKUSER');
		insert into role (id, role_name) values('user', 'ROLE_USER');