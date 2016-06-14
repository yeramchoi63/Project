---------------테이블생성---------------
create table fileupload(
	num number, --글번호
	title varchar2(50), --제목
	writer varchar2(50), --글쓴이
	content  varchar2(4000), --내용
	regdate timestamp, --글작성일
	filesrc varchar2(500), --파일첨부
	category varchar2(30), --카테고리
	employeeid varchar2(20) --담당 상담자/치료자
)
---------------------------------------------
drop table fileupload;
---------------------------------------------
select * from fileupload;
---------------------------------------------
delete from fileupload;
---------------------------------------------
create sequence task_seq;
---------------------------------------------
select * from fileupload;
-------------------------------------------------------------------------------------------------------------
insert into fileupload (num,title,writer,content,regdate)values (task_seq.NEXTVAL,'기본상담 면접자료','관리자','기본상담 면접자료입니다',sysdate);
insert into fileupload (num,title,writer,content,regdate)values (task_seq.NEXTVAL,'자기보고식 검사','관리자','기본상담 면접자료입니다',sysdate);