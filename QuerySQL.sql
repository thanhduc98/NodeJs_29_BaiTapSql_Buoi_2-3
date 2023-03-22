CREATE DATABASE BaiTapSQL_Buoi2_3;
USE BaiTapSQL_Buoi2_3 ;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ;
INSERT INTO users(full_name, email, password)
VALUES
	("Nguyen Van A", "nguyenvana@gmail.com", "123456"),
	("Nguyen Van B", "tranvanb@gmail.com", "123456"),
	("Vo Thi C", "vothic@gmail.com", "123456"),
	("Trinh Thu D", "trinhthud@gmail.com", "123456"),
	("Ho Van E", "hovane@gmail.com", "123456"),
	("Vu Van F", "vuvanf@gmail.com", "123456"),
	("Huynh Thi G", "huynhthig@gmail.com", "123456"),
	("Vu Van H", "vuvanh@gmail.com", "123456");
CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`res_id`)
);
INSERT INTO rate_res(user_id,res_id, amount, date_rate)
VALUES
	("1","1", "3", "2022-12-03"),
	("2", "3","5", "2022-12-03"),
	("4", "2", "2","2022-12-03"),
	("5", "3", "1","2022-12-03");
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
);	
INSERT INTO restaurant(res_name, image, `desc`)
VALUES
	("A Restaurant", "https://www.hoteljob.vn/files/Anh-HTJ-Hong/sai-lam-tai-hai-khien-nha-hang-ngay-cang-vang-khach-tt-1.jpg", "..."),
	("B Restaurant", "https://media-cdn.tripadvisor.com/media/photo-s/15/c5/84/65/khong-gian-nha-hang-vu.jpg", "..."),
	("C Restaurant", "https://toplist.vn/images/800px/french-grill-jw-marriott-hotel-hanoi-517635.jpg", "...");
CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`res_id`)
);
INSERT INTO like_res (user_id,res_id,date_like)
VALUES
	("1","1","2022-12-03"),
	("1","2","2022-12-03"),
	("1","3","2022-12-03"),
	("2","1", "2022-12-03"),
	("2","2", "2022-12-03"),
	("3","1", "2022-12-03"),
	("3","2", "2022-12-03"),
	("4","2", "2022-12-03"),
	("4","1", "2022-12-03"),
	("5","1", "2022-12-03"),
	("6","1", "2022-12-03"),
	("6","2", "2022-12-03");
CREATE TABLE `order` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`food_id`)
);
INSERT INTO `order`(user_id,food_id, amount, code, arr_sub_id)
VALUES
	("1","4", "4", "...", "[4,8]"),
	("2","1", "2", "...", "[1,5]"),
	("2","2", "1", "...", ""),
	("2","3", "4", "...", "[3]"),
	("3","1", "1", "...", "[1]"),
	("5","3", "2", "...", "[3,7]");
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `desc` varchar(255) NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`food_id`)
);
INSERT INTO food(food_name, image, price, `desc`, `type`)
VALUES
	("Com suon bi cha", "https://cdn.daynauan.info.vn/wp-content/uploads/2015/06/com-tam-suon-bi-cha.jpg", "40000", "...", "1"),
	("Pho bo", "https://thegioihinhanh.com/uploads/images/news/1431441444_news_2414.png", "35000", "...", "1"),
	("Tra sua", "http://cdn.tgdd.vn/Files/2021/08/10/1374160/hoc-cach-pha-tra-sua-o-long-dai-loan-thom-ngon-chuan-vi-ai-cung-me-202108100039248020.jpg", "35000", "...", "2"),
	("Tra dao", "https://cdn.netspace.edu.vn/images/2018/10/25/cach-lam-tra-dao-thom-nong-vi-tra-ngot-ngao-vi-dao-1024.jpg", "25000", "...", "2");
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
);
INSERT INTO food_type(type_name)
VALUES 
	("Thuc an"),
	("Do uong");
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) NOT NULL,
  `sub_price` varchar(255) NOT NULL,
  `food_id` int NOT NULL,
  PRIMARY KEY (`sub_id`)
);
INSERT INTO sub_food (sub_name, sub_price, food_id)
VALUES
	("Them trung","5000","1"),
	("Them bo","10000", "2"),
	("Them thach","3000","3"),
	("Them dao", "4000", "4"),
	("Them suon", "20000", "1"),
	("Them pho", "5000", "2"),
	("Tang size", "10000", "3"),
	("Tang size", "5000" , "4");
-- Câu 1:
SELECT users.user_id  , users.full_name , COUNT(like_res.res_id) AS total_like , users.full_name, users.`password`
FROM users
LEFT JOIN like_res
ON users.user_id = like_res.user_id
GROUP BY users.user_id 
ORDER BY total_like DESC
LIMIT 5;
-- Câu 2:
SELECT restaurant.res_id , restaurant.res_name , COUNT(like_res.user_id) AS total_like , restaurant.image, restaurant.`DESC`
FROM restaurant
LEFT JOIN like_res
ON restaurant.res_id = like_res.res_id
GROUP BY restaurant.res_id
ORDER BY total_like DESC
LIMIT 2;
-- Câu 3:
SELECT users.user_id , users.full_name , SUM(`order`.amount) AS total_amount , users.`password`
FROM users
LEFT JOIN `order`
ON users.user_id = `order`.user_id
GROUP BY users.user_id 
ORDER BY total_amount DESC
LIMIT 1;
-- Câu 4 ;
SELECT users.user_id , users.full_name , users.email , users.`password`
FROM users 
LEFT JOIN `order`
ON users.user_id = `order`.user_id 
LEFT JOIN rate_res
ON users.user_id = rate_res.user_id
LEFT JOIN like_res
ON users.user_id = like_res.user_id
WHERE `order`.user_id IS NULL AND rate_res.user_id  IS NULL AND like_res.user_id  IS NULL
GROUP BY users.user_id;
-- Câu 5:
SELECT food.food_id, food.food_name,  AVG (sub_food.sub_price) as AVG_Price_Sub_Food_VND
FROM food
LEFT JOIN sub_food
ON food.food_id = sub_food.food_id
GROUP BY food.food_id;











