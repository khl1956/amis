/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     07.11.2017 20:49:44                          */
/*==============================================================*/


alter table Schedule
   drop constraint FK_SCHEDULE_HAS_POOL;

alter table Schedule
   drop constraint FK_SCHEDULE_HAS_TEAM;

alter table Tariff_plan
   drop constraint FK_TARIFF_PLAN_HAS_TARIFF;

alter table Tariff_plan
   drop constraint FK_TARIFF_PLAN_HAS_USER;

alter table Team
   drop constraint FK_TEAM_COACH_USER;

alter table Team
   drop constraint FK_TEAM_MEMBER_USER;

alter table "User"
   drop constraint FK_USER_HAS_ROLE;

drop table Pool cascade constraints;

drop table Role cascade constraints;

drop index "has a schedule_FK";

drop index "has a schedule2_FK";

drop table Schedule cascade constraints;

drop table Tariff cascade constraints;

drop index "has a tariff plan_FK";

drop index "has a tariff plan2_FK";

drop table Tariff_plan cascade constraints;

drop index coach_FK;

drop index member_FK;

drop table Team cascade constraints;

drop index "has a role_FK";

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: Pool                                                  */
/*==============================================================*/
create table Pool 
(
   line_id              INTEGER              not null,
   line_number          NUMBER(2)            not null,
   line_length          NUMBER(3)            not null,
   pool_name            VARCHAR2(256)        not null,
   constraint PK_POOL primary key (line_id)
);

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role 
(
   role_name            VARCHAR2(256)        not null,
   role_description     VARCHAR2(1024)       not null,
   constraint PK_ROLE primary key (role_name)
);

/*==============================================================*/
/* Table: Schedule                                              */
/*==============================================================*/
create table Schedule 
(
   line_id_fk           INTEGER              not null,
   member_id_fk         INTEGER              not null,
   coach_id_fk          INTEGER              not null,
   team_name_fk            VARCHAR2(256)        not null,
   day                  DATE                 not null,
   time                 DATE                 not null,
   constraint PK_SCHEDULE primary key (line_id_fk, member_id_fk, coach_id_fk, team_name_fk)
);

/*==============================================================*/
/* Index: "has a schedule2_FK"                                  */
/*==============================================================*/
create index "has a schedule2_FK" on Schedule (
   member_id_fk ASC,
   coach_id_fk ASC,
   team_name_fk ASC
);

/*==============================================================*/
/* Index: "has a schedule_FK"                                   */
/*==============================================================*/
create index "has a schedule_FK" on Schedule (
   line_id_fk ASC
);

/*==============================================================*/
/* Table: Tariff                                                */
/*==============================================================*/
create table Tariff 
(
   tariff_name          VARCHAR2(256)        not null,
   tariff_price         NUMBER(19,4)         not null,
   tariff_subscription_time VARCHAR2(5)      not null,
   constraint PK_TARIFF primary key (tariff_name)
);

/*==============================================================*/
/* Table: Tariff_plan                                           */
/*==============================================================*/
create table Tariff_plan 
(
   tariff_name_fk       VARCHAR2(256)        not null,
   user_id_fk           INTEGER              not null,
   pay_date             DATE                 not null,
   constraint PK_TARIFF_PLAN primary key (tariff_name_fk, user_id_fk)
);

/*==============================================================*/
/* Index: "has a tariff plan2_FK"                               */
/*==============================================================*/
create index "has a tariff plan2_FK" on Tariff_plan (
   user_id_fk ASC
);

/*==============================================================*/
/* Index: "has a tariff plan_FK"                                */
/*==============================================================*/
create index "has a tariff plan_FK" on Tariff_plan (
   tariff_name_fk ASC
);

/*==============================================================*/
/* Table: Team                                                  */
/*==============================================================*/
create table Team 
(
   coach_id_fk          INTEGER              not null,
   member_id_fk         INTEGER              not null,
   team_name            VARCHAR2(256)        not null,
   constraint PK_TEAM primary key (member_id_fk, coach_id_fk, team_name)
);

/*==============================================================*/
/* Index: member_FK                                             */
/*==============================================================*/
create index member_FK on Team (
   coach_id_fk ASC
);

/*==============================================================*/
/* Index: coach_FK                                              */
/*==============================================================*/
create index coach_FK on Team (
   member_id_fk ASC
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   user_id              INTEGER              not null,
   email                VARCHAR2(254)        not null,
   role_name_fk         VARCHAR2(256)        not null,
   first_name           VARCHAR2(256)        not null,
   second_name          VARCHAR2(256)        not null,
   last_name            VARCHAR2(256)        not null,
   birthday             DATE                 not null,
   user_address         VARCHAR2(256)        not null,
   phone_number         VARCHAR2(15)         not null,
   med_doc              BLOB                 not null,
   sport_rank           VARCHAR2(256),
   password             VARCHAR2(256)        not null,
   constraint PK_USER primary key (user_id)
);

/*==============================================================*/
/* Index: "has a role_FK"                                       */
/*==============================================================*/
create index "has a role_FK" on "User" (
   role_name_fk ASC
);

alter table Schedule
   add constraint FK_SCHEDULE_HAS_POOL foreign key (line_id_fk)
      references Pool (line_id);

alter table Schedule
   add constraint FK_SCHEDULE_HAS_TEAM foreign key (member_id_fk, coach_id_fk, team_name_fk)
      references Team (member_id_fk, coach_id_fk, team_name);

alter table Tariff_plan
   add constraint FK_TARIFF_PLAN_HAS_TARIFF foreign key (tariff_name_fk)
      references Tariff (tariff_name);

alter table Tariff_plan
   add constraint FK_TARIFF_PLAN_HAS_USER foreign key (user_id_fk)
      references "User" (user_id);

alter table Team
   add constraint FK_TEAM_COACH_USER foreign key (member_id_fk)
      references "User" (user_id);

alter table Team
   add constraint FK_TEAM_MEMBER_USER foreign key (coach_id_fk)
      references "User" (user_id);

alter table "User"
   add constraint FK_USER_HAS_ROLE foreign key (role_name_fk)
      references Role (role_name);
