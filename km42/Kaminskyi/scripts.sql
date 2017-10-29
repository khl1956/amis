
--INSERT ROLES
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('admin', 'Manage data')
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('lessor', 'Add new car.')
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('User', 'Can rent car.')
INSERT INTO ROLE ("ROLE", "DESCRIPTION")
VALUES('Driver', 'Drive a car.')


-- INSERT USER
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING")
VALUES ('User', 'user_1@gmail.com', 'user_1', 'pass_1', TO_DATE('2016/06/01','yyyy/mm/dd'), 'AAA123456', 'firstname_1', 'lastname_1', '0501234567', 'TO_DATE('1990/05/01','yyyy/mm/dd')', '5');

-- INSERT LESSOR
INSERT INTO "USER" ("ROLE", "EMAIL","LOGIN","PASSWORD","DRIVER_LICENCE","NUMBER_DRIVER_LICENCE", "FIRSTNAME", "LASTNAME","PHONE_NUMBER","BIRTHDAY", "RATING")
VALUES ('lessor', 'lessor_1@gmail.com', 'lessor_1', 'lessor_pass_1', TO_DATE('2011/04/02','yyyy/mm/dd'), 'BBB123456', 'lessor_firstname_1', 'lessor_lastname_1', '0501434567', 'TO_DATE('1980/11/22','yyyy/mm/dd')', '7')  



--INSERT APPLICATION

