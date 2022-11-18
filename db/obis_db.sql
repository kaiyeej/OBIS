-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table obis_db.tbl_customers
CREATE TABLE IF NOT EXISTS `tbl_customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_contact_number` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_customer_payment
CREATE TABLE IF NOT EXISTS `tbl_customer_payment` (
  `cp_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_type` varchar(1) NOT NULL,
  `payment_option_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `deposit_status` int(1) NOT NULL DEFAULT '0' COMMENT '1 = Deposited',
  `check_number` varchar(30) NOT NULL,
  `check_bank` varchar(30) NOT NULL,
  `check_date` date NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_customer_payment_details
CREATE TABLE IF NOT EXISTS `tbl_customer_payment_details` (
  `cpd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `type` varchar(2) NOT NULL COMMENT 'DR = sales ; BB = beginning balance',
  PRIMARY KEY (`cpd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_expense
CREATE TABLE IF NOT EXISTS `tbl_expense` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) NOT NULL DEFAULT '',
  `expense_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(1) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_expense_category
CREATE TABLE IF NOT EXISTS `tbl_expense_category` (
  `expense_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category` varchar(75) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`expense_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_expense_details
CREATE TABLE IF NOT EXISTS `tbl_expense_details` (
  `expense_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `remarks` varchar(250) NOT NULL DEFAULT '',
  `amount` decimal(12,2) NOT NULL,
  PRIMARY KEY (`expense_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_formulation
CREATE TABLE IF NOT EXISTS `tbl_formulation` (
  `formulation_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(75) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`formulation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_formulation_details
CREATE TABLE IF NOT EXISTS `tbl_formulation_details` (
  `formulation_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `formulation_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `qty` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`formulation_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_job_orders
CREATE TABLE IF NOT EXISTS `tbl_job_orders` (
  `job_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(75) NOT NULL,
  `product_id` int(11) NOT NULL,
  `no_of_batches` int(3) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_order_date` datetime NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_job_order_details
CREATE TABLE IF NOT EXISTS `tbl_job_order_details` (
  `jo_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(7,2) NOT NULL,
  `cost` decimal(7,2) NOT NULL,
  PRIMARY KEY (`jo_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_payment_option
CREATE TABLE IF NOT EXISTS `tbl_payment_option` (
  `payment_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_option` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_products
CREATE TABLE IF NOT EXISTS `tbl_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(100) NOT NULL,
  `product_name` varchar(75) NOT NULL,
  `product_price` decimal(11,2) NOT NULL,
  `product_cost` decimal(11,2) NOT NULL,
  `product_img` text NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `is_package` int(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_product_categories
CREATE TABLE IF NOT EXISTS `tbl_product_categories` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category` varchar(75) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_purchase_order
CREATE TABLE IF NOT EXISTS `tbl_purchase_order` (
  `po_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(30) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `po_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`po_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_purchase_order_details
CREATE TABLE IF NOT EXISTS `tbl_purchase_order_details` (
  `po_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(11,2) NOT NULL,
  `supplier_price` decimal(11,2) NOT NULL,
  PRIMARY KEY (`po_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_sales
CREATE TABLE IF NOT EXISTS `tbl_sales` (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(30) NOT NULL DEFAULT '',
  `customer_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S' COMMENT 'F',
  `sales_type` varchar(1) NOT NULL,
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `sales_date` date NOT NULL,
  `q_num` int(5) NOT NULL,
  `q_status` varchar(1) NOT NULL COMMENT 'S = serving; F = finished',
  `sales_summary_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_sales_details
CREATE TABLE IF NOT EXISTS `tbl_sales_details` (
  `sales_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(12,2) NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  PRIMARY KEY (`sales_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_sales_summary
CREATE TABLE IF NOT EXISTS `tbl_sales_summary` (
  `sales_summary_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cashier_id` int(11) NOT NULL,
  `starting_balance` decimal(11,2) NOT NULL,
  `total_sales_amount` decimal(11,2) NOT NULL,
  `total_amount_collected` decimal(11,2) NOT NULL,
  `total_deficit` decimal(9,2) DEFAULT NULL,
  `encoded_by` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`sales_summary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_suppliers
CREATE TABLE IF NOT EXISTS `tbl_suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(100) NOT NULL,
  `user_category` varchar(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for trigger obis_db.delete_expense_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_expense_details` AFTER DELETE ON `tbl_expense` FOR EACH ROW DELETE FROM tbl_expense_details WHERE expense_id = OLD.expense_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger obis_db.delete_formulation_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_formulation_details` AFTER DELETE ON `tbl_formulation` FOR EACH ROW DELETE FROM tbl_formulation_details WHERE formulation_id = OLD.formulation_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger obis_db.delete_jo_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_jo_details` AFTER DELETE ON `tbl_job_orders` FOR EACH ROW DELETE FROM tbl_job_order_details WHERE job_order_id = OLD.job_order_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger obis_db.delete_purchase_order_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_purchase_order_details` AFTER DELETE ON `tbl_purchase_order` FOR EACH ROW DELETE FROM tbl_purchase_order_details WHERE po_id = OLD.po_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger obis_db.delete_sales_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_sales_details` AFTER DELETE ON `tbl_sales` FOR EACH ROW DELETE FROM tbl_sales_details WHERE sales_id = OLD.sales_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
