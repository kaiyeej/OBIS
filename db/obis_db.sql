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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_customers: ~1 rows (approximately)
/*!40000 ALTER TABLE `tbl_customers` DISABLE KEYS */;
INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_address`, `customer_contact_number`, `remarks`, `date_added`, `date_last_modified`) VALUES
	(1, 'pepe smith', 'bcd', '0212454', '', '2022-06-06 15:08:10', '2022-06-06 15:08:10');
/*!40000 ALTER TABLE `tbl_customers` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_expense: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_expense` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_expense_category
CREATE TABLE IF NOT EXISTS `tbl_expense_category` (
  `expense_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category` varchar(75) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`expense_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_expense_category: ~3 rows (approximately)
/*!40000 ALTER TABLE `tbl_expense_category` DISABLE KEYS */;
INSERT INTO `tbl_expense_category` (`expense_category_id`, `expense_category`, `date_added`, `date_last_modified`) VALUES
	(1, 'Waterbills', '2022-02-28 14:35:33', '2022-06-09 09:37:28'),
	(3, 'Electric Bill', '2022-06-09 09:39:01', '2022-06-09 09:39:30'),
	(4, 'Rental Fee', '2022-06-13 14:05:05', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tbl_expense_category` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_expense_details
CREATE TABLE IF NOT EXISTS `tbl_expense_details` (
  `expense_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `remarks` varchar(250) NOT NULL DEFAULT '',
  `amount` decimal(12,2) NOT NULL,
  PRIMARY KEY (`expense_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_expense_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_expense_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_expense_details` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_formulation
CREATE TABLE IF NOT EXISTS `tbl_formulation` (
  `formulation_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(75) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`formulation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_formulation: ~2 rows (approximately)
/*!40000 ALTER TABLE `tbl_formulation` DISABLE KEYS */;
INSERT INTO `tbl_formulation` (`formulation_id`, `product_id`, `remarks`, `date_added`, `date_last_modified`) VALUES
	(11, 8, '', '2022-05-02 11:20:37', '0000-00-00 00:00:00'),
	(12, 3, '34', '2022-06-23 14:07:10', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tbl_formulation` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_formulation_details
CREATE TABLE IF NOT EXISTS `tbl_formulation_details` (
  `formulation_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `formulation_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `qty` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`formulation_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_formulation_details: ~4 rows (approximately)
/*!40000 ALTER TABLE `tbl_formulation_details` DISABLE KEYS */;
INSERT INTO `tbl_formulation_details` (`formulation_detail_id`, `formulation_id`, `product_id`, `qty`) VALUES
	(1, 11, 4, 3.00),
	(2, 11, 5, 3.00),
	(3, 11, 3, 3.00),
	(4, 11, 3, 2.00);
/*!40000 ALTER TABLE `tbl_formulation_details` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_job_orders
CREATE TABLE IF NOT EXISTS `tbl_job_orders` (
  `job_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(75) NOT NULL,
  `product_id` int(11) NOT NULL,
  `no_of_batches` int(3) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_order_date` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_job_orders: ~3 rows (approximately)
/*!40000 ALTER TABLE `tbl_job_orders` DISABLE KEYS */;
INSERT INTO `tbl_job_orders` (`job_order_id`, `reference_number`, `product_id`, `no_of_batches`, `remarks`, `user_id`, `job_order_date`, `status`, `date_added`, `date_last_modified`) VALUES
	(1, 'JO-20220623085920', 3, 1, '', 0, '2022-06-23 00:00:00', '', '2022-06-23 14:59:29', '0000-00-00 00:00:00'),
	(2, 'JO-20220623090929', 3, 1, '', 0, '2022-06-23 00:00:00', '', '2022-06-23 15:10:07', '0000-00-00 00:00:00'),
	(3, 'JO-20220623091037', 0, 1, '', 0, '2022-06-23 00:00:00', 'F', '2022-06-23 15:10:42', '2022-06-23 15:15:48');
/*!40000 ALTER TABLE `tbl_job_orders` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_job_order_details
CREATE TABLE IF NOT EXISTS `tbl_job_order_details` (
  `jo_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(7,2) NOT NULL,
  `cost` decimal(7,2) NOT NULL,
  PRIMARY KEY (`jo_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_job_order_details: ~4 rows (approximately)
/*!40000 ALTER TABLE `tbl_job_order_details` DISABLE KEYS */;
INSERT INTO `tbl_job_order_details` (`jo_detail_id`, `job_order_id`, `product_id`, `qty`, `cost`) VALUES
	(25, 1, 1, 2.00, 10.00),
	(26, 1, 4, 2.00, 12.00),
	(27, 0, 3, 3.00, 23.00),
	(29, 3, 4, 2.00, 0.00);
/*!40000 ALTER TABLE `tbl_job_order_details` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_products: ~6 rows (approximately)
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` (`product_id`, `product_code`, `product_name`, `product_price`, `product_cost`, `product_img`, `product_category_id`, `remarks`, `is_package`, `date_added`, `date_last_modified`) VALUES
	(3, '0002', 'asdasd', 23.00, 0.00, 'viber_image_2022-06-16_09-03-21-539.jpg', 4, 'aqwd\r\n', 1, '2022-02-16 09:43:33', '2022-03-04 17:25:25'),
	(4, '0003', 'George', 12.00, 0.00, 'default.jpg', 5, '312', 1, '2022-02-16 11:02:15', '2022-03-04 17:25:28'),
	(5, '0004', 'q', 21.00, 0.00, 'default.jpg', 1, 'as', 1, '2022-02-21 15:15:41', '2022-03-04 17:25:31'),
	(6, '0005', '3232', 324.00, 0.00, 'default.jpg', 1, 'sdfsf', 1, '2022-02-21 15:15:55', '2022-03-04 17:25:33'),
	(8, '000222', 'prod1', 4.00, 0.00, 'default.jpg', 1, 'dadas', 0, '2022-04-22 09:05:43', '2022-04-22 09:48:55'),
	(12, '333', 'sample', 3.00, 0.00, 'default.jpg', 1, '', 0, '2022-06-07 10:51:03', '2022-06-07 10:51:03');
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_product_categories
CREATE TABLE IF NOT EXISTS `tbl_product_categories` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category` varchar(75) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_product_categories: ~5 rows (approximately)
/*!40000 ALTER TABLE `tbl_product_categories` DISABLE KEYS */;
INSERT INTO `tbl_product_categories` (`product_category_id`, `product_category`, `remarks`, `date_added`, `date_last_modified`) VALUES
	(1, 'Cofffee', '', '2022-02-09 14:41:36', '2022-02-16 09:02:01'),
	(2, 'Bread', '', '2022-02-11 14:49:11', '2022-02-16 09:01:42'),
	(4, 'Nachos', '', '2022-02-16 09:01:10', '0000-00-00 00:00:00'),
	(5, 'Sample New', '', '2022-02-16 09:39:18', '2022-02-16 09:39:27'),
	(6, 'A', '', '2022-02-17 13:03:52', '2022-02-17 13:03:59');
/*!40000 ALTER TABLE `tbl_product_categories` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_purchase_order: ~3 rows (approximately)
/*!40000 ALTER TABLE `tbl_purchase_order` DISABLE KEYS */;
INSERT INTO `tbl_purchase_order` (`po_id`, `reference_number`, `supplier_id`, `po_date`, `remarks`, `status`, `user_id`, `date_added`, `date_last_modified`) VALUES
	(11, 'PO-20220622042127', 1, '2022-06-22', '', 'F', 0, '2022-06-22 10:21:31', '2022-06-22 10:21:31'),
	(12, 'PO-20220623032701', 1, '2022-06-23', '', '', 0, '2022-06-23 09:27:06', '2022-06-23 09:27:06'),
	(13, 'PO-20220623075846', 1, '2022-06-23', '', 'F', 0, '2022-06-23 13:58:52', '2022-06-23 13:58:52');
/*!40000 ALTER TABLE `tbl_purchase_order` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_purchase_order_details
CREATE TABLE IF NOT EXISTS `tbl_purchase_order_details` (
  `po_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(11,2) NOT NULL,
  `supplier_price` decimal(11,2) NOT NULL,
  PRIMARY KEY (`po_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_purchase_order_details: ~3 rows (approximately)
/*!40000 ALTER TABLE `tbl_purchase_order_details` DISABLE KEYS */;
INSERT INTO `tbl_purchase_order_details` (`po_detail_id`, `po_id`, `product_id`, `qty`, `supplier_price`) VALUES
	(18, 11, 4, 1.00, 23.00),
	(19, 11, 8, 12.00, 122.00),
	(20, 13, 3, 2.00, 100.00);
/*!40000 ALTER TABLE `tbl_purchase_order_details` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_sales: ~6 rows (approximately)
/*!40000 ALTER TABLE `tbl_sales` DISABLE KEYS */;
INSERT INTO `tbl_sales` (`sales_id`, `reference_number`, `customer_id`, `status`, `remarks`, `user_id`, `sales_date`, `date_added`, `date_last_modified`) VALUES
	(16, 'SLS-20220622051713', 1, 'S', '', 0, '2022-06-22', '2022-06-22 11:17:19', '0000-00-00 00:00:00'),
	(17, 'SLS-20220623052825', 1, 'S', '', 0, '2022-06-23', '2022-06-23 11:28:30', '0000-00-00 00:00:00'),
	(18, 'SLS-20220623055419', 1, 'S', '', 0, '2022-06-23', '2022-06-23 11:54:24', '0000-00-00 00:00:00'),
	(19, 'SLS-20220623072526', 1, 'F', '', 0, '2022-06-23', '2022-06-23 13:25:33', '2022-06-23 13:54:12'),
	(20, 'SLS-20220623075447', 1, 'S', '', 0, '2022-06-23', '2022-06-23 13:54:52', '0000-00-00 00:00:00'),
	(21, 'SLS-20220623080555', 1, 'S', '', 0, '2022-06-23', '2022-06-23 14:06:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tbl_sales` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_sales_details
CREATE TABLE IF NOT EXISTS `tbl_sales_details` (
  `sales_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(12,2) NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  PRIMARY KEY (`sales_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_sales_details: ~1 rows (approximately)
/*!40000 ALTER TABLE `tbl_sales_details` DISABLE KEYS */;
INSERT INTO `tbl_sales_details` (`sales_detail_id`, `sales_id`, `product_id`, `qty`, `cost`, `price`) VALUES
	(1, 19, 4, 4.00, 0.00, 12.00);
/*!40000 ALTER TABLE `tbl_sales_details` ENABLE KEYS */;

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

-- Dumping data for table obis_db.tbl_suppliers: ~3 rows (approximately)
/*!40000 ALTER TABLE `tbl_suppliers` DISABLE KEYS */;
INSERT INTO `tbl_suppliers` (`supplier_id`, `supplier_name`, `supplier_address`, `contact_number`, `remarks`, `date_added`, `date_last_modified`) VALUES
	(1, 'asdasd', 'sadasd', 'sdfsdf', 'sdfsd', '2022-02-28 15:14:42', '2022-02-28 15:14:42'),
	(2, 'a', 'a', 'a', '', '2022-03-07 14:57:17', '2022-03-07 14:57:17'),
	(3, '3', '3', '3', '3', '2022-05-24 15:53:57', '2022-05-24 15:53:57');
/*!40000 ALTER TABLE `tbl_suppliers` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_users: ~1 rows (approximately)
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` (`user_id`, `user_fullname`, `user_category`, `username`, `password`, `date_added`, `date_last_modified`) VALUES
	(1, 'Kaye Jacildo', 0, 'admin', '0cc175b9c0f1b6a831c399e269772661', '2022-06-13 13:59:32', '2022-06-13 13:59:32');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;

-- Dumping structure for trigger obis_db.delete_expense_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_expense_details` AFTER DELETE ON `tbl_expense` FOR EACH ROW DELETE FROM tbl_expense_details WHERE expense_id = OLD.expense_id//
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
