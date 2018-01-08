CREATE TABLE IF NOT EXISTS bike (
  bike_id         BIGINT  NOT NULL AUTO_INCREMENT,
  bike_name VARCHAR(64) NOT NULL ,
  bike_type  VARCHAR(64) NOT NULL ,
  wheel_size    tinyint unsigned NOT NULL,
  bike_color   VARCHAR(64)  NOT NULL,
  bike_price       VARCHAR(64)   NOT NULL,
  bike_image mediumblob NOT NULL,
  PRIMARY KEY (bike_id)
  );
  
  CREATE TABLE IF NOT EXISTS user (
  user_id         BIGINT  NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(64)  ,
  last_name  VARCHAR(64)  ,
  email     VARCHAR(128) NOT NULL UNIQUE,
  password   VARCHAR(64)  NOT NULL,
  role       VARCHAR(64)   NOT NULL,
  PRIMARY KEY (user_id)
  );
  
  CREATE TABLE IF NOT EXISTS order_item (
  order_id         BIGINT  NOT NULL AUTO_INCREMENT ,
  user_id bigint not NULL ,
  order_start_date timestamp not null,
  order_end_date timestamp not null,
  
  primary key(order_id),
  
  constraint order_item_to_user
  foreign key (user_id)
  references user (user_id)
  
  );
  
  
  CREATE TABLE IF NOT EXISTS order_bike (
    order_id BIGINT NOT NULL,
    bike_id BIGINT NOT NULL,
    bike_amount TINYINT UNSIGNED NOT NULL,
    CONSTRAINT order_bike_to_order_item FOREIGN KEY (order_id)
        REFERENCES order_item (order_id),
    CONSTRAINT order_bike_to_bike FOREIGN KEY (bike_id)
        REFERENCES bike (bike_id)
);

CREATE TABLE IF NOT EXISTS bikestore (
  bike_id         BIGINT  NOT NULL ,
  amount smallint unsigned NULL ,
  
  constraint bikestore_to_bike_ids
  foreign key (bike_id)
  references bike (bike_id)
  );



  
  
  