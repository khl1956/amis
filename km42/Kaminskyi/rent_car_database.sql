/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     29.10.2017 14:13:22                          */
/*==============================================================*/


alter table APPLICATION
   drop constraint FK_APPLICAT_LESSOR_USER;

alter table "Comments"
   drop constraint FK_COMMENTS_COMMENTED_USER;

alter table PHOTOS
   drop constraint FK_PHOTOS_CAR_PHOTO_APPLICAT;

alter table STATE
   drop constraint FK_STATE_CAR_STATE_APPLICAT;

alter table "USER"
   drop constraint "FK_USER_HAS A ROL_ROLE";

alter table "book_car"
   drop constraint FK_BOOK_CAR_BOOK_CAR2_USER;

alter table "book_car"
   drop constraint FK_BOOK_CAR_CAR_FOR_R_APPLICAT;

alter table "book_car"
   drop constraint FK_BOOK_CAR_DRIVER_USER;

drop index "lessor_FK";

drop table APPLICATION cascade constraints;

drop index "commented_FK";

drop table "Comments" cascade constraints;

drop index "car_photos_FK";

drop table PHOTOS cascade constraints;

drop table ROLE cascade constraints;

drop index "car_state_FK";

drop table STATE cascade constraints;

drop index "has a role_FK";

drop table "USER" cascade constraints;

drop index "driver_FK";

drop index "car_for_rent_FK";

drop index "book_car2_FK";

drop table "book_car" cascade constraints;

/*==============================================================*/
/* Table: APPLICATION                                           */
/*==============================================================*/
create table APPLICATION 
(
   "role"               VARCHAR2(15)         not null,
   "email"              VARCHAR2(20)         not null,
   "¹_Engine"           VARCHAR2(20)         not null,
   "¹_body"             VARCHAR2(20)         not null,
   "application_status" SMALLINT             not null,
   "car_brand"          VARCHAR2(20)         not null,
   "car_model"          VARCHAR2(20)         not null,
   "car_year"           DATE                 not null,
   "last_technical_inspection" DATE                 not null,
   "price_per_day"      NUMBER(8,2)          not null,
   constraint PK_APPLICATION primary key ("role", "email", "¹_Engine", "¹_body")
);

/*==============================================================*/
/* Index: "lessor_FK"                                           */
/*==============================================================*/
create index "lessor_FK" on APPLICATION (
   "role" ASC,
   "email" ASC
);

/*==============================================================*/
/* Table: "Comments"                                            */
/*==============================================================*/
create table "Comments" 
(
   "role"               VARCHAR2(15)         not null,
   "email"              VARCHAR2(20)         not null,
   "comments_date"      DATE                 not null,
   "comments_text"      CLOB                 not null,
   constraint PK_COMMENTS primary key ("role", "email", "comments_date")
);

/*==============================================================*/
/* Index: "commented_FK"                                        */
/*==============================================================*/
create index "commented_FK" on "Comments" (
   "role" ASC,
   "email" ASC
);

/*==============================================================*/
/* Table: PHOTOS                                                */
/*==============================================================*/
create table PHOTOS 
(
   "role"               VARCHAR2(15)         not null,
   "email"              VARCHAR2(20)         not null,
   "¹_Engine"           VARCHAR2(20)         not null,
   "¹_body"             VARCHAR2(20)         not null,
   "photo_name"         VARCHAR2(20)         not null,
   "photo"              BLOB                 not null,
   constraint PK_PHOTOS primary key ("role", "email", "¹_Engine", "¹_body", "photo_name")
);

/*==============================================================*/
/* Index: "car_photos_FK"                                       */
/*==============================================================*/
create index "car_photos_FK" on PHOTOS (
   "role" ASC,
   "email" ASC,
   "¹_Engine" ASC,
   "¹_body" ASC
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE 
(
   "role"               VARCHAR2(15)         not null,
   "description"        CLOB                 not null,
   constraint PK_ROLE primary key ("role")
);

/*==============================================================*/
/* Table: STATE                                                 */
/*==============================================================*/
create table STATE 
(
   "role"               VARCHAR2(15)         not null,
   "email"              VARCHAR2(20)         not null,
   "¹_Engine"           VARCHAR2(20)         not null,
   "¹_body"             VARCHAR2(20)         not null,
   "state_name"         VARCHAR2(15)         not null,
   "state_description"  VARCHAR2(50)         not null,
   "scale"              NUMBER(10)           not null,
   constraint PK_STATE primary key ("role", "email", "¹_Engine", "¹_body", "state_name")
);

/*==============================================================*/
/* Index: "car_state_FK"                                        */
/*==============================================================*/
create index "car_state_FK" on STATE (
   "role" ASC,
   "email" ASC,
   "¹_Engine" ASC,
   "¹_body" ASC
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" 
(
   "role"               VARCHAR2(15)         not null,
   "email"              VARCHAR2(20)         not null,
   "login"              VARCHAR2(20)         not null,
   "password"           VARCHAR2(20)         not null,
   "driver_licence"     DATE                 not null,
   "¹_driver_licence"   CHAR(9)              not null,
   "firstname"          VARCHAR2(20)         not null,
   "lastname"           VARCHAR2(20)         not null,
   "phone_number"       CHAR(12)             not null,
   "birthday"           DATE,
   "rating"             SMALLINT,
   constraint PK_USER primary key ("role", "email")
);

/*==============================================================*/
/* Index: "has a role_FK"                                       */
/*==============================================================*/
create index "has a role_FK" on "USER" (
   "role" ASC
);

/*==============================================================*/
/* Table: "book_car"                                            */
/*==============================================================*/
create table "book_car" 
(
   "APP_role"           VARCHAR2(15)         not null,
   "APP_email"          VARCHAR2(20)         not null,
   "¹_Engine"           VARCHAR2(20)         not null,
   "¹_body"             VARCHAR2(20)         not null,
   "role"               VARCHAR2(15)         not null,
   "email"              VARCHAR2(20)         not null,
   "USE_role"           VARCHAR2(15),
   "USE_email"          VARCHAR2(20),
   "contract_number"    INTEGER              not null,
   "start_date"         DATE                 not null,
   "finish_date"        DATE                 not null,
   "meeting_point"      VARCHAR2(50)         not null,
   constraint PK_BOOK_CAR primary key ("APP_role", "APP_email", "¹_Engine", "¹_body", "role", "email")
);

/*==============================================================*/
/* Index: "book_car2_FK"                                        */
/*==============================================================*/
create index "book_car2_FK" on "book_car" (
   "role" ASC,
   "email" ASC
);

/*==============================================================*/
/* Index: "car_for_rent_FK"                                     */
/*==============================================================*/
create index "car_for_rent_FK" on "book_car" (
   "APP_role" ASC,
   "APP_email" ASC,
   "¹_Engine" ASC,
   "¹_body" ASC
);

/*==============================================================*/
/* Index: "driver_FK"                                           */
/*==============================================================*/
create index "driver_FK" on "book_car" (
   "USE_role" ASC,
   "USE_email" ASC
);

alter table APPLICATION
   add constraint FK_APPLICAT_LESSOR_USER foreign key ("role", "email")
      references "USER" ("role", "email");

alter table "Comments"
   add constraint FK_COMMENTS_COMMENTED_USER foreign key ("role", "email")
      references "USER" ("role", "email");

alter table PHOTOS
   add constraint FK_PHOTOS_CAR_PHOTO_APPLICAT foreign key ("role", "email", "¹_Engine", "¹_body")
      references APPLICATION ("role", "email", "¹_Engine", "¹_body");

alter table STATE
   add constraint FK_STATE_CAR_STATE_APPLICAT foreign key ("role", "email", "¹_Engine", "¹_body")
      references APPLICATION ("role", "email", "¹_Engine", "¹_body");

alter table "USER"
   add constraint "FK_USER_HAS A ROL_ROLE" foreign key ("role")
      references ROLE ("role");

alter table "book_car"
   add constraint FK_BOOK_CAR_BOOK_CAR2_USER foreign key ("role", "email")
      references "USER" ("role", "email");

alter table "book_car"
   add constraint FK_BOOK_CAR_CAR_FOR_R_APPLICAT foreign key ("APP_role", "APP_email", "¹_Engine", "¹_body")
      references APPLICATION ("role", "email", "¹_Engine", "¹_body");

alter table "book_car"
   add constraint FK_BOOK_CAR_DRIVER_USER foreign key ("USE_role", "USE_email")
      references "USER" ("role", "email");

