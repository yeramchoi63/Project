--membertable--
select * from membertable;
truncate table membertable;
--상담사/치료사 등록

insert into membertable values('emp1','1111','김상담','kim@gmail.com','010-1234-5678','여자','19891123',
	'경기도','','','','상담사',sysdate);
insert into membertable values('emp3','1111','최상담','choi@gmail.com','010-3608-1426','여자','19901123',
	'성남시','상담치료','','','상담사',sysdate);
insert into membertable values('emp2','1111','박치료','park@gmail.com','010-1234-5679','남자','19991123',
	'서울시','언어치료','','','치료사',sysdate);
insert into membertable values('emp4','1111','정치료','jeng@gmail.com','010-3608-1427','남자','19941123',
	'파주시','미술치료','','','치료사',sysdate);
--내담자 등록
insert into membertable values('user1','1111','신내담','sin@gmail.com','010-3608-1427','여자','19951123',
	'파주시','','','','내담자',sysdate);
--관리자 등록
insert into membertable values('admin','1111','관리자','sin@gmail.com','010-3608-1427','여자','19951123',
	'파주시','','','','관리자',sysdate);
--role--
insert into role values('emp1','ROLE_PKEMPLOYEE');
insert into role values('emp2','ROLE_PKEMPLOYEE');
insert into role values('emp3','ROLE_PKEMPLOYEE');
insert into role values('emp4','ROLE_PKEMPLOYEE');
insert into role values('user1','ROLE_PKUSER');
--reservation
select * from reservation;
truncate table reservation;

create table reservation(
num number,
memberid varchar2(20),
currentday date,
appointday date,
appointweek varchar2(20),
appointtime number,
memberconsult varchar2(20),
employeeid varchar2(20),
ref varchar2(50),
appointcheck varchar2(10), --취소확인용
resertype varchar2(20),
categoryprice number,
consulttype varchar2(20) --개인/집단 유무
);

insert into reservation values(r_sequence.NEXTVAL,'user1',sysdate,to_date('2016-01-02','yyyy-mm-dd'),'월',1000,'채팅',
	'emp1','비고란','Y','상담',100000,'');
insert into reservation values(r_sequence.NEXTVAL,'user1',sysdate,to_date('2016-02-02','yyyy-mm-dd'),'화',1000,'내방',
	'emp2','비고란','Y','언어치료','집단',150000,'parent1');
insert into reservation values(r_sequence.NEXTVAL,'user1',sysdate,to_date('2016-03-02','yyyy-mm-dd'),'월',1000,'내방',
	'emp3','비고란','Y','상담치료','개인',100000,'');
insert into reservation values(r_sequence.NEXTVAL,'user1',sysdate,to_date('2016-04-02','yyyy-mm-dd'),'월',1000,'온라인상담',
	'emp4','비고란','Y','미술치료','집단',150000,'parent1');
---------------------------
select categoryprice from(
			select to_char(appointday, 'yyyymmdd') as appointday,employeeid,categoryprice from reservation
		) where employeeid = 'emp1' and appointday like '2016'||'10'||'%' 

		
		SELECT * FROM schedule
		insert into schedule values('emp1',0900,1800,0900,1800,0900,1800,1000,1600,0900,1500,0900,1700);
insert into schedule values('emp2',0900,1800,0900,1800,0900,1800,0900,1700,1000,1700,1000,1700);
insert into schedule values('emp3',0900,1800,0900,1800,0900,1800,0900,1800,1000,1400,1300,1700);


select m.name as
		memname, e.name as empname, floor(m.appointtime/100) as ahour,
		floor(m.appointtime-(m.appointtime/100)*100) as aminute, m.* from
		(select m.name, r.* from membertable m join
		reservation r on m.ID =
		r.MEMBERID) m JOIN (select m.name, r.* from membertable m join
		reservation r on m.ID = r.EMPLOYEEID) e on m.num = e.num where
		m.employeeid = 'emp3';
