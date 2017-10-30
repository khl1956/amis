
--INSERT ROLES
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('admin', 'Manage data');
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('lessor', 'Add new car.');
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('User', 'Can rent car.');
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('Driver', 'Drive a car.');


-- INSERT USER
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING")
VALUES ('User', 'user_1@gmail.com', 'user_1', 'pass_1', TO_DATE('2016/06/01','yyyy/mm/dd'), 'AAA123456', 'firstname_1', 'lastname_1', '0501234567', TO_DATE('1990/05/01','yyyy/mm/dd'), '5');

-- INSERT LESSOR
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING")
VALUES ('lessor', 'lessor_1@gmail.com', 'lessor_1', 'lessor_pass_1', TO_DATE('2011/04/02','yyyy/mm/dd'), 'BBB123456', 'lessor_firstname_1', 'lessor_lastname_1', '0501434567', TO_DATE('1980/11/22','yyyy/mm/dd'), '7');  


-- INSERT Admin
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING")
VALUES ('admin', 'admin_1@gmail.com', 'admin_1', 'admin_pass_1', TO_DATE('2011/04/02','yyyy/mm/dd'), 'CCC123456', 'admin_firstname_1', 'admin_lastname_1', '0501434563', TO_DATE('1987/12/22','yyyy/mm/dd'), '10');  


-- INSERT Driver
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING")
VALUES ('Driver', 'driver_1@gmail.com', 'driver_1', 'driver_pass_1', TO_DATE('2014/04/02','yyyy/mm/dd'), 'VVV123456', 'driver_firstname_1', 'driver_lastname_1', '0502434563', TO_DATE('1988/12/02','yyyy/mm/dd'), '6');  


-- INSERT STATE
INSERT INTO STATE ("STATE_NAME", "STATE_DESCRIPTION", "SCALE")
VALUES('exelent', 'the best condition', '9');

INSERT INTO STATE ("STATE_NAME", "STATE_DESCRIPTION", "SCALE")
VALUES('very good', 'no problems with engine', '7');

INSERT INTO STATE ("STATE_NAME", "STATE_DESCRIPTION", "SCALE")
VALUES('normal', 'car with no visual defects', '5');


-- INSERT APPLICATION
INSERT INTO APPLICATION ("STATE_NAME", "ROLE", "EMAIL", "ENGINE_NUMBER", "BODY_NUMBER" ,"APPLICATION_STATUS" , "CAR_BRAND", "CAR_MODEL", "CAR_YEAR", "LAST_TECHNICAL_INSPECTION" ,"PRICE_PER_DAY")
VALUES ('very good', 'lessor', 'lessor_1@gmail.com', 'EEE123456', 'BBB1234567', '1', 'AUDI', 'A6', TO_DATE('2014', 'yyyy'), TO_DATE('2017/06/06','yyyy/mm/dd'), '100');  
-- INSERT APPLICATION
INSERT INTO BOOK_CAR ("STATE_NAME", "APP_ROLE", "APP_EMAIL", "ENGINE_NUMBER", "BODY_NUMBER" ,"ROLE", "EMAIL", "USE_ROLE", "USE_EMAIL", "CONTRACT_NUMBER", "START_DATE","FINISH_DATE" ,"MEETING_POINT")
VALUES ('very good', 'lessor', 'lessor_1@gmail.com', 'EEE123456', 'BBB1234567','User', 'user_1@gmail.com', NULL, NULL, '00000001', TO_DATE('2017/10/06','yyyy/mm/dd'), TO_DATE('2017/10/16','yyyy/mm/dd'), 'KOVALSKYI 5');
