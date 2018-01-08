--------------------------------------------------------
--  File created - Monday-January-08-2018   
--------------------------------------------------------
REM INSERTING into SSARTEMS.BANK
SET DEFINE OFF;
Insert into SSARTEMS.BANK (NUMBER_FILIA,ADRESS) values (65484,'Проспект Перемоги 10');
Insert into SSARTEMS.BANK (NUMBER_FILIA,ADRESS) values (44645,'вул. Тараса Шевченка 15');
REM INSERTING into SSARTEMS.CLIENTS
SET DEFINE OFF;
Insert into SSARTEMS.CLIENTS (LOGIN,PASSWORD,PASSPORT,STREET,SURNAME,NAME,MIDDLENAME,PHONE,EMAIL,IDENTIFIICATION_CODE,BUD,KV) values ('SS','SS','АЮ15461','Сонячна','Дмитрук','Назар','Ільїч',3806487651,null,65661841,'1',null);
Insert into SSARTEMS.CLIENTS (LOGIN,PASSWORD,PASSPORT,STREET,SURNAME,NAME,MIDDLENAME,PHONE,EMAIL,IDENTIFIICATION_CODE,BUD,KV) values ('Satir','pSatir','МВ324236','Крупської','Терешин','Андрій','Іванович',380751423654,'Satir@ukr.net',931484654,'6','455');
REM INSERTING into SSARTEMS.MANAGER
SET DEFINE OFF;
Insert into SSARTEMS.MANAGER (LOGIN,PASSWORD,ADMIN,FILL,NAME_SURNAME) values ('Jenkins','pJenkins',2,'65484','Медведчук Валентин');
Insert into SSARTEMS.MANAGER (LOGIN,PASSWORD,ADMIN,FILL,NAME_SURNAME) values ('Man','pMan',1,'44645','Кричук Дмитро');
REM INSERTING into SSARTEMS.OPERATIONS
SET DEFINE OFF;
REM INSERTING into SSARTEMS.SCORE
SET DEFINE OFF;
REM INSERTING into SSARTEMS.TYPE_SCORE
SET DEFINE OFF;
Insert into SSARTEMS.TYPE_SCORE (CODE_TYPE,NAME_TYPE) values (1,'Cript');
Insert into SSARTEMS.TYPE_SCORE (CODE_TYPE,NAME_TYPE) values (2,'usual');
