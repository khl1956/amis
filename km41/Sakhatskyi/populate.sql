insert into Role(user,role)
values(1,'user');
insert into Role(user,role)
values(2,'manager');

insert into User(id,email,login,password,roles, recycle_history)
values (1,'user@user.com','user1','pass',1,'no history');
insert into User(id,email,login,password,roles, recycle_history)
values (2,'admin@user.com','user2','pass1',2,'no history');
insert into User(id,email,login,password,roles, recycle_history)
values (3,'db@user.com','user3','pass2',1,'no history');

insert into Material(id,products,name,description,recycleBin)
values(1,1,'paper','paper','red');
insert into Material(id,products,name,description,recycleBin)
values(2,2,'metal','metal','green');
insert into Material(id,products,name,description,recycleBin)
values(3,3,'glass','glass','blue');

insert into Product(id,product_to_history,material,name,payment,description)
values(1,1,1,'pack',5,'paper pack');
insert into Product(id,product_to_history,material,name,payment,description)
values(2,2,2,'cup',10,'metal pack');
insert into Product(id,product_to_history,material,name,payment,description)
values(3,3,3,'bottle',11,'glass bottle');

insert into ProductToHistory(id,recycle_history,products)
values(1,1,1);
insert into ProductToHistory(id,recycle_history,products)
values(2,2,2);
insert into ProductToHistory(id,recycle_history,products)
values(3,3,3);

insert into RecycleHistory(id,user,product_to_history)
values(1,1,1);
insert into Payment(user,paymentinfo)
values(2,2,2);
insert into Payment(user,paymentinfo)
values(3,3,3);
