/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     11/5/2017 11:32:33 AM                        */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_MESSAGE_CAN BE SE_NEWS') then
    alter table "Message"
       delete foreign key "FK_MESSAGE_CAN BE SE_NEWS"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MESSAGE_CAN GET_USER') then
    alter table "Message"
       delete foreign key "FK_MESSAGE_CAN GET_USER"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CAN HUNT_CAN HUNT_PLACE&DA') then
    alter table "can hunt"
       delete foreign key "FK_CAN HUNT_CAN HUNT_PLACE&DA"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CAN HUNT_CAN HUNT2_USER') then
    alter table "can hunt"
       delete foreign key "FK_CAN HUNT_CAN HUNT2_USER"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CAN VIEW_CAN VIEW_NEWS') then
    alter table "can view"
       delete foreign key "FK_CAN VIEW_CAN VIEW_NEWS"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CAN VIEW_CAN VIEW2_USER') then
    alter table "can view"
       delete foreign key "FK_CAN VIEW_CAN VIEW2_USER"
end if;

drop index if exists "Message"."can get_FK";

drop index if exists "Message"."can be sent as_FK";

drop index if exists "Message".Message_PK;

drop table if exists "Message";

drop index if exists News.News_PK;

drop table if exists News;

drop index if exists "Place&Date hunt"."Place&Date hunt_PK";

drop table if exists "Place&Date hunt";

drop index if exists "User".User_PK;

drop table if exists "User";

drop index if exists "can hunt"."can hunt_FK";

drop index if exists "can hunt"."can hunt2_FK";

drop index if exists "can hunt"."can hunt_PK";

drop table if exists "can hunt";

drop index if exists "can view"."can view_FK";

drop index if exists "can view"."can view2_FK";

drop index if exists "can view"."can view_PK";

drop table if exists "can view";

/*==============================================================*/
/* Table: "Message"                                             */
/*==============================================================*/
create table "Message" 
(
   date_message         long binary                    not null,
   date_news            timestamp                      null,
   email                char(100)                      null,
   title_message        char(256)                      not null,
   body_message         char(1024)                     not null,
   constraint PK_MESSAGE primary key (date_message)
);

/*==============================================================*/
/* Index: Message_PK                                            */
/*==============================================================*/
create unique index Message_PK on "Message" (
date_message ASC
);

/*==============================================================*/
/* Index: "can be sent as_FK"                                   */
/*==============================================================*/
create index "can be sent as_FK" on "Message" (
date_news ASC
);

/*==============================================================*/
/* Index: "can get_FK"                                          */
/*==============================================================*/
create index "can get_FK" on "Message" (
email ASC
);

/*==============================================================*/
/* Table: News                                                  */
/*==============================================================*/
create table News 
(
   date_news            timestamp                      not null,
   news_title           char(50)                       not null,
   news_body            char(1024)                     not null,
   news_comment         char(1024)                     null,
   constraint PK_NEWS primary key (date_news)
);

/*==============================================================*/
/* Index: News_PK                                               */
/*==============================================================*/
create unique index News_PK on News (
date_news ASC
);

/*==============================================================*/
/* Table: "Place&Date hunt"                                     */
/*==============================================================*/
create table "Place&Date hunt" 
(
   region_name          char(50)                       not null,
   place_name           char(50)                       not null,
   date_start           date                           not null,
   date_end             date                           not null,
   time_start           time                           null,
   time_end             time                           null,
   availability_place   smallint                       not null,
   constraint "PK_PLACE&DATE HUNT" primary key (region_name)
);

/*==============================================================*/
/* Index: "Place&Date hunt_PK"                                  */
/*==============================================================*/
create unique index "Place&Date hunt_PK" on "Place&Date hunt" (
region_name ASC
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   email                char(100)                      not null,
   first_name           char(20)                       not null,
   last_name            char(25)                       not null,
   password             char(25)                       not null,
   phone_number         numeric(15)                    not null,
   constraint PK_USER primary key (email)
);

/*==============================================================*/
/* Index: User_PK                                               */
/*==============================================================*/
create unique index User_PK on "User" (
email ASC
);

/*==============================================================*/
/* Table: "can hunt"                                            */
/*==============================================================*/
create table "can hunt" 
(
   region_name          char(50)                       not null,
   email                char(100)                      not null,
   constraint "PK_CAN HUNT" primary key (region_name, email)
);

/*==============================================================*/
/* Index: "can hunt_PK"                                         */
/*==============================================================*/
create unique index "can hunt_PK" on "can hunt" (
region_name ASC,
email ASC
);

/*==============================================================*/
/* Index: "can hunt2_FK"                                        */
/*==============================================================*/
create index "can hunt2_FK" on "can hunt" (
email ASC
);

/*==============================================================*/
/* Index: "can hunt_FK"                                         */
/*==============================================================*/
create index "can hunt_FK" on "can hunt" (
region_name ASC
);

/*==============================================================*/
/* Table: "can view"                                            */
/*==============================================================*/
create table "can view" 
(
   date_news            timestamp                      not null,
   email                char(100)                      not null,
   constraint "PK_CAN VIEW" primary key (date_news, email)
);

/*==============================================================*/
/* Index: "can view_PK"                                         */
/*==============================================================*/
create unique index "can view_PK" on "can view" (
date_news ASC,
email ASC
);

/*==============================================================*/
/* Index: "can view2_FK"                                        */
/*==============================================================*/
create index "can view2_FK" on "can view" (
email ASC
);

/*==============================================================*/
/* Index: "can view_FK"                                         */
/*==============================================================*/
create index "can view_FK" on "can view" (
date_news ASC
);

alter table "Message"
   add constraint "FK_MESSAGE_CAN BE SE_NEWS" foreign key (date_news)
      references News (date_news)
      on update restrict
      on delete restrict;

alter table "Message"
   add constraint "FK_MESSAGE_CAN GET_USER" foreign key (email)
      references "User" (email)
      on update restrict
      on delete restrict;

alter table "can hunt"
   add constraint "FK_CAN HUNT_CAN HUNT_PLACE&DA" foreign key (region_name)
      references "Place&Date hunt" (region_name)
      on update restrict
      on delete restrict;

alter table "can hunt"
   add constraint "FK_CAN HUNT_CAN HUNT2_USER" foreign key (email)
      references "User" (email)
      on update restrict
      on delete restrict;

alter table "can view"
   add constraint "FK_CAN VIEW_CAN VIEW_NEWS" foreign key (date_news)
      references News (date_news)
      on update restrict
      on delete restrict;

alter table "can view"
   add constraint "FK_CAN VIEW_CAN VIEW2_USER" foreign key (email)
      references "User" (email)
      on update restrict
      on delete restrict;

