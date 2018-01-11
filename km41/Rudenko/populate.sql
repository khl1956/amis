+insert into user(user_email,user_password,user_name,user_balance,role_name)
 +values('user1@com', '111','name1',100, 'admin');
+insert into user(user_email,user_password,user_name,user_balance,role_name)
 +values('user2@com', '222','name2',200,'user');
+insert into user(user_email,user_password,user_name,user_balance,role_name)
 +values('user3@com', '333','name3',300,'user');
 +insert into user(user_email,user_password,user_name,user_balance,role_name)
 +values('user4@com', '444','name4',400,'user');
 +insert into user(user_email,user_password,user_name,user_balance,role_name)
 +values('user5@com', '555','name5',500,'user');
 +
 +insert into Role(role_name,descripion)
 +values('user', 'make orders only');
 +insert into Role(role_name)
 +values('admin','del\add\change products');
 +
 +
 +insert into Product(product_name,product_price,product_type,product_brand,product_description)
 +values('lipstick',10,'lip','elf','color - red');
 +insert into Product(product_name,product_price,product_type,product_brand,product_description)
 +values('powder',20,'face','elf','color - light beige');
 +insert into Product(product_name,product_price,product_type,product_brand,product_description)
 +values('mascara',30,'eyes','mac','color - black');
 +insert into Product(product_name,product_price,product_type,product_brand,product_description)
 +values('liner',40,'eyes','mac','color - brown');
 +insert into Product(product_name,product_price,product_type,product_brand,product_description)
 +values('blush',50,'face','dior','color - pink');
 +insert into Product(product_name,product_price,product_type,product_brand,product_description)
 +values('lipgloss',60,'lip','dior','color - burgundi');
 +
 +insert into Cart(cart_id,product_name,user_email)
 +values(1111,'liner','user2@com');
 +insert into Cart(cart_id,product_name,user_email)
 +values(1112,'powder','user3@com');
 +insert into Cart(cart_id,product_name,user_email)
 +values(1113,'lipstick','user4@com');
 +insert into Cart(cart_id,product_name,user_email)
 +values(1111,'lipgloss','user2@com');
 +insert into Cart(cart_id,product_name,user_email)
 +values(1112,'liner','user3@com');
 +
 +insert into Order(order_date,cart_id,product_name,user_email,order_price)
 +values(to_timestamp('17-Nov-09 14:00:00.100', 'DD-Mon-RR HH24:MI:SS.FF'),1111,'liner,lipgloss','user2@com',100);
 +insert into Order(order_date,cart_id,product_name,user_email,order_price)
 +values(to_timestamp('19-Nov-09 14:00:00.100', 'DD-Mon-RR HH24:MI:SS.FF'),1112,'powder,liner','user3@com',60);
 +insert into Order(order_date,cart_id,product_name,user_email,order_price)
 +values(to_timestamp('27-Nov-09 14:00:00.100', 'DD-Mon-RR HH24:MI:SS.FF'),1113,'lipstick','user4@com',10);
,