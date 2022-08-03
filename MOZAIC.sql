/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.19-MariaDB : Database - ciptapro_mozaic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ciptapro_mozaic` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ciptapro_mozaic`;

/*Table structure for table `acct_account` */

DROP TABLE IF EXISTS `acct_account`;

CREATE TABLE `acct_account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `account_code` varchar(225) DEFAULT NULL,
  `account_name` varchar(225) DEFAULT NULL,
  `account_group` varchar(225) DEFAULT NULL,
  `account_suspended` int(1) DEFAULT 0,
  `account_default_status` int(1) DEFAULT 0,
  `account_remark` varchar(225) DEFAULT NULL,
  `account_status` int(1) DEFAULT 0,
  `account_token` varchar(225) DEFAULT NULL,
  `account_type_id` int(10) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `acct_account` */

insert  into `acct_account`(`account_id`,`company_id`,`account_code`,`account_name`,`account_group`,`account_suspended`,`account_default_status`,`account_remark`,`account_status`,`account_token`,`account_type_id`,`data_state`,`created_id`,`updated_id`,`created_at`,`updated_at`) values 
(10,1,'100.1','KAS BESAR','100',0,0,NULL,0,NULL,1,0,55,55,'2022-07-23 09:08:01','2022-07-23 09:08:01'),
(11,1,'100.2','KAS KECIL','100',0,0,NULL,0,NULL,1,0,55,55,'2022-07-23 09:08:29','2022-07-23 09:08:29'),
(12,1,'200.1','PEMBELIAN','200',0,1,NULL,1,NULL,3,0,55,55,'2022-07-23 09:09:04','2022-08-02 14:05:55'),
(14,1,'300.1','PENJUALAN','300',0,0,NULL,0,NULL,2,0,55,55,'2022-07-23 09:11:21','2022-08-02 14:05:37'),
(15,1,'400.1','PENGELUARAN','400',0,1,NULL,1,NULL,3,0,55,55,'2022-07-23 09:11:45','2022-08-02 14:06:06');

/*Table structure for table `acct_account_balance` */

DROP TABLE IF EXISTS `acct_account_balance`;

CREATE TABLE `acct_account_balance` (
  `account_balance_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `account_id` int(10) DEFAULT NULL,
  `last_balance` varchar(225) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`account_balance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `acct_account_balance` */

insert  into `acct_account_balance`(`account_balance_id`,`company_id`,`account_id`,`last_balance`,`created_id`,`last_update`) values 
(12,1,11,'-336000',55,'2022-08-03 13:02:44'),
(13,1,12,'-343000',55,'2022-08-03 11:48:45'),
(14,1,14,'-7000',55,'2022-08-03 11:54:17'),
(15,1,15,'0',55,'2022-08-03 13:02:44');

/*Table structure for table `acct_account_balance_detail` */

DROP TABLE IF EXISTS `acct_account_balance_detail`;

CREATE TABLE `acct_account_balance_detail` (
  `account_balance_detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `account_id` int(10) DEFAULT NULL,
  `transaction_id` int(10) DEFAULT NULL,
  `transaction_type` varchar(225) DEFAULT NULL,
  `transaction_code` varchar(225) DEFAULT NULL,
  `transaction_date` varchar(225) DEFAULT NULL,
  `opening_balance` varchar(225) DEFAULT NULL,
  `account_in` varchar(225) DEFAULT NULL,
  `account_out` varchar(225) DEFAULT NULL,
  `last_balance` varchar(225) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`account_balance_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

/*Data for the table `acct_account_balance_detail` */

insert  into `acct_account_balance_detail`(`account_balance_detail_id`,`company_id`,`account_id`,`transaction_id`,`transaction_type`,`transaction_code`,`transaction_date`,`opening_balance`,`account_in`,`account_out`,`last_balance`,`created_id`,`data_state`,`last_update`) values 
(43,1,11,36,'2','PBL','2022-08-03','0','0','65000','-65000',55,0,'2022-08-03 11:43:29'),
(44,1,12,36,'2','PBL','2022-08-03','0','0','65000','-65000',55,0,'2022-08-03 11:43:29'),
(45,1,11,37,'2','PBL','2022-08-03','-65000','0','378000','-443000',55,0,'2022-08-03 11:45:40'),
(46,1,12,37,'2','PBL','2022-08-03','-65000','0','378000','-443000',55,0,'2022-08-03 11:45:40'),
(47,1,11,38,'3','RPBL','2022-08-03','-443000','100000','0','-343000',55,0,'2022-08-03 11:48:45'),
(48,1,12,38,'3','RPBL','2022-08-03','-443000','100000','0','-343000',55,0,'2022-08-03 11:48:45'),
(49,1,11,39,'4','PJL','2022-08-03','-343000','7000','0','-336000',55,0,'2022-08-03 11:51:12'),
(50,1,14,39,'4','PJL','2022-08-03','0','0','7000','-7000',55,0,'2022-08-03 11:51:12'),
(51,1,11,40,'4','PJL','2022-08-03','-336000','19000','0','-317000',55,0,'2022-08-03 11:53:13'),
(52,1,14,40,'4','PJL','2022-08-03','-7000','0','19000','-26000',55,0,'2022-08-03 11:53:13'),
(53,1,11,41,'7','HPSPJL','2022-08-03','-317000','0','19000','-336000',55,0,'2022-08-03 11:54:17'),
(54,1,14,41,'7','HPSPJL','2022-08-03','-26000','19000','0','-7000',55,0,'2022-08-03 11:54:17'),
(55,1,11,42,'5','PGL','2022-08-03','-336000','0','10000','-346000',55,0,'2022-08-03 13:02:15'),
(56,1,15,42,'5','PGL','2022-08-03','0','0','10000','-10000',55,0,'2022-08-03 13:02:15'),
(57,1,11,43,'8','HPSPGL','2022-08-03','-346000','10000','0','-336000',55,0,'2022-08-03 13:02:44'),
(58,1,15,43,'8','HPSPGL','2022-08-03','-10000','10000','0','0',55,0,'2022-08-03 13:02:44');

/*Table structure for table `acct_account_setting` */

DROP TABLE IF EXISTS `acct_account_setting`;

CREATE TABLE `acct_account_setting` (
  `account_setting_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `account_id` int(10) DEFAULT NULL,
  `account_setting_name` varchar(225) DEFAULT NULL,
  `account_setting_status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`account_setting_id`),
  KEY `FK_account_id` (`account_id`),
  CONSTRAINT `FK_account_id` FOREIGN KEY (`account_id`) REFERENCES `acct_account` (`account_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8mb4;

/*Data for the table `acct_account_setting` */

insert  into `acct_account_setting`(`account_setting_id`,`company_id`,`account_id`,`account_setting_name`,`account_setting_status`,`created_at`,`updated_at`) values 
(378,1,12,'purchase_account',0,'2022-07-23 09:43:57','2022-07-23 09:43:57'),
(379,1,11,'purchase_cash_account',1,'2022-07-23 09:43:57','2022-07-23 09:43:57'),
(380,1,12,'purchase_return_account',1,'2022-07-23 09:43:57','2022-07-23 09:43:57'),
(381,1,11,'purchase_return_cash_account',0,'2022-07-23 09:43:57','2022-07-23 09:43:57'),
(382,1,14,'sales_account',1,'2022-07-23 09:43:57','2022-07-23 09:43:57'),
(383,1,11,'sales_cash_account',0,'2022-07-23 09:43:57','2022-07-23 09:43:57'),
(384,1,15,'expenditure_account',0,'2022-07-23 09:43:57','2022-07-23 09:43:57'),
(385,1,11,'expenditure_cash_account',1,'2022-07-23 09:43:57','2022-07-23 09:43:57');

/*Table structure for table `acct_journal_voucher` */

DROP TABLE IF EXISTS `acct_journal_voucher`;

CREATE TABLE `acct_journal_voucher` (
  `journal_voucher_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `transaction_module_id` int(10) DEFAULT NULL,
  `journal_voucher_status` int(1) DEFAULT 0,
  `transaction_module_code` varchar(225) DEFAULT NULL,
  `journal_voucher_date` varchar(225) DEFAULT NULL,
  `journal_voucher_description` varchar(225) DEFAULT NULL,
  `journal_voucher_period` varchar(225) DEFAULT NULL,
  `journal_voucher_no` varchar(225) DEFAULT NULL,
  `journal_voucher_title` varchar(225) DEFAULT NULL,
  `data_state` int(10) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`journal_voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

/*Data for the table `acct_journal_voucher` */

insert  into `acct_journal_voucher`(`journal_voucher_id`,`company_id`,`transaction_module_id`,`journal_voucher_status`,`transaction_module_code`,`journal_voucher_date`,`journal_voucher_description`,`journal_voucher_period`,`journal_voucher_no`,`journal_voucher_title`,`data_state`,`created_id`,`updated_id`,`created_at`,`updated_at`) values 
(36,1,2,1,'PBL','2022-08-03','Pembelian','202208','0001/JV/VIII/2022','Pembelian',0,55,55,'2022-08-03 11:43:29','2022-08-03 11:43:29'),
(37,1,2,1,'PBL','2022-08-03','Pembelian','202208','0002/JV/VIII/2022','Pembelian',0,55,55,'2022-08-03 11:45:40','2022-08-03 11:45:40'),
(38,1,3,1,'RPBL','2022-08-03','Retur Pembelian','202208','0003/JV/VIII/2022','Retur Pembelian',0,55,55,'2022-08-03 11:48:45','2022-08-03 11:48:45'),
(39,1,4,1,'PJL','2022-08-03','Penjualan','202208','0004/JV/VIII/2022','Penjualan',0,55,55,'2022-08-03 11:51:12','2022-08-03 11:51:12'),
(40,1,4,1,'PJL','2022-08-03','Penjualan','202208','0005/JV/VIII/2022','Penjualan',0,55,55,'2022-08-03 11:53:13','2022-08-03 11:53:13'),
(41,1,7,1,'HPSPJL','2022-08-03','Hapus Penjualan','202208','0006/JV/VIII/2022','Hapus Penjualan',0,55,55,'2022-08-03 11:54:17','2022-08-03 11:54:17'),
(42,1,5,1,'PGL','2022-08-03','Pengeluaran','202208','0007/JV/VIII/2022','Pengeluaran',0,55,55,'2022-08-03 13:02:15','2022-08-03 13:02:15'),
(43,1,8,1,'HPSPGL','2022-08-03','Hapus Pengeluaran','202208','0008/JV/VIII/2022','Hapus Pengeluaran',0,55,55,'2022-08-03 13:02:44','2022-08-03 13:02:44');

/*Table structure for table `acct_journal_voucher_item` */

DROP TABLE IF EXISTS `acct_journal_voucher_item`;

CREATE TABLE `acct_journal_voucher_item` (
  `journal_voucher_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `journal_voucher_id` int(10) DEFAULT NULL,
  `account_id` int(10) DEFAULT NULL,
  `journal_voucher_amount` varchar(225) DEFAULT '0',
  `account_id_status` int(1) DEFAULT NULL,
  `account_id_default_status` int(1) DEFAULT NULL,
  `journal_voucher_debit_amount` varchar(225) DEFAULT '0',
  `journal_voucher_credit_amount` varchar(225) DEFAULT '0',
  `data_state` int(10) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`journal_voucher_item_id`),
  KEY `Fk_journal_voucher` (`journal_voucher_id`),
  CONSTRAINT `Fk_journal_voucher` FOREIGN KEY (`journal_voucher_id`) REFERENCES `acct_journal_voucher` (`journal_voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

/*Data for the table `acct_journal_voucher_item` */

insert  into `acct_journal_voucher_item`(`journal_voucher_item_id`,`company_id`,`journal_voucher_id`,`account_id`,`journal_voucher_amount`,`account_id_status`,`account_id_default_status`,`journal_voucher_debit_amount`,`journal_voucher_credit_amount`,`data_state`,`created_id`,`updated_id`,`created_at`,`updated_at`) values 
(55,1,36,11,'65000',1,0,'0','65000',0,55,55,'2022-08-03 11:43:29','2022-08-03 11:43:29'),
(56,1,36,12,'65000',0,1,'65000','0',0,55,55,'2022-08-03 11:43:29','2022-08-03 11:43:29'),
(57,1,37,11,'378000',1,0,'0','378000',0,55,55,'2022-08-03 11:45:40','2022-08-03 11:45:40'),
(58,1,37,12,'378000',0,1,'378000','0',0,55,55,'2022-08-03 11:45:40','2022-08-03 11:45:40'),
(59,1,38,11,'100000',0,0,'100000','0',0,55,55,'2022-08-03 11:48:45','2022-08-03 11:48:45'),
(60,1,38,12,'100000',1,1,'0','100000',0,55,55,'2022-08-03 11:48:45','2022-08-03 11:48:45'),
(61,1,39,11,'7000',0,0,'7000','0',0,55,55,'2022-08-03 11:51:12','2022-08-03 11:51:12'),
(62,1,39,14,'7000',1,0,'0','7000',0,55,55,'2022-08-03 11:51:12','2022-08-03 11:51:12'),
(63,1,40,11,'19000',0,0,'19000','0',0,55,55,'2022-08-03 11:53:13','2022-08-03 11:53:13'),
(64,1,40,14,'19000',1,0,'0','19000',0,55,55,'2022-08-03 11:53:13','2022-08-03 11:53:13'),
(65,1,41,11,'19000',1,0,'0','19000',0,55,55,'2022-08-03 11:54:17','2022-08-03 11:54:17'),
(66,1,41,14,'19000',0,0,'19000','0',0,55,55,'2022-08-03 11:54:17','2022-08-03 11:54:17'),
(67,1,42,11,'10000',1,0,'0','10000',0,55,55,'2022-08-03 13:02:15','2022-08-03 13:02:15'),
(68,1,42,15,'10000',0,1,'10000','0',0,55,55,'2022-08-03 13:02:15','2022-08-03 13:02:15'),
(69,1,43,11,'10000',0,0,'10000','0',0,55,55,'2022-08-03 13:02:44','2022-08-03 13:02:44'),
(70,1,43,15,'10000',1,1,'0','10000',0,55,55,'2022-08-03 13:02:44','2022-08-03 13:02:44');

/*Table structure for table `capital_money` */

DROP TABLE IF EXISTS `capital_money`;

CREATE TABLE `capital_money` (
  `capital_money_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `capital_money_date` date DEFAULT NULL,
  `capital_money_amount` int(10) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`capital_money_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `capital_money` */

insert  into `capital_money`(`capital_money_id`,`company_id`,`capital_money_date`,`capital_money_amount`,`data_state`,`created_id`,`created_at`,`updated_at`) values 
(1,1,'2022-07-14',200000,0,55,'2022-07-14 09:11:08','2022-07-14 09:11:08'),
(4,1,'2022-07-14',123123,0,55,'2022-07-14 09:17:52','2022-07-14 09:17:52'),
(5,1,'2022-07-14',2222,0,55,'2022-07-14 09:49:22','2022-07-14 09:49:22'),
(14,1,'2022-07-15',100000,0,55,'2022-07-15 07:12:50','2022-07-15 07:12:58'),
(15,1,'2022-07-18',20000,0,55,'2022-07-18 16:06:22','2022-07-18 16:06:22');

/*Table structure for table `core_section` */

DROP TABLE IF EXISTS `core_section`;

CREATE TABLE `core_section` (
  `section_id` int(10) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(225) DEFAULT NULL,
  `section_token` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `company_id` int(10) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `core_section` */

insert  into `core_section`(`section_id`,`section_name`,`section_token`,`data_state`,`company_id`,`created_id`,`updated_id`,`created_at`,`updated_at`) values 
(1,'Bagian Tes','d8c5bb6f76b6f508b42f431397f1731b',0,1,55,55,'2022-06-25 11:15:20','2022-06-25 11:15:24');

/*Table structure for table `expenditure` */

DROP TABLE IF EXISTS `expenditure`;

CREATE TABLE `expenditure` (
  `expenditure_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `expenditure_date` date DEFAULT NULL,
  `expenditure_remark` text DEFAULT NULL,
  `expenditure_amount` int(10) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`expenditure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `expenditure` */

insert  into `expenditure`(`expenditure_id`,`company_id`,`expenditure_date`,`expenditure_remark`,`expenditure_amount`,`data_state`,`created_id`,`created_at`,`updated_at`) values 
(7,1,'2022-08-03',NULL,10000,1,55,'2022-08-03 13:02:15','2022-08-03 13:02:44');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `invt_item` */

DROP TABLE IF EXISTS `invt_item`;

CREATE TABLE `invt_item` (
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `item_category_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_barcode` varchar(50) DEFAULT NULL,
  `item_status` int(1) DEFAULT 0,
  `item_default_quantity` varchar(100) DEFAULT NULL,
  `item_unit_price` varchar(100) DEFAULT NULL,
  `item_unit_cost` varchar(100) DEFAULT NULL,
  `item_remark` varchar(255) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_category_id` (`item_category_id`),
  KEY `FK_item_unit_id` (`item_unit_id`),
  CONSTRAINT `FK_category_id` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_item_unit_id` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

/*Data for the table `invt_item` */

insert  into `invt_item`(`item_id`,`company_id`,`item_category_id`,`item_unit_id`,`item_name`,`item_code`,`item_barcode`,`item_status`,`item_default_quantity`,`item_unit_price`,`item_unit_cost`,`item_remark`,`data_state`,`updated_at`,`created_at`,`updated_id`,`created_id`) values 
(15,1,10,26,'P-XL 5RB','P-XL 5RB',NULL,0,'1','7000','6500',NULL,0,'2022-08-03 11:28:55','2022-08-03 11:28:55',55,55),
(16,1,10,26,'P-XL 10RB','P-XL 10RB',NULL,0,'1','12000','11000',NULL,0,'2022-08-03 11:29:29','2022-08-03 11:29:29',55,55),
(17,1,13,26,'P-TSEL 5RB','P-TSEL 5RB',NULL,0,'1','7000','6500',NULL,0,'2022-08-03 11:30:22','2022-08-03 11:30:22',55,55),
(18,1,13,26,'P-TSEL 10RB','P-TSEL 10RB',NULL,0,'1','12000','11000',NULL,0,'2022-08-03 11:30:46','2022-08-03 11:30:46',55,55),
(19,1,11,27,'M-DUCKBIL','M-DUCKBIL',NULL,0,'1','25000','20000',NULL,0,'2022-08-03 11:31:38','2022-08-03 11:31:38',55,55),
(20,1,12,27,'V-XL 1GB','V-XL 1GB',NULL,0,'1','30000','25000',NULL,1,'2022-08-03 11:33:16','2022-08-03 11:32:58',55,55),
(21,1,14,26,'V-XL 1GB','V-XL 1GB',NULL,0,'1','30000','25000',NULL,1,'2022-08-03 11:34:40','2022-08-03 11:34:23',55,55),
(22,1,12,26,'V-XL 1GB','V-XL 1GB',NULL,0,'1','30000','25000',NULL,0,'2022-08-03 11:35:17','2022-08-03 11:35:17',55,55),
(23,1,12,26,'V-XL 2GB','V-XL 2GB',NULL,0,'1','55000','50000',NULL,0,'2022-08-03 11:35:40','2022-08-03 11:35:40',55,55),
(24,1,14,26,'V-TSEL 2GB','V-TSEL 2GB',NULL,0,'1','60000','58000',NULL,0,'2022-08-03 11:36:16','2022-08-03 11:36:16',55,55),
(25,1,11,27,'M-KOREA','M-KOREA',NULL,0,'1','50000','45000',NULL,0,'2022-08-03 11:37:20','2022-08-03 11:37:20',55,55);

/*Table structure for table `invt_item_category` */

DROP TABLE IF EXISTS `invt_item_category`;

CREATE TABLE `invt_item_category` (
  `item_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `item_category_code` varchar(50) DEFAULT NULL,
  `item_category_name` varchar(255) DEFAULT NULL,
  `item_category_remark` varchar(255) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `invt_item_category` */

insert  into `invt_item_category`(`item_category_id`,`company_id`,`item_category_code`,`item_category_name`,`item_category_remark`,`data_state`,`updated_at`,`created_at`,`updated_id`,`created_id`) values 
(10,1,'PLS XL','PLS XL',NULL,0,'2022-08-03 11:18:38','2022-08-03 11:09:43',55,55),
(11,1,'MASKER','MASKER',NULL,0,'2022-08-03 11:13:53','2022-08-03 11:13:53',55,55),
(12,1,'VCR XL','VCR XL',NULL,0,'2022-08-03 11:19:33','2022-08-03 11:14:09',55,55),
(13,1,'PLS TSEL','PLS TSEL',NULL,0,'2022-08-03 11:20:03','2022-08-03 11:20:03',55,55),
(14,1,'VCR TSEL','VCR TSEL',NULL,0,'2022-08-03 11:20:24','2022-08-03 11:20:24',55,55);

/*Table structure for table `invt_item_stock` */

DROP TABLE IF EXISTS `invt_item_stock`;

CREATE TABLE `invt_item_stock` (
  `item_stock_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `warehouse_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `item_category_id` int(10) DEFAULT NULL,
  `last_balance` varchar(225) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `data_state` int(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_stock_id`),
  KEY `FK_item_id_stock` (`item_id`),
  KEY `FK_item_category_stock` (`item_category_id`),
  KEY `Fk_warehouse_id_stock` (`warehouse_id`),
  KEY `FK_item_unit_id_stock` (`item_unit_id`),
  CONSTRAINT `FK_item_category_stock` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`),
  CONSTRAINT `FK_item_id_stock` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `FK_item_unit_id_stock` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`),
  CONSTRAINT `Fk_warehouse_id_stock` FOREIGN KEY (`warehouse_id`) REFERENCES `invt_warehouse` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

/*Data for the table `invt_item_stock` */

insert  into `invt_item_stock`(`item_stock_id`,`company_id`,`warehouse_id`,`item_id`,`item_unit_id`,`item_category_id`,`last_balance`,`last_update`,`data_state`,`updated_at`,`updated_id`,`created_at`,`created_id`) values 
(16,1,6,15,26,10,'9','2022-08-03 11:54:17',0,'2022-08-03 11:54:17',55,'2022-08-03 11:28:55',55),
(17,1,6,16,26,10,'0','2022-08-03 11:54:17',0,'2022-08-03 11:54:17',55,'2022-08-03 11:29:29',55),
(18,1,6,17,26,13,'12','2022-08-03 11:45:40',0,'2022-08-03 11:45:40',55,'2022-08-03 11:30:22',55),
(19,1,6,18,26,13,'0',NULL,0,'2022-08-03 11:30:46',55,'2022-08-03 11:30:46',55),
(20,1,6,19,27,11,'0',NULL,0,'2022-08-03 11:31:38',55,'2022-08-03 11:31:38',55),
(21,1,6,20,27,12,'0','2022-08-03 11:33:16',1,'2022-08-03 11:33:16',55,'2022-08-03 11:32:58',55),
(22,1,6,21,26,14,'0','2022-08-03 11:34:40',1,'2022-08-03 11:34:40',55,'2022-08-03 11:34:23',55),
(23,1,6,22,26,12,'0',NULL,0,'2022-08-03 11:35:17',55,'2022-08-03 11:35:17',55),
(24,1,6,23,26,12,'0',NULL,0,'2022-08-03 11:35:40',55,'2022-08-03 11:35:40',55),
(25,1,6,24,26,14,'4','2022-08-03 11:48:45',0,'2022-08-03 11:48:45',55,'2022-08-03 11:36:16',55),
(26,1,6,25,27,11,'0',NULL,0,'2022-08-03 11:37:20',55,'2022-08-03 11:37:20',55);

/*Table structure for table `invt_item_unit` */

DROP TABLE IF EXISTS `invt_item_unit`;

CREATE TABLE `invt_item_unit` (
  `item_unit_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `item_unit_code` varchar(50) DEFAULT NULL,
  `item_unit_name` varchar(255) DEFAULT NULL,
  `item_unit_remark` varchar(255) DEFAULT '',
  `data_state` int(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

/*Data for the table `invt_item_unit` */

insert  into `invt_item_unit`(`item_unit_id`,`company_id`,`item_unit_code`,`item_unit_name`,`item_unit_remark`,`data_state`,`updated_at`,`created_at`,`updated_id`,`created_id`) values 
(26,1,'UNIT','UNIT',NULL,0,'2022-08-03 11:10:29','2022-08-03 11:10:29',55,55),
(27,1,'PACK','PACK',NULL,0,'2022-08-03 11:13:31','2022-08-03 11:13:31',55,55);

/*Table structure for table `invt_stock_adjustment` */

DROP TABLE IF EXISTS `invt_stock_adjustment`;

CREATE TABLE `invt_stock_adjustment` (
  `stock_adjustment_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `warehouse_id` int(10) DEFAULT NULL,
  `stock_adjustment_date` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`stock_adjustment_id`),
  KEY `FK_warehouse_adjustment` (`warehouse_id`),
  CONSTRAINT `FK_warehouse_adjustment` FOREIGN KEY (`warehouse_id`) REFERENCES `invt_warehouse` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

/*Data for the table `invt_stock_adjustment` */

/*Table structure for table `invt_stock_adjustment_item` */

DROP TABLE IF EXISTS `invt_stock_adjustment_item`;

CREATE TABLE `invt_stock_adjustment_item` (
  `stock_adjustment_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `stock_adjustment_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `item_category_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `last_balance_data` varchar(225) DEFAULT NULL,
  `last_balance_physical` varchar(225) DEFAULT NULL,
  `last_balance_adjustment` varchar(225) DEFAULT NULL,
  `stock_adjustment_item_remark` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`stock_adjustment_item_id`),
  KEY `FK_item_id_stock_item` (`item_id`),
  KEY `FK_category_id_stock_item` (`item_category_id`),
  KEY `FK_unit_id_stock_item` (`item_unit_id`),
  KEY `FK_adjustment_id` (`stock_adjustment_id`),
  CONSTRAINT `FK_adjustment_id` FOREIGN KEY (`stock_adjustment_id`) REFERENCES `invt_stock_adjustment` (`stock_adjustment_id`),
  CONSTRAINT `FK_category_id_stock_item` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`),
  CONSTRAINT `FK_item_id_stock_item` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `FK_unit_id_stock_item` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `invt_stock_adjustment_item` */

/*Table structure for table `invt_warehouse` */

DROP TABLE IF EXISTS `invt_warehouse`;

CREATE TABLE `invt_warehouse` (
  `warehouse_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `warehouse_code` varchar(50) DEFAULT NULL,
  `warehouse_name` varchar(255) DEFAULT NULL,
  `warehouse_address` varchar(255) DEFAULT NULL,
  `warehouse_phone` varbinary(12) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `invt_warehouse` */

insert  into `invt_warehouse`(`warehouse_id`,`company_id`,`warehouse_code`,`warehouse_name`,`warehouse_address`,`warehouse_phone`,`data_state`,`updated_at`,`created_at`,`updated_id`,`created_id`) values 
(6,1,'TOKO','TOKO','KARANGANYAR','012132324545',0,'2022-08-03 11:08:07','2022-08-03 11:08:07',55,55);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2022_06_18_024733_create_sessions_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`created_at`,`updated_at`) values 
(10,'App\\Models\\User',55,'token-name','b8c1afdcad0f8a21acd625d99d1e1c6ba31700abff2e11e1b87a6ead06854772','[\"*\"]','2022-07-19 13:36:21','2022-07-19 11:51:22','2022-07-19 13:36:21'),
(11,'App\\Models\\User',55,'token-name','2745549e505babf5dc6f90c28ce5b831947b7e77d7dedc103ff96aa8037fe1cc','[\"*\"]',NULL,'2022-07-19 14:24:08','2022-07-19 14:24:08');

/*Table structure for table `preference_company` */

DROP TABLE IF EXISTS `preference_company`;

CREATE TABLE `preference_company` (
  `company_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(225) DEFAULT NULL,
  `company_address` varchar(225) DEFAULT NULL,
  `company_phone_number` varchar(225) DEFAULT NULL,
  `company_mobile_number` varchar(225) DEFAULT NULL,
  `company_email` varchar(225) DEFAULT NULL,
  `company_website` varchar(225) DEFAULT NULL,
  `company_logo` varchar(225) DEFAULT NULL,
  `printer_address` varchar(225) DEFAULT NULL,
  `receipt_bottom_text` varchar(250) DEFAULT ':::::Terima Kasih:::::',
  `data_state` int(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `preference_company` */

insert  into `preference_company`(`company_id`,`company_name`,`company_address`,`company_phone_number`,`company_mobile_number`,`company_email`,`company_website`,`company_logo`,`printer_address`,`receipt_bottom_text`,`data_state`,`created_at`,`updated_at`) values 
(1,'TOKO JAYA','Jl.Lawu, Jawa tengah, Indonesia','081122223333','0125321','tokojaya@gmail.com','tokojaya.com',NULL,'66:12:0D:33:A8:D3',':::::Terima Kasih:::::',0,'2022-07-04 16:39:34','2022-07-19 11:12:24'),
(2,'TOKO MAJU MAKMUR','Jl.Solo, Jawa Tengah, Indonesia','082190908989','0123910',NULL,'tokomajumakmur.com',NULL,NULL,':::::Terima Kasih:::::',0,'2022-07-05 09:09:27','2022-07-05 09:09:30');

/*Table structure for table `preference_transaction_module` */

DROP TABLE IF EXISTS `preference_transaction_module`;

CREATE TABLE `preference_transaction_module` (
  `transaction_module_id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_module_name` varchar(225) DEFAULT NULL,
  `transaction_module_code` varchar(225) DEFAULT NULL,
  `transaction_controller` varchar(225) DEFAULT NULL,
  `transaction_table` varchar(225) DEFAULT NULL,
  `transaction_primary_key` varchar(225) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`transaction_module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `preference_transaction_module` */

insert  into `preference_transaction_module`(`transaction_module_id`,`transaction_module_name`,`transaction_module_code`,`transaction_controller`,`transaction_table`,`transaction_primary_key`,`status`,`data_state`,`last_update`) values 
(1,'Jurnal Umum','JU','JournalVoucherController','acct_journal_voucher','journal_voucher_id',NULL,0,'2022-07-11 09:44:29'),
(2,'Pembelian','PBL','PurchaseInvoiceController','purchase_invoice','purchase_invoice_id',NULL,0,'2022-07-13 12:08:23'),
(3,'Retur Pembelian','RPBL','PurchaseReturnReportController','purchase_return','purchase_return_id',NULL,0,'2022-07-13 12:09:17'),
(4,'Penjualan','PJL','SalesInvoiceReportController','sales_invoice','sales_invoice_id',NULL,0,'2022-07-13 12:11:37'),
(5,'Pengeluaran','PGL','ExpenditureController','expenditure','expenditure_id',NULL,0,'2022-07-18 16:00:46'),
(7,'Hapus Penjualan','HPSPJL','SalesInvoiceReportController','sales_invoice','sales_invoice_id',NULL,0,'2022-08-02 13:15:42'),
(8,'Hapus Pengeluaran','HPSPGL','ExpenditureController','expenditure','expenditure_id',NULL,0,'2022-08-02 13:15:56');

/*Table structure for table `purchase_invoice` */

DROP TABLE IF EXISTS `purchase_invoice`;

CREATE TABLE `purchase_invoice` (
  `purchase_invoice_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `purchase_invoice_no` varchar(225) DEFAULT NULL,
  `warehouse_id` int(10) DEFAULT NULL,
  `subtotal_item` varchar(225) DEFAULT NULL,
  `purchase_invoice_remark` varchar(225) DEFAULT NULL,
  `purchase_invoice_date` varchar(225) DEFAULT NULL,
  `purchase_invoice_supplier` varchar(225) DEFAULT NULL,
  `subtotal_amount_total` varchar(225) DEFAULT NULL,
  `discount_percentage_total` varchar(225) DEFAULT NULL,
  `discount_amount_total` varchar(225) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `paid_amount` varchar(225) DEFAULT NULL,
  `owing_amount` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`purchase_invoice_id`),
  KEY `FK_warehouse_id_purchase_invoice` (`warehouse_id`),
  CONSTRAINT `FK_warehouse_id_purchase_invoice` FOREIGN KEY (`warehouse_id`) REFERENCES `invt_warehouse` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;

/*Data for the table `purchase_invoice` */

insert  into `purchase_invoice`(`purchase_invoice_id`,`company_id`,`purchase_invoice_no`,`warehouse_id`,`subtotal_item`,`purchase_invoice_remark`,`purchase_invoice_date`,`purchase_invoice_supplier`,`subtotal_amount_total`,`discount_percentage_total`,`discount_amount_total`,`total_amount`,`paid_amount`,`owing_amount`,`data_state`,`created_id`,`updated_id`,`created_at`,`updated_at`) values 
(60,1,'0001/PI/VIII/2022',6,'10',NULL,'2022-08-03','RIAN','65000','0','0','65000','65000','0',0,55,55,'2022-08-03 11:43:29','2022-08-03 11:43:29'),
(61,1,'0002/PI/VIII/2022',6,'18',NULL,'2022-08-03','RIAN','378000','0','0','378000','378000','0',0,55,55,'2022-08-03 11:45:40','2022-08-03 11:45:40');

/*Table structure for table `purchase_invoice_item` */

DROP TABLE IF EXISTS `purchase_invoice_item`;

CREATE TABLE `purchase_invoice_item` (
  `purchase_invoice_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `purchase_invoice_id` int(10) DEFAULT NULL,
  `item_category_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `quantity` varchar(225) DEFAULT NULL,
  `item_unit_cost` varchar(225) DEFAULT NULL,
  `subtotal_amount` varchar(225) DEFAULT NULL,
  `item_expired_date` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`purchase_invoice_item_id`),
  KEY `Fk_category_purchase_invoice` (`item_category_id`),
  KEY `Fk_item_unit_purchase_invoice` (`item_unit_id`),
  KEY `Fk_item_purchase_invoice` (`item_id`),
  KEY `Fk_purchase_invoice_id` (`purchase_invoice_id`),
  CONSTRAINT `Fk_category_purchase_invoice` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`),
  CONSTRAINT `Fk_item_purchase_invoice` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `Fk_item_unit_purchase_invoice` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`),
  CONSTRAINT `Fk_purchase_invoice_id` FOREIGN KEY (`purchase_invoice_id`) REFERENCES `purchase_invoice` (`purchase_invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

/*Data for the table `purchase_invoice_item` */

insert  into `purchase_invoice_item`(`purchase_invoice_item_id`,`company_id`,`purchase_invoice_id`,`item_category_id`,`item_unit_id`,`item_id`,`quantity`,`item_unit_cost`,`subtotal_amount`,`item_expired_date`,`data_state`,`created_id`,`updated_id`,`created_at`,`updated_at`) values 
(64,1,60,10,26,15,'10','6500','65000','2022-11-19',0,55,55,'2022-08-03 11:43:29','2022-08-03 11:43:29'),
(65,1,61,13,26,17,'12','6500','78000','2022-08-03',0,55,55,'2022-08-03 11:45:40','2022-08-03 11:45:40'),
(66,1,61,14,26,24,'6','50000','300000','2022-08-03',0,55,55,'2022-08-03 11:45:40','2022-08-03 11:45:40');

/*Table structure for table `purchase_return` */

DROP TABLE IF EXISTS `purchase_return`;

CREATE TABLE `purchase_return` (
  `purchase_return_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `purchase_return_no` varchar(225) DEFAULT NULL,
  `warehouse_id` int(10) DEFAULT NULL,
  `purchase_return_date` varchar(225) DEFAULT NULL,
  `purchase_return_supplier` varchar(255) DEFAULT NULL,
  `purchase_return_quantity` varchar(255) DEFAULT NULL,
  `purchase_return_subtotal` varchar(255) DEFAULT NULL,
  `purchase_return_remark` varchar(255) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`purchase_return_id`),
  KEY `Fk_warehouse_id` (`warehouse_id`),
  CONSTRAINT `Fk_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `invt_warehouse` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

/*Data for the table `purchase_return` */

insert  into `purchase_return`(`purchase_return_id`,`company_id`,`purchase_return_no`,`warehouse_id`,`purchase_return_date`,`purchase_return_supplier`,`purchase_return_quantity`,`purchase_return_subtotal`,`purchase_return_remark`,`data_state`,`updated_at`,`created_at`,`updated_id`,`created_id`) values 
(21,1,'0001/PR/VIII/2022',6,'2022-08-03','RIAN','2','100000',NULL,0,'2022-08-03 11:48:45','2022-08-03 11:48:45',55,55);

/*Table structure for table `purchase_return_item` */

DROP TABLE IF EXISTS `purchase_return_item`;

CREATE TABLE `purchase_return_item` (
  `purchase_item_id` int(20) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `purchase_return_id` int(20) DEFAULT NULL,
  `item_category_id` int(20) DEFAULT NULL,
  `item_id` int(20) DEFAULT NULL,
  `item_unit_id` int(20) DEFAULT NULL,
  `purchase_item_cost` varchar(255) DEFAULT NULL,
  `purchase_item_quantity` varchar(225) DEFAULT NULL,
  `purchase_item_subtotal` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`purchase_item_id`),
  KEY `FK_Purchase_return_id` (`purchase_return_id`),
  CONSTRAINT `FK_Purchase_return_id` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_return` (`purchase_return_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `purchase_return_item` */

insert  into `purchase_return_item`(`purchase_item_id`,`company_id`,`purchase_return_id`,`item_category_id`,`item_id`,`item_unit_id`,`purchase_item_cost`,`purchase_item_quantity`,`purchase_item_subtotal`,`data_state`,`created_id`,`updated_id`,`created_at`,`updated_at`) values 
(18,1,21,14,24,26,'50000','2','100000',0,55,55,'2022-08-03 11:48:45','2022-08-03 11:48:45');

/*Table structure for table `sales_customer` */

DROP TABLE IF EXISTS `sales_customer`;

CREATE TABLE `sales_customer` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  `customer_gender` int(1) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sales_customer` */

/*Table structure for table `sales_invoice` */

DROP TABLE IF EXISTS `sales_invoice`;

CREATE TABLE `sales_invoice` (
  `sales_invoice_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `sales_invoice_no` varchar(225) DEFAULT NULL,
  `sales_invoice_date` varchar(225) DEFAULT NULL,
  `subtotal_item` varchar(225) DEFAULT NULL,
  `subtotal_amount` varchar(225) DEFAULT NULL,
  `discount_percentage_total` varchar(225) DEFAULT NULL,
  `discount_amount_total` varchar(225) DEFAULT NULL,
  `total_amount` varchar(225) DEFAULT NULL,
  `paid_amount` varchar(225) DEFAULT NULL,
  `change_amount` varchar(225) DEFAULT NULL,
  `table_no` varchar(250) DEFAULT NULL,
  `payment_method` int(10) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`sales_invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sales_invoice` */

insert  into `sales_invoice`(`sales_invoice_id`,`company_id`,`customer_id`,`sales_invoice_no`,`sales_invoice_date`,`subtotal_item`,`subtotal_amount`,`discount_percentage_total`,`discount_amount_total`,`total_amount`,`paid_amount`,`change_amount`,`table_no`,`payment_method`,`data_state`,`created_at`,`updated_at`,`created_id`,`updated_id`) values 
(39,1,NULL,'0001/SI/VIII/2022','2022-08-03','1','7000','0','0','7000','7000','0',NULL,NULL,0,'2022-08-03 11:51:12','2022-08-03 11:51:12',55,55),
(40,1,NULL,'0002/SI/VIII/2022','2022-08-03','2','19000','0','0','19000','19000','0',NULL,NULL,1,'2022-08-03 11:53:13','2022-08-03 11:54:17',55,55);

/*Table structure for table `sales_invoice_item` */

DROP TABLE IF EXISTS `sales_invoice_item`;

CREATE TABLE `sales_invoice_item` (
  `sales_invoice_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `sales_invoice_id` int(10) DEFAULT NULL,
  `item_category_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `quantity` varchar(225) DEFAULT NULL,
  `item_unit_price` varchar(225) DEFAULT NULL,
  `subtotal_amount` varchar(225) DEFAULT NULL,
  `discount_percentage` varchar(225) DEFAULT NULL,
  `discount_amount` varchar(225) DEFAULT NULL,
  `subtotal_amount_after_discount` varchar(225) DEFAULT NULL,
  `item_remark` varchar(250) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sales_invoice_item_id`),
  KEY `FK_sales_invoice_item` (`item_id`),
  KEY `FK_sales_invoice_category` (`item_category_id`),
  KEY `FK_sales_invoice_unit` (`item_unit_id`),
  KEY `FK_sales_invoice_id` (`sales_invoice_id`),
  CONSTRAINT `FK_sales_invoice_category` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`),
  CONSTRAINT `FK_sales_invoice_id` FOREIGN KEY (`sales_invoice_id`) REFERENCES `sales_invoice` (`sales_invoice_id`),
  CONSTRAINT `FK_sales_invoice_item` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `FK_sales_invoice_unit` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sales_invoice_item` */

insert  into `sales_invoice_item`(`sales_invoice_item_id`,`company_id`,`sales_invoice_id`,`item_category_id`,`item_unit_id`,`item_id`,`quantity`,`item_unit_price`,`subtotal_amount`,`discount_percentage`,`discount_amount`,`subtotal_amount_after_discount`,`item_remark`,`data_state`,`created_id`,`updated_id`,`created_at`,`updated_at`) values 
(56,1,39,10,26,15,'1','7000','7000','0','0','7000',NULL,0,55,55,'2022-08-03 11:51:12','2022-08-03 11:51:12'),
(57,1,40,10,26,15,'1','7000','7000','0','0','7000',NULL,0,55,55,'2022-08-03 11:53:13','2022-08-03 11:53:13'),
(58,1,40,10,26,16,'1','12000','12000','0','0','12000',NULL,0,55,55,'2022-08-03 11:53:13','2022-08-03 11:53:13');

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

/*Table structure for table `system_log_user` */

DROP TABLE IF EXISTS `system_log_user`;

CREATE TABLE `system_log_user` (
  `user_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT 0,
  `username` varchar(50) DEFAULT '',
  `id_previllage` int(4) DEFAULT 0,
  `log_stat` enum('0','1') DEFAULT NULL,
  `class_name` varchar(250) DEFAULT '',
  `pk` varchar(20) DEFAULT '',
  `remark` varchar(50) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `system_log_user` */

/*Table structure for table `system_login_log` */

DROP TABLE IF EXISTS `system_login_log`;

CREATE TABLE `system_login_log` (
  `login_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT 0,
  `company_id` int(10) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `log_status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`login_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `system_login_log` */

insert  into `system_login_log`(`login_log_id`,`user_id`,`company_id`,`log_time`,`log_status`,`created_at`,`updated_at`) values 
(1,55,1,'2022-07-19 07:51:22',0,'2022-07-19 11:51:22','2022-07-19 11:51:22'),
(2,55,1,'2022-07-19 14:24:08',1,'2022-07-19 14:24:08','2022-07-19 14:24:08'),
(3,50,1,'2022-07-19 13:53:25',NULL,'2022-07-19 13:53:33','2022-07-19 13:53:36'),
(4,55,1,'2022-07-06 14:23:09',1,'2022-07-22 14:23:15','2022-07-22 14:23:18'),
(5,55,1,'2022-07-07 07:28:33',0,'2022-07-25 13:28:45','2022-07-25 13:28:48'),
(6,55,1,'2022-07-07 14:51:46',1,NULL,NULL),
(7,55,1,'1972-02-21 00:00:00',0,'2022-07-25 14:17:59','2022-07-25 14:17:59'),
(8,NULL,NULL,'1972-02-21 00:00:00',1,'2022-07-25 14:22:10','2022-07-25 14:22:10'),
(9,55,1,'2022-07-25 14:24:55',0,'2022-07-25 14:24:55','2022-07-25 14:24:55'),
(10,55,1,'2022-07-25 14:25:11',1,'2022-07-25 14:25:11','2022-07-25 14:25:11'),
(11,55,1,'2022-07-25 14:25:48',0,'2022-07-25 14:25:48','2022-07-25 14:25:48'),
(12,55,1,'2022-07-25 15:06:51',1,'2022-07-25 15:06:51','2022-07-25 15:06:51'),
(13,55,1,'2022-08-02 10:05:36',0,'2022-08-02 10:05:37','2022-08-02 10:05:37'),
(14,55,1,'2022-08-02 11:46:43',0,'2022-08-02 11:46:43','2022-08-02 11:46:43'),
(15,55,1,'2022-08-03 09:07:10',0,'2022-08-03 09:07:10','2022-08-03 09:07:10'),
(16,55,1,'2022-08-03 13:46:11',1,'2022-08-03 13:46:11','2022-08-03 13:46:11'),
(17,55,1,'2022-08-03 13:49:06',0,'2022-08-03 13:49:06','2022-08-03 13:49:06');

/*Table structure for table `system_menu` */

DROP TABLE IF EXISTS `system_menu`;

CREATE TABLE `system_menu` (
  `id_menu` varchar(10) NOT NULL,
  `id` varchar(100) DEFAULT NULL,
  `type` enum('folder','file','function') DEFAULT NULL,
  `indent_level` int(1) DEFAULT NULL,
  `text` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `system_menu` */

insert  into `system_menu`(`id_menu`,`id`,`type`,`indent_level`,`text`,`image`,`company_id`,`last_update`) values 
('0','home','file',1,'Beranda',NULL,NULL,'2022-06-14 10:01:03'),
('1','#','folder',1,'Persediaan',NULL,NULL,'2022-06-14 10:07:14'),
('11','stock-adjustment','file',2,'Stok Penyesuaian',NULL,NULL,'2022-07-14 16:02:00'),
('13','stock-adjustment-report','file',2,'Stok Barang',NULL,NULL,'2022-08-02 14:23:53'),
('2','#','folder',1,'Pembelian',NULL,NULL,'2022-06-14 10:47:13'),
('21','purchase-invoice','file',2,'Pembelian',NULL,NULL,'2022-07-14 16:03:20'),
('23','purchase-return','file',2,'Retur Pembelian',NULL,NULL,'2022-07-14 16:03:36'),
('24','#','file',2,'Laporan Pembelian',NULL,NULL,'2022-06-14 11:00:04'),
('25','purchase-invoice-report','file',3,'Laporan Pembelian',NULL,NULL,'2022-06-27 13:33:10'),
('26','purchase-return-report','file',3,'Laporan Retur Pembelian',NULL,NULL,'2022-06-28 11:24:14'),
('27','purchase-invoice-by-item-report','file',3,'Laporan Pembelian by Produk',NULL,NULL,'2022-06-28 14:19:27'),
('3','#','folder',1,'Penjualan',NULL,NULL,'2022-06-14 11:06:55'),
('31','sales-invoice','file',2,'Penjualan',NULL,NULL,'2022-07-14 16:03:53'),
('32','sales-customer','file',2,'Pelanggan',NULL,NULL,'2022-07-18 14:41:40'),
('33','#','file',2,'Laporan Penjualan',NULL,NULL,'2022-07-18 14:40:18'),
('34','sales-invoice-report','file',3,'Laporan Penjualan',NULL,NULL,'2022-07-18 14:40:12'),
('35','sales-invoice-by-item-report','file',3,'Laporan Penjualan by Produk',NULL,NULL,'2022-07-18 14:40:09'),
('36','sales-invoice-by-item-report/not-sold','file',3,'Laporan Produk Tidak Terjual',NULL,NULL,'2022-07-18 14:40:06'),
('37','sales-invoice-by-user-report','file',3,'Laporan Penjualan by User',NULL,NULL,'2022-07-18 14:40:00'),
('38','sales-invoice-by-year-report','file',3,'Laporan Penjualan Tahunan',NULL,NULL,'2022-07-18 14:39:53'),
('4','#','folder',1,'Keuangan',NULL,NULL,'2022-06-14 11:15:12'),
('46','#','file',2,'Laporan',NULL,NULL,'2022-06-14 11:20:35'),
('47','cash-receipts-report','file',3,'Laporan Penerimaan Kas',NULL,NULL,'2022-07-22 09:06:44'),
('48','cash-disbursement-report','file',3,'Laporan Pengeluaran Kas',NULL,NULL,'2022-07-22 09:05:44'),
('49','profit-loss-report','file',3,'Laporan Keuangan',NULL,NULL,'2022-07-18 10:11:51'),
('490','profit-loss-year-report','file',3,'Laporan Keuangan Tahunan',NULL,NULL,'2022-07-22 09:06:58'),
('5','#','folder',1,'Akuntansi',NULL,NULL,'2022-07-25 10:01:22'),
('50','#','file',2,'Preferensi',NULL,NULL,'2022-07-25 10:01:58'),
('51','acct-account','file',3,'No. Perkiraan',NULL,NULL,'2022-07-25 10:02:05'),
('52','acct-account-setting','file',3,'Setting Jurnal',NULL,NULL,'2022-07-25 10:02:08'),
('53','journal-voucher','file',2,'Jurnal Umum',NULL,NULL,'2022-07-25 10:02:13'),
('54','journal-memorial','file',2,'Jurnal Memorial',NULL,NULL,'2022-07-25 10:02:15'),
('55','ledger-report','file',2,'Buku Besar',NULL,NULL,'2022-07-25 10:06:02'),
('7','#','folder',1,'Preferensi',NULL,NULL,'2022-07-08 15:06:39'),
('70','#','file',2,'Preferensi Barang',NULL,NULL,'2022-07-08 15:06:42'),
('71','item-unit','file',3,'Preferensi Satuan Barang',NULL,NULL,'2022-07-08 15:06:49'),
('72','item-category','file',3,'Kategori Barang',NULL,NULL,'2022-07-08 15:06:52'),
('73','item','file',3,'Barang',NULL,NULL,'2022-07-08 15:06:56'),
('74','warehouse','file',3,'Gudang',NULL,NULL,'2022-07-08 15:06:59'),
('75','#','file',2,'Set Up Data',NULL,NULL,'2022-07-08 15:07:02'),
('76','system-user-group','file',3,'User Group',NULL,NULL,'2022-07-08 15:07:05'),
('77','system-user','file',3,'User',NULL,NULL,'2022-07-08 15:07:12'),
('9','attendance-report','file',1,'Laporan Absensi',NULL,NULL,'2022-07-25 09:54:07'),
('91','expenditure','file',1,'Pengeluaran',NULL,NULL,'2022-07-25 09:58:39');

/*Table structure for table `system_menu_mapping` */

DROP TABLE IF EXISTS `system_menu_mapping`;

CREATE TABLE `system_menu_mapping` (
  `menu_mapping_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `user_group_level` int(3) DEFAULT NULL,
  `id_menu` varchar(10) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`menu_mapping_id`),
  KEY `FK_system_menu_mapping_id_menu` (`id_menu`),
  CONSTRAINT `FK_system_menu_mapping_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `system_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;

/*Data for the table `system_menu_mapping` */

insert  into `system_menu_mapping`(`menu_mapping_id`,`company_id`,`user_group_level`,`id_menu`,`data_state`,`created_at`,`updated_at`) values 
(0,1,1,'0',0,NULL,'2022-07-05 09:05:24'),
(1,1,1,'1',0,NULL,'2022-07-05 09:05:25'),
(3,1,1,'11',0,NULL,'2022-07-05 09:05:26'),
(6,1,1,'13',0,NULL,'2022-07-05 09:05:27'),
(7,1,1,'2',0,NULL,'2022-07-05 09:05:32'),
(9,1,1,'21',0,NULL,'2022-07-05 09:05:33'),
(11,1,1,'23',0,NULL,'2022-07-05 09:05:35'),
(12,1,1,'24',0,NULL,'2022-07-05 09:05:36'),
(13,1,1,'25',0,NULL,'2022-07-05 09:05:37'),
(14,1,1,'26',0,NULL,'2022-07-05 09:05:39'),
(15,1,1,'27',0,NULL,'2022-07-05 09:05:40'),
(16,1,1,'3',0,NULL,'2022-07-05 09:05:41'),
(18,1,1,'31',0,NULL,'2022-07-05 09:05:43'),
(19,1,1,'33',0,NULL,'2022-07-05 09:05:45'),
(20,1,1,'34',0,NULL,'2022-07-05 09:05:46'),
(21,1,1,'35',0,NULL,'2022-07-05 09:05:47'),
(22,1,1,'36',0,NULL,'2022-07-05 09:05:47'),
(23,1,1,'37',0,NULL,'2022-07-05 09:05:48'),
(24,1,1,'38',0,NULL,'2022-07-05 09:05:48'),
(25,1,1,'4',0,NULL,'2022-07-05 09:05:50'),
(26,1,1,'50',0,NULL,'2022-07-05 09:05:51'),
(27,1,1,'51',0,NULL,'2022-07-05 09:05:51'),
(28,1,1,'52',0,NULL,'2022-07-05 09:05:52'),
(32,1,1,'46',0,NULL,'2022-07-05 09:05:57'),
(34,1,1,'48',0,NULL,'2022-07-05 09:06:00'),
(35,1,1,'49',0,NULL,'2022-07-05 09:06:01'),
(36,1,1,'490',0,NULL,'2022-07-05 09:06:01'),
(37,1,1,'7',0,NULL,'2022-07-05 09:06:02'),
(38,1,1,'70',0,NULL,'2022-07-05 09:06:03'),
(39,1,1,'71',0,NULL,'2022-07-05 09:06:07'),
(40,1,1,'72',0,NULL,'2022-07-05 09:06:08'),
(41,1,1,'73',0,NULL,'2022-07-05 09:06:09'),
(42,1,1,'74',0,NULL,'2022-07-05 09:06:09'),
(43,1,1,'75',0,NULL,'2022-07-05 09:06:10'),
(44,1,1,'76',0,NULL,'2022-07-05 09:06:11'),
(45,1,1,'77',0,NULL,'2022-07-05 09:06:20'),
(59,1,1,'53',0,NULL,'2022-07-08 15:14:43'),
(62,1,1,'54',0,NULL,'2022-07-13 16:47:51'),
(78,1,1,'32',0,NULL,'2022-07-18 14:41:56'),
(79,1,1,'9',0,NULL,'2022-07-21 11:48:21'),
(80,1,1,'47',0,NULL,'2022-07-22 09:07:44'),
(82,1,1,'91',0,NULL,'2022-07-25 09:58:51'),
(83,1,1,'5',0,NULL,'2022-07-25 10:03:19'),
(84,1,1,'55',0,NULL,'2022-07-25 10:06:43');

/*Table structure for table `system_user` */

DROP TABLE IF EXISTS `system_user`;

CREATE TABLE `system_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `user_group_id` int(3) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `phone_number` varchar(255) DEFAULT '',
  `branch_id` int(1) DEFAULT 0,
  `section_id` int(10) DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_system_user_user_group_id` (`user_group_id`),
  CONSTRAINT `fk_system_user_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `system_user_group` (`user_group_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

/*Data for the table `system_user` */

insert  into `system_user`(`user_id`,`company_id`,`user_group_id`,`full_name`,`name`,`phone_number`,`branch_id`,`section_id`,`email`,`email_verified_at`,`password`,`remember_token`,`data_state`,`created_at`,`updated_at`) values 
(55,1,1,'Administrator','administrator','081212124566',0,0,NULL,'2022-06-14 09:36:00','$2y$10$X3wxaIbGvrntrKkgBNxk8.GVGMboZNSMQ985bSnMMcHOJ9ne94.2y',NULL,0,'2022-07-13 09:36:10','2022-07-13 09:36:14'),
(57,2,4,'Administrator','admin2','090990902090',0,0,NULL,NULL,'$2y$10$u/2M0O2m1UJToBK6HB9cau2OJ24xnMfKcVysXknJMW9vgMYZcQ8xm',NULL,0,'2022-07-13 09:36:20','2022-07-13 09:36:22'),
(60,1,4,'dsad','dfsdsf','',0,0,NULL,NULL,'',NULL,0,NULL,NULL);

/*Table structure for table `system_user_group` */

DROP TABLE IF EXISTS `system_user_group`;

CREATE TABLE `system_user_group` (
  `user_group_id` int(3) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `user_group_level` int(11) DEFAULT NULL,
  `user_group_name` varchar(50) DEFAULT NULL,
  `user_group_token` varchar(250) DEFAULT '',
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT 0,
  `updated_on` datetime DEFAULT NULL,
  `deleted_id` int(10) DEFAULT 0,
  `deleted_on` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `system_user_group` */

insert  into `system_user_group`(`user_group_id`,`company_id`,`user_group_level`,`user_group_name`,`user_group_token`,`data_state`,`created_id`,`created_at`,`updated_id`,`updated_on`,`deleted_id`,`deleted_on`,`updated_at`) values 
(1,1,1,'Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-07-05 09:04:46'),
(4,2,1,'Administrator','',0,0,NULL,0,NULL,0,NULL,'2022-07-05 10:54:40');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/* Trigger structure for table `acct_journal_voucher` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_acct_journal_voucher` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_acct_journal_voucher` BEFORE INSERT ON `acct_journal_voucher` FOR EACH ROW BEGIN
	DECLARE year_period 		VARCHAR(20);
	DECLARE month_period 		VARCHAR(20);
	DECLARE PERIOD 			VARCHAR(20);
	DECLARE tPeriod			INT;
	DECLARE nJournalVoucherNo	VARCHAR(20);
	DECLARE monthPeriod		VARCHAR(20);
	
	SET year_period = (YEAR(new.journal_voucher_date));
	
	SET month_period = (SELECT RIGHT(CONCAT('0', MONTH(new.journal_voucher_date)), 2));
	
	IF (month_period) = '01' THEN 
		SET monthPeriod = 'I';
	END IF;
	
	IF (month_period) = '02' THEN 
		SET monthPeriod = 'II';
	END IF;
	
	IF (month_period) = '03' THEN 
		SET monthPeriod = 'III';
	END IF;
	
	IF (month_period) = '04' THEN 
		SET monthPeriod = 'IV';
	END IF;	
	
	IF (month_period) = '05' THEN 
		SET monthPeriod = 'V';
	END IF;
	
	IF (month_period) = '06' THEN 
		SET monthPeriod = 'VI';
	END IF;
	
	IF (month_period) = '07' THEN 
		SET monthPeriod = 'VII';
	END IF;
	
	IF (month_period) = '08' THEN 
		SET monthPeriod = 'VIII';
	END IF;
	
	IF (month_period) = '09' THEN 
		SET monthPeriod = 'IX';
	END IF;
	
	IF (month_period) = '10' THEN 
		SET monthPeriod = 'X';
	END IF;
	
	IF (month_period) = '11' THEN 
		SET monthPeriod = 'XI';
	END IF;
	
	IF (month_period) = '12' THEN 
		SET monthPeriod = 'XII';
	END IF;
		
	SET PERIOD = (SELECT LEFT(TRIM(journal_voucher_no), 4) 
			FROM acct_journal_voucher
			WHERE RIGHT(TRIM(journal_voucher_no), 4) = year_period
			ORDER BY journal_voucher_id DESC 
			LIMIT 1);
		
	IF (PERIOD IS NULL ) THEN 
		SET PERIOD = "0000";
	END IF;
	
	SET tPeriod = CAST(PERIOD AS DECIMAL(10));
	
	SET tPeriod = tPeriod + 1;
	
	SET PERIOD = RIGHT(CONCAT('0000', TRIM(CAST(tPeriod AS CHAR(4)))), 4);
	
	SET nJournalVoucherNo = CONCAT(PERIOD, '/JV/', monthPeriod, '/', year_period);
		
	SET new.journal_voucher_no = nJournalVoucherNo;
    END */$$


DELIMITER ;

/* Trigger structure for table `acct_journal_voucher_item` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_acct_journal_voucher_item` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_acct_journal_voucher_item` BEFORE INSERT ON `acct_journal_voucher_item` FOR EACH ROW BEGIN
	DECLARE nAccountIDDefaultStatus		DECIMAL(1);
	
	DECLARE nAccountID		INT(10);
	DECLARE nBranchID		INT(10);
	DECLARE nOpeningBalance		DECIMAL(20);
	DECLARE nLastBalance		DECIMAL(20);
	DECLARE nTransactionType	DECIMAL(10);
	DECLARE nTransactionCode	VARCHAR(20);
	DECLARE nTransactionID		INT(10);
	DECLARE nTransactionDate	DATE;
	DECLARE nAccountIn		DECIMAL(20);
	DECLARE nAccountOut		DECIMAL(20);
	DECLARE nCreatedId		INT(10);
	
	
	set nCreatedId			= (SELECT created_id FROM acct_journal_voucher
						WHERE journal_voucher_id = new.journal_voucher_id);
	
	SET nBranchID 			= (SELECT company_id FROM acct_journal_voucher
						WHERE journal_voucher_id = new.journal_voucher_id);
						
	SET nOpeningBalance 		= (SELECT last_balance FROM acct_account_balance
						WHERE company_id = nBranchID
						AND account_id = new.account_id);
						
	IF ( nOpeningBalance IS NULL ) THEN
		SET nOpeningBalance = 0;
	END IF;
				
	SET nAccountIDDefaultStatus 	= (SELECT account_default_status FROM acct_account 
						WHERE account_id = new.account_id);
						
	IF (new.account_id_status = nAccountIDDefaultStatus) THEN
		SET nLastBalance 	= nOpeningBalance + new.journal_voucher_amount;
		SET nAccountIn 		= new.journal_voucher_amount;
		SET nAccountOut		= 0;
	ELSE
		SET nLastBalance 	= nOpeningBalance - new.journal_voucher_amount;
		SET nAccountIn 		= 0;
		SET nAccountOut		= new.journal_voucher_amount;
	END IF; 
	
	SET nAccountID 			= (SELECT account_id FROM acct_account_balance 
						WHERE company_id = nBranchID
						AND account_id = new.account_id);
	
	IF (nAccountID IS NULL) THEN
		INSERT INTO acct_account_balance (company_id, account_id, last_balance, created_id) VALUES (nBranchID, new.account_id, nLastBalance, nCreatedId);
	ELSE 
		UPDATE acct_account_balance SET last_balance = nLastBalance
			WHERE account_id = new.account_id
			AND company_id = nBranchID;
	END IF;
	
		
	SET nTransactionType 		= (SELECT transaction_module_id FROM acct_journal_voucher WHERE journal_voucher_id = new.journal_voucher_id);
		
	SET nTransactionCode 		= (SELECT transaction_module_code FROM acct_journal_voucher WHERE journal_voucher_id = new.journal_voucher_id);
	
	SET nTransactionID 		= new.journal_voucher_id;
		
	SET nTransactionDate 		= (SELECT journal_voucher_date FROM acct_journal_voucher WHERE journal_voucher_id = new.journal_voucher_id);
		
	INSERT INTO acct_account_balance_detail (company_id, transaction_type, transaction_code, transaction_id, transaction_date, 
		account_id, opening_balance, account_in, account_out, last_balance, created_id)
		VALUES (nBranchID, nTransactionType, nTransactionCode, nTransactionID, nTransactionDate, 
			new.account_id, nOpeningBalance, nAccountIn, nAccountOut, nLastBalance, nCreatedId);
    END */$$


DELIMITER ;

/* Trigger structure for table `acct_journal_voucher_item` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_acct_journal_voucher_item` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_acct_journal_voucher_item` BEFORE UPDATE ON `acct_journal_voucher_item` FOR EACH ROW BEGIN
	DECLARE nAccountIDDefaultStatus		DECIMAL(1);
	
	DECLARE nAccountID			INT(10);
	DECLARE nBranchID			INT(10);
	DECLARE nOpeningBalance			DECIMAL(20);
	DECLARE nLastBalance			DECIMAL(20);
	DECLARE nTransactionType		DECIMAL(10);
	DECLARE nTransactionCode		VARCHAR(20);
	DECLARE nTransactionID			INT(10);
	DECLARE nTransactionDate		DATE;
	DECLARE nAccountIn			DECIMAL(20);
	DECLARE nAccountOut			DECIMAL(20);
	
	IF (new.data_state = 2) THEN 
		SET nBranchID 			= (SELECT company_id FROM acct_journal_voucher
						WHERE journal_voucher_id = new.journal_voucher_id);
						
		SET nOpeningBalance 		= (SELECT last_balance FROM acct_account_balance
						WHERE company_id = nBranchID
						AND account_id = new.account_id);
							
		IF ( nOpeningBalance IS NULL ) THEN
			SET nOpeningBalance = 0;
		END IF;
					
		SET nAccountIDDefaultStatus 	= (SELECT account_default_status FROM acct_account 
							WHERE account_id = new.account_id);
							
		IF (new.account_id_status = nAccountIDDefaultStatus) THEN
			SET nLastBalance 	= nOpeningBalance - new.journal_voucher_amount;
			SET nAccountOut 	= new.journal_voucher_amount;
			SET nAccountIn		= 0;
		ELSE
			SET nLastBalance 	= nOpeningBalance + new.journal_voucher_amount;
			SET nAccountOut 	= 0;
			SET nAccountIn		= new.journal_voucher_amount;
		END IF; 
			
		SET nAccountID 			= (SELECT account_id FROM acct_account_balance 
						WHERE company_id = nBranchID
						AND account_id = new.account_id);
		
		IF (nAccountID IS NULL) THEN
			INSERT INTO acct_account_balance (company_id, account_id, last_balance) VALUES (nBranchID, new.account_id, nLastBalance);
		ELSE 
			UPDATE acct_account_balance SET last_balance = nLastBalance
				WHERE account_id = new.account_id
				AND branch_id = nBranchID;
		END IF;
		
			
		SET nTransactionType 		= (SELECT transaction_module_id FROM acct_journal_voucher WHERE journal_voucher_id = new.journal_voucher_id);
			
		SET nTransactionCode 		= (SELECT transaction_module_code FROM acct_journal_voucher WHERE journal_voucher_id = new.journal_voucher_id);
		
		SET nTransactionID 		= new.journal_voucher_id;
			
		SET nTransactionDate 		= (SELECT journal_voucher_date FROM acct_journal_voucher WHERE journal_voucher_id = new.journal_voucher_id);
			
		INSERT INTO acct_account_balance_detail (company_id, transaction_type, transaction_code, transaction_id, transaction_date, 
			account_id, opening_balance, account_in, account_out, last_balance)
			VALUES (nBranchID, nTransactionType, nTransactionCode, nTransactionID, nTransactionDate, 
				new.account_id, nOpeningBalance, nAccountIn, nAccountOut, nLastBalance);
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `purchase_invoice` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_purchase_invoice` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_purchase_invoice` BEFORE INSERT ON `purchase_invoice` FOR EACH ROW BEGIN
	DECLARE year_period 		VARCHAR(20);
	DECLARE month_period 		VARCHAR(20);
	DECLARE PERIOD 			VARCHAR(20);
	DECLARE tPeriod			INT;
	DECLARE nPurchaseInvoiceNo	VARCHAR(20);
	DECLARE monthPeriod		VARCHAR(20);
	DECLARE lenPurchaseInvoiceNo	DECIMAL(10);
	
	SET year_period = (YEAR(new.purchase_invoice_date));
	
	SET month_period = (SELECT RIGHT(CONCAT('0', MONTH(new.purchase_invoice_date)), 2));
	
	IF (month_period) = '01' THEN 
		SET monthPeriod = 'I';
	END IF;
	
	IF (month_period) = '02' THEN 
		SET monthPeriod = 'II';
	END IF;
	
	IF (month_period) = '03' THEN 
		SET monthPeriod = 'III';
	END IF;
	
	IF (month_period) = '04' THEN 
		SET monthPeriod = 'IV';
	END IF;	
	
	IF (month_period) = '05' THEN 
		SET monthPeriod = 'V';
	END IF;
	
	IF (month_period) = '06' THEN 
		SET monthPeriod = 'VI';
	END IF;
	
	IF (month_period) = '07' THEN 
		SET monthPeriod = 'VII';
	END IF;
	
	IF (month_period) = '08' THEN 
		SET monthPeriod = 'VIII';
	END IF;
	
	IF (month_period) = '09' THEN 
		SET monthPeriod = 'IX';
	END IF;
	
	IF (month_period) = '10' THEN 
		SET monthPeriod = 'X';
	END IF;
	
	IF (month_period) = '11' THEN 
		SET monthPeriod = 'XI';
	END IF;
	
	IF (month_period) = '12' THEN 
		SET monthPeriod = 'XII';
	END IF;
		
	SET PERIOD = (SELECT LEFT(TRIM(purchase_invoice_no), 4) 
			FROM purchase_invoice
			WHERE RIGHT(TRIM(purchase_invoice_no), 4) = year_period
			ORDER BY purchase_invoice_id DESC 
			LIMIT 1);
		
	IF (PERIOD IS NULL ) THEN 
		SET PERIOD = "0000";
	END IF;
	
	SET tPeriod = CAST(PERIOD AS DECIMAL(10));
	
	SET tPeriod = tPeriod + 1;
	
	SET PERIOD = RIGHT(CONCAT('0000', TRIM(CAST(tPeriod AS CHAR(4)))), 4);
	
	SET nPurchaseInvoiceNo = CONCAT(PERIOD, '/PI/', monthPeriod, '/', year_period);
		
	SET new.purchase_invoice_no = nPurchaseInvoiceNo;
    END */$$


DELIMITER ;

/* Trigger structure for table `purchase_return` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_purchase_return` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_purchase_return` BEFORE INSERT ON `purchase_return` FOR EACH ROW BEGIN
	DECLARE year_period 		VARCHAR(20);
	DECLARE month_period 		VARCHAR(20);
	DECLARE PERIOD 			VARCHAR(20);
	DECLARE tPeriod			INT;
	DECLARE nSalesInvoiceNo		VARCHAR(20);
	DECLARE monthPeriod		VARCHAR(20);
	DECLARE lenSalesInvoiceNo	DECIMAL(10);
	
	SET year_period = (YEAR(new.purchase_return_date));
	
	SET month_period = (SELECT RIGHT(CONCAT('0', MONTH(new.purchase_return_date)), 2));
	
	IF (month_period) = '01' THEN 
		SET monthPeriod = 'I';
	END IF;
	
	IF (month_period) = '02' THEN 
		SET monthPeriod = 'II';
	END IF;
	
	IF (month_period) = '03' THEN 
		SET monthPeriod = 'III';
	END IF;
	
	IF (month_period) = '04' THEN 
		SET monthPeriod = 'IV';
	END IF;	
	
	IF (month_period) = '05' THEN 
		SET monthPeriod = 'V';
	END IF;
	
	IF (month_period) = '06' THEN 
		SET monthPeriod = 'VI';
	END IF;
	
	IF (month_period) = '07' THEN 
		SET monthPeriod = 'VII';
	END IF;
	
	IF (month_period) = '08' THEN 
		SET monthPeriod = 'VIII';
	END IF;
	
	IF (month_period) = '09' THEN 
		SET monthPeriod = 'IX';
	END IF;
	
	IF (month_period) = '10' THEN 
		SET monthPeriod = 'X';
	END IF;
	
	IF (month_period) = '11' THEN 
		SET monthPeriod = 'XI';
	END IF;
	
	IF (month_period) = '12' THEN 
		SET monthPeriod = 'XII';
	END IF;
		
	SET PERIOD = (SELECT LEFT(TRIM(purchase_return_no), 4) 
			FROM purchase_return
			WHERE RIGHT(TRIM(purchase_return_no), 4) = year_period
			ORDER BY purchase_return_id DESC 
			LIMIT 1);
		
	IF (PERIOD IS NULL ) THEN 
		SET PERIOD = "0000";
	END IF;
	
	SET tPeriod = CAST(PERIOD AS DECIMAL(10));
	
	SET tPeriod = tPeriod + 1;
	
	SET PERIOD = RIGHT(CONCAT('0000', TRIM(CAST(tPeriod AS CHAR(4)))), 4);
	
	SET nSalesInvoiceNo = CONCAT(PERIOD, '/PR/', monthPeriod, '/', year_period);
		
	SET new.purchase_return_no = nSalesInvoiceNo;
    END */$$


DELIMITER ;

/* Trigger structure for table `sales_invoice` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_sales_invoice` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_sales_invoice` BEFORE INSERT ON `sales_invoice` FOR EACH ROW BEGIN
	DECLARE year_period 		VARCHAR(20);
	DECLARE month_period 		VARCHAR(20);
	DECLARE PERIOD 			VARCHAR(20);
	DECLARE tPeriod			INT;
	DECLARE nSalesInvoiceNo		VARCHAR(20);
	DECLARE monthPeriod		VARCHAR(20);
	DECLARE lenSalesInvoiceNo	DECIMAL(10);
	
	SET year_period = (YEAR(new.sales_invoice_date));
	
	SET month_period = (SELECT RIGHT(CONCAT('0', MONTH(new.sales_invoice_date)), 2));
	
	IF (month_period) = '01' THEN 
		SET monthPeriod = 'I';
	END IF;
	
	IF (month_period) = '02' THEN 
		SET monthPeriod = 'II';
	END IF;
	
	IF (month_period) = '03' THEN 
		SET monthPeriod = 'III';
	END IF;
	
	IF (month_period) = '04' THEN 
		SET monthPeriod = 'IV';
	END IF;	
	
	IF (month_period) = '05' THEN 
		SET monthPeriod = 'V';
	END IF;
	
	IF (month_period) = '06' THEN 
		SET monthPeriod = 'VI';
	END IF;
	
	IF (month_period) = '07' THEN 
		SET monthPeriod = 'VII';
	END IF;
	
	IF (month_period) = '08' THEN 
		SET monthPeriod = 'VIII';
	END IF;
	
	IF (month_period) = '09' THEN 
		SET monthPeriod = 'IX';
	END IF;
	
	IF (month_period) = '10' THEN 
		SET monthPeriod = 'X';
	END IF;
	
	IF (month_period) = '11' THEN 
		SET monthPeriod = 'XI';
	END IF;
	
	IF (month_period) = '12' THEN 
		SET monthPeriod = 'XII';
	END IF;
		
	SET PERIOD = (SELECT LEFT(TRIM(sales_invoice_no), 4) 
			FROM sales_invoice
			WHERE RIGHT(TRIM(sales_invoice_no), 4) = year_period
			ORDER BY sales_invoice_id DESC 
			LIMIT 1);
		
	IF (PERIOD IS NULL ) THEN 
		SET PERIOD = "0000";
	END IF;
	
	SET tPeriod = CAST(PERIOD AS DECIMAL(10));
	
	SET tPeriod = tPeriod + 1;
	
	SET PERIOD = RIGHT(CONCAT('0000', TRIM(CAST(tPeriod AS CHAR(4)))), 4);
	
	SET nSalesInvoiceNo = CONCAT(PERIOD, '/SI/', monthPeriod, '/', year_period);
		
	SET new.sales_invoice_no = nSalesInvoiceNo;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
