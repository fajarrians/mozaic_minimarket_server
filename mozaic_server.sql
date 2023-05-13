/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.18-MariaDB : Database - ciptaprocpanel_minimarket_kasihibu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `ciptaprocpanel_minimarket_kasihibu`;

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
  PRIMARY KEY (`account_id`),
  KEY `fk_company_id_acct_account` (`company_id`),
  CONSTRAINT `fk_company_id_acct_account` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `acct_account_balance` */

DROP TABLE IF EXISTS `acct_account_balance`;

CREATE TABLE `acct_account_balance` (
  `account_balance_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `account_id` int(10) DEFAULT NULL,
  `last_balance` varchar(225) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`account_balance_id`),
  KEY `fk_company_id_account_balence` (`company_id`),
  KEY `fk_account_id_account_balence` (`account_id`),
  CONSTRAINT `fk_account_id_account_balence` FOREIGN KEY (`account_id`) REFERENCES `acct_account` (`account_id`),
  CONSTRAINT `fk_company_id_account_balence` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

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
  PRIMARY KEY (`account_balance_detail_id`),
  KEY `fk_company_id_account_balance_detail` (`company_id`),
  KEY `fk_account_id_balance_detail` (`account_id`),
  KEY `fk_transaction_id_balance_detail` (`transaction_id`),
  CONSTRAINT `fk_account_id_balance_detail` FOREIGN KEY (`account_id`) REFERENCES `acct_account` (`account_id`),
  CONSTRAINT `fk_company_id_account_balance_detail` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41600 DEFAULT CHARSET=utf8mb4;

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
  KEY `fk_company_id_account_setting` (`company_id`),
  CONSTRAINT `FK_account_id` FOREIGN KEY (`account_id`) REFERENCES `acct_account` (`account_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_company_id_account_setting` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `acct_balance_sheet_report` */

DROP TABLE IF EXISTS `acct_balance_sheet_report`;

CREATE TABLE `acct_balance_sheet_report` (
  `balance_sheet_report_id` bigint(22) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `report_no` int(10) DEFAULT 0,
  `account_id1` int(10) DEFAULT 0,
  `account_code1` varchar(20) DEFAULT '',
  `account_name1` varchar(100) DEFAULT '',
  `account_id2` int(10) DEFAULT 0,
  `account_code2` varchar(20) DEFAULT '',
  `account_name2` varchar(100) DEFAULT '',
  `report_formula1` varchar(255) DEFAULT '',
  `report_operator1` varchar(255) DEFAULT '',
  `report_type1` int(11) DEFAULT 0,
  `report_tab1` int(11) DEFAULT 0,
  `report_bold1` int(11) DEFAULT 0,
  `report_formula2` varchar(255) DEFAULT '',
  `report_operator2` varchar(255) DEFAULT '',
  `report_type2` int(11) DEFAULT 0,
  `report_tab2` int(11) DEFAULT 0,
  `report_bold2` int(11) DEFAULT 0,
  `report_formula3` varchar(255) DEFAULT '',
  `report_operator3` varchar(255) DEFAULT '',
  `balance_report_type` decimal(1,0) NOT NULL,
  `balance_report_type1` decimal(1,0) NOT NULL,
  `data_state` int(10) DEFAULT 0,
  `created_id` int(10) DEFAULT 0,
  `created_on` datetime DEFAULT NULL,
  `last_update` time DEFAULT '00:00:00',
  PRIMARY KEY (`balance_sheet_report_id`),
  KEY `account_id1` (`account_id1`),
  KEY `account_id2` (`account_id2`),
  KEY `fk_company_id_sheet_report` (`company_id`),
  CONSTRAINT `fk_company_id_sheet_report` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Table structure for table `acct_journal_voucher` */

DROP TABLE IF EXISTS `acct_journal_voucher`;

CREATE TABLE `acct_journal_voucher` (
  `journal_voucher_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `transaction_module_id` int(10) DEFAULT NULL,
  `journal_voucher_status` int(1) DEFAULT 0,
  `transaction_journal_no` varchar(225) DEFAULT NULL,
  `transaction_module_code` varchar(225) DEFAULT NULL,
  `journal_voucher_date` varchar(225) DEFAULT NULL,
  `journal_voucher_description` varchar(225) DEFAULT NULL,
  `journal_voucher_period` varchar(225) DEFAULT NULL,
  `journal_voucher_no` varchar(225) DEFAULT NULL,
  `journal_voucher_title` varchar(225) DEFAULT NULL,
  `voided` int(1) DEFAULT 0,
  `voided_id` int(10) DEFAULT NULL,
  `voided_on` datetime DEFAULT NULL,
  `voided_remark` varchar(225) DEFAULT NULL,
  `data_state` int(10) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`journal_voucher_id`),
  KEY `fk_company_id_journal_voucher` (`company_id`),
  KEY `fk_transaction_module_id_journal_voucher` (`transaction_module_id`),
  CONSTRAINT `fk_company_id_journal_voucher` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_transaction_module_id_journal_voucher` FOREIGN KEY (`transaction_module_id`) REFERENCES `preference_transaction_module` (`transaction_module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20820 DEFAULT CHARSET=utf8mb4;

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
  KEY `fk_company_id_journal_voucher_item` (`company_id`),
  KEY `fk_account_id_journal_voucher_item` (`account_id`),
  CONSTRAINT `Fk_journal_voucher` FOREIGN KEY (`journal_voucher_id`) REFERENCES `acct_journal_voucher` (`journal_voucher_id`),
  CONSTRAINT `fk_account_id_journal_voucher_item` FOREIGN KEY (`account_id`) REFERENCES `acct_account` (`account_id`),
  CONSTRAINT `fk_company_id_journal_voucher_item` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41600 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `acct_profit_loss_combined_report` */

DROP TABLE IF EXISTS `acct_profit_loss_combined_report`;

CREATE TABLE `acct_profit_loss_combined_report` (
  `profit_loss_combined_report_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `format_id` int(10) DEFAULT NULL,
  `report_no` int(10) DEFAULT NULL,
  `account_type_id` int(10) DEFAULT NULL,
  `account_id1` int(10) DEFAULT NULL,
  `account_id2` int(10) DEFAULT NULL,
  `account_code1` varchar(250) DEFAULT NULL,
  `account_code2` varchar(250) DEFAULT NULL,
  `account_name` varchar(250) DEFAULT NULL,
  `report_formula` varchar(250) DEFAULT NULL,
  `report_operator` varchar(250) DEFAULT NULL,
  `report_type` int(1) DEFAULT NULL,
  `report_tab` int(1) DEFAULT NULL,
  `report_bold` int(1) DEFAULT NULL,
  `data_state` int(1) DEFAULT NULL,
  `created_id` int(1) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`profit_loss_combined_report_id`),
  KEY `fk_company_id_commbined_report` (`company_id`),
  CONSTRAINT `fk_company_id_commbined_report` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `acct_profit_loss_report` */

DROP TABLE IF EXISTS `acct_profit_loss_report`;

CREATE TABLE `acct_profit_loss_report` (
  `profit_loss_report_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `format_id` int(10) DEFAULT NULL,
  `report_no` int(10) DEFAULT NULL,
  `account_type_id` int(10) DEFAULT NULL,
  `account_id` int(10) DEFAULT NULL,
  `account_code` varchar(250) DEFAULT NULL,
  `account_name` varchar(250) DEFAULT NULL,
  `report_formula` varchar(250) DEFAULT NULL,
  `report_operator` varchar(250) DEFAULT NULL,
  `report_type` int(1) DEFAULT NULL,
  `report_tab` int(1) DEFAULT NULL,
  `report_bold` int(1) DEFAULT NULL,
  `data_state` int(1) DEFAULT NULL,
  `created_id` int(1) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`profit_loss_report_id`),
  KEY `fk_company_id_profit_loss_report` (`company_id`),
  CONSTRAINT `fk_company_id_profit_loss_report` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `acct_supplier_balance` */

DROP TABLE IF EXISTS `acct_supplier_balance`;

CREATE TABLE `acct_supplier_balance` (
  `supplier_balance_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `supplier_id` int(10) DEFAULT NULL,
  `supplier_balance_remark` varchar(225) DEFAULT NULL,
  `transaction_no` varchar(225) DEFAULT NULL,
  `supplier_balance_date` varchar(225) DEFAULT NULL,
  `opening_balance` varchar(225) DEFAULT NULL,
  `payable_amount` varchar(225) DEFAULT NULL,
  `payment_amount` varchar(225) DEFAULT NULL,
  `last_balance` varchar(225) DEFAULT NULL,
  `data_state` int(10) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`supplier_balance_id`),
  KEY `fk_company_id_supplier_balance` (`company_id`),
  KEY `fk_supplier_id_supplier_balance` (`supplier_id`),
  CONSTRAINT `fk_company_id_supplier_balance` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_supplier_id_supplier_balance` FOREIGN KEY (`supplier_id`) REFERENCES `core_supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2265 DEFAULT CHARSET=utf8mb4;

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
  PRIMARY KEY (`capital_money_id`),
  KEY `fk_company_id_capital_money` (`company_id`),
  CONSTRAINT `fk_company_id_capital_money` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `close_cashier_log` */

DROP TABLE IF EXISTS `close_cashier_log`;

CREATE TABLE `close_cashier_log` (
  `cashier_log_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `cashier_log_date` varchar(250) DEFAULT NULL,
  `shift_cashier` varchar(250) DEFAULT NULL,
  `total_cash_transaction` varchar(250) DEFAULT NULL,
  `amount_cash_transaction` varchar(250) DEFAULT NULL,
  `total_receivable_transaction` varchar(250) DEFAULT NULL,
  `amount_receivable_transaction` varchar(250) DEFAULT NULL,
  `total_cashless_transaction` varchar(250) DEFAULT NULL,
  `amount_cashless_transaction` varchar(250) DEFAULT NULL,
  `total_transaction` varchar(250) DEFAULT NULL,
  `total_amount` varchar(250) DEFAULT NULL,
  `status_upload` int(1) DEFAULT 0,
  `from_store` int(1) NOT NULL DEFAULT 1,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`cashier_log_id`),
  KEY `fk_company_id_cashier_log` (`company_id`),
  CONSTRAINT `fk_company_id_cashier_log` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `core_bank` */

DROP TABLE IF EXISTS `core_bank`;

CREATE TABLE `core_bank` (
  `bank_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `account_id` int(10) DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`bank_id`),
  KEY `fk_company_id_core_bank` (`company_id`),
  KEY `fk_account_id_core_bank` (`account_id`),
  CONSTRAINT `fk_account_id_core_bank` FOREIGN KEY (`account_id`) REFERENCES `acct_account` (`account_id`),
  CONSTRAINT `fk_company_id_core_bank` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `core_member` */

DROP TABLE IF EXISTS `core_member`;

CREATE TABLE `core_member` (
  `member_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT 1,
  `member_no` varchar(50) DEFAULT NULL,
  `member_name` varchar(250) DEFAULT NULL,
  `division_name` varchar(250) DEFAULT NULL,
  `member_mandatory_savings` varchar(250) DEFAULT NULL,
  `member_account_receivable_amount` varchar(250) DEFAULT NULL,
  `member_account_receivable_amount_temp` varchar(250) DEFAULT NULL,
  `member_account_receivable_status` varchar(250) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `fk_company_id_core_member` (`company_id`),
  CONSTRAINT `fk_company_id_core_member` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=726 DEFAULT CHARSET=utf8mb4;

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

/*Table structure for table `core_supplier` */

DROP TABLE IF EXISTS `core_supplier`;

CREATE TABLE `core_supplier` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `supplier_name` varchar(250) DEFAULT NULL,
  `supplier_phone` varchar(250) DEFAULT NULL,
  `supplier_address` varchar(250) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`supplier_id`),
  KEY `fk_company_id_core_supplier` (`company_id`),
  CONSTRAINT `fk_company_id_core_supplier` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4;

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
  PRIMARY KEY (`expenditure_id`),
  KEY `fk_company_id_expenditure` (`company_id`),
  CONSTRAINT `fk_company_id_expenditure` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

/*Table structure for table `invt_item` */

DROP TABLE IF EXISTS `invt_item`;

CREATE TABLE `invt_item` (
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `item_category_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_barcode` varchar(50) DEFAULT '',
  `item_status` int(1) DEFAULT 0,
  `item_default_quantity` varchar(100) DEFAULT NULL,
  `item_unit_price` varchar(100) DEFAULT NULL,
  `item_unit_cost` varchar(100) DEFAULT NULL,
  `item_remark` varchar(255) DEFAULT '',
  `data_state` int(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_category_id` (`item_category_id`),
  KEY `FK_item_unit_id` (`item_unit_id`),
  KEY `fk_company_id_item` (`company_id`),
  CONSTRAINT `FK_category_id` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_item_unit_id` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_company_id_item` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3527 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `invt_item_barcode` */

DROP TABLE IF EXISTS `invt_item_barcode`;

CREATE TABLE `invt_item_barcode` (
  `item_barcode_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `item_packge_id` int(10) DEFAULT NULL,
  `item_barcode` varchar(250) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`item_barcode_id`),
  KEY `fk_company_id_item_barcode` (`company_id`),
  KEY `fk_item_id_item_barcode` (`item_id`),
  KEY `fk_item_unit_id_item_barcode` (`item_unit_id`),
  KEY `fk_item_packge_id_item_barcode` (`item_packge_id`),
  CONSTRAINT `fk_company_id_item_barcode` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_item_id_item_barcode` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `fk_item_packge_id_item_barcode` FOREIGN KEY (`item_packge_id`) REFERENCES `invt_item_packge` (`item_packge_id`),
  CONSTRAINT `fk_item_unit_id_item_barcode` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1973 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `invt_item_category` */

DROP TABLE IF EXISTS `invt_item_category`;

CREATE TABLE `invt_item_category` (
  `item_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `item_category_code` varchar(50) DEFAULT NULL,
  `item_category_name` varchar(225) DEFAULT NULL,
  `item_category_remark` varchar(225) DEFAULT '',
  `margin_percentage` varchar(225) DEFAULT '0',
  `data_state` int(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_category_id`),
  KEY `fk_company_id_item_category` (`company_id`),
  CONSTRAINT `fk_company_id_item_category` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `invt_item_mutation` */

DROP TABLE IF EXISTS `invt_item_mutation`;

CREATE TABLE `invt_item_mutation` (
  `item_mutation_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `item_category_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `transaction_no` varchar(225) DEFAULT NULL,
  `transaction_date` varchar(225) DEFAULT NULL,
  `transaction_remark` varchar(225) DEFAULT NULL,
  `opening_balence` varchar(225) DEFAULT NULL,
  `stock_in` varchar(225) DEFAULT NULL,
  `stock_out` varchar(225) DEFAULT NULL,
  `last_balence` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`item_mutation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `invt_item_packge` */

DROP TABLE IF EXISTS `invt_item_packge`;

CREATE TABLE `invt_item_packge` (
  `item_packge_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `item_category_id` int(10) DEFAULT NULL,
  `item_default_quantity` varchar(250) DEFAULT NULL,
  `margin_percentage` varchar(250) DEFAULT '0',
  `item_unit_price` varchar(250) DEFAULT NULL,
  `item_unit_cost` varchar(250) DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`item_packge_id`),
  KEY `fk_company_id_item_packge` (`company_id`),
  KEY `fk_item_id_item_packge` (`item_id`),
  KEY `fk_item_unit_id_item_packge` (`item_unit_id`),
  KEY `fk_item_category_id_item_packge` (`item_category_id`),
  CONSTRAINT `fk_company_id_item_packge` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_item_category_id_item_packge` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`),
  CONSTRAINT `fk_item_id_item_packge` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `fk_item_unit_id_item_packge` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14105 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `invt_item_rack` */

DROP TABLE IF EXISTS `invt_item_rack`;

CREATE TABLE `invt_item_rack` (
  `item_rack_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `rack_name` varchar(250) DEFAULT NULL,
  `rack_status` int(1) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_rack_id`),
  KEY `fk_company_id_item_rack` (`company_id`),
  CONSTRAINT `fk_company_id_item_rack` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `invt_item_stock` */

DROP TABLE IF EXISTS `invt_item_stock`;

CREATE TABLE `invt_item_stock` (
  `item_stock_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `warehouse_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `item_category_id` int(10) DEFAULT NULL,
  `rack_line` int(10) DEFAULT NULL,
  `rack_column` int(10) DEFAULT NULL,
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
  KEY `fk_company_id_item_stock` (`company_id`),
  CONSTRAINT `FK_item_category_stock` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`),
  CONSTRAINT `FK_item_id_stock` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `FK_item_unit_id_stock` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`),
  CONSTRAINT `Fk_warehouse_id_stock` FOREIGN KEY (`warehouse_id`) REFERENCES `invt_warehouse` (`warehouse_id`),
  CONSTRAINT `fk_company_id_item_stock` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3534 DEFAULT CHARSET=utf8mb4;

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
  PRIMARY KEY (`item_unit_id`),
  KEY `fk_company_id_item_unit` (`company_id`),
  CONSTRAINT `fk_company_id_item_unit` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `invt_stock_adjustment` */

DROP TABLE IF EXISTS `invt_stock_adjustment`;

CREATE TABLE `invt_stock_adjustment` (
  `stock_adjustment_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `warehouse_id` int(10) DEFAULT NULL,
  `adjustment_no` varchar(225) DEFAULT NULL,
  `stock_adjustment_date` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`stock_adjustment_id`),
  KEY `FK_warehouse_adjustment` (`warehouse_id`),
  KEY `fk_company_id_stock_adjustment` (`company_id`),
  CONSTRAINT `FK_warehouse_adjustment` FOREIGN KEY (`warehouse_id`) REFERENCES `invt_warehouse` (`warehouse_id`),
  CONSTRAINT `fk_company_id_stock_adjustment` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3833 DEFAULT CHARSET=utf8mb4;

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
  KEY `fk_company_id_stock_adjustment_item` (`company_id`),
  CONSTRAINT `FK_adjustment_id` FOREIGN KEY (`stock_adjustment_id`) REFERENCES `invt_stock_adjustment` (`stock_adjustment_id`),
  CONSTRAINT `FK_category_id_stock_item` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`),
  CONSTRAINT `FK_item_id_stock_item` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `FK_unit_id_stock_item` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`),
  CONSTRAINT `fk_company_id_stock_adjustment_item` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3831 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `invt_warehouse` */

DROP TABLE IF EXISTS `invt_warehouse`;

CREATE TABLE `invt_warehouse` (
  `warehouse_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `warehouse_code` varchar(50) DEFAULT NULL,
  `warehouse_name` varchar(255) DEFAULT NULL,
  `warehouse_address` varchar(255) DEFAULT NULL,
  `warehouse_phone` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`),
  KEY `fk_company_id_warehouse` (`company_id`),
  CONSTRAINT `fk_company_id_warehouse` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `account_payable_id` varchar(225) DEFAULT NULL,
  `account_shortover_id` varchar(225) DEFAULT NULL,
  `ppn_percentage` varchar(225) DEFAULT NULL,
  `printer_address` varchar(225) DEFAULT NULL,
  `receipt_bottom_text` varchar(250) DEFAULT ':::::Terima Kasih:::::',
  `data_state` int(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `preference_voucher` */

DROP TABLE IF EXISTS `preference_voucher`;

CREATE TABLE `preference_voucher` (
  `voucher_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `voucher_code` varchar(225) DEFAULT NULL,
  `voucher_amount` varchar(225) DEFAULT NULL,
  `start_voucher` varchar(225) DEFAULT NULL,
  `end_voucher` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`voucher_id`),
  KEY `fk_company_id_preference_voucher` (`company_id`),
  CONSTRAINT `fk_company_id_preference_voucher` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `purchase_invoice` */

DROP TABLE IF EXISTS `purchase_invoice`;

CREATE TABLE `purchase_invoice` (
  `purchase_invoice_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `warehouse_id` int(10) DEFAULT NULL,
  `supplier_id` int(10) DEFAULT NULL,
  `purchase_payment_method` int(1) DEFAULT NULL,
  `purchase_invoice_no` varchar(225) DEFAULT NULL,
  `subtotal_item` varchar(225) DEFAULT NULL,
  `purchase_invoice_remark` varchar(225) DEFAULT NULL,
  `purchase_invoice_date` varchar(225) DEFAULT NULL,
  `purchase_invoice_due_date` varchar(225) DEFAULT NULL,
  `subtotal_amount_total` varchar(225) DEFAULT NULL,
  `discount_percentage_total` varchar(225) DEFAULT NULL,
  `discount_amount_total` varchar(225) DEFAULT NULL,
  `tax_ppn_percentage` varchar(225) DEFAULT '0',
  `tax_ppn_amount` varchar(225) DEFAULT '0',
  `total_amount` varchar(255) DEFAULT NULL,
  `paid_amount` varchar(225) DEFAULT NULL,
  `owing_amount` varchar(225) DEFAULT NULL,
  `shortover_amount` varchar(225) DEFAULT NULL,
  `return_amount` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`purchase_invoice_id`),
  KEY `FK_warehouse_id_purchase_invoice` (`warehouse_id`),
  KEY `fk_company_id_purchase_invoice` (`company_id`),
  KEY `fk_supplier_id_purchase_invoice` (`supplier_id`),
  CONSTRAINT `FK_warehouse_id_purchase_invoice` FOREIGN KEY (`warehouse_id`) REFERENCES `invt_warehouse` (`warehouse_id`),
  CONSTRAINT `fk_company_id_purchase_invoice` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_supplier_id_purchase_invoice` FOREIGN KEY (`supplier_id`) REFERENCES `core_supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1678 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `purchase_invoice_item` */

DROP TABLE IF EXISTS `purchase_invoice_item`;

CREATE TABLE `purchase_invoice_item` (
  `purchase_invoice_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `purchase_invoice_id` int(10) DEFAULT NULL,
  `item_category_id` int(10) DEFAULT NULL,
  `item_unit_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `item_unit_cost` varchar(225) DEFAULT NULL,
  `quantity` varchar(225) DEFAULT NULL,
  `subtotal_amount` varchar(225) DEFAULT NULL,
  `discount_percentage` varchar(225) DEFAULT '0',
  `discount_amount` varchar(225) DEFAULT '0',
  `subtotal_amount_after_discount` varchar(225) DEFAULT NULL,
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
  KEY `fk_company_id_purchase_invoice_item` (`company_id`),
  CONSTRAINT `Fk_category_purchase_invoice` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`),
  CONSTRAINT `Fk_item_purchase_invoice` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `Fk_item_unit_purchase_invoice` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`),
  CONSTRAINT `Fk_purchase_invoice_id` FOREIGN KEY (`purchase_invoice_id`) REFERENCES `purchase_invoice` (`purchase_invoice_id`),
  CONSTRAINT `fk_company_id_purchase_invoice_item` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9612 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `purchase_payment` */

DROP TABLE IF EXISTS `purchase_payment`;

CREATE TABLE `purchase_payment` (
  `payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `supplier_id` int(10) DEFAULT NULL,
  `payment_method` int(1) DEFAULT NULL,
  `payment_date` varchar(250) DEFAULT NULL,
  `payment_no` varchar(250) DEFAULT NULL,
  `payment_remark` varchar(250) DEFAULT NULL,
  `payable_amount` varchar(250) DEFAULT NULL,
  `payment_amount` varchar(250) DEFAULT NULL,
  `rounding_amount` varchar(250) DEFAULT NULL,
  `data_state` int(10) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_company_id_purchase_payment` (`company_id`),
  KEY `fk_supplier_id_purchase_payment` (`supplier_id`),
  CONSTRAINT `fk_company_id_purchase_payment` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_supplier_id_purchase_payment` FOREIGN KEY (`supplier_id`) REFERENCES `core_supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `purchase_payment_item` */

DROP TABLE IF EXISTS `purchase_payment_item`;

CREATE TABLE `purchase_payment_item` (
  `payment_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `payment_id` int(10) DEFAULT NULL,
  `purchase_invoice_id` int(10) DEFAULT NULL,
  `purchase_invoice_no` varchar(225) DEFAULT NULL,
  `return_amount` varchar(225) DEFAULT NULL,
  `date_invoice` varchar(225) DEFAULT NULL,
  `due_date_invoice` varchar(225) DEFAULT NULL,
  `total_amount` varchar(225) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_item_id`),
  KEY `fk_payment_id` (`payment_id`),
  CONSTRAINT `fk_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `purchase_payment` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `purchase_return` */

DROP TABLE IF EXISTS `purchase_return`;

CREATE TABLE `purchase_return` (
  `purchase_return_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `supplier_id` int(10) DEFAULT NULL,
  `warehouse_id` int(10) DEFAULT NULL,
  `purchase_invoice_id` int(10) DEFAULT NULL,
  `purchase_return_no` varchar(225) DEFAULT NULL,
  `purchase_return_date` varchar(225) DEFAULT NULL,
  `purchase_return_quantity` varchar(255) DEFAULT NULL,
  `subtotal_amount_total` varchar(225) DEFAULT NULL,
  `discount_percentage_total` varchar(225) DEFAULT '0',
  `discount_amount_total` varchar(225) DEFAULT '0',
  `tax_ppn_percentage` varchar(225) DEFAULT '0',
  `tax_ppn_amount` varchar(225) DEFAULT '0',
  `shortover_amount` varchar(225) DEFAULT '0',
  `purchase_return_subtotal` varchar(255) DEFAULT NULL,
  `purchase_return_remark` varchar(255) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`purchase_return_id`),
  KEY `Fk_warehouse_id` (`warehouse_id`),
  KEY `fk_company_id_purchase_retrun` (`company_id`),
  KEY `fk_supplier_id_purchase_retrun` (`supplier_id`),
  KEY `fk_purchase_invoice_id_purchase_return` (`purchase_invoice_id`),
  CONSTRAINT `Fk_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `invt_warehouse` (`warehouse_id`),
  CONSTRAINT `fk_company_id_purchase_retrun` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_purchase_invoice_id_purchase_return` FOREIGN KEY (`purchase_invoice_id`) REFERENCES `purchase_invoice` (`purchase_invoice_id`),
  CONSTRAINT `fk_supplier_id_purchase_retrun` FOREIGN KEY (`supplier_id`) REFERENCES `core_supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4;

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
  KEY `fk_company_id_return_item` (`company_id`),
  KEY `fk_category_id_return_item` (`item_category_id`),
  KEY `fk_item_id_return_item` (`item_id`),
  KEY `fk_item_unit_id_return_item` (`item_unit_id`),
  CONSTRAINT `FK_Purchase_return_id` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_return` (`purchase_return_id`),
  CONSTRAINT `fk_category_id_return_item` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`),
  CONSTRAINT `fk_company_id_return_item` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_item_id_return_item` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `fk_item_unit_id_return_item` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1077 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `sales_customer` */

DROP TABLE IF EXISTS `sales_customer`;

CREATE TABLE `sales_customer` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  `customer_gender` int(1) DEFAULT NULL,
  `customer_status` int(1) DEFAULT 0,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_company_id_sales_customer` (`company_id`),
  CONSTRAINT `fk_company_id_sales_customer` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `sales_invoice` */

DROP TABLE IF EXISTS `sales_invoice`;

CREATE TABLE `sales_invoice` (
  `sales_invoice_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `voucher_id` int(10) DEFAULT NULL,
  `voucher_no` varchar(250) DEFAULT NULL,
  `sales_invoice_no` varchar(225) DEFAULT NULL,
  `sales_invoice_date` varchar(225) DEFAULT NULL,
  `sales_payment_method` int(1) DEFAULT NULL,
  `subtotal_item` varchar(225) DEFAULT NULL,
  `subtotal_amount` varchar(225) DEFAULT NULL,
  `voucher_amount` varchar(225) DEFAULT NULL,
  `discount_percentage_total` varchar(225) DEFAULT NULL,
  `discount_amount_total` varchar(225) DEFAULT NULL,
  `total_amount` varchar(225) DEFAULT NULL,
  `paid_amount` varchar(225) DEFAULT NULL,
  `change_amount` varchar(225) DEFAULT NULL,
  `table_no` varchar(250) DEFAULT NULL,
  `payment_method` int(10) DEFAULT NULL,
  `from_store` int(1) DEFAULT NULL,
  `status_upload` int(1) DEFAULT 0,
  `data_state` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sales_invoice_id`),
  KEY `fk_company_id_sales_invoice` (`company_id`),
  KEY `fk_voucher_id_sales_invoice` (`voucher_id`),
  CONSTRAINT `fk_company_id_sales_invoice` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_voucher_id_sales_invoice` FOREIGN KEY (`voucher_id`) REFERENCES `preference_voucher` (`voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17540 DEFAULT CHARSET=utf8mb4;

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
  `status_upload` int(1) DEFAULT 0,
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
  KEY `fk_company_id_sales_invoice_item` (`company_id`),
  CONSTRAINT `FK_sales_invoice_category` FOREIGN KEY (`item_category_id`) REFERENCES `invt_item_category` (`item_category_id`),
  CONSTRAINT `FK_sales_invoice_id` FOREIGN KEY (`sales_invoice_id`) REFERENCES `sales_invoice` (`sales_invoice_id`),
  CONSTRAINT `FK_sales_invoice_item` FOREIGN KEY (`item_id`) REFERENCES `invt_item` (`item_id`),
  CONSTRAINT `FK_sales_invoice_unit` FOREIGN KEY (`item_unit_id`) REFERENCES `invt_item_unit` (`item_unit_id`),
  CONSTRAINT `fk_company_id_sales_invoice_item` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52622 DEFAULT CHARSET=utf8mb4;

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

/*Table structure for table `sii_remove_log` */

DROP TABLE IF EXISTS `sii_remove_log`;

CREATE TABLE `sii_remove_log` (
  `sii_remove_log_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `sales_invoice_id` int(10) DEFAULT NULL,
  `sales_invoice_item_id` int(10) DEFAULT NULL,
  `sales_invoice_no` varchar(250) DEFAULT NULL,
  `sii_amount` varchar(250) DEFAULT NULL,
  `data_state` int(1) DEFAULT 0,
  `status_upload` int(1) DEFAULT 0,
  `created_id` int(10) DEFAULT NULL,
  `updated_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sii_remove_log_id`),
  KEY `fk_company_id_remove_log` (`company_id`),
  KEY `fk_sales_invoice_id_remove_log` (`sales_invoice_id`),
  KEY `fk_sales_invoice_item_id_remove_log` (`sales_invoice_item_id`),
  CONSTRAINT `fk_company_id_remove_log` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_sales_invoice_id_remove_log` FOREIGN KEY (`sales_invoice_id`) REFERENCES `sales_invoice` (`sales_invoice_id`),
  CONSTRAINT `fk_sales_invoice_item_id_remove_log` FOREIGN KEY (`sales_invoice_item_id`) REFERENCES `sales_invoice_item` (`sales_invoice_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

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

/*Table structure for table `system_login_log` */

DROP TABLE IF EXISTS `system_login_log`;

CREATE TABLE `system_login_log` (
  `login_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT 0,
  `company_id` int(10) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `log_status` int(1) DEFAULT NULL,
  `status_upload` int(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`login_log_id`),
  KEY `fk_company_id_login_log` (`company_id`),
  CONSTRAINT `fk_company_id_login_log` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8mb4;

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
  KEY `fk_company_id_menu_mapping` (`company_id`),
  CONSTRAINT `FK_system_menu_mapping_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `system_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_company_id_menu_mapping` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `system_user` */

DROP TABLE IF EXISTS `system_user`;

CREATE TABLE `system_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT NULL,
  `user_group_id` int(3) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `phone_number` varchar(255) DEFAULT '',
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
  KEY `fk_company_id_system_user` (`company_id`),
  CONSTRAINT `fk_company_id_system_user` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`),
  CONSTRAINT `fk_system_user_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `system_user_group` (`user_group_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;

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
  PRIMARY KEY (`user_group_id`),
  KEY `fk_company_id_user_group` (`company_id`),
  CONSTRAINT `fk_company_id_user_group` FOREIGN KEY (`company_id`) REFERENCES `preference_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

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

/* Trigger structure for table `invt_stock_adjustment` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_invt_stock_adjustment` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_invt_stock_adjustment` BEFORE INSERT ON `invt_stock_adjustment` FOR EACH ROW BEGIN
	DECLARE year_period 		VARCHAR(20);
	DECLARE month_period 		VARCHAR(20);
	DECLARE PERIOD 			VARCHAR(20);
	DECLARE tPeriod			INT;
	DECLARE nAdjustmentNo		VARCHAR(20);
	DECLARE monthPeriod		VARCHAR(20);
	DECLARE nLastBalance		VARCHAR(225);
	DECLARE nOpeningBalance		VARCHAR(225);
	
	SET year_period = (YEAR(new.stock_adjustment_date));
	
	SET month_period = (SELECT RIGHT(CONCAT('0', MONTH(new.stock_adjustment_date)), 2));
	
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
		
	SET PERIOD = (SELECT LEFT(TRIM(adjustment_no), 4) 
			FROM invt_stock_adjustment
			WHERE RIGHT(TRIM(adjustment_no), 4) = year_period
			ORDER BY stock_adjustment_id DESC 
			LIMIT 1);
		
	IF (PERIOD IS NULL ) THEN 
		SET PERIOD = "0000";
	END IF;
	
	SET tPeriod = CAST(PERIOD AS DECIMAL(10));
	
	SET tPeriod = tPeriod + 1;
	
	SET PERIOD = RIGHT(CONCAT('0000', TRIM(CAST(tPeriod AS CHAR(4)))), 4);
	
	SET nAdjustmentNo = CONCAT(PERIOD, '/SA/', monthPeriod, '/', year_period);
		
	SET new.adjustment_no = nAdjustmentNo;
    END */$$


DELIMITER ;

/* Trigger structure for table `invt_stock_adjustment_item` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_invt_stock_adjustment_item` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_invt_stock_adjustment_item` BEFORE INSERT ON `invt_stock_adjustment_item` FOR EACH ROW BEGIN
	DECLARE openingStock		VARCHAR(225);
	DECLARE lastStock		VARCHAR(225);
	DECLARE transactionNo		VARCHAR(225);
	DECLARE dateTransaction		VARCHAR(225);
	
	
	SET transactionNo = (SELECT adjustment_no
				FROM invt_stock_adjustment
				WHERE stock_adjustment_id = new.stock_adjustment_id
				LIMIT 1);
				
	SET dateTransaction = (SELECT stock_adjustment_date
				FROM invt_stock_adjustment
				WHERE stock_adjustment_id = new.stock_adjustment_id
				LIMIT 1);
	
	SET openingStock = (SELECT last_balence
				FROM invt_item_mutation
				WHERE item_id = new.item_id
				AND item_category_id = new.item_category_id
				AND item_unit_id = new.item_unit_id
				ORDER BY item_mutation_id DESC
				LIMIT 1);
				
	IF (openingStock is NULL) THEN
		SET openingStock = new.last_balance_data;
	END IF;
	
	IF (new.last_balance_data >= 0) THEN 
		IF (new.last_balance_physical < 0) THEN 
			SET lastStock = openingStock - ABS(new.last_balance_physical);
			INSERT INTO invt_item_mutation (company_id, item_id, item_category_id, item_unit_id, transaction_no, transaction_date, opening_balence, stock_in, stock_out, last_balence, created_id, updated_id, created_at, updated_at, transaction_remark)
			VALUES (new.company_id, new.item_id, new.item_category_id, new.item_unit_id, transactionNo, dateTransaction, openingStock, 0, ABS(new.last_balance_physical), lastStock, new.created_id, new.updated_id, new.created_at, new.updated_at, 'Penyesuaian Stok');
		END IF;
		
		IF (new.last_balance_physical > 0) THEN 
			SET lastStock = openingStock + ABS(new.last_balance_physical);
			INSERT INTO invt_item_mutation (company_id, item_id, item_category_id, item_unit_id, transaction_no, transaction_date, opening_balence, stock_in, stock_out, last_balence, created_id, updated_id, created_at, updated_at, transaction_remark)
			VALUES (new.company_id, new.item_id, new.item_category_id, new.item_unit_id, transactionNo, dateTransaction, openingStock, ABS(new.last_balance_physical), 0, lastStock, new.created_id, new.updated_id, new.created_at, new.updated_at, 'Penyesuaian Stok');
		END IF;
	ELSE
		INSERT INTO invt_item_mutation (company_id, item_id, item_category_id, item_unit_id, transaction_no, transaction_date, opening_balence, stock_in, stock_out, last_balence, created_id, updated_id, created_at, updated_at, transaction_remark)
		VALUES (new.company_id, new.item_id, new.item_category_id, new.item_unit_id, transactionNo, dateTransaction, openingStock, new.last_balance_physical, 0, new.last_balance_adjustment, new.created_id, new.updated_id, new.created_at, new.updated_at, 'Penyesuaian Stok');
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
	declare nLastBalance		varchar(225);
	declare nOpeningBalance		varchar(225);
	
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
	
	SET nOpeningBalance 		= (SELECT last_balance FROM acct_supplier_balance
						WHERE company_id = new.company_id
						AND supplier_id = new.supplier_id
						order by supplier_balance_id desc
						limit 1);
						
	IF ( nOpeningBalance IS NULL ) THEN
		SET nOpeningBalance = 0;
	END IF;
	
	if (new.purchase_payment_method = '1') then
		set nLastBalance = nOpeningBalance + new.total_amount;
		insert into acct_supplier_balance (company_id, supplier_id, supplier_balance_remark, transaction_no, supplier_balance_date, opening_balance, payable_amount, payment_amount, last_balance, created_id, updated_id, created_at, updated_at)
		values (new.company_id, new.supplier_id, 'Pembelian', nPurchaseInvoiceNo, new.purchase_invoice_date, nOpeningBalance, new.total_amount, 0, nLastBalance, new.created_id, new.updated_id, new.created_at, new.updated_at);
	end if;
    END */$$


DELIMITER ;

/* Trigger structure for table `purchase_invoice` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_purchase_invoice` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_purchase_invoice` BEFORE UPDATE ON `purchase_invoice` FOR EACH ROW BEGIN
	DECLARE nLastBalance		VARCHAR(225);
	DECLARE nOpeningBalance		VARCHAR(225);
	
	SET nOpeningBalance 		= (SELECT last_balance FROM acct_supplier_balance
						WHERE company_id = new.company_id
						AND supplier_id = new.supplier_id
						ORDER BY supplier_balance_id DESC
						LIMIT 1);
						
	IF ( nOpeningBalance IS NULL ) THEN
		SET nOpeningBalance = 0;
	END IF;
	
	SET nLastBalance = nOpeningBalance - new.total_amount;
	IF (new.data_state = 1 and new.purchase_payment_method = '1') THEN
		INSERT INTO acct_supplier_balance (company_id, supplier_id, supplier_balance_remark, transaction_no, supplier_balance_date, opening_balance, payable_amount, payment_amount, last_balance, created_id, updated_id, created_at, updated_at, data_state)
		VALUES (new.company_id, new.supplier_id, 'Hapus Pembelian', new.purchase_invoice_no, new.purchase_invoice_date, nOpeningBalance, 0, new.total_amount, nLastBalance, new.created_id, new.updated_id, new.created_at, new.updated_at, 0);
	END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `purchase_invoice_item` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_purchase_invoice_item` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_purchase_invoice_item` BEFORE INSERT ON `purchase_invoice_item` FOR EACH ROW BEGIN
	DECLARE openingStock		VARCHAR(225);
	DECLARE lastStock		VARCHAR(225);
	declare transactionNo		varchar(225);
	declare dateTransaction		varchar(225);
	
	
	set transactionNo = (Select purchase_invoice_no
				from purchase_invoice
				where purchase_invoice_id = new.purchase_invoice_id
				limit 1);
				
	set dateTransaction = (SELECT purchase_invoice_date
				FROM purchase_invoice
				WHERE purchase_invoice_id = new.purchase_invoice_id
				LIMIT 1);
	
	set openingStock = (select last_balence
				from invt_item_mutation
				where item_id = new.item_id
				and item_category_id = new.item_category_id
				and item_unit_id = new.item_unit_id
				order By item_mutation_id desc
				limit 1);
				
	if (openingStock is null) then
		SET openingStock = (SELECT last_balance
					FROM invt_item_stock
					WHERE item_id = new.item_id
					AND item_category_id = new.item_category_id
					AND item_unit_id = new.item_unit_id
					LIMIT 1);
	end if;
	
	set lastStock = openingStock + new.quantity;
	
	Insert into invt_item_mutation (company_id, item_id, item_category_id, item_unit_id, transaction_no, transaction_date, opening_balence, stock_in, stock_out, last_balence, created_id, updated_id, created_at, updated_at, transaction_remark)
	values (new.company_id, new.item_id, new.item_category_id, new.item_unit_id, transactionNo, dateTransaction, openingStock, new.quantity, 0, lastStock, new.created_id, new.updated_id, new.created_at, new.updated_at, 'Pembelian');
	
    END */$$


DELIMITER ;

/* Trigger structure for table `purchase_invoice_item` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_purchase_invoice_item` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_purchase_invoice_item` BEFORE UPDATE ON `purchase_invoice_item` FOR EACH ROW BEGIN
	DECLARE openingStock		VARCHAR(225);
	DECLARE lastStock		VARCHAR(225);
	DECLARE transactionNo		VARCHAR(225);
	DECLARE dateTransaction		VARCHAR(225);
	
	
	SET transactionNo = (SELECT purchase_invoice_no
				FROM purchase_invoice
				WHERE purchase_invoice_id = new.purchase_invoice_id
				LIMIT 1);
				
	SET dateTransaction = (SELECT purchase_invoice_date
				FROM purchase_invoice
				WHERE purchase_invoice_id = new.purchase_invoice_id
				LIMIT 1);
	
	SET openingStock = (SELECT last_balence
				FROM invt_item_mutation
				WHERE item_id = new.item_id
				AND item_category_id = new.item_category_id
				AND item_unit_id = new.item_unit_id
				ORDER BY item_mutation_id DESC
				LIMIT 1);
				
	IF (openingStock is NULL) THEN
		SET openingStock = (SELECT last_balance
					FROM invt_item_stock
					WHERE item_id = new.item_id
					AND item_category_id = new.item_category_id
					AND item_unit_id = new.item_unit_id
					LIMIT 1);
	END IF;
	
	SET lastStock = openingStock - new.quantity;
	
	if (new.data_state = 1) then
		INSERT INTO invt_item_mutation (company_id, item_id, item_category_id, item_unit_id, transaction_no, transaction_date, opening_balence, stock_in, stock_out, last_balence, created_id, updated_id, created_at, updated_at, transaction_remark)
		VALUES (new.company_id, new.item_id, new.item_category_id, new.item_unit_id, transactionNo, dateTransaction, openingStock, 0, new.quantity, lastStock, new.created_id, new.updated_id, new.created_at, new.updated_at, 'Hapus Pembelian');
	end if;
	
    END */$$


DELIMITER ;

/* Trigger structure for table `purchase_payment` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_purchase_payment` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_purchase_payment` BEFORE INSERT ON `purchase_payment` FOR EACH ROW BEGIN
	DECLARE year_period 		VARCHAR(20);
	DECLARE month_period 		VARCHAR(20);
	DECLARE PERIOD 			VARCHAR(20);
	DECLARE tPeriod			INT;
	DECLARE nPurchasePaymentNo	VARCHAR(20);
	DECLARE monthPeriod		VARCHAR(20);
	DECLARE lenPurchasePaymentNo	DECIMAL(10);
	DECLARE nLastBalance		VARCHAR(225);
	DECLARE nOpeningBalance		VARCHAR(225);
	
	SET year_period = (YEAR(new.payment_date));
	
	SET month_period = (SELECT RIGHT(CONCAT('0', MONTH(new.payment_date)), 2));
	
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
		
	SET PERIOD = (SELECT LEFT(TRIM(payment_no), 4) 
			FROM purchase_payment
			WHERE RIGHT(TRIM(payment_no), 4) = year_period
			ORDER BY payment_id DESC 
			LIMIT 1);
		
	IF (PERIOD IS NULL ) THEN 
		SET PERIOD = "0000";
	END IF;
	
	SET tPeriod = CAST(PERIOD AS DECIMAL(10));
	
	SET tPeriod = tPeriod + 1;
	
	SET PERIOD = RIGHT(CONCAT('0000', TRIM(CAST(tPeriod AS CHAR(4)))), 4);
	
	SET nPurchasePaymentNo = CONCAT(PERIOD, '/PO/', monthPeriod, '/', year_period);
		
	SET new.payment_no = nPurchasePaymentNo;
	
	SET nOpeningBalance 		= (SELECT last_balance FROM acct_supplier_balance
						WHERE company_id = new.company_id
						AND supplier_id = new.supplier_id
						ORDER BY supplier_balance_id DESC
						LIMIT 1);
						
	IF ( nOpeningBalance IS NULL ) THEN
		SET nOpeningBalance = 0;
	END IF;
	
	SET nLastBalance = nOpeningBalance - new.payment_amount;
	
	INSERT INTO acct_supplier_balance (company_id, supplier_id, supplier_balance_remark, transaction_no, supplier_balance_date, opening_balance, payable_amount, payment_amount, last_balance, created_id, updated_id, created_at, updated_at)
		VALUES (new.company_id, new.supplier_id, 'Pembayaran Hutang', nPurchasePaymentNo, new.payment_date, nOpeningBalance, 0, new.payment_amount, nLastBalance, new.created_id, new.updated_id, new.created_at, new.updated_at);
    END */$$


DELIMITER ;

/* Trigger structure for table `purchase_payment` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_purchase_payment` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_purchase_payment` BEFORE UPDATE ON `purchase_payment` FOR EACH ROW BEGIN
	DECLARE nLastBalance		VARCHAR(225);
	DECLARE nOpeningBalance		VARCHAR(225);
	
	SET nOpeningBalance 		= (SELECT last_balance FROM acct_supplier_balance
						WHERE company_id = new.company_id
						AND supplier_id = new.supplier_id
						ORDER BY supplier_balance_id DESC
						LIMIT 1);
						
	IF ( nOpeningBalance IS NULL ) THEN
		SET nOpeningBalance = 0;
	END IF;
	
	SET nLastBalance = nOpeningBalance + new.payment_amount;
	if (new.data_state = 1) then
		INSERT INTO acct_supplier_balance (company_id, supplier_id, supplier_balance_remark, transaction_no, supplier_balance_date, opening_balance, payable_amount, payment_amount, last_balance, created_id, updated_id, created_at, updated_at, data_state)
		VALUES (new.company_id, new.supplier_id, 'Hapus Pembayaran Hutang', new.payment_no, new.payment_date, nOpeningBalance, new.payment_amount, 0, nLastBalance, new.created_id, new.updated_id, new.created_at, new.updated_at, 0);
	end if;
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
	DECLARE nLastBalance		VARCHAR(225);
	DECLARE nOpeningBalance		VARCHAR(225);
	
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
	
	SET nOpeningBalance 		= (SELECT last_balance FROM acct_supplier_balance
						WHERE company_id = new.company_id
						AND supplier_id = new.supplier_id
						ORDER BY supplier_balance_id DESC
						LIMIT 1);
						
	IF ( nOpeningBalance IS NULL ) THEN
		SET nOpeningBalance = 0;
	END IF;
	
	SET nLastBalance = nOpeningBalance - new.purchase_return_subtotal;
	INSERT INTO acct_supplier_balance (company_id, supplier_id, supplier_balance_remark, transaction_no, supplier_balance_date, opening_balance, payable_amount, payment_amount, last_balance, created_id, updated_id, created_at, updated_at)
	VALUES (new.company_id, new.supplier_id, 'Retur Pembelian', nSalesInvoiceNo, new.purchase_return_date, nOpeningBalance, 0, new.purchase_return_subtotal, nLastBalance, new.created_id, new.updated_id, new.created_at, new.updated_at);
    END */$$


DELIMITER ;

/* Trigger structure for table `purchase_return_item` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_purchase_return_item` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_purchase_return_item` BEFORE INSERT ON `purchase_return_item` FOR EACH ROW BEGIN
	DECLARE openingStock		VARCHAR(225);
	DECLARE lastStock		VARCHAR(225);
	DECLARE transactionNo		VARCHAR(225);
	DECLARE dateTransaction		VARCHAR(225);
	
	
	SET transactionNo = (SELECT purchase_return_no
				FROM purchase_return
				WHERE purchase_return_id = new.purchase_return_id
				LIMIT 1);
				
	SET dateTransaction = (SELECT purchase_return_date
				FROM purchase_return
				WHERE purchase_return_id = new.purchase_return_id
				LIMIT 1);
	
	SET openingStock = (SELECT last_balence
				FROM invt_item_mutation
				WHERE item_id = new.item_id
				AND item_category_id = new.item_category_id
				AND item_unit_id = new.item_unit_id
				ORDER BY item_mutation_id DESC
				LIMIT 1);
				
	IF (openingStock is NULL) THEN
		SET openingStock = (SELECT last_balance
					FROM invt_item_stock
					WHERE item_id = new.item_id
					AND item_category_id = new.item_category_id
					AND item_unit_id = new.item_unit_id
					LIMIT 1);
	END IF;
	
	SET lastStock = openingStock - new.purchase_item_quantity;
	
	INSERT INTO invt_item_mutation (company_id, item_id, item_category_id, item_unit_id, transaction_no, transaction_date, opening_balence, stock_in, stock_out, last_balence, created_id, updated_id, created_at, updated_at, transaction_remark)
	VALUES (new.company_id, new.item_id, new.item_category_id, new.item_unit_id, transactionNo, dateTransaction, openingStock, 0, new.purchase_item_quantity, lastStock, new.created_id, new.updated_id, new.created_at, new.updated_at, 'Retur Pembelian');
	
    END */$$


DELIMITER ;

/* Trigger structure for table `sales_invoice_item` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_sales_invoice_item` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_sales_invoice_item` BEFORE INSERT ON `sales_invoice_item` FOR EACH ROW BEGIN
	DECLARE openingStock		VARCHAR(225);
	DECLARE lastStock		VARCHAR(225);
	DECLARE transactionNo		VARCHAR(225);
	DECLARE dateTransaction		VARCHAR(225);
	
	
	SET transactionNo = (SELECT sales_invoice_no
				FROM sales_invoice
				WHERE sales_invoice_id = new.sales_invoice_id
				LIMIT 1);
				
	SET dateTransaction = (SELECT sales_invoice_date
				FROM sales_invoice
				WHERE sales_invoice_id = new.sales_invoice_id
				LIMIT 1);
	
	SET openingStock = (SELECT last_balence
				FROM invt_item_mutation
				WHERE item_id = new.item_id
				AND item_category_id = new.item_category_id
				AND item_unit_id = new.item_unit_id
				ORDER BY item_mutation_id DESC
				LIMIT 1);
				
	IF (openingStock is NULL) THEN
		SET openingStock = (SELECT last_balance
					FROM invt_item_stock
					WHERE item_id = new.item_id
					AND item_category_id = new.item_category_id
					AND item_unit_id = new.item_unit_id
					LIMIT 1);
	END IF;
	
	SET lastStock = openingStock - new.quantity;
	
	INSERT INTO invt_item_mutation (company_id, item_id, item_category_id, item_unit_id, transaction_no, transaction_date, opening_balence, stock_in, stock_out, last_balence, created_id, updated_id, created_at, updated_at, transaction_remark)
	VALUES (new.company_id, new.item_id, new.item_category_id, new.item_unit_id, transactionNo, dateTransaction, openingStock, 0, new.quantity, lastStock, new.created_id, new.updated_id, new.created_at, new.updated_at, 'Penjualan');
	
    END */$$


DELIMITER ;

/* Trigger structure for table `sales_invoice_item` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_sales_invoice_item` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_sales_invoice_item` BEFORE UPDATE ON `sales_invoice_item` FOR EACH ROW BEGIN
	DECLARE openingStock		VARCHAR(225);
	DECLARE lastStock		VARCHAR(225);
	DECLARE transactionNo		VARCHAR(225);
	DECLARE dateTransaction		VARCHAR(225);
	declare oldQuantity		varchar(225);
	
	set oldQuantity = (select quantity
				from sales_invoice_item
				where sales_invoice_item_id = new.sales_invoice_item_id
				limit 1);
				
	SET transactionNo = (SELECT sales_invoice_no
				FROM sales_invoice
				WHERE sales_invoice_id = new.sales_invoice_id
				LIMIT 1);
				
	SET dateTransaction = (SELECT sales_invoice_date
				FROM sales_invoice
				WHERE sales_invoice_id = new.sales_invoice_id
				LIMIT 1);
	
	SET openingStock = (SELECT last_balence
				FROM invt_item_mutation
				WHERE item_id = new.item_id
				AND item_category_id = new.item_category_id
				AND item_unit_id = new.item_unit_id
				ORDER BY item_mutation_id DESC
				LIMIT 1);
				
	IF (openingStock is NULL) THEN
		SET openingStock = (SELECT last_balance
					FROM invt_item_stock
					WHERE item_id = new.item_id
					AND item_category_id = new.item_category_id
					AND item_unit_id = new.item_unit_id
					LIMIT 1);
	END IF;
	
	if (new.data_state = 1) then
		SET lastStock = openingStock + new.quantity;
		INSERT INTO invt_item_mutation (company_id, item_id, item_category_id, item_unit_id, transaction_no, transaction_date, opening_balence, stock_in, stock_out, last_balence, created_id, updated_id, created_at, updated_at, transaction_remark)
		VALUES (new.company_id, new.item_id, new.item_category_id, new.item_unit_id, transactionNo, dateTransaction, openingStock, new.quantity, 0, lastStock, new.created_id, new.updated_id, new.created_at, new.updated_at, 'Hapus Penjualan');
	end if;
	
	IF (new.quantity > oldQuantity) THEN
		SET lastStock = openingStock - (new.quantity - oldQuantity);
		INSERT INTO invt_item_mutation (company_id, item_id, item_category_id, item_unit_id, transaction_no, transaction_date, opening_balence, stock_in, stock_out, last_balence, created_id, updated_id, created_at, updated_at, transaction_remark)
		VALUES (new.company_id, new.item_id, new.item_category_id, new.item_unit_id, transactionNo, dateTransaction, openingStock, 0, (new.quantity - oldQuantity), lastStock, new.created_id, new.updated_id, new.created_at, new.updated_at, 'Hapus Penjualan');
	END IF;
	
	IF (new.quantity < oldQuantity) THEN
		SET lastStock = openingStock + (oldQuantity - new.quantity);
		INSERT INTO invt_item_mutation (company_id, item_id, item_category_id, item_unit_id, transaction_no, transaction_date, opening_balence, stock_in, stock_out, last_balence, created_id, updated_id, created_at, updated_at, transaction_remark)
		VALUES (new.company_id, new.item_id, new.item_category_id, new.item_unit_id, transactionNo, dateTransaction, openingStock, (oldQuantity - new.quantity), 0, lastStock, new.created_id, new.updated_id, new.created_at, new.updated_at, 'Hapus Penjualan');
	END IF;
	
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
