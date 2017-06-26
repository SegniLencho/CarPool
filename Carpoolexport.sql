/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17-log : Database - carpool
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`carpool` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `carpool`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `accountId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(8) NOT NULL,
  `password` varchar(8) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`accountId`),
  KEY `fk_accountUserId` (`userId`),
  CONSTRAINT `fk_accountUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`accountId`,`userName`,`password`,`userId`) values (1,'bre','abc123',1);

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `addressId` int(20) NOT NULL AUTO_INCREMENT,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zipCode` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `fk_addressUserId` (`userId`),
  CONSTRAINT `fk_addressUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`addressId`,`street`,`city`,`zipCode`,`state`,`userId`) values (1,'1000 N','FairField','52557','IA',1);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(200) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `dateUpdated` date DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `fk_commentUserId` (`userId`),
  KEY `fk_commentPostId` (`postId`),
  CONSTRAINT `fk_commentPostId` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`),
  CONSTRAINT `fk_commentUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `like` */

DROP TABLE IF EXISTS `like`;

CREATE TABLE `like` (
  `likeId` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreate` date DEFAULT NULL,
  `dateupdated` date DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`likeId`),
  KEY `fk_likeUserId` (`userId`),
  KEY `fk_likePostId` (`postId`),
  CONSTRAINT `fk_likePostId` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`),
  CONSTRAINT `fk_likeUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `like` */

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `postText` varchar(200) DEFAULT NULL,
  `postType` varchar(1) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `dateUpdate` date DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`postId`),
  KEY `fk_postUserId` (`userId`),
  CONSTRAINT `fk_postUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `post` */

insert  into `post`(`postId`,`postText`,`postType`,`dateCreated`,`dateUpdate`,`userId`) values (1,'Im planning to go to Chicago coming Friday anobody interseted ?','1','2017-03-18','2017-03-18',1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `gender` varchar(7) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `addressId` int(20) DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `fk_userAccountId` (`accountId`),
  KEY `fk_userAddressId` (`addressId`),
  CONSTRAINT `fk_userAccountId` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`),
  CONSTRAINT `fk_userAddressId` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`firstName`,`lastName`,`gender`,`birthDate`,`email`,`addressId`,`accountId`) values (1,'Berhanu','Ababu','Male','1991-06-27','berhanuasa@gmail.com',1,1),(2,'biniam','shibru','male','1990-02-12','dfdkfjdkj',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
