/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     12/21/2017 11:00:23 PM                       */
/*==============================================================*/


alter table ALARM
   drop constraint FK_ALARM_SIGNAL;

alter table ALARM
   drop constraint FK_USER_HAS_ALARM;

alter table SIGNAL
   drop constraint FK_ADMIN_ADD__SIGNAL;

alter table "USER"
   drop constraint FK_BE_ADMIN;

drop index ALARM_HAS_A_SIGNAL_FK;

drop index USER_HAS_ALARM_FK;

drop table ALARM cascade constraints;

drop index ADMIN_ADD_NEW_SIGNAL_FK;

drop table SIGNAL cascade constraints;

drop index BE_VIP_USER_FK;

drop table "USER" cascade constraints;

/*==============================================================*/
/* Table: ALARM                                                 */
/*==============================================================*/
create table ALARM 
(
   ALARM_ID             VARCHAR2(40)         not null,
   USER_EMAIL           VARCHAR2(40)         not null,
   SIGNAL_ID            INTEGER              not null,
   TIME_OF_SIGNAL       DATE                 not null,
   TIMER_OF_SIGNAL      INTEGER              not null,
   DURATION             INTEGER              not null,
   SNOOZE               INTEGER              not null,
   VOLUME               INTEGER              not null,
   SUNDAY               SMALLINT             not null,
   MONDAY               SMALLINT             not null,
   TUESDAY              SMALLINT             not null,
   WEDNESDAY            SMALLINT             not null,
   THURSDAY             SMALLINT             not null,
   FRIDAY               SMALLINT             not null,
   SATURDAY             SMALLINT             not null,
   constraint PK_ALARM primary key (SIGNAL_ID, USER_EMAIL, ALARM_ID)
);

/*==============================================================*/
/* Index: USER_HAS_ALARM_FK                                     */
/*==============================================================*/
create index USER_HAS_ALARM_FK on ALARM (
   USER_EMAIL ASC
);

/*==============================================================*/
/* Index: ALARM_HAS_A_SIGNAL_FK                                 */
/*==============================================================*/
create index ALARM_HAS_A_SIGNAL_FK on ALARM (
   SIGNAL_ID ASC
);

/*==============================================================*/
/* Table: SIGNAL                                                */
/*==============================================================*/
create table SIGNAL 
(
   SIGNAL_ID            INTEGER              not null,
   USER_EMAIL           VARCHAR2(40)         not null,
   SIGNAL_NAME          VARCHAR2(25)         not null,
   LENGHT               INTEGER              not null,
   constraint PK_SIGNAL primary key (SIGNAL_ID)
);

/*==============================================================*/
/* Index: ADMIN_ADD_NEW_SIGNAL_FK                               */
/*==============================================================*/
create index ADMIN_ADD_NEW_SIGNAL_FK on SIGNAL (
   USER_EMAIL ASC
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" 
(
   USER_EMAIL           VARCHAR2(40)         not null,
   ADMIN_USER_EMAIL     VARCHAR2(40),
   USER_FIRSTNAME       VARCHAR2(25)         not null,
   USER_SECONDNAME      VARCHAR2(25),
   USER_PASS            VARCHAR2(20)         not null,
   constraint PK_USER primary key (USER_EMAIL)
);

/*==============================================================*/
/* Index: BE_VIP_USER_FK                                        */
/*==============================================================*/
create index BE_VIP_USER_FK on "USER" (
   ADMIN_USER_EMAIL ASC
);

alter table ALARM
   add constraint FK_ALARM_SIGNAL foreign key (SIGNAL_ID)
      references SIGNAL (SIGNAL_ID);

alter table ALARM
   add constraint FK_USER_HAS_ALARM foreign key (USER_EMAIL)
      references "USER" (USER_EMAIL);

alter table SIGNAL
   add constraint FK_ADMIN_ADD__SIGNAL foreign key (USER_EMAIL)
      references "USER" (USER_EMAIL);

alter table "USER"
   add constraint FK_BE_ADMIN foreign key (ADMIN_USER_EMAIL)
      references "USER" (USER_EMAIL);

