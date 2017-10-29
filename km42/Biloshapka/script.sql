/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     29.10.2017 21:31:42                          */
/*==============================================================*/


alter table Delivery
   drop constraint FK_IS_DELIVERED_ORDER;

alter table "Order"
   drop constraint FK_ORDER_USER;

alter table "User"
   drop constraint FK_USER_TYPE;

alter table flower_is_ordered
   drop constraint FK_FLOWER_IS_ORDER;

alter table flower_is_ordered
   drop constraint FK_FLOWER_IS_FLOWER;

drop table Delivery cascade constraints;

drop table Flower cascade constraints;

drop index user_order_FK;

drop table "Order" cascade constraints;

drop index USER_TYPE_FK;

drop table "User" cascade constraints;

drop table User_type cascade constraints;

drop index flower_is_ordered_FK;

drop index flower_is_ordered2_FK;

drop table flower_is_ordered cascade constraints;

/*==============================================================*/
/* Table: Delivery                                              */
/*==============================================================*/
create table Delivery 
(
   type_name            VARCHAR2(30)         not null,
   user_login           VARCHAR2(30)         not null,
   order_date           DATE                 not null,
   city                 VARCHAR2(30)         not null,
   street               VARCHAR2(30)         not null,
   house                VARCHAR2(30)         not null,
   building_num         NUMBER               not null,
   del_price            FLOAT                not null,
   constraint PK_DELIVERY primary key (type_name, user_login, order_date)
);

/*==============================================================*/
/* Table: Flower                                                */
/*==============================================================*/
create table Flower 
(
   flower_name          VARCHAR2(30)         not null,
   flower_price         FLOAT                not null,
   flower_status        SMALLINT             not null,
   flower_quontity      INTEGER              not null,
   flower_comment       VARCHAR2(300),
   constraint PK_FLOWER primary key (flower_name)
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" 
(
   type_name            VARCHAR2(30)         not null,
   user_login           VARCHAR2(30)         not null,
   order_date           DATE                 not null,
   order_status         CLOB                 not null,
   constraint PK_ORDER primary key (type_name, user_login, order_date)
);

/*==============================================================*/
/* Index: user_order_FK                                         */
/*==============================================================*/
create index user_order_FK on "Order" (
   type_name ASC,
   user_login ASC
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   type_name            VARCHAR2(30)         not null,
   user_login           VARCHAR2(30)         not null,
   user_name            VARCHAR2(30)         not null,
   user_email           VARCHAR2(30)         not null,
   user_password        VARCHAR2(30)         not null,
   user_phone           NUMBER(12)           not null,
   user_image           BLOB,
   user_type            CLOB                 not null,
   constraint PK_USER primary key (type_name, user_login)
);

/*==============================================================*/
/* Index: USER_TYPE_FK                                          */
/*==============================================================*/
create index USER_TYPE_FK on "User" (
   type_name ASC
);

/*==============================================================*/
/* Table: User_type                                             */
/*==============================================================*/
create table User_type 
(
   type_name            VARCHAR2(30)         not null,
   constraint PK_USER_TYPE primary key (type_name)
);

/*==============================================================*/
/* Table: flower_is_ordered                                     */
/*==============================================================*/
create table flower_is_ordered 
(
   type_name            VARCHAR2(30)         not null,
   user_login           VARCHAR2(30)         not null,
   order_date           DATE                 not null,
   flower_name          VARCHAR2(30)         not null,
   constraint PK_FLOWER_IS_ORDERED primary key (type_name, user_login, order_date, flower_name)
);

/*==============================================================*/
/* Index: flower_is_ordered2_FK                                 */
/*==============================================================*/
create index flower_is_ordered2_FK on flower_is_ordered (
   flower_name ASC
);

/*==============================================================*/
/* Index: flower_is_ordered_FK                                  */
/*==============================================================*/
create index flower_is_ordered_FK on flower_is_ordered (
   type_name ASC,
   user_login ASC,
   order_date ASC
);

alter table Delivery
   add constraint FK_IS_DELIVERED_ORDER foreign key (type_name, user_login, order_date)
      references "Order" (type_name, user_login, order_date);

alter table "Order"
   add constraint FK_ORDER_USER foreign key (type_name, user_login)
      references "User" (type_name, user_login);

alter table "User"
   add constraint FK_USER_TYPE foreign key (type_name)
      references User_type (type_name);

alter table flower_is_ordered
   add constraint FK_FLOWER_IS_ORDER foreign key (type_name, user_login, order_date)
      references "Order" (type_name, user_login, order_date);

alter table flower_is_ordered
   add constraint FK_FLOWER_IS_FLOWER foreign key (flower_name)
      references Flower (flower_name);

