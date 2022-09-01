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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_customers: ~2 rows (approximately)
/*!40000 ALTER TABLE `tbl_customers` DISABLE KEYS */;
INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_address`, `customer_contact_number`, `remarks`, `date_added`, `date_last_modified`) VALUES
	(1, 'Pepe Smith', 'Bacolod City, Negros Occidental', '0212454', '', '2022-06-06 15:08:10', '2022-07-11 13:38:16'),
	(2, 'Walk-in', '---', ' ', 'Demo only', '2022-07-11 13:38:32', '2022-07-11 13:38:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_expense: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_expense` DISABLE KEYS */;
INSERT INTO `tbl_expense` (`expense_id`, `reference_number`, `expense_date`, `remarks`, `status`, `date_added`, `date_last_modified`) VALUES
	(1, 'EXP-20220708075156', '2022-07-08', '', 'F', '2022-07-08 13:51:59', '2022-07-08 13:57:32'),
	(2, 'EXP-20220711075108', '2022-07-10', 'June Due', 'F', '2022-07-11 13:51:20', '2022-07-11 13:52:08');
/*!40000 ALTER TABLE `tbl_expense` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_expense_category
CREATE TABLE IF NOT EXISTS `tbl_expense_category` (
  `expense_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category` varchar(75) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`expense_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_expense_category: ~2 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_expense_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_expense_details` DISABLE KEYS */;
INSERT INTO `tbl_expense_details` (`expense_detail_id`, `expense_id`, `supplier_id`, `expense_category_id`, `remarks`, `amount`) VALUES
	(1, 1, 1, 1, '', 100.00),
	(2, 2, 4, 3, '', 2500.00);
/*!40000 ALTER TABLE `tbl_expense_details` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_formulation
CREATE TABLE IF NOT EXISTS `tbl_formulation` (
  `formulation_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(75) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`formulation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_formulation: ~4 rows (approximately)
/*!40000 ALTER TABLE `tbl_formulation` DISABLE KEYS */;
INSERT INTO `tbl_formulation` (`formulation_id`, `product_id`, `remarks`, `date_added`, `date_last_modified`) VALUES
	(14, 14, '', '2022-07-11 14:11:05', '0000-00-00 00:00:00'),
	(15, 15, '', '2022-07-11 14:11:50', '0000-00-00 00:00:00'),
	(16, 17, '', '2022-07-11 14:12:42', '0000-00-00 00:00:00'),
	(17, 16, '', '2022-07-11 14:14:40', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tbl_formulation` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_formulation_details
CREATE TABLE IF NOT EXISTS `tbl_formulation_details` (
  `formulation_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `formulation_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `qty` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`formulation_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_formulation_details: ~21 rows (approximately)
/*!40000 ALTER TABLE `tbl_formulation_details` DISABLE KEYS */;
INSERT INTO `tbl_formulation_details` (`formulation_detail_id`, `formulation_id`, `product_id`, `qty`) VALUES
	(1, 11, 4, 3.00),
	(2, 11, 5, 3.00),
	(3, 11, 3, 3.00),
	(4, 11, 3, 2.00),
	(6, 12, 4, 12.00),
	(7, 12, 5, 1.00),
	(8, 13, 4, 1.00),
	(9, 13, 5, 2.00),
	(10, 14, 26, 1.00),
	(11, 14, 21, 2.00),
	(12, 14, 24, 1.00),
	(13, 15, 24, 2.00),
	(14, 15, 20, 1.00),
	(15, 15, 20, 1.00),
	(16, 16, 20, 1.00),
	(17, 16, 21, 1.00),
	(18, 16, 23, 1.00),
	(19, 16, 24, 1.00),
	(20, 17, 20, 1.00),
	(21, 17, 24, 1.00),
	(22, 17, 25, 1.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_job_orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_job_orders` DISABLE KEYS */;
INSERT INTO `tbl_job_orders` (`job_order_id`, `reference_number`, `product_id`, `no_of_batches`, `remarks`, `user_id`, `job_order_date`, `status`, `date_added`, `date_last_modified`) VALUES
	(32, 'JO-20220712075129', 16, 5, '', 0, '2022-07-12 00:00:00', 'F', '2022-07-12 13:51:39', '2022-07-13 10:35:55'),
	(33, 'JO-20220713043222', 15, 5, '', 0, '2022-07-12 00:00:00', 'F', '2022-07-13 10:32:41', '2022-07-13 10:32:46'),
	(34, 'JO-20220713043533', 15, 1, '', 0, '2022-07-12 00:00:00', 'F', '2022-07-13 10:35:44', '2022-07-13 10:35:49');
/*!40000 ALTER TABLE `tbl_job_orders` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_job_order_details
CREATE TABLE IF NOT EXISTS `tbl_job_order_details` (
  `jo_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(7,2) NOT NULL,
  `cost` decimal(7,2) NOT NULL,
  PRIMARY KEY (`jo_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_job_order_details: ~2 rows (approximately)
/*!40000 ALTER TABLE `tbl_job_order_details` DISABLE KEYS */;
INSERT INTO `tbl_job_order_details` (`jo_detail_id`, `job_order_id`, `product_id`, `qty`, `cost`) VALUES
	(29, 32, 20, 5.00, 2.00),
	(30, 32, 24, 5.00, 5.00),
	(31, 32, 25, 5.00, 56.10),
	(32, 33, 24, 10.00, 5.00),
	(33, 33, 20, 5.00, 2.00),
	(34, 33, 20, 5.00, 2.00),
	(35, 34, 24, 2.00, 5.00),
	(36, 34, 20, 1.00, 2.00),
	(37, 34, 20, 1.00, 2.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_products: ~13 rows (approximately)
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` (`product_id`, `product_code`, `product_name`, `product_price`, `product_cost`, `product_img`, `product_category_id`, `remarks`, `is_package`, `date_added`, `date_last_modified`) VALUES
	(13, '00001', 'Cinnamon Rolls', 125.00, 0.00, 'cinnamon rolls.jpg', 2, '', 1, '2022-07-11 13:46:55', '2022-07-11 13:46:55'),
	(14, '0002', 'Caffe Latte', 150.00, 0.00, 'cafe latte.jpg', 1, '', 1, '2022-07-11 13:48:05', '2022-07-11 13:48:05'),
	(15, '0003', 'Caffe Americano', 100.00, 5.14, 'cafe americano.jpg', 1, '', 1, '2022-07-11 13:48:38', '2022-07-11 13:48:38'),
	(16, '0004', 'Caffe Crema', 120.00, 63.10, 'caffe crema hot.jpg', 4, '', 1, '2022-07-11 13:49:03', '2022-07-11 13:49:03'),
	(17, '0005', 'Caffe Mocha', 123.00, 0.00, 'caffe mocha.jpg', 1, '', 1, '2022-07-11 13:49:39', '2022-07-11 13:49:39'),
	(18, '0006', 'Potato Chips', 90.00, 0.00, 'fries.jpg', 5, '', 1, '2022-07-11 13:50:06', '2022-07-11 13:50:06'),
	(19, '0007', 'Choco Muffin', 78.00, 0.00, 'muffin.jpg', 2, '', 1, '2022-07-11 13:50:45', '2022-07-11 13:50:45'),
	(20, '00010', 'Distilled Water', 15.00, 2.00, 'distilled water.jpg', 7, '', 0, '2022-07-11 14:06:06', '2022-07-11 14:06:06'),
	(21, '00011', 'Creamer', 250.00, 150.00, 'creamer.jpg', 7, '', 0, '2022-07-11 14:06:34', '2022-07-11 14:06:34'),
	(22, '00012', 'Chocolate Chips', 80.00, 12.00, 'chocolate chips.jpg', 7, '', 0, '2022-07-11 14:06:56', '2022-07-11 14:06:56'),
	(23, '00013', 'Choco Powder', 250.00, 12.00, 'chocolate powder.jpg', 7, '', 0, '2022-07-11 14:07:37', '2022-07-11 14:07:37'),
	(24, '00014', 'Coffee Beans', 10.00, 5.00, 'beans.jpg', 7, '', 0, '2022-07-11 14:08:18', '2022-07-11 14:08:18'),
	(25, '00015', 'Sugar', 50.00, 56.10, 'sugar.jpg', 7, '', 0, '2022-07-11 14:08:49', '2022-07-11 14:08:49'),
	(26, '00016', 'Sugar Syrup', 15.00, 40.00, 'sugar syrup.jpg', 7, '', 0, '2022-07-11 14:09:28', '2022-07-11 14:09:28');
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_product_categories
CREATE TABLE IF NOT EXISTS `tbl_product_categories` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category` varchar(75) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_product_categories: ~5 rows (approximately)
/*!40000 ALTER TABLE `tbl_product_categories` DISABLE KEYS */;
INSERT INTO `tbl_product_categories` (`product_category_id`, `product_category`, `remarks`, `date_added`, `date_last_modified`) VALUES
	(1, 'Cold Cofffee', '', '2022-02-09 14:41:36', '2022-07-11 13:47:15'),
	(2, 'Bread', '', '2022-02-11 14:49:11', '2022-02-16 09:01:42'),
	(4, 'Hot Coffee', '', '2022-02-16 09:01:10', '2022-07-11 13:47:09'),
	(5, 'Snacks', '', '2022-02-16 09:39:18', '2022-07-11 13:47:30'),
	(7, 'Raw Materials/Ingredients', '', '2022-07-11 14:05:26', '0000-00-00 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_purchase_order: ~6 rows (approximately)
/*!40000 ALTER TABLE `tbl_purchase_order` DISABLE KEYS */;
INSERT INTO `tbl_purchase_order` (`po_id`, `reference_number`, `supplier_id`, `po_date`, `remarks`, `status`, `user_id`, `date_added`, `date_last_modified`) VALUES
	(16, 'PO-20220712041837', 5, '2022-07-12', '', 'F', 0, '2022-07-12 10:18:42', '2022-07-12 10:18:42'),
	(17, 'PO-20220712042003', 5, '2022-07-12', '', 'F', 0, '2022-07-12 10:20:08', '2022-07-12 10:20:08'),
	(18, 'PO-20220712042056', 5, '2022-07-12', '', 'F', 0, '2022-07-12 10:21:00', '2022-07-12 10:21:00'),
	(19, 'PO-20220712043045', 3, '2022-07-12', '', 'F', 0, '2022-07-12 10:30:54', '2022-07-12 10:30:54'),
	(20, 'PO-20220712044907', 2, '2022-07-12', '', 'F', 0, '2022-07-12 10:49:14', '2022-07-12 10:49:14'),
	(21, 'PO-20220712045358', 1, '2022-07-12', '', 'F', 0, '2022-07-12 10:54:05', '2022-07-12 10:54:05');
/*!40000 ALTER TABLE `tbl_purchase_order` ENABLE KEYS */;

-- Dumping structure for table obis_db.tbl_purchase_order_details
CREATE TABLE IF NOT EXISTS `tbl_purchase_order_details` (
  `po_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(11,2) NOT NULL,
  `supplier_price` decimal(11,2) NOT NULL,
  PRIMARY KEY (`po_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_purchase_order_details: ~12 rows (approximately)
/*!40000 ALTER TABLE `tbl_purchase_order_details` DISABLE KEYS */;
INSERT INTO `tbl_purchase_order_details` (`po_detail_id`, `po_id`, `product_id`, `qty`, `supplier_price`) VALUES
	(23, 16, 25, 1.00, 50.00),
	(24, 17, 25, 2.00, 60.00),
	(25, 17, 21, 50.00, 150.00),
	(26, 18, 23, 50.00, 80.00),
	(27, 18, 26, 50.00, 40.00),
	(28, 18, 22, 50.00, 123.00),
	(29, 18, 25, 5.00, 46.00),
	(30, 19, 25, 24.00, 50.00),
	(31, 20, 25, 50.00, 60.00),
	(33, 21, 24, 500.00, 5.00),
	(34, 21, 23, 500.00, 12.00),
	(35, 21, 22, 120.00, 12.00),
	(36, 21, 20, 580.00, 2.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_sales: ~8 rows (approximately)
/*!40000 ALTER TABLE `tbl_sales` DISABLE KEYS */;
INSERT INTO `tbl_sales` (`sales_id`, `reference_number`, `customer_id`, `status`, `remarks`, `user_id`, `sales_date`, `date_added`, `date_last_modified`) VALUES
	(24, 'SLS-20220713035512', 1, 'F', '', 0, '2022-07-13', '2022-07-13 09:55:18', '2022-07-13 10:31:32'),
	(25, 'SLS-20220713043145', 1, 'F', '', 0, '2022-07-13', '2022-07-13 10:31:50', '2022-07-13 10:32:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_sales_details: ~3 rows (approximately)
/*!40000 ALTER TABLE `tbl_sales_details` DISABLE KEYS */;
INSERT INTO `tbl_sales_details` (`sales_detail_id`, `sales_id`, `product_id`, `qty`, `cost`, `price`) VALUES
	(4, 24, 14, 1.00, 0.00, 150.00),
	(5, 25, 13, 1.00, 0.00, 125.00),
	(6, 25, 15, 2.00, 0.00, 100.00);
/*!40000 ALTER TABLE `tbl_sales_details` ENABLE KEYS */;

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

-- Dumping data for table obis_db.tbl_suppliers: ~4 rows (approximately)
/*!40000 ALTER TABLE `tbl_suppliers` DISABLE KEYS */;
INSERT INTO `tbl_suppliers` (`supplier_id`, `supplier_name`, `supplier_address`, `contact_number`, `remarks`, `date_added`, `date_last_modified`) VALUES
	(1, 'Coco Martin', 'Bacolod City, Neg. Occ.', '054774444', ' ', '2022-02-28 15:14:42', '2022-02-28 15:14:42'),
	(2, 'Anna Maria', 'Brgy. 5, Bacolod City', '095787878444', '', '2022-03-07 14:57:17', '2022-03-07 14:57:17'),
	(3, 'Len Len', 'Brgy. Banago, Bcd', '212212121', '', '2022-05-24 15:53:57', '2022-05-24 15:53:57'),
	(4, 'NOCECO', ' ', ' ', 'Electric', '0000-00-00 00:00:00', '2022-07-11 13:51:51'),
	(5, 'Gaisano Bacolod', ' Cor. Ballesteros, Gatuslao St, Bacolod, 6100 Negros Occidental', '4350211', '', '0000-00-00 00:00:00', '2022-07-12 10:10:41');
/*!40000 ALTER TABLE `tbl_suppliers` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table obis_db.tbl_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` (`user_id`, `user_fullname`, `user_category`, `username`, `password`, `date_added`, `date_last_modified`) VALUES
	(1, 'Juan Dela Cruz', 'A', 'admin', '0cc175b9c0f1b6a831c399e269772661', '2022-06-13 13:59:32', '2022-06-13 13:59:32');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;

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
