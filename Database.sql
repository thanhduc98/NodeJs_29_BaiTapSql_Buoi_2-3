/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `desc` varchar(255) NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) NOT NULL,
  `sub_price` varchar(255) NOT NULL,
  `food_id` int NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type`) VALUES
(1, 'Com suon bi cha', 'https://cdn.daynauan.info.vn/wp-content/uploads/2015/06/com-tam-suon-bi-cha.jpg', 40000, '...', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type`) VALUES
(2, 'Pho bo', 'https://thegioihinhanh.com/uploads/images/news/1431441444_news_2414.png', 35000, '...', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type`) VALUES
(3, 'Tra sua', 'http://cdn.tgdd.vn/Files/2021/08/10/1374160/hoc-cach-pha-tra-sua-o-long-dai-loan-thom-ngon-chuan-vi-ai-cung-me-202108100039248020.jpg', 35000, '...', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type`) VALUES
(4, 'Tra dao', 'https://cdn.netspace.edu.vn/images/2018/10/25/cach-lam-tra-dao-thom-nong-vi-tra-ngot-ngao-vi-dao-1024.jpg', 25000, '...', 2);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Thuc an');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Do uong');


INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2022-12-03 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 2, '2022-12-03 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 3, '2022-12-03 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 1, '2022-12-03 00:00:00'),
(2, 2, '2022-12-03 00:00:00'),
(3, 1, '2022-12-03 00:00:00'),
(3, 2, '2022-12-03 00:00:00'),
(4, 1, '2022-12-03 00:00:00'),
(4, 2, '2022-12-03 00:00:00'),
(5, 1, '2022-12-03 00:00:00'),
(6, 1, '2022-12-03 00:00:00'),
(6, 2, '2022-12-03 00:00:00');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 4, 4, '...', '[4,8]');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 1, 2, '...', '[1,5]');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 1, '...', '');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 3, 4, '...', '[3]'),
(3, 1, 1, '...', '[1]'),
(5, 3, 2, '...', '[3,7]');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 3, '2022-12-03 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 3, 5, '2022-12-03 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 2, 2, '2022-12-03 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(5, 3, 1, '2022-12-03 00:00:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'A Restaurant', 'https://www.hoteljob.vn/files/Anh-HTJ-Hong/sai-lam-tai-hai-khien-nha-hang-ngay-cang-vang-khach-tt-1.jpg', '...');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(2, 'B Restaurant', 'https://media-cdn.tripadvisor.com/media/photo-s/15/c5/84/65/khong-gian-nha-hang-vu.jpg', '...');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(3, 'C Restaurant', 'https://toplist.vn/images/800px/french-grill-jw-marriott-hotel-hanoi-517635.jpg', '...');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Them trung', '5000', 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Them bo', '10000', 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Them thach', '3000', 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Them dao', '4000', 4),
(5, 'Them suon', '20000', 1),
(6, 'Them pho', '5000', 2),
(7, 'Tang size', '10000', 3),
(8, 'Tang size', '5000', 4);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyen Van A', 'nguyenvana@gmail.com', '123456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Nguyen Van B', 'tranvanb@gmail.com', '123456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Vo Thi C', 'vothic@gmail.com', '123456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Trinh Thu D', 'trinhthud@gmail.com', '123456'),
(5, 'Ho Van E', 'hovane@gmail.com', '123456'),
(6, 'Vu Van F', 'vuvanf@gmail.com', '123456'),
(7, 'Huynh Thi G', 'huynhthig@gmail.com', '123456'),
(8, 'Vu Van H', 'vuvanh@gmail.com', '123456');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;