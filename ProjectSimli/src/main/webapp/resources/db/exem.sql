select*from exem order by exnum desc;

drop table exem;
create table exem(
exnum number,
extitle varchar2(20),
exname varchar2(20),
excon varchar2(20)
);

insert into exem (exnum, extitle, exname, excon) values(1, 'ff', 'ffff', 'ffff');
insert into exem (exnum, extitle, exname, excon) values(2, 'aa', 'aaa', 'aaaa');
insert into exem (exnum, extitle, exname, excon) values(3, 'ddd', 'dddd', 'ddddd');