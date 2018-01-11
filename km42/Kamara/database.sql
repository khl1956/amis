/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     08.01.2018 17:48:47                          */
/*==============================================================*/


alter table "RENT"
   drop constraint FK_BOOKING_REFERENCE_CAR;

alter table "RENT"
   drop constraint FK_BOOKING_TO_BOOK_F_USER;

alter table "RENT"
   drop constraint FK_BOOKING_TO_LEASE__USER;

drop table "RENT" cascade constraints;

drop table "CAR" cascade constraints;

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: "RENT"                                             */
/*==============================================================*/
create table "RENT" 
(
   "rent_status"     	boolean              not null,
   "rent_startdate"  	DATE                 not null,
   "rent_finishdate" 	DATE                 not null,
   "car_model"        	CHAR(25),
   "car_id"             INTEGER,
   "user_email"         CHAR(25),
   "user_type"          SMALLINT,
   "Use_user_email"     CHAR(25),
   "Use_user_type"      SMALLINT,
   constraint PK_RENT primary key ("rent_startdate", "rent_finishdate")
);

/*==============================================================*/
/* Table: "CAR"                                                */
/*==============================================================*/
create table "CAR" 
(
   "car_id"             INTEGER,
   "car_model"	        CHAR(25)             not null,
   "car_price"          NUMBER(8)            not null,
   "car_seats"          CHAR(25)             not null,
   constraint PK_FLAT primary key ("car_id")
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   "user_firstname"     CHAR(25)             not null,
   "user_surname"    	CHAR(25)             not null,
   "user_email"         CHAR(25)             not null,
   "user_password"      CHAR(25)             not null,
   "user_type"          SMALLINT             not null,
   constraint PK_USER primary key ("user_email", "user_type")
);

alter table "RENT"
   add constraint FK_BOOKING_REFERENCE_CAR foreign key ("car_id")
      references "CAR" ("car_id");

alter table "RENT"
   add constraint FK_BOOKING_TO_BOOK_F_USER foreign key ("Use_user_email", "Use_user_type")
      references "User" ("user_email", "user_type");

alter table "RENT"
   add constraint FK_BOOKING_TO_LEASE__USER foreign key ("user_email", "user_type")
      references "User" ("user_email", "user_type");

