------------------------  공지사항 -----------------------------------------------
select *from notice;      
CREATE SEQUENCE NOTICE_SEQ;
create table notice(
   nonum number,
   notitle varchar2(1000),
   nocontent varchar2(1000),
   noname varchar2(1000),
   nodate Date
);
INSERT INTO NOTICE VALUES ( NOTICE_SEQ.NEXTVAL, 'df', 'fff','fff',SYSDATE);
DROP TABLE NOTICE
CREATE SEQUENCE NOTICE_SEQ;
DROP SEQUENCE NOTICE_SEQ;
select notitle, nocontent from notice where nonum = 1

delete NOTICE where ONnum = 1;




-------------------------  온라인상담게시판  ---------------------------------------
delete  ONLINEBOARD where ONCONTENT='aasas'
SELECT *FROM ONLINEBOARD;
DROP TABLE ONLINEBOARD;
CREATE TABLE ONLINEBOARD(
   ONNUM NUMBER,
   ONTITLE VARCHAR2(1000),
   ONCONTENT VARCHAR2(1000),
  ONNAME VARCHAR2(1000),
   ONDATE DATE,
   ONGROUP NUMBER,
   ONSTEP NUMBER,
  ONINDENT NUMBER
   );
    insert into ONLINEBOARD (ONnum, ONname, ONtitle, ONcontent, ONgroup, ONstep, ONindent, ONDATE) values (counselling_seq.nextval,'sss', '[�亯] ����', 'dfdf',  counselling_seq.currval, 0, 0, sysdate)

CREATE SEQUENCE ONLINEBOARD_SEQ;

INSERT INTO COUNSELLING (ONNUM, ONTITLE, ONCONTENT, ONNAME, ONDATE) 
                                    VALUES (ONLINEBOARD_SEQ.NEXTVAL, 'xx', 'sdsd.', 'sdsd', SYSDATE, )

     --컬럼 추가시?--
   alter table counselling add (ONgroup number, ONstep number, ONindent number)
                         select * from ONLINEBOARD order by ONgroup desc , ONstep asc          
                         
                         
                         select ONnum, ONtitle, ONcontent, ONname, ONDATE, ONgroup, ONstep, ONindent from ONLINEBOARD order by ONgroup desc, ONstep asc

                         select ONnum, ONname, ONtitle, ONcontent, ONgroup, ONstep, ONindent, ONDATE  from ONLINEBOARD order by ONgroup desc, ONstep asc
                         
                         
                   