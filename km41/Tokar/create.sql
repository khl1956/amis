/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     15.11.2017 3:51:27                           */
/*==============================================================*/


alter table FEEDBACK
   drop constraint "FK_FEEDBACK_FEEDBACK _STORED I";

alter table FEEDBACK
   drop constraint "FK_FEEDBACK_USER LEAV_USER";

alter table "GIFT BASKET"
   drop constraint "FK_GIFT BAS_USER CREA_USER";

alter table "SELECTED ITEMS"
   drop constraint "FK_SELECTED_GIFT BASK_GIFT BAS";

alter table "SELECTED ITEMS"
   drop constraint "FK_SELECTED_USER CAN _STORED I";

alter table "STORED ITEMS"
   drop constraint "FK_STORED I_ADMINISTR_USER";

drop index feedback_stored_item_FK;

drop index "user leaves feedback_FK";

drop table FEEDBACK cascade constraints;

drop index "user create gift basket_FK";

drop table "GIFT BASKET" cascade constraints;

drop index "user_put in_basket_item_FK";

drop index basket_contain_items_FK;

drop table "SELECTED ITEMS" cascade constraints;

drop index admin_add_item_FK;

drop table "STORED ITEMS" cascade constraints;

drop table "USER" cascade constraints;

/*==============================================================*/
/* Table: FEEDBACK                                              */
/*==============================================================*/
create table FEEDBACK 
(
   user_email_fk        VARCHAR2(50)         not null,
   "sending date&time"  DATE                 not null,
   "text of feedback"   VARCHAR2(1000)       not null,
   admin_email_fk       VARCHAR2(50),
   item_code           VARCHAR2(20),
   feedback_id          INTEGER              not null,
   constraint PK_FEEDBACK primary key (feedback_id)
);

/*==============================================================*/
/* Index: "user leaves feedback_FK"                             */
/*==============================================================*/
create index "user leaves feedback_FK" on FEEDBACK (
   user_email_fk ASC
);

/*==============================================================*/
/* Index: feedback_stored_item_FK                               */
/*==============================================================*/
create index feedback_stored_item_FK on FEEDBACK (
   admin_email_fk ASC,
   item_code ASC
);

/*==============================================================*/
/* Table: "GIFT BASKET"                                         */
/*==============================================================*/
create table "GIFT BASKET" 
(
   user_email_fk        VARCHAR2(50)         not null,
   "creation_date&time" DATE                 not null,
   basket_name          VARCHAR2(30)         not null,
   status               VARCHAR2(10)            not null,
   gift_id              INTEGER              not null,
   constraint "PK_GIFT BASKET" primary key (gift_id)
);

/*==============================================================*/
/* Index: "user create gift basket_FK"                          */
/*==============================================================*/
create index "user create gift basket_FK" on "GIFT BASKET" (
   user_email_fk ASC
);

/*==============================================================*/
/* Table: "SELECTED ITEMS"                                      */
/*==============================================================*/
create table "SELECTED ITEMS" 
(
   gift_id_fk           INTEGER              not null,
   admin_email_fk       VARCHAR2(50)         not null,
   item_code         VARCHAR2(20)             not null,
   "adding_date&time"   DATE                 not null,
   "quantity in order"  INTEGER              not null,
   constraint "PK_SELECTED ITEMS" primary key (gift_id_fk, admin_email_fk, item_code, "adding_date&time")
);

/*==============================================================*/
/* Index: basket_contain_items_FK                               */
/*==============================================================*/
create index basket_contain_items_FK on "SELECTED ITEMS" (
   gift_id_fk ASC
);

/*==============================================================*/
/* Index: "user_put in_basket_item_FK"                          */
/*==============================================================*/
create index "user_put in_basket_item_FK" on "SELECTED ITEMS" (
   admin_email_fk ASC,
   item_code ASC
);

/*==============================================================*/
/* Table: "STORED ITEMS"                                        */
/*==============================================================*/
create table "STORED ITEMS" 
(
   admin_email_fk       VARCHAR2(50)         not null,
   item_code            VARCHAR2(20)             not null,
   item_name            VARCHAR2(50)         not null,
   quantity             INTEGER              not null,
   description          VARCHAR2(1000)       not null,
   price                FLOAT(8)                not null,
   category             VARCHAR2(25)         not null,
   "date&time"               DATE                 not null,
   photos               VARCHAR2(256)        ,
   constraint "PK_STORED ITEMS" primary key (admin_email_fk, item_code)
);

/*==============================================================*/
/* Index: admin_add_item_FK                                     */
/*==============================================================*/
create index admin_add_item_FK on "STORED ITEMS" (
   admin_email_fk ASC
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" 
(
   user_email           VARCHAR2(50)         not null,
   user_name            VARCHAR2(30)             not null,
   user_password        VARCHAR2(25)         not null,
   "phone number"       VARCHAR2(18)             not null,
   adress               VARCHAR2(50)         not null,
   postcode             INTEGER              not null,
   status               VARCHAR2(10)             not null,
   birthday             DATE                 not null,
   "role"                 CHAR(10)             not null,
   constraint PK_USER primary key (user_email)
);

alter table FEEDBACK
   add constraint "FK_FEEDBACK_FEEDBACK _STORED I" foreign key (admin_email_fk, item_code)
      references "STORED ITEMS" (admin_email_fk, item_code);

alter table FEEDBACK
   add constraint "FK_FEEDBACK_USER LEAV_USER" foreign key (user_email_fk)
      references "USER" (user_email);

alter table "GIFT BASKET"
   add constraint "FK_GIFT BAS_USER CREA_USER" foreign key (user_email_fk)
      references "USER" (user_email);

alter table "SELECTED ITEMS"
   add constraint "FK_SELECTED_GIFT BASK_GIFT BAS" foreign key (gift_id_fk)
      references "GIFT BASKET" (gift_id);

alter table "SELECTED ITEMS"
   add constraint "FK_SELECTED_USER CAN _STORED I" foreign key (admin_email_fk, item_code)
      references "STORED ITEMS" (admin_email_fk, item_code);

alter table "STORED ITEMS"
   add constraint "FK_STORED I_ADMINISTR_USER" foreign key (admin_email_fk)
      references "USER" (user_email);