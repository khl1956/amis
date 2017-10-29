/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     10/29/2017 10:45:23 PM                       */
/*==============================================================*/


alter table INSTRUCTOR_SPORT
   drop constraint FK_INSTRUCT_TO_INSTRSPORT;

alter table INSTRUCTOR_SPORT
   drop constraint FK_SPORT_TO_INSTRSPORT;

alter table LOCATION
   drop constraint FK_LOCATION_TO_TYPE;

alter table TRAINING
   drop constraint FK_INSTR_SPORT_TO_TRAINING;

alter table TRAINING
   drop constraint FK_TRAINING_LOCATION;

alter table TRAINING
   drop constraint FK_TRAINING_USER;

drop table INSTRUCTOR cascade constraints;

drop index SPORT_IS_KNOWN_BY_INSTR_FK;

drop index INSTR_SPECIALIZED_ON_SPORT_FK;

drop table INSTRUCTOR_SPORT cascade constraints;

drop index RELATIONSHIP_4_FK;

drop table LOCATION cascade constraints;

drop table LOCATION_TYPE cascade constraints;

drop table SPORT cascade constraints;

drop index INSTRUCTOR_TRAINEE_USER_FK;

drop index USER_IS_TRAINING_FK;

drop index TRAINING_ON_THE_LOCATION_FK;

drop table TRAINING cascade constraints;

drop table "USER" cascade constraints;

/*==============================================================*/
/* Table: INSTRUCTOR                                            */
/*==============================================================*/
create table INSTRUCTOR 
(
   INSTRUCTOR_EMAIL     CHAR(256)            not null,
   INSTRUCTOR_FIRSTNAME CHAR(256)            not null,
   INSTRUCTOR_LASTNAME  CHAR(256)            not null,
   INSTRUCTOR_QUALIFICATION CHAR(1024)           not null,
   INSTRUCTOR_PHONE     CHAR(20)             not null,
   INSTRUCTOR_BIRTHDAY  DATE,
   INSTRUCTOR_SERTIFICATION1 CHAR(1024),
   INSTRUCTOR_MEDIC_EDUC SMALLINT,
   INSTRUCTOR_CAREER_START DATE,
   INSTRUCTOR_EXTRA_INFO CHAR(1024),
   INSTRUCTOR_PAYMENT   NUMBER(8,2),
   constraint PK_INSTRUCTOR primary key (INSTRUCTOR_EMAIL)
);

/*==============================================================*/
/* Table: INSTRUCTOR_SPORT                                      */
/*==============================================================*/
create table INSTRUCTOR_SPORT 
(
   SPORT_NAME           CHAR(256)            not null,
   INSTRUCTOR_EMAIL     CHAR(256)            not null,
   constraint PK_INSTRUCTOR_SPORT primary key (SPORT_NAME, INSTRUCTOR_EMAIL)
);

/*==============================================================*/
/* Index: INSTR_SPECIALIZED_ON_SPORT_FK                         */
/*==============================================================*/
create index INSTR_SPECIALIZED_ON_SPORT_FK on INSTRUCTOR_SPORT (
   INSTRUCTOR_EMAIL ASC
);

/*==============================================================*/
/* Index: SPORT_IS_KNOWN_BY_INSTR_FK                            */
/*==============================================================*/
create index SPORT_IS_KNOWN_BY_INSTR_FK on INSTRUCTOR_SPORT (
   SPORT_NAME ASC
);

/*==============================================================*/
/* Table: LOCATION                                              */
/*==============================================================*/
create table LOCATION 
(
   LOC_ID               INTEGER              not null,
   LOC_TYPE_NAME        VARCHAR2(1024)       not null,
   LOC_NAME             VARCHAR2(256)        not null,
   LOC_ADDRESS          VARCHAR2(100)        not null,
   LOC_AREA             FLOAT,
   LOC_WATER            SMALLINT,
   LOC_INSTUM           SMALLINT,
   LOC_PAYMENT          NUMBER(8,2),
   LOC_POOL             SMALLINT,
   LOC_RACE_TRACK       SMALLINT,
   LOC_OPEN_TIME        DATE,
   LOC_CLOSE_TIME       DATE,
   constraint PK_LOCATION primary key (LOC_ID)
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on LOCATION (
   LOC_TYPE_NAME ASC
);

/*==============================================================*/
/* Table: LOCATION_TYPE                                         */
/*==============================================================*/
create table LOCATION_TYPE 
(
   LOC_TYPE_NAME        VARCHAR2(1024)       not null,
   constraint PK_LOCATION_TYPE primary key (LOC_TYPE_NAME)
);

/*==============================================================*/
/* Table: SPORT                                                 */
/*==============================================================*/
create table SPORT 
(
   SPORT_NAME           CHAR(256)            not null,
   constraint PK_SPORT primary key (SPORT_NAME)
);

/*==============================================================*/
/* Table: TRAINING                                              */
/*==============================================================*/
create table TRAINING 
(
   USER_EMAIL           CHAR(300)            not null,
   LOC_ID               INTEGER              not null,
   TRAINING_DATE        DATE                 not null,
   SPORT_NAME           CHAR(256),
   INSTRUCTOR_EMAIL     CHAR(256),
   constraint PK_TRAINING primary key (USER_EMAIL, LOC_ID, TRAINING_DATE)
);

/*==============================================================*/
/* Index: TRAINING_ON_THE_LOCATION_FK                           */
/*==============================================================*/
create index TRAINING_ON_THE_LOCATION_FK on TRAINING (
   LOC_ID ASC
);

/*==============================================================*/
/* Index: USER_IS_TRAINING_FK                                   */
/*==============================================================*/
create index USER_IS_TRAINING_FK on TRAINING (
   USER_EMAIL ASC
);

/*==============================================================*/
/* Index: INSTRUCTOR_TRAINEE_USER_FK                            */
/*==============================================================*/
create index INSTRUCTOR_TRAINEE_USER_FK on TRAINING (
   SPORT_NAME ASC,
   INSTRUCTOR_EMAIL ASC
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" 
(
   USER_EMAIL           CHAR(300)            not null,
   USER_FIRSTNAME       CHAR(256)            not null,
   USER_LASTNAME        CHAR(256)            not null,
   USER_PASS            CHAR(50)             not null,
   USER_BIRTHDAY        DATE,
   USER_PHONE           DATE,
   constraint PK_USER primary key (USER_EMAIL)
);

alter table INSTRUCTOR_SPORT
   add constraint FK_INSTRUCT_TO_INSTRSPORT foreign key (INSTRUCTOR_EMAIL)
      references INSTRUCTOR (INSTRUCTOR_EMAIL);

alter table INSTRUCTOR_SPORT
   add constraint FK_SPORT_TO_INSTRSPORT foreign key (SPORT_NAME)
      references SPORT (SPORT_NAME);

alter table LOCATION
   add constraint FK_LOCATION_TO_TYPE foreign key (LOC_TYPE_NAME)
      references LOCATION_TYPE (LOC_TYPE_NAME);

alter table TRAINING
   add constraint FK_INSTR_SPORT_TO_TRAINING foreign key (SPORT_NAME, INSTRUCTOR_EMAIL)
      references INSTRUCTOR_SPORT (SPORT_NAME, INSTRUCTOR_EMAIL);

alter table TRAINING
   add constraint FK_TRAINING_LOCATION foreign key (LOC_ID)
      references LOCATION (LOC_ID);

alter table TRAINING
   add constraint FK_TRAINING_USER foreign key (USER_EMAIL)
      references "USER" (USER_EMAIL);

