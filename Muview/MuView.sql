--------------------------------------------------------
--  파일이 생성됨 - 금요일-12월-18-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence NO
--------------------------------------------------------

   CREATE SEQUENCE  "WEB"."NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 241 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table BCOMMENT
--------------------------------------------------------

  CREATE TABLE "WEB"."BCOMMENT" 
   (	"COMMENTDATE" DATE, 
	"CMT" NVARCHAR2(200), 
	"NO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "WEB_TS" ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "WEB"."BOARD" 
   (	"NO" VARCHAR2(10 BYTE), 
	"TITLE" VARCHAR2(30 BYTE), 
	"WRITER" NVARCHAR2(30), 
	"CONTENT" NVARCHAR2(400), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "WEB_TS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "WEB"."MEMBER" 
   (	"ID" VARCHAR2(10 BYTE), 
	"PWD" VARCHAR2(10 BYTE), 
	"NAME" VARCHAR2(50 BYTE), 
	"EMAIL" NVARCHAR2(50), 
	"JOINDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "WEB_TS" ;
REM INSERTING into WEB.BCOMMENT
SET DEFINE OFF;
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/14','RR/MM/DD'),null,null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'asd',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'asdzxzxcasdsa',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'asd',221);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'zxc',221);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'테스트입니다',221);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'테스트입니다',221);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'테스트해봅시다',161);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'두번째 테스트',161);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'ㅁㅊㅋㅌㅊ',221);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'카카오톡',104);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'카톡카톡',104);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'zxc',201);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'zz',221);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'글 번호로 인식해서 해당 글 번호에서 작성한 댓글목록만 불러옵니다',161);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'test',221);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/14','RR/MM/DD'),null,null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/14','RR/MM/DD'),null,null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/14','RR/MM/DD'),null,null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/14','RR/MM/DD'),'asd',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/15','RR/MM/DD'),null,null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'asd',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'댓글을 남겨주세요!',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/14','RR/MM/DD'),null,null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'zz',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'zxccccc',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'zxc',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'asd',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'asd',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'zxc',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'asdsad',null);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'zzzzzzzzzzzzzzzzz',221);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'zxc',201);
Insert into WEB.BCOMMENT (COMMENTDATE,CMT,NO) values (to_date('20/12/16','RR/MM/DD'),'asd',221);
REM INSERTING into WEB.BOARD
SET DEFINE OFF;
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REGDATE) values ('223',null,null,null,to_date('20/12/16','RR/MM/DD'));
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REGDATE) values ('222',null,null,null,to_date('20/12/16','RR/MM/DD'));
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REGDATE) values ('181','test2','ttest','<p>tes2tes2</p>
',to_date('20/12/16','RR/MM/DD'));
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REGDATE) values ('104','ㅅㄷㄴㅅ','ㅅㄷㄴㅅ',null,to_date('20/11/11','RR/MM/DD'));
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REGDATE) values ('102','ㅁㅁㅁ','ㅁㅁㅁㅁ','<p>김대관 테스트 합니다2</p>
',to_date('20/11/11','RR/MM/DD'));
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REGDATE) values ('161','장범준-오래된노래','김대관','<p><iframe allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" frameborder="0" height="538" src="https://www.youtube.com/embed/zdcGGB4qBgA" width="956"></iframe></p>
',to_date('20/12/13','RR/MM/DD'));
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REGDATE) values ('224',null,null,null,to_date('20/12/16','RR/MM/DD'));
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REGDATE) values ('201','test1','asd','<p>test1</p>
',to_date('20/12/16','RR/MM/DD'));
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REGDATE) values ('225',null,null,null,to_date('20/12/16','RR/MM/DD'));
REM INSERTING into WEB.MEMBER
SET DEFINE OFF;
Insert into WEB.MEMBER (ID,PWD,NAME,EMAIL,JOINDATE) values ('gildong','1111','홍길동','gildong@naver.com',to_date('20/10/16','RR/MM/DD'));
Insert into WEB.MEMBER (ID,PWD,NAME,EMAIL,JOINDATE) values ('aaa','1234','1234',null,to_date('20/12/12','RR/MM/DD'));
Insert into WEB.MEMBER (ID,PWD,NAME,EMAIL,JOINDATE) values ('zzz','123','1234',null,to_date('20/12/12','RR/MM/DD'));
Insert into WEB.MEMBER (ID,PWD,NAME,EMAIL,JOINDATE) values ('1234','1234','1234',null,to_date('20/12/15','RR/MM/DD'));
Insert into WEB.MEMBER (ID,PWD,NAME,EMAIL,JOINDATE) values ('daegwan','1234','1234',null,to_date('20/12/16','RR/MM/DD'));
