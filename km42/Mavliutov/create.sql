/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     29.10.2017 18:50:02                          */
/*==============================================================*/


alter table Match
   drop constraint FK_MATCH_AWAY_TEAM_TEAM;

alter table Match
   drop constraint FK_MATCH_HOME_TEAM_TEAM;

alter table Match
   drop constraint FK_MATCH_TOURNAMEN_TOURNAME;

alter table Messages
   drop constraint FK_MESSAGES_ORGANIZER_ORGANIZE;

alter table Messages
   drop constraint FK_MESSAGES_READ_TEAM;

alter table Score
   drop constraint FK_SCORE_GOAL_IN_M_MATCH;

alter table Tournament
   drop constraint FK_TOURNAME_ORGANIZE__ORGANIZE;

drop index Away_Team_play_FK;

drop index Home_Team_play_FK;

drop index Tournament_contains_matches_FK;

drop table Match cascade constraints;

drop index Read_FK;

drop index Organizer_sends_message_FK;

drop table Messages cascade constraints;

drop table Organizer cascade constraints;

drop index Goal_in_match_FK;

drop table Score cascade constraints;

drop table Team cascade constraints;

drop index "Organize_create_ tournament_FK";

drop table Tournament cascade constraints;

/*==============================================================*/
/* Table: Organizer                                             */
/*==============================================================*/
create table Organizer 
(
   Organizer_login      VARCHAR2(30)         not null,
   Organizer_email      VARCHAR2(30)         not null,
   Organizer_password   VARCHAR2(30)         not null,
   constraint PK_ORGANIZER primary key (Organizer_login)
);

ALTER TABLE Organizer
ADD CONSTRAINT email_org_unique UNIQUE (Organizer_email);

ALTER TABLE Organizer
ADD CONSTRAINT check_name_organ CHECK (length(Organizer_login)>=8 AND length(Organizer_login)<=30);

ALTER TABLE Organizer
ADD CONSTRAINT check_pass_organ CHECK (length(Organizer_password)>=8 AND length(Organizer_password)<=30);

ALTER TABLE Organizer
ADD CONSTRAINT check_email1_organ CHECK(Organizer_email LIKE '%___@___%');

ALTER TABLE Organizer
ADD CONSTRAINT check_email2_organ CHECK(length(Organizer_email)>=8 AND length(Organizer_email)<=30);

/*==============================================================*/
/* Table: Tournament                                            */
/*==============================================================*/
create table Tournament 
(
   Tournament_id        INTEGER              not null,
   Organizer_login_fk   VARCHAR2(30)         not null,
   Tournament_name      VARCHAR2(10)         not null,
   Tournament_data_started DATE                 not null,
   Tournament_data_end  DATE                 not null,
   constraint PK_TOURNAMENT primary key (Tournament_id, Organizer_login_fk)
);

ALTER TABLE Tournament
ADD CONSTRAINT tourn_unique UNIQUE (Tournament_name, Tournament_data_started);

ALTER TABLE Tournament
ADD CONSTRAINT check_name_tourn CHECK (length(Tournament_name)>=5 AND length(Tournament_name)<=10);

ALTER TABLE Tournament
ADD CONSTRAINT check_data_start CHECK (Tournament_data_started > date '2017-10-29');

ALTER TABLE Tournament
ADD CONSTRAINT check_data_end CHECK (Tournament_data_end > Tournament_data_started);

/*==============================================================*/
/* Table: Match                                                 */
/*==============================================================*/
create table Match 
(
   Match_data           DATE                 not null,
   Team1_email_fk       VARCHAR2(30)         not null,
   Team2_email_fk       VARCHAR2(30)         not null,
   Tournament_id_fk     INTEGER              not null,
   Organizer_login_fk   VARCHAR2(30)         not null,
   constraint PK_MATCH primary key (Team1_email_fk, Team2_email_fk, Match_data)
);

/*ALTER TABLE Match*/
/*ADD CONSTRAINT id_login_unique UNIQUE (Tournament_id_fk, Organizer_login_fk);*/

/*==============================================================*/
/* Index: Tournament_contains_matches_FK                        */
/*==============================================================*/
/*create index Tournament_contains_matches_FK on Match (*/
   /*Tournament_id_fk ASC,*/
   /*Organizer_login_fk ASC*/
/*);*/

/*==============================================================*/
/* Index: Home_Team_play_FK                                     */
/*==============================================================*/
create index Home_Team_play_FK on Match (
   Team2_email_fk ASC
);

/*==============================================================*/
/* Index: Away_Team_play_FK                                     */
/*==============================================================*/
create index Away_Team_play_FK on Match (
   Team1_email_fk ASC
);

/*==============================================================*/
/* Table: Messages                                              */
/*==============================================================*/
create table Messages 
(
   Message_data         DATE                 not null,
   Team_email_fk        VARCHAR2(30)         not null,
   Organizer_login_fk   VARCHAR2(30)         not null,
   Message_context      CLOB                 not null,
   constraint PK_MESSAGES primary key (Team_email_fk, Organizer_login_fk, Message_data)
);

/*==============================================================*/
/* Index: Organizer_sends_message_FK                            */
/*==============================================================*/
create index Organizer_sends_message_FK on Messages (
   Organizer_login_fk ASC
);

/*==============================================================*/
/* Index: Read_FK                                               */
/*==============================================================*/
create index Read_FK on Messages (
   Team_email_fk ASC
);

/*==============================================================*/
/* Table: Score                                                 */
/*==============================================================*/
create table Score 
(
   Goal_time            TIMESTAMP            not null,
   Team1_email_fk       VARCHAR2(30)         not null,
   Team2_email_fk       VARCHAR2(30)         not null,
   Match_data_fk        DATE                 not null,
   Team_goal            VARCHAR2(30)         not null,
   constraint PK_SCORE primary key (Team1_email_fk, Team2_email_fk, Match_data_fk, Goal_time)
);

ALTER TABLE Score
ADD CONSTRAINT check_time_goal CHECK (Goal_time > Match_data_fk);

ALTER TABLE Score
ADD CONSTRAINT check_name_goal CHECK (length(Team_goal)>=8 AND length(Team_goal)<=30);

/*==============================================================*/
/* Index: Goal_in_match_FK                                      */
/*==============================================================*/
create index Goal_in_match_FK on Score (
   Team1_email_fk ASC,
   Team2_email_fk ASC,
   Match_data_fk ASC
);

/*==============================================================*/
/* Table: Team                                                  */
/*==============================================================*/
create table Team 
(
   Team_email           VARCHAR2(30)         not null,
   Team_name            VARCHAR2(30)         not null,
   constraint PK_TEAM primary key (Team_email)
);

ALTER TABLE Team
ADD CONSTRAINT team_name_unique UNIQUE (Team_name);

ALTER TABLE Team
ADD CONSTRAINT check_name_team CHECK (length(Team_name)>=8 AND length(Team_name)<=30);

ALTER TABLE Team
ADD CONSTRAINT check_email1_team CHECK(Team_email LIKE '%___@___%');

ALTER TABLE Team
ADD CONSTRAINT check_email2_team CHECK(length(Team_email)>=8 AND length(Team_email)<=30);

/*==============================================================*/
/* Index: "Organize_create_ tournament_FK"                      */
/*==============================================================*/
create index "Organize_create_ tournament_FK" on Tournament (
   Organizer_login_fk ASC
);

alter table Match
   add constraint FK_MATCH_AWAY_TEAM_TEAM foreign key (Team1_email_fk)
      references Team (Team_email);

alter table Match
   add constraint FK_MATCH_HOME_TEAM_TEAM foreign key (Team2_email_fk)
      references Team (Team_email);

alter table Match
   add constraint FK_MATCH_TOURNAMEN_TOURNAME foreign key (Tournament_id_fk, Organizer_login_fk)
      references Tournament (Tournament_id, Organizer_login_fk);

alter table Messages
   add constraint FK_MESSAGES_ORGANIZER_ORGANIZE foreign key (Organizer_login_fk)
      references Organizer (Organizer_login);

alter table Messages
   add constraint FK_MESSAGES_READ_TEAM foreign key (Team_email_fk)
      references Team (Team_email);

alter table Score
   add constraint FK_SCORE_GOAL_IN_M_MATCH foreign key (Team1_email_fk, Team2_email_fk, Match_data_fk)
      references Match (Team1_email_fk, Team2_email_fk, Match_data);

alter table Tournament
   add constraint FK_TOURNAME_ORGANIZE__ORGANIZE foreign key (Organizer_login_fk)
      references Organizer (Organizer_login);

