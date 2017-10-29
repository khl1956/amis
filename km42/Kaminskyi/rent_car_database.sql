/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     29.10.2017 15:39:03                          */
/*==============================================================*/


ALTER TABLE APPLICATION
   DROP CONSTRAINT FK_APPLICAT_LESSOR_USER;

ALTER TABLE BOOK_CAR
   DROP CONSTRAINT FK_BOOK_CAR_BOOK_CAR2_USER;

ALTER TABLE BOOK_CAR
   DROP CONSTRAINT FK_BOOK_CAR_CAR_FOR_R_APPLICAT;

ALTER TABLE BOOK_CAR
   DROP CONSTRAINT FK_BOOK_CAR_DRIVER_USER;

ALTER TABLE COMMENTS
   DROP CONSTRAINT FK_COMMENTS_COMMENTED_USER;

ALTER TABLE PHOTOS
   DROP CONSTRAINT FK_PHOTOS_CAR_PHOTO_APPLICAT;

ALTER TABLE STATE
   DROP CONSTRAINT FK_STATE_CAR_STATE_APPLICAT;

ALTER TABLE "USER"
   DROP CONSTRAINT "FK_USER_HAS A ROL_ROLE";

DROP INDEX "LESSOR_FK";

DROP TABLE APPLICATION CASCADE CONSTRAINTS;

DROP INDEX "DRIVER_FK";

DROP INDEX "CAR_FOR_RENT_FK";

DROP INDEX "BOOK_CAR2_FK";

DROP TABLE BOOK_CAR CASCADE CONSTRAINTS;

DROP INDEX "COMMENTED_FK";

DROP TABLE COMMENTS CASCADE CONSTRAINTS;

DROP INDEX "CAR_PHOTOS_FK";

DROP TABLE PHOTOS CASCADE CONSTRAINTS;

DROP TABLE ROLE CASCADE CONSTRAINTS;

DROP INDEX "CAR_STATE_FK";

DROP TABLE STATE CASCADE CONSTRAINTS;

DROP INDEX "HAS A ROLE_FK";

DROP TABLE "USER" CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: APPLICATION                                           */
/*==============================================================*/
CREATE TABLE APPLICATION 
(
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "ENGINE_NUMBER"      VARCHAR2(20)         NOT NULL,
   "BODY_NUMBER"        VARCHAR2(20)         NOT NULL,
   "APPLICATION_STATUS" SMALLINT             NOT NULL,
   "CAR_BRAND"          VARCHAR2(20)         NOT NULL,
   "CAR_MODEL"          VARCHAR2(20)         NOT NULL,
   "CAR_YEAR"           DATE                 NOT NULL,
   "LAST_TECHNICAL_INSPECTION" DATE                 NOT NULL,
   "PRICE_PER_DAY"      NUMBER(8,2)          NOT NULL,
   CONSTRAINT PK_APPLICATION PRIMARY KEY ("ROLE", "EMAIL", "ENGINE_NUMBER", "BODY_NUMBER")
);

/*==============================================================*/
/* Index: "LESSOR_FK"                                           */
/*==============================================================*/
CREATE INDEX "LESSOR_FK" ON APPLICATION (
   "ROLE" ASC,
   "EMAIL" ASC
);

/*==============================================================*/
/* Table: BOOK_CAR                                              */
/*==============================================================*/
CREATE TABLE BOOK_CAR 
(
   "APP_ROLE"           VARCHAR2(15)         NOT NULL,
   "APP_EMAIL"          VARCHAR2(20)         NOT NULL,
   "ENGINE_NUMBER"      VARCHAR2(20)         NOT NULL,
   "BODY_NUMBER"        VARCHAR2(20)         NOT NULL,
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "USE_ROLE"           VARCHAR2(15),
   "USE_EMAIL"          VARCHAR2(20),
   "CONTRACT_NUMBER"    INTEGER              NOT NULL,
   "START_DATE"         DATE                 NOT NULL,
   "FINISH_DATE"        DATE                 NOT NULL,
   "MEETING_POINT"      VARCHAR2(50)         NOT NULL,
   CONSTRAINT PK_BOOK_CAR PRIMARY KEY ("APP_ROLE", "APP_EMAIL", "ENGINE_NUMBER", "BODY_NUMBER", "ROLE", "EMAIL")
);

/*==============================================================*/
/* Index: "BOOK_CAR2_FK"                                        */
/*==============================================================*/
CREATE INDEX "BOOK_CAR2_FK" ON BOOK_CAR (
   "ROLE" ASC,
   "EMAIL" ASC
);

/*==============================================================*/
/* Index: "CAR_FOR_RENT_FK"                                     */
/*==============================================================*/
CREATE INDEX "CAR_FOR_RENT_FK" ON BOOK_CAR (
   "APP_ROLE" ASC,
   "APP_EMAIL" ASC,
   "ENGINE_NUMBER" ASC,
   "BODY_NUMBER" ASC
);

/*==============================================================*/
/* Index: "DRIVER_FK"                                           */
/*==============================================================*/
CREATE INDEX "DRIVER_FK" ON BOOK_CAR (
   "USE_ROLE" ASC,
   "USE_EMAIL" ASC
);

/*==============================================================*/
/* Table: COMMENTS                                              */
/*==============================================================*/
CREATE TABLE COMMENTS 
(
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "COMMENTS_DATE"      DATE                 NOT NULL,
   "COMMENTS_TEXT"      CLOB                 NOT NULL,
   CONSTRAINT PK_COMMENTS PRIMARY KEY ("ROLE", "EMAIL", "COMMENTS_DATE")
);

/*==============================================================*/
/* Index: "COMMENTED_FK"                                        */
/*==============================================================*/
CREATE INDEX "COMMENTED_FK" ON COMMENTS (
   "ROLE" ASC,
   "EMAIL" ASC
);

/*==============================================================*/
/* Table: PHOTOS                                                */
/*==============================================================*/
CREATE TABLE PHOTOS 
(
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "ENGINE_NUMBER"      VARCHAR2(20)         NOT NULL,
   "BODY_NUMBER"        VARCHAR2(20)         NOT NULL,
   "PHOTO_NAME"         VARCHAR2(20)         NOT NULL,
   "PHOTO"              BLOB                 NOT NULL,
   CONSTRAINT PK_PHOTOS PRIMARY KEY ("ROLE", "EMAIL", "ENGINE_NUMBER", "BODY_NUMBER", "PHOTO_NAME")
);

/*==============================================================*/
/* Index: "CAR_PHOTOS_FK"                                       */
/*==============================================================*/
CREATE INDEX "CAR_PHOTOS_FK" ON PHOTOS (
   "ROLE" ASC,
   "EMAIL" ASC,
   "ENGINE_NUMBER" ASC,
   "BODY_NUMBER" ASC
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
CREATE TABLE ROLE 
(
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "DESCRIPTION"        CLOB                 NOT NULL,
   CONSTRAINT PK_ROLE PRIMARY KEY ("ROLE")
);

/*==============================================================*/
/* Table: STATE                                                 */
/*==============================================================*/
CREATE TABLE STATE 
(
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "ENGINE_NUMBER"      VARCHAR2(20)         NOT NULL,
   "BODY_NUMBER"        VARCHAR2(20)         NOT NULL,
   "STATE_NAME"         VARCHAR2(15)         NOT NULL,
   "STATE_DESCRIPTION"  VARCHAR2(50)         NOT NULL,
   "SCALE"              NUMBER(10)           NOT NULL,
   CONSTRAINT PK_STATE PRIMARY KEY ("ROLE", "EMAIL", "ENGINE_NUMBER", "BODY_NUMBER", "STATE_NAME")
);

/*==============================================================*/
/* Index: "CAR_STATE_FK"                                        */
/*==============================================================*/
CREATE INDEX "CAR_STATE_FK" ON STATE (
   "ROLE" ASC,
   "EMAIL" ASC,
   "ENGINE_NUMBER" ASC,
   "BODY_NUMBER" ASC
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
CREATE TABLE "USER" 
(
   "ROLE"               VARCHAR2(15)         NOT NULL,
   "EMAIL"              VARCHAR2(20)         NOT NULL,
   "LOGIN"              VARCHAR2(20)         NOT NULL,
   "PASSWORD"           VARCHAR2(20)         NOT NULL,
   "DRIVER_LICENCE"     DATE                 NOT NULL,
   "NUMBER_DRIVER_LICENCE" CHAR(9)              NOT NULL,
   "FIRSTNAME"          VARCHAR2(20)         NOT NULL,
   "LASTNAME"           VARCHAR2(20)         NOT NULL,
   "PHONE_NUMBER"       CHAR(12)             NOT NULL,
   "BIRTHDAY"           DATE,
   "RATING"             SMALLINT,
   CONSTRAINT PK_USER PRIMARY KEY ("ROLE", "EMAIL")
);

/*==============================================================*/
/* Index: "HAS A ROLE_FK"                                       */
/*==============================================================*/
CREATE INDEX "HAS A ROLE_FK" ON "USER" (
   "ROLE" ASC
);

ALTER TABLE APPLICATION
   ADD CONSTRAINT FK_APPLICAT_LESSOR_USER FOREIGN KEY ("ROLE", "EMAIL")
      REFERENCES "USER" ("ROLE", "EMAIL");

ALTER TABLE BOOK_CAR
   ADD CONSTRAINT FK_BOOK_CAR_BOOK_CAR2_USER FOREIGN KEY ("ROLE", "EMAIL")
      REFERENCES "USER" ("ROLE", "EMAIL");

ALTER TABLE BOOK_CAR
   ADD CONSTRAINT FK_BOOK_CAR_CAR_FOR_R_APPLICAT FOREIGN KEY ("APP_ROLE", "APP_EMAIL", "ENGINE_NUMBER", "BODY_NUMBER")
      REFERENCES APPLICATION ("ROLE", "EMAIL", "ENGINE_NUMBER", "BODY_NUMBER");

ALTER TABLE BOOK_CAR
   ADD CONSTRAINT FK_BOOK_CAR_DRIVER_USER FOREIGN KEY ("USE_ROLE", "USE_EMAIL")
      REFERENCES "USER" ("ROLE", "EMAIL");

ALTER TABLE COMMENTS
   ADD CONSTRAINT FK_COMMENTS_COMMENTED_USER FOREIGN KEY ("ROLE", "EMAIL")
      REFERENCES "USER" ("ROLE", "EMAIL");

ALTER TABLE PHOTOS
   ADD CONSTRAINT FK_PHOTOS_CAR_PHOTO_APPLICAT FOREIGN KEY ("ROLE", "EMAIL", "ENGINE_NUMBER", "BODY_NUMBER")
      REFERENCES APPLICATION ("ROLE", "EMAIL", "ENGINE_NUMBER", "BODY_NUMBER");

ALTER TABLE STATE
   ADD CONSTRAINT FK_STATE_CAR_STATE_APPLICAT FOREIGN KEY ("ROLE", "EMAIL", "ENGINE_NUMBER", "BODY_NUMBER")
      REFERENCES APPLICATION ("ROLE", "EMAIL", "ENGINE_NUMBER", "BODY_NUMBER");

ALTER TABLE "USER"
   ADD CONSTRAINT "FK_USER_HAS A ROL_ROLE" FOREIGN KEY ("ROLE")
      REFERENCES ROLE ("ROLE");

