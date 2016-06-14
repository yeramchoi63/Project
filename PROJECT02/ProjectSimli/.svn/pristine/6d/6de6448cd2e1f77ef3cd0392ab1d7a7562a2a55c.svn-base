---------예  약---------
----------------------
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

alter table reservation add ( patron varchar2(20));
select * from reservation;

----예약 스퀀스--------------------------
create sequence r_sequence;

---------스케줄-------------------------------
create table schedule(
employeeid varchar2(20),
mon_s number,
mon_e number,
tue_s number,
tue_e number,
wed_s number,
wed_e number,
thu_s number,
thu_e number,
fri_s number,
fri_e number,
sat_s number,
sat_e number
);
-----------조회-------------------
select * from reservation;
select * from schedule;
-----------삭제-------------------
delete from reservation;
delete from SCHEDULE;
------------------------------------
drop table reservation;
drop table schedule;
---------------------------------
update reservation set employeeid = 'lee' where appointday=20160502 and appointtime=900;
--------------------테스트 select문----------------------------
select * from RESERVATION where appointtime<'1000';
select * from schedule where Mon_s=900; 
insert into schedule(employeeid,mon_s)values('aa',900);
--------------------------------------------------------------------------------
insert into reservation(appointday,appointtime,memberconsult,memberid,employeeid)
values(5,5,'online','allfreenew','test','');
---------------------------------------------------------------------------------
insert into reservation(appointday,appointtime,memberconsult,memberid,employeeid)
values(20160531,1100,'online','freenew','lee');
insert into reservation(appointday,appointtime,memberconsult,memberid,employeeid)
values(20160601,1400,'offline','abcdefg','choi');
insert into reservation(appointday,appointtime,memberconsult,memberid,employeeid)
values(20160602,1500,'online','aaa123','park');
---------------------------------------------------------------------------------
insert into schedule values('employee',0900,1800,0900,1800,0900,1800,0900,1800,1000,1400,1300,1700);
insert into schedule values('choi',0900,1800,0900,1700,0900,1700,0900,1700,0900,1700,0900,1700);
insert into schedule values('p',0900,1500,1000,1500,1000,2100,1300,1800,1300,2000,0900,1200);
-----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
insert into reservation(appointday,appointtime,memberconsult,memberid,employeeid)
values('2016-01-01',5,'online','allfreenew','test','');
-------------------------------------------------------------------------------------
SELECT * FROM RESERVATION;
select * from RESERVATION where APPOINTDAY =  to_date('2016-05-21', 'yyyy-mm-dd') order by appointtime ; --약속날짜 와 약속시간 내림차순으로 스케줄 생성
SELECT * from RESERVATION where CURRENTDAY = to_date('2016-06-02','yyyy-mm-dd');

select * from reservation where resertype like '%%상담' order by RESERVATION DESC appointday;



insert into reservation(num,memberid,employeeid,currentday,appointday,appointtime,memberconsult,appointweek,categoryprice,appointcheck)
	values(r_sequence.NEXTVAL,'test','aa',sysdate,to_date('2016-06-06','yyyy-mm-dd'),1700,'online','Mon','50000','waiting');

	
	insert into reservation(num,memberid,employeeid,currentday,appointday,appointtime,memberconsult,appointweek,categoryprice,appointcheck)
   values(r_sequence.NEXTVAL,'test','aa',sysdate,to_date('2016-06-06','yyyy-mm-dd'),1700,'online','Mon','50000','waiting');

   
   
   select * from reservation where resertype = '상담' and memberid = 'user';
   
   
   select * from reservation where employeeid = 'iovot'