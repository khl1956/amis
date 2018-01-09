/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 17                          */
/* Created on:     09.01.2018 10:32:52                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ORDER_TV PACKAG_TV PACKA') then
    alter table "Order"
       delete foreign key "FK_ORDER_TV PACKAG_TV PACKA"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ORDER_USER HAS _USER') then
    alter table "Order"
       delete foreign key "FK_ORDER_USER HAS _USER"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TV PACKA_CHANNELS _TV CHANN') then
    alter table "TV package"
       delete foreign key "FK_TV PACKA_CHANNELS _TV CHANN"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USER_USER HAS _ROLES') then
    alter table "USER"
       delete foreign key "FK_USER_USER HAS _ROLES"
end if;

drop index if exists "Order"."TV packages in order_FK";

drop index if exists "Order"."User has orders_FK";

drop index if exists "Order".Order_PK;

drop table if exists "Order";

drop index if exists Roles.Roles_PK;

drop table if exists Roles;

drop index if exists "TV channel"."TV channel_PK";

drop table if exists "TV channel";

drop index if exists "TV package"."channels in TV packag_FK";

drop index if exists "TV package"."TV package_PK";

drop table if exists "TV package";

drop index if exists "USER"."User has role_FK";

drop index if exists "USER".USER_PK;

drop table if exists "USER";

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create or replace table "Order" 
(
   order_id             integer                        not null,
   user_id              integer                        not null,
   package_id           integer                        not null,
   constraint PK_ORDER primary key clustered (order_id)
);

/*==============================================================*/
/* Index: Order_PK                                              */
/*==============================================================*/
create unique clustered index Order_PK on "Order" (
order_id ASC
);

/*==============================================================*/
/* Index: "User has orders_FK"                                  */
/*==============================================================*/
create index "User has orders_FK" on "Order" (
user_id ASC
);

/*==============================================================*/
/* Index: "TV packages in order_FK"                             */
/*==============================================================*/
create index "TV packages in order_FK" on "Order" (
package_id ASC
);

/*==============================================================*/
/* Table: Roles                                                 */
/*==============================================================*/
create or replace table Roles 
(
   role_name            varchar(30)                    not null,
   description          varchar(30)                    null,
   constraint PK_ROLES primary key clustered (role_name)
);

/*==============================================================*/
/* Index: Roles_PK                                              */
/*==============================================================*/
create unique clustered index Roles_PK on Roles (
role_name ASC
);

/*==============================================================*/
/* Table: "TV channel"                                          */
/*==============================================================*/
create or replace table "TV channel" 
(
   channel_id           integer                        not null,
   channel_name         varchar(30)                    not null,
   channel_language     varchar(30)                    not null,
   time_of_broadcasting varchar(30)                    not null,
   description          varchar(30)                    null,
   constraint "PK_TV CHANNEL" primary key clustered (channel_id)
);

/*==============================================================*/
/* Index: "TV channel_PK"                                       */
/*==============================================================*/
create unique clustered index "TV channel_PK" on "TV channel" (
channel_id ASC
);

/*==============================================================*/
/* Table: "TV package"                                          */
/*==============================================================*/
create or replace table "TV package" 
(
   package_id           integer                        not null,
   channel_id           integer                        not null,
   package_price        varchar(30)                    not null,
   package_name         varchar(30)                    not null,
   describtion          varchar(30)                    null,
   constraint "PK_TV PACKAGE" primary key clustered (package_id)
);

/*==============================================================*/
/* Index: "TV package_PK"                                       */
/*==============================================================*/
create unique clustered index "TV package_PK" on "TV package" (
package_id ASC
);

/*==============================================================*/
/* Index: "channels in TV packag_FK"                            */
/*==============================================================*/
create index "channels in TV packag_FK" on "TV package" (
channel_id ASC
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create or replace table "USER" 
(
   user_id              integer                        not null,
   role_name            varchar(30)                    not null,
   user_password        varchar(30)                    not null,
   user_login           varchar(30)                    not null,
   user_email           varchar(30)                    not null,
   last_logged          timestamp                      not null,
   user_firstname       varchar(30)                    null,
   user_lastname        varchar(30)                    null,
   date_joined          date                           not null,
   is_staff             smallint                       not null,
   is_active            smallint                       not null,
   constraint PK_USER primary key clustered (user_id)
);

/*==============================================================*/
/* Index: USER_PK                                               */
/*==============================================================*/
create unique clustered index USER_PK on "USER" (
user_id ASC
);

/*==============================================================*/
/* Index: "User has role_FK"                                    */
/*==============================================================*/
create index "User has role_FK" on "USER" (
role_name ASC
);

alter table "Order"
   add constraint "FK_ORDER_TV PACKAG_TV PACKA" foreign key (package_id)
      references "TV package" (package_id)
      on update restrict
      on delete restrict;

alter table "Order"
   add constraint "FK_ORDER_USER HAS _USER" foreign key (user_id)
      references "USER" (user_id)
      on update restrict
      on delete restrict;

alter table "TV package"
   add constraint "FK_TV PACKA_CHANNELS _TV CHANN" foreign key (channel_id)
      references "TV channel" (channel_id)
      on update restrict
      on delete restrict;

alter table "USER"
   add constraint "FK_USER_USER HAS _ROLES" foreign key (role_name)
      references Roles (role_name)
      on update restrict
      on delete restrict;

