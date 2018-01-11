insert into userInfo(user,name,surname,BirthDate)
values(1, 'name1','lname1',to_date('1996/02/24','yyyy/mm/dd'));
insert into userInfo(id,name,surname,BirthDate)
values(2, 'name2','lname2',to_date('1976/08/24','yyyy/mm/dd'));
insert into userInfo(id,name,surname,BirthDate)
values(3, 'name3','lname3',to_date('1986/12/24','yyyy/mm/dd'));

insert into Role(user,role)
values(1,'user');
insert into Role(user,role)
values(2,'admin');

insert into User(id,email,login,password,balance,roles)
values (1,'user@user.com','user1','pass',100,1);
insert into User(id,email,login,password,balance,roles)
values (2,'admin@user.com','user2','pass1',200,2);
insert into User(id,email,login,password,balance,roles)
values (3,'db@user.com','user3','pass2',300,1);

insert into OrderComposition(id,order,products)
values(1,1,1);
insert into OrderComposition(id,order,products)
values(2,2,2);
insert into OrderComposition(id,order,products)
values(3,3,3);

insert into Order(id,user,OrderTime,order_composition)
values(1,1,to_timestamp('10-Sep-02 14:10:10.123000', 'DD-Mon-RR HH24:MI:SS.FF'),1);
insert into Order(id,user,OrderTime,order_composition)
values(2,2,to_timestamp('11-Sep-12 14:12:10.123000', 'DD-Mon-RR HH24:MI:SS.FF'),2);
insert into Order(id,user,OrderTime,order_composition)
values(3,3,to_timestamp('20-Oct-02 19:15:10.123000', 'DD-Mon-RR HH24:MI:SS.FF'),3);

insert into Product(id,order_description,Name,Description)
values(1,1,'milk','milk');
insert into Product(id,order_description,Name,Description)
values(2,2,'pivo','temnoe');
insert into Product(id,order_description,Name,Description)
values(3,3,'pivo','svetloe');

insert into Payment(user,paymentinfo)
values(1,'1000 UAH');
insert into Payment(user,paymentinfo)
values(2,'2000 UAH');
insert into Payment(user,paymentinfo)
values(3,'3000 UAH');
