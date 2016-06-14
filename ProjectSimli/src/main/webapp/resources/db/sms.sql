select * from smstable;

drop table smstable;

create table smstable(
num number,
fromid varchar2(100),
smstitle varchar2(100),
smscon varchar2(100),
smstime date,
toid varchar2(100),
smsread varchar2(100)
);

select count(*) from smstable where toid = 'user' and smsread = 'no'

create sequence sms_seq;

insert into sms(smstime, num, fromid,smstitle,smscon,toid)
values(sysdate, sms_seq.nextval, #{fromid}, #{smstitle}, #{smscon}, #{toid});

select * from smstable where toid = 'iovot' order by smstime desc