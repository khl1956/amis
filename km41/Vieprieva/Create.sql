CREATE TABLE "ORDERCOMPOSITION" (
  "ID" NUMBER(10) CONSTRAINT "PK_ORDERCOMPOSITION" PRIMARY KEY
);

CREATE SEQUENCE "ORDERCOMPOSITION_SEQ" NOCACHE;

CREATE TRIGGER "ORDERCOMPOSITION_BI"
  BEFORE INSERT ON "ORDERCOMPOSITION"
  FOR EACH ROW
BEGIN
  IF :NEW."ID" IS NULL THEN
    SELECT "ORDERCOMPOSITION_SEQ".NEXTVAL INTO :NEW."ID" FROM DUAL;
  END IF;
END;;

CREATE TABLE "PRODUCT" (
  "ID" NUMBER(10) CONSTRAINT "PK_PRODUCT" PRIMARY KEY,
  "ORDER_COMPOSITION" NUMBER(10) NOT NULL,
  "NAME" VARCHAR2(1000 CHAR) NOT NULL,
  "DESCRIPTION" VARCHAR2(600 CHAR)
);

CREATE INDEX "IDX_PRODUCT__ORDER_COMPOSITION" ON "PRODUCT" ("ORDER_COMPOSITION");

ALTER TABLE "PRODUCT" ADD CONSTRAINT "FK_PRODUCT__ORDER_COMPOSITION" FOREIGN KEY ("ORDER_COMPOSITION") REFERENCES "ORDERCOMPOSITION" ("ID");

CREATE SEQUENCE "PRODUCT_SEQ" NOCACHE;

CREATE TRIGGER "PRODUCT_BI"
  BEFORE INSERT ON "PRODUCT"
  FOR EACH ROW
BEGIN
  IF :NEW."ID" IS NULL THEN
    SELECT "PRODUCT_SEQ".NEXTVAL INTO :NEW."ID" FROM DUAL;
  END IF;
END;;

CREATE TABLE "USER" (
  "ID" NUMBER(10) CONSTRAINT "PK_USER" PRIMARY KEY,
  "EMAIL" VARCHAR2(50 CHAR) UNIQUE NOT NULL,
  "LOGIN" VARCHAR2(30 CHAR) UNIQUE NOT NULL,
  "PASSWORD" VARCHAR2(30 CHAR) UNIQUE NOT NULL,
  "BALANCE" NUMBER
);

CREATE SEQUENCE "USER_SEQ" NOCACHE;

CREATE TRIGGER "USER_BI"
  BEFORE INSERT ON "USER"
  FOR EACH ROW
BEGIN
  IF :NEW."ID" IS NULL THEN
    SELECT "USER_SEQ".NEXTVAL INTO :NEW."ID" FROM DUAL;
  END IF;
END;;

CREATE TABLE "PAYMENT" (
  "USER" NUMBER(10) CONSTRAINT "PK_PAYMENT" PRIMARY KEY,
  "PAYMENTINFO" VARCHAR2(300 CHAR)
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_PAYMENT__USER" FOREIGN KEY ("USER") REFERENCES "USER" ("ID");

CREATE TABLE "ROLE" (
  "USER" NUMBER(10) CONSTRAINT "PK_ROLE" PRIMARY KEY,
  "ROLENAME" VARCHAR2(30 CHAR) DEFAULT 'admin, user' NOT NULL
);

ALTER TABLE "ROLE" ADD CONSTRAINT "FK_ROLE__USER" FOREIGN KEY ("USER") REFERENCES "USER" ("ID");

CREATE TABLE "USERINFO" (
  "USER" NUMBER(10) CONSTRAINT "PK_USERINFO" PRIMARY KEY,
  "NAME" VARCHAR2(30 CHAR) NOT NULL,
  "SURNAME" VARCHAR2(50 CHAR) NOT NULL,
  "BIRTHDATE" DATE
);

ALTER TABLE "USERINFO" ADD CONSTRAINT "FK_USERINFO__USER" FOREIGN KEY ("USER") REFERENCES "USER" ("ID");

CREATE TABLE "order" (
  "ID" NUMBER(10) CONSTRAINT "PK_ORDER" PRIMARY KEY,
  "USER" NUMBER(10) NOT NULL,
  "ORDERTIME" TIMESTAMP NOT NULL,
  "ORDER_COMPOSITION" NUMBER(10) NOT NULL
);

CREATE INDEX "IDX_ORDER__ORDER_COMPOSITION" ON "order" ("ORDER_COMPOSITION");

CREATE INDEX "IDX_ORDER__USER" ON "order" ("USER");

ALTER TABLE "order" ADD CONSTRAINT "FK_ORDER__ORDER_COMPOSITION" FOREIGN KEY ("ORDER_COMPOSITION") REFERENCES "ORDERCOMPOSITION" ("ID");

ALTER TABLE "order" ADD CONSTRAINT "FK_ORDER__USER" FOREIGN KEY ("USER") REFERENCES "USER" ("ID");

CREATE SEQUENCE "order_SEQ" NOCACHE;

CREATE TRIGGER "order_BI"
  BEFORE INSERT ON "order"
  FOR EACH ROW
BEGIN
  IF :NEW."ID" IS NULL THEN
    SELECT "order_SEQ".NEXTVAL INTO :NEW."ID" FROM DUAL;
  END IF;
END;