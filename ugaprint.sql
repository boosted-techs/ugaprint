-- -------------------------------------------------------------
-- TablePlus 4.0.0(370)
--
-- https://tableplus.com/
--
-- Database: ugaprint
-- Generation Time: 2021-11-03 13:39:27.4440
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` char(150) NOT NULL,
  `password` char(64) NOT NULL,
  `date_added` date DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '1',
  `username` char(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` char(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `thumbnail` char(100) NOT NULL DEFAULT 'blank.png',
  `url` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `story` int NOT NULL,
  `user` int DEFAULT NULL,
  `comment` text,
  `deleted` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

DROP TABLE IF EXISTS `stories`;
CREATE TABLE `stories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `story` text,
  `user` int NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `image` char(70) NOT NULL DEFAULT (1),
  `date_added` date NOT NULL,
  `category` int DEFAULT '1',
  `url` char(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ;

DROP TABLE IF EXISTS `story_likes`;
CREATE TABLE `story_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `story` int NOT NULL,
  `date_added` date NOT NULL,
  `user` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `names` char(100) NOT NULL,
  `dob` date NOT NULL,
  `profile_pic` char(70) NOT NULL DEFAULT 'blank.png',
  `address` char(100) NOT NULL,
  `contacts` char(100) DEFAULT NULL,
  `country` char(100) NOT NULL,
  `gender` char(2) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

INSERT INTO `auth` (`id`, `email`, `password`, `date_added`, `role`, `username`, `status`) VALUES
(4, 'ashrikan@gmail.com', 'af003a9652206e3686a3010d739bd396497ef3d673dd304dac462625fcea125d', '2021-11-01', 1, 'nakabiito', 1),
(5, 'ashan@boostedtechs.com', 'af003a9652206e3686a3010d739bd396497ef3d673dd304dac462625fcea125d', '2021-11-01', 1, 'ashiraff', 1),
(6, 'ashan4@boostedtechs.com', 'af003a9652206e3686a3010d739bd396497ef3d673dd304dac462625fcea125d', '2021-11-02', 1, 'tumusiime', 1);

INSERT INTO `categories` (`id`, `category`, `status`, `thumbnail`, `url`) VALUES
(1, 'Business cards', 1, 'cards.png', 'business-cards'),
(2, 'ID Printng', 1, 'id.png', 'id-printing'),
(3, 'Magazines printing', 1, 'magazine.png', 'magazines'),
(4, 'Graphics design', 1, 'graphics.png', 'graphics');

INSERT INTO `stories` (`id`, `story`, `user`, `status`, `image`, `date_added`, `category`, `url`) VALUES
(1, 'Am here tring new things. I love doing great stadd', 4, 1, 'default.jpg', '2012-09-12', 1, 'post-one'),
(2, 'Who can do for me a perfect logo at UGX 30.000, AM in Kabale', 5, 1, 'photo-grid.jpg', '2021-09-23', 1, 'post-two');

INSERT INTO `users` (`id`, `names`, `dob`, `profile_pic`, `address`, `contacts`, `country`, `gender`) VALUES
(4, 'NAKABIITO ENID', '2021-10-31', 'blank.png', 'kasubi-namungoona', '+256784565201', 'Uganda', 'M'),
(5, 'Ashiraff Tumusiime', '2021-10-31', 'blank.png', 'Buziga - kampala U', '+256759800742', 'Uganda', 'M'),
(6, 'Tumusiime Ashiraff', '2021-11-01', 'blank.png', 'Buziga - kampala U', '+256759800742', 'Uganda', 'M');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;