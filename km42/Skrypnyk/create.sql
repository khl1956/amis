--------------------------------------------------------
--  File created - Monday-January-08-2018   
--------------------------------------------------------
DROP TABLE "BANK" cascade constraints;
DROP TABLE "CLIENTS" cascade constraints;
DROP TABLE "MANAGER" cascade constraints;
DROP TABLE "OPERATIONS" cascade constraints;
DROP TABLE "SCORE" cascade constraints;
DROP TABLE "TYPE_SCORE" cascade constraints;
--------------------------------------------------------
--  DDL for Table BANK
--------------------------------------------------------

  CREATE TABLE "BANK" 
   (	"NUMBER_FILIA" NUMBER, 
	"ID_FILIA" NUMBER(*,0), 
	"ADRESS" VARCHAR2(20 BYTE)
   )
--------------------------------------------------------
--  DDL for Table CLIENTS
--------------------------------------------------------

  CREATE TABLE "CLIENTS" 
   (	"ID" NUMBER(10,0), 
	"LOGIN" VARCHAR2(15 BYTE), 
	"PASSWORD" VARCHAR2(15 BYTE), 
	"FILL" VARCHAR2(12 BYTE), 
	"PASSPORT" VARCHAR2(10 BYTE), 
	"STREET" VARCHAR2(20 BYTE), 
	"SURNAME" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"MIDDLENAME" VARCHAR2(15 BYTE), 
	"PHONE" NUMBER(15,0), 
	"EMAIL" VARCHAR2(15 BYTE), 
	"IDENTIFIICATION_CODE" NUMBER(15,0), 
	"SEX" NUMBER(1,0), 
	"BUD" VARCHAR2(5 BYTE), 
	"KV" VARCHAR2(5 BYTE)
   )
--------------------------------------------------------
--  DDL for Table MANAGER
--------------------------------------------------------

  CREATE TABLE "MANAGER" 
   (	"ID" NUMBER(10,0), 
	"LOGIN" VARCHAR2(15 BYTE), 
	"PASSWORD" VARCHAR2(15 BYTE), 
	"ADMIN" NUMBER(*,0), 
	"FILL" VARCHAR2(10 BYTE), 
	"NAME_SURNAME" VARCHAR2(10 BYTE)
   )
--------------------------------------------------------
--  DDL for Table OPERATIONS
--------------------------------------------------------

  CREATE TABLE "OPERATIONS" 
   (	"ID_OPER" NUMBER(*,0), 
	"DATE_OPER" DATE, 
	"SUM_OPER" NUMBER, 
	"TYPE_OPER" NUMBER, 
	"ID_MANAGER" NUMBER, 
	"ID_SCORE" NUMBER
   )
--------------------------------------------------------
--  DDL for Table SCORE
--------------------------------------------------------

  CREATE TABLE "SCORE" 
   (	"NUMBER_SCORE" NUMBER, 
	"OPENING_DATE" DATE, 
	"CLOSING_DATE" DATE, 
	"ID_MANAGER" NUMBER(*,0), 
	"CODE_TYPE" NUMBER, 
	"ID_CLIENTS" NUMBER, 
	"ID_FILIA" NUMBER
   )
--------------------------------------------------------
--  DDL for Table TYPE_SCORE
--------------------------------------------------------

  CREATE TABLE "TYPE_SCORE" 
   (	"CODE_TYPE" NUMBER, 
	"NAME_TYPE" VARCHAR2(10 BYTE)
   )
--------------------------------------------------------
--  Constraints for Table BANK
--------------------------------------------------------

  ALTER TABLE "BANK" ADD CONSTRAINT "BANK_PK" PRIMARY KEY ("ID_FILIA") ENABLE
  ALTER TABLE "BANK" MODIFY ("ADRESS" NOT NULL ENABLE)
  ALTER TABLE "BANK" MODIFY ("ID_FILIA" NOT NULL ENABLE)
  ALTER TABLE "BANK" MODIFY ("NUMBER_FILIA" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table OPERATIONS
--------------------------------------------------------

  ALTER TABLE "OPERATIONS" ADD CONSTRAINT "OPERATIONS_PK" PRIMARY KEY ("ID_OPER") ENABLE
  ALTER TABLE "OPERATIONS" MODIFY ("ID_SCORE" NOT NULL ENABLE)
  ALTER TABLE "OPERATIONS" MODIFY ("ID_MANAGER" NOT NULL ENABLE)
  ALTER TABLE "OPERATIONS" MODIFY ("TYPE_OPER" NOT NULL ENABLE)
  ALTER TABLE "OPERATIONS" MODIFY ("SUM_OPER" NOT NULL ENABLE)
  ALTER TABLE "OPERATIONS" MODIFY ("DATE_OPER" NOT NULL ENABLE)
  ALTER TABLE "OPERATIONS" MODIFY ("ID_OPER" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table CLIENTS
--------------------------------------------------------

  ALTER TABLE "CLIENTS" MODIFY ("BUD" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" MODIFY ("SEX" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" MODIFY ("IDENTIFIICATION_CODE" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" MODIFY ("MIDDLENAME" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" MODIFY ("NAME" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" MODIFY ("SURNAME" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" ADD CONSTRAINT "CLIENTS_PK" PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "CLIENTS" MODIFY ("STREET" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" MODIFY ("PASSPORT" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" MODIFY ("FILL" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" MODIFY ("PASSWORD" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" MODIFY ("LOGIN" NOT NULL ENABLE)
  ALTER TABLE "CLIENTS" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table TYPE_SCORE
--------------------------------------------------------

  ALTER TABLE "TYPE_SCORE" ADD CONSTRAINT "TYPE_SCORE_PK" PRIMARY KEY ("CODE_TYPE") ENABLE
  ALTER TABLE "TYPE_SCORE" MODIFY ("NAME_TYPE" NOT NULL ENABLE)
  ALTER TABLE "TYPE_SCORE" MODIFY ("CODE_TYPE" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table MANAGER
--------------------------------------------------------

  ALTER TABLE "MANAGER" MODIFY ("ADMIN" NOT NULL ENABLE)
  ALTER TABLE "MANAGER" MODIFY ("NAME_SURNAME" NOT NULL ENABLE)
  ALTER TABLE "MANAGER" ADD CONSTRAINT "MANAGER_PK" PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "MANAGER" MODIFY ("FILL" NOT NULL ENABLE)
  ALTER TABLE "MANAGER" MODIFY ("PASSWORD" NOT NULL ENABLE)
  ALTER TABLE "MANAGER" MODIFY ("LOGIN" NOT NULL ENABLE)
  ALTER TABLE "MANAGER" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table SCORE
--------------------------------------------------------

  ALTER TABLE "SCORE" MODIFY ("ID_FILIA" NOT NULL ENABLE)
  ALTER TABLE "SCORE" MODIFY ("ID_CLIENTS" NOT NULL ENABLE)
  ALTER TABLE "SCORE" ADD CONSTRAINT "SCORE_PK" PRIMARY KEY ("NUMBER_SCORE") ENABLE
  ALTER TABLE "SCORE" MODIFY ("CODE_TYPE" NOT NULL ENABLE)
  ALTER TABLE "SCORE" MODIFY ("OPENING_DATE" NOT NULL ENABLE)
  ALTER TABLE "SCORE" MODIFY ("NUMBER_SCORE" NOT NULL ENABLE)
  ALTER TABLE "SCORE" MODIFY ("ID_MANAGER" NOT NULL ENABLE)
