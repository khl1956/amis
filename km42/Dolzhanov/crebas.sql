/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     29.10.2017 21:26:42                          */
/*==============================================================*/


alter table "Order"
   drop constraint FK_ORDER_USER_ORDE_USER;

alter table "Order_item"
   drop constraint FK_ORDER_IT_ORDER_ITE_ORDER;

alter table "Order_item"
   drop constraint FK_ORDER_IT_PRODUCT_O_PRODUCT;

alter table "Product"
   drop constraint FK_PRODUCT_PRODUCT_C_CATEGORY;

alter table "Product"
   drop constraint FK_PRODUCT_STOREHOUS_STOREHOU;

drop table "Category" cascade constraints;

drop index "user_order_FK";

drop table "Order" cascade constraints;

drop index "order_item_in_order_FK";

drop index "product_order_item_FK";

drop table "Order_item" cascade constraints;

drop index "product_category_FK";

drop index "storehouse_supply_product_FK";

drop table "Product" cascade constraints;

drop table "Storehouse" cascade constraints;

drop table "User" cascade constraints;

/*==============================================================*/
/* Table: "Category"                                            */
/*==============================================================*/
create table "Category" 
(
   "product_category"   VARCHAR2(32)         not null,
   constraint PK_CATEGORY primary key ("product_category")
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" 
(
   "user_login"         VARCHAR2(32)         not null,
   "order_date"         DATE                 not null,
   "order_status"       CLOB                 not null,
   constraint PK_ORDER primary key ("user_login", "order_date")
);

/*==============================================================*/
/* Index: "user_order_FK"                                       */
/*==============================================================*/
create index "user_order_FK" on "Order" (
   "user_login" ASC
);

/*==============================================================*/
/* Table: "Order_item"                                          */
/*==============================================================*/
create table "Order_item" 
(
   "user_login"         VARCHAR2(32)         not null,
   "order_date"         DATE                 not null,
   "product_category"   VARCHAR2(32)         not null,
   "storehouse_number"  NUMBER(6)            not null,
   "storehouse_adress"  VARCHAR2(56)         not null,
   "product_name"       VARCHAR2(32)         not null,
   constraint PK_ORDER_ITEM primary key ("user_login", "order_date", "product_category", "storehouse_number", "storehouse_adress", "product_name")
);

/*==============================================================*/
/* Index: "product_order_item_FK"                               */
/*==============================================================*/
create index "product_order_item_FK" on "Order_item" (
   "product_category" ASC,
   "storehouse_number" ASC,
   "storehouse_adress" ASC,
   "product_name" ASC
);

/*==============================================================*/
/* Index: "order_item_in_order_FK"                              */
/*==============================================================*/
create index "order_item_in_order_FK" on "Order_item" (
   "user_login" ASC,
   "order_date" ASC
);

/*==============================================================*/
/* Table: "Product"                                             */
/*==============================================================*/
create table "Product" 
(
   "product_category"   VARCHAR2(32)         not null,
   "storehouse_number"  NUMBER(6)            not null,
   "storehouse_adress"  VARCHAR2(56)         not null,
   "product_name"       VARCHAR2(32)         not null,
   "product_price"      NUMBER(6)            not null,
   "product_info"       VARCHAR2(250),
   constraint PK_PRODUCT primary key ("product_category", "storehouse_number", "storehouse_adress", "product_name")
);

/*==============================================================*/
/* Index: "storehouse_supply_product_FK"                        */
/*==============================================================*/
create index "storehouse_supply_product_FK" on "Product" (
   "storehouse_number" ASC,
   "storehouse_adress" ASC
);

/*==============================================================*/
/* Index: "product_category_FK"                                 */
/*==============================================================*/
create index "product_category_FK" on "Product" (
   "product_category" ASC
);

/*==============================================================*/
/* Table: "Storehouse"                                          */
/*==============================================================*/
create table "Storehouse" 
(
   "storehouse_number"  NUMBER(6)            not null,
   "storehouse_adress"  VARCHAR2(56)         not null,
   "storehouse_phonenum" NUMBER(10),
   constraint PK_STOREHOUSE primary key ("storehouse_number", "storehouse_adress")
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   "user_login"         VARCHAR2(32)         not null,
   "user_name"          VARCHAR2(32)         not null,
   "user_email"         VARCHAR2(32)         not null,
   "user_password"      VARCHAR2(32)         not null,
   "user_phonenum"      NUMBER(10),
   constraint PK_USER primary key ("user_login")
);

alter table "Order"
   add constraint FK_ORDER_USER_ORDE_USER foreign key ("user_login")
      references "User" ("user_login");

alter table "Order_item"
   add constraint FK_ORDER_IT_ORDER_ITE_ORDER foreign key ("user_login", "order_date")
      references "Order" ("user_login", "order_date");

alter table "Order_item"
   add constraint FK_ORDER_IT_PRODUCT_O_PRODUCT foreign key ("product_category", "storehouse_number", "storehouse_adress", "product_name")
      references "Product" ("product_category", "storehouse_number", "storehouse_adress", "product_name");

alter table "Product"
   add constraint FK_PRODUCT_PRODUCT_C_CATEGORY foreign key ("product_category")
      references "Category" ("product_category");

alter table "Product"
   add constraint FK_PRODUCT_STOREHOUS_STOREHOU foreign key ("storehouse_number", "storehouse_adress")
      references "Storehouse" ("storehouse_number", "storehouse_adress");

