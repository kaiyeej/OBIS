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


-- Dumping database structure for obis_db
CREATE DATABASE IF NOT EXISTS `obis_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `obis_db`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_expense_category
CREATE TABLE IF NOT EXISTS `tbl_expense_category` (
  `expense_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category_code` varchar(10) NOT NULL DEFAULT '',
  `expense_category` varchar(75) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`expense_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_products
CREATE TABLE IF NOT EXISTS `tbl_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(100) NOT NULL,
  `product_name` varchar(75) NOT NULL,
  `product_price` decimal(11,2) NOT NULL,
  `product_img` text NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_product_categories
CREATE TABLE IF NOT EXISTS `tbl_product_categories` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category` varchar(75) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_purchase_order
CREATE TABLE IF NOT EXISTS `tbl_purchase_order` (
  `po_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(30) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `po_date` date NOT NULL,
  `po_type` varchar(1) NOT NULL,
  `paid_status` int(1) NOT NULL DEFAULT '0' COMMENT '1 = Paid; 0 = Unpaid',
  `remarks` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`po_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_purchase_order_details
CREATE TABLE IF NOT EXISTS `tbl_purchase_order_details` (
  `po_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(11,2) NOT NULL,
  `supplier_price` decimal(11,2) NOT NULL,
  PRIMARY KEY (`po_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_sales
CREATE TABLE IF NOT EXISTS `tbl_sales` (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(30) NOT NULL DEFAULT '',
  `customer_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S' COMMENT 'F',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `sales_date` date NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_suppliers
CREATE TABLE IF NOT EXISTS `tbl_suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table obis_db.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(100) NOT NULL,
  `user_category` int(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_last_modified` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
