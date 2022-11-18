-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2022 at 08:28 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `obis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_contact_number` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_address`, `customer_contact_number`, `remarks`, `date_added`, `date_last_modified`) VALUES
(1, 'Pepe Smith', 'Bacolod City, Negros Occidental', '0212454', '', '2022-06-06 15:08:10', '2022-11-11 15:56:01'),
(2, 'Walk-in', '---', ' ', 'Demo only', '2022-07-11 13:38:32', '2022-07-11 13:38:46'),
(3, 'Juan Smith', 'Bacolod', '09090909', '', '2022-11-11 13:09:52', '2022-11-11 13:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_payment`
--

CREATE TABLE `tbl_customer_payment` (
  `cp_id` int(11) NOT NULL,
  `reference_number` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_type` varchar(1) NOT NULL,
  `payment_option_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `deposit_status` int(1) NOT NULL DEFAULT 0 COMMENT '1 = Deposited',
  `check_number` varchar(30) NOT NULL,
  `check_bank` varchar(30) NOT NULL,
  `check_date` date NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer_payment`
--

INSERT INTO `tbl_customer_payment` (`cp_id`, `reference_number`, `customer_id`, `payment_type`, `payment_option_id`, `payment_date`, `remarks`, `status`, `deposit_status`, `check_number`, `check_bank`, `check_date`, `encoded_by`, `date_added`, `date_last_modified`) VALUES
(41, 'CP-221021090441', 0, 'C', 0, '2022-10-21', '', 'F', 0, '', '', '2022-10-21', 1, '2022-10-21 15:04:45', '2022-10-21 15:04:45'),
(42, 'CP-221021092830', 24, 'H', 0, '2022-10-21', '', 'F', 1, '0001', 'BPI', '2022-10-21', 1, '2022-10-21 15:28:39', '2022-10-21 15:28:39'),
(43, 'CP-221021092853', 24, 'C', 0, '2022-10-21', '', 'F', 0, '', '', '2022-10-21', 1, '2022-10-21 15:28:58', '2022-10-21 15:28:58'),
(44, 'CP-221021092909', 0, 'H', 0, '2022-10-21', '', 'F', 1, '101010', 'bdo', '2022-10-21', 1, '2022-10-21 15:29:19', '2022-10-21 15:29:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_payment_details`
--

CREATE TABLE `tbl_customer_payment_details` (
  `cpd_id` int(11) NOT NULL,
  `cp_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `type` varchar(2) NOT NULL COMMENT 'DR = sales ; BB = beginning balance'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer_payment_details`
--

INSERT INTO `tbl_customer_payment_details` (`cpd_id`, `cp_id`, `ref_id`, `amount`, `type`) VALUES
(52, 41, 71, '258.00', 'DR'),
(53, 42, 72, '2000.00', 'DR'),
(54, 43, 72, '5500.00', 'DR'),
(55, 44, 71, '3000.00', 'DR');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense`
--

CREATE TABLE `tbl_expense` (
  `expense_id` int(11) NOT NULL,
  `reference_number` varchar(50) NOT NULL DEFAULT '',
  `expense_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(1) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_expense`
--

INSERT INTO `tbl_expense` (`expense_id`, `reference_number`, `expense_date`, `remarks`, `status`, `date_added`, `date_last_modified`) VALUES
(1, 'EXP-20220708075156', '2022-07-08', '', 'F', '2022-07-08 13:51:59', '2022-07-08 13:57:32'),
(2, 'EXP-20220711075108', '2022-07-10', 'June Due', 'F', '2022-07-11 13:51:20', '2022-07-11 13:52:08'),
(3, 'EXP-20220829025616', '2022-08-29', '', 'F', '2022-08-29 08:56:20', '2022-08-29 08:56:55'),
(4, 'EXP-20221111030034', '2022-11-11', '', 'F', '2022-11-11 10:00:37', '2022-11-11 10:00:46'),
(5, 'EXP-20221111030100', '2022-11-10', '', 'F', '2022-11-11 10:01:06', '2022-11-11 10:01:34'),
(6, 'EXP-20221111131914', '2022-11-11', 'demo ', 'F', '2022-11-11 13:19:38', '2022-11-11 13:21:00');

--
-- Triggers `tbl_expense`
--
DELIMITER $$
CREATE TRIGGER `delete_expenses_details` AFTER DELETE ON `tbl_expense` FOR EACH ROW DELETE FROM tbl_expense_details WHERE expense_id = OLD.expense_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_category`
--

CREATE TABLE `tbl_expense_category` (
  `expense_category_id` int(11) NOT NULL,
  `expense_category` varchar(75) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_expense_category`
--

INSERT INTO `tbl_expense_category` (`expense_category_id`, `expense_category`, `date_added`, `date_last_modified`) VALUES
(1, 'Waterbills', '2022-02-28 14:35:33', '2022-06-09 09:37:28'),
(3, 'Electric Bill', '2022-06-09 09:39:01', '2022-06-09 09:39:30'),
(4, 'Rental Fee', '2022-06-13 14:05:05', '0000-00-00 00:00:00'),
(5, 'Fees', '2022-08-29 08:56:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_details`
--

CREATE TABLE `tbl_expense_details` (
  `expense_detail_id` int(11) NOT NULL,
  `expense_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `remarks` varchar(250) NOT NULL DEFAULT '',
  `amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_expense_details`
--

INSERT INTO `tbl_expense_details` (`expense_detail_id`, `expense_id`, `supplier_id`, `expense_category_id`, `remarks`, `amount`) VALUES
(1, 1, 1, 1, '', '100.00'),
(2, 2, 4, 3, '', '2500.00'),
(3, 3, 1, 5, '', '2.00'),
(4, 4, 1, 1, '', '2500.00'),
(5, 5, 1, 4, '', '5000.00'),
(6, 5, 4, 3, '', '400.00'),
(7, 6, 1, 1, '', '100.00'),
(8, 6, 4, 3, '', '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_formulation`
--

CREATE TABLE `tbl_formulation` (
  `formulation_id` int(11) NOT NULL,
  `product_id` int(75) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_formulation`
--

INSERT INTO `tbl_formulation` (`formulation_id`, `product_id`, `remarks`, `date_added`, `date_last_modified`) VALUES
(14, 14, '', '2022-07-11 14:11:05', '0000-00-00 00:00:00'),
(15, 15, '', '2022-07-11 14:11:50', '0000-00-00 00:00:00'),
(16, 17, '', '2022-07-11 14:12:42', '0000-00-00 00:00:00'),
(17, 16, '', '2022-07-11 14:14:40', '0000-00-00 00:00:00'),
(18, 19, '', '2022-11-11 13:12:23', '0000-00-00 00:00:00');

--
-- Triggers `tbl_formulation`
--
DELIMITER $$
CREATE TRIGGER `delete_formulation_details` AFTER DELETE ON `tbl_formulation` FOR EACH ROW DELETE FROM tbl_formulation_details WHERE formulation_id= OLD.formulation_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_formulation_details`
--

CREATE TABLE `tbl_formulation_details` (
  `formulation_detail_id` int(11) NOT NULL,
  `formulation_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `qty` decimal(7,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_formulation_details`
--

INSERT INTO `tbl_formulation_details` (`formulation_detail_id`, `formulation_id`, `product_id`, `qty`) VALUES
(1, 11, 4, '3.00'),
(2, 11, 5, '3.00'),
(3, 11, 3, '3.00'),
(4, 11, 3, '2.00'),
(6, 12, 4, '12.00'),
(7, 12, 5, '1.00'),
(8, 13, 4, '1.00'),
(9, 13, 5, '2.00'),
(10, 14, 26, '1.00'),
(11, 14, 21, '2.00'),
(12, 14, 24, '1.00'),
(13, 15, 24, '2.00'),
(14, 15, 20, '1.00'),
(15, 15, 20, '1.00'),
(16, 16, 20, '1.00'),
(17, 16, 21, '1.00'),
(18, 16, 23, '1.00'),
(19, 16, 24, '1.00'),
(20, 17, 20, '1.00'),
(21, 17, 24, '1.00'),
(22, 17, 25, '1.00'),
(23, 14, 25, '1.00'),
(24, 18, 25, '1.00'),
(25, 18, 23, '1.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_job_orders`
--

CREATE TABLE `tbl_job_orders` (
  `job_order_id` int(11) NOT NULL,
  `reference_number` varchar(75) NOT NULL,
  `product_id` int(11) NOT NULL,
  `no_of_batches` int(3) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_order_date` datetime NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `tbl_job_orders`
--
DELIMITER $$
CREATE TRIGGER `add_transaction_in_jo` AFTER INSERT ON `tbl_job_orders` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,header_id,module,type) VALUES (NEW.product_id,NEW.no_of_batches,NEW.job_order_id,'JO','IN')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_job_order_details` AFTER DELETE ON `tbl_job_orders` FOR EACH ROW BEGIN
DELETE FROM tbl_job_order_details WHERE job_order_id = OLD.job_order_id;
DELETE FROM tbl_product_transactions WHERE header_id = OLD.job_order_id AND module = 'JO';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `finish_transaction_jo` AFTER UPDATE ON `tbl_job_orders` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.job_order_id AND module = 'JO'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_job_order_details`
--

CREATE TABLE `tbl_job_order_details` (
  `jo_detail_id` int(11) NOT NULL,
  `job_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(7,2) NOT NULL,
  `cost` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `tbl_job_order_details`
--
DELIMITER $$
CREATE TRIGGER `add_transaction_out_jo` AFTER INSERT ON `tbl_job_order_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.qty,NEW.cost,NEW.cost,NEW.job_order_id,NEW.jo_detail_id,'JO','OUT')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_transaction_jo_details` AFTER DELETE ON `tbl_job_order_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.jo_detail_id AND header_id = OLD.job_order_id AND module = 'JO'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_option`
--

CREATE TABLE `tbl_payment_option` (
  `payment_option_id` int(11) NOT NULL,
  `payment_option` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment_option`
--

INSERT INTO `tbl_payment_option` (`payment_option_id`, `payment_option`, `date_added`, `date_last_modified`) VALUES
(1, 'GCash', '2022-05-24 15:55:09', '2022-05-24 15:55:09'),
(2, 'Paymaya', '2022-09-27 15:47:00', '2022-09-27 15:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `product_id` int(11) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `product_name` varchar(75) NOT NULL,
  `product_price` decimal(11,2) NOT NULL,
  `product_cost` decimal(11,2) NOT NULL,
  `product_img` text NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `is_package` int(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`product_id`, `product_code`, `product_name`, `product_price`, `product_cost`, `product_img`, `product_category_id`, `remarks`, `is_package`, `date_added`, `date_last_modified`) VALUES
(13, '00001', 'Cinnamon Rolls', '125.00', '94.64', 'cinnamon rolls.jpg', 2, '', 1, '2022-07-11 13:46:55', '2022-07-11 13:46:55'),
(14, '0002', 'Caffe Latte', '150.00', '-2.37', 'cafe latte.jpg', 1, '', 1, '2022-07-11 13:48:05', '2022-07-11 13:48:05'),
(15, '0003', 'Caffe Americano', '100.00', '50.00', 'cafe americano.jpg', 1, '', 1, '2022-07-11 13:48:38', '2022-07-11 13:48:38'),
(16, '0004', 'Caffe Crema', '120.00', '60.03', 'caffe crema hot.jpg', 4, '', 1, '2022-07-11 13:49:03', '2022-07-11 13:49:03'),
(17, '0005', 'Caffe Mocha', '123.00', '50.22', 'caffe mocha.jpg', 1, '', 1, '2022-07-11 13:49:39', '2022-07-11 13:49:39'),
(18, '0006', 'Potato Chips', '90.00', '0.00', 'fries.jpg', 5, '', 1, '2022-07-11 13:50:06', '2022-07-11 13:50:06'),
(19, '0007', 'Choco Muffin', '78.00', '0.00', 'muffin.jpg', 2, '', 1, '2022-07-11 13:50:45', '2022-07-11 13:50:45'),
(20, '00010', 'Distilled Water', '15.00', '2.35', 'distilled water.jpg', 7, '', 0, '2022-07-11 14:06:06', '2022-07-11 14:06:06'),
(21, '00011', 'Creamer', '250.00', '150.00', 'creamer.jpg', 7, '', 0, '2022-07-11 14:06:34', '2022-07-11 14:06:34'),
(22, '00012', 'Chocolate Chips', '80.00', '12.00', 'chocolate chips.jpg', 7, '', 0, '2022-07-11 14:06:56', '2022-07-11 14:06:56'),
(23, '00013', 'Choco Powder', '250.00', '12.00', 'chocolate powder.jpg', 7, '', 0, '2022-07-11 14:07:37', '2022-07-11 14:07:37'),
(24, '00014', 'Coffee Beans', '10.00', '5.00', 'beans.jpg', 7, '', 0, '2022-07-11 14:08:18', '2022-07-11 14:08:18'),
(25, '00015', 'Sugar', '50.00', '15.54', 'sugar.jpg', 7, '', 0, '2022-07-11 14:08:49', '2022-07-11 14:08:49'),
(26, '00016', 'Sugar Syrup', '15.00', '27.42', 'sugar syrup.jpg', 7, '', 0, '2022-07-11 14:09:28', '2022-07-11 14:09:28'),
(27, '00017', 'Black Coffee', '50.00', '0.00', 'OIP.jpg', 8, 'for cold 70 pesos', 1, '2022-11-12 05:29:16', '2022-11-12 05:29:16'),
(28, '00018', 'Hazelnut Coffee', '70.00', '0.00', 'OIP (1).jpg', 8, 'for hot 50 pesos ', 1, '2022-11-12 05:30:34', '2022-11-12 05:30:34'),
(29, '00019', 'French Vanilla', '70.00', '0.00', 'OIP (2).jpg', 8, 'hot for 50 pesos', 1, '2022-11-12 05:42:55', '2022-11-12 05:42:55'),
(30, '00020', 'Coffee Jelly', '80.00', '0.00', 'OIP (3).jpg', 1, '', 0, '2022-11-12 05:47:45', '2022-11-12 05:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_categories`
--

CREATE TABLE `tbl_product_categories` (
  `product_category_id` int(11) NOT NULL,
  `product_category` varchar(75) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_categories`
--

INSERT INTO `tbl_product_categories` (`product_category_id`, `product_category`, `remarks`, `date_added`, `date_last_modified`) VALUES
(1, 'Iced Coffee', '', '2022-02-09 14:41:36', '2022-11-12 05:30:05'),
(2, 'Bread', '', '2022-02-11 14:49:11', '2022-02-16 09:01:42'),
(4, 'Hot Coffee', '', '2022-02-16 09:01:10', '2022-07-11 13:47:09'),
(5, 'Snacks', '', '2022-02-16 09:39:18', '2022-07-11 13:47:30'),
(7, 'Raw Materials/Ingredients', '', '2022-07-11 14:05:26', '0000-00-00 00:00:00'),
(8, 'Hot and Cold Coffee', '', '2022-11-12 05:31:22', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_transactions`
--

CREATE TABLE `tbl_product_transactions` (
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `cost` decimal(12,5) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `header_id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `module` varchar(3) NOT NULL DEFAULT '' COMMENT 'SLS=Sales',
  `type` varchar(3) NOT NULL DEFAULT '' COMMENT 'IN,OUT',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '1=Finished;0=Saved',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_order`
--

CREATE TABLE `tbl_purchase_order` (
  `po_id` int(11) NOT NULL,
  `reference_number` varchar(30) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `po_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Triggers `tbl_purchase_order`
--
DELIMITER $$
CREATE TRIGGER `delete_po_details` AFTER DELETE ON `tbl_purchase_order` FOR EACH ROW DELETE FROM tbl_purchase_order_details WHERE po_id = OLD.po_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `finish_transaction_po` AFTER UPDATE ON `tbl_purchase_order` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.po_id AND module = 'PO'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_order_details`
--

CREATE TABLE `tbl_purchase_order_details` (
  `po_detail_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(11,2) NOT NULL,
  `supplier_price` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `tbl_purchase_order_details`
--
DELIMITER $$
CREATE TRIGGER `add_transaction_in_po` AFTER INSERT ON `tbl_purchase_order_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.qty,NEW.supplier_price,NEW.supplier_price,NEW.po_id,NEW.po_detail_id,'PO','IN')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_transaction_po_details` AFTER DELETE ON `tbl_purchase_order_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.po_detail_id AND header_id = OLD.po_id AND module = 'PO'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `sales_id` int(11) NOT NULL,
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
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `tbl_sales`
--
DELIMITER $$
CREATE TRIGGER `delete_sales_details` AFTER DELETE ON `tbl_sales` FOR EACH ROW DELETE FROM tbl_sales_details WHERE sales_id = OLD.sales_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `finish_transaction_sales` AFTER UPDATE ON `tbl_sales` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.sales_id AND module = 'SLS'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_details`
--

CREATE TABLE `tbl_sales_details` (
  `sales_detail_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(12,2) NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Triggers `tbl_sales_details`
--
DELIMITER $$
CREATE TRIGGER `add_transaction_out_sales` AFTER INSERT ON `tbl_sales_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.qty,NEW.cost,NEW.price,NEW.sales_id,NEW.sales_detail_id,'SLS','OUT')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_transaction_sales` AFTER DELETE ON `tbl_sales_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.sales_detail_id AND header_id = OLD.sales_id AND module = 'SLS'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_transaction` AFTER UPDATE ON `tbl_sales_details` FOR EACH ROW UPDATE tbl_product_transactions SET product_id = NEW.product_id,quantity = NEW.qty,cost=NEW.cost, price = NEW.price WHERE detail_id = OLD.sales_detail_id AND header_id = OLD.sales_id AND module = 'SLS'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_summary`
--

CREATE TABLE `tbl_sales_summary` (
  `sales_summary_id` int(11) UNSIGNED NOT NULL,
  `cashier_id` int(11) NOT NULL,
  `starting_balance` decimal(11,2) NOT NULL,
  `total_sales_amount` decimal(11,2) NOT NULL,
  `total_amount_collected` decimal(11,2) NOT NULL,
  `total_deficit` decimal(9,2) DEFAULT NULL,
  `encoded_by` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `tbl_suppliers`
--

CREATE TABLE `tbl_suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `user_category` varchar(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_fullname`, `user_category`, `username`, `password`, `date_added`, `date_last_modified`) VALUES
(1, 'Juan Dela Cruz', 'A', 'admin', '0cc175b9c0f1b6a831c399e269772661', '2022-06-13 13:59:32', '2022-06-13 13:59:32'),
(2, 'Cashier', 'C', 'cashier', '0cc175b9c0f1b6a831c399e269772661', '0000-00-00 00:00:00', '2022-11-07 09:12:53'),
(3, 'Anne Anne', 'A', 'cashier1', '0cc175b9c0f1b6a831c399e269772661', '2022-11-11 11:55:37', '2022-11-11 11:55:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  ADD PRIMARY KEY (`cp_id`);

--
-- Indexes for table `tbl_customer_payment_details`
--
ALTER TABLE `tbl_customer_payment_details`
  ADD PRIMARY KEY (`cpd_id`);

--
-- Indexes for table `tbl_expense`
--
ALTER TABLE `tbl_expense`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `tbl_expense_category`
--
ALTER TABLE `tbl_expense_category`
  ADD PRIMARY KEY (`expense_category_id`);

--
-- Indexes for table `tbl_expense_details`
--
ALTER TABLE `tbl_expense_details`
  ADD PRIMARY KEY (`expense_detail_id`);

--
-- Indexes for table `tbl_formulation`
--
ALTER TABLE `tbl_formulation`
  ADD PRIMARY KEY (`formulation_id`);

--
-- Indexes for table `tbl_formulation_details`
--
ALTER TABLE `tbl_formulation_details`
  ADD PRIMARY KEY (`formulation_detail_id`);

--
-- Indexes for table `tbl_job_orders`
--
ALTER TABLE `tbl_job_orders`
  ADD PRIMARY KEY (`job_order_id`);

--
-- Indexes for table `tbl_job_order_details`
--
ALTER TABLE `tbl_job_order_details`
  ADD PRIMARY KEY (`jo_detail_id`);

--
-- Indexes for table `tbl_payment_option`
--
ALTER TABLE `tbl_payment_option`
  ADD PRIMARY KEY (`payment_option_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `tbl_purchase_order`
--
ALTER TABLE `tbl_purchase_order`
  ADD PRIMARY KEY (`po_id`);

--
-- Indexes for table `tbl_purchase_order_details`
--
ALTER TABLE `tbl_purchase_order_details`
  ADD PRIMARY KEY (`po_detail_id`);

--
-- Indexes for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  ADD PRIMARY KEY (`sales_detail_id`);

--
-- Indexes for table `tbl_sales_summary`
--
ALTER TABLE `tbl_sales_summary`
  ADD PRIMARY KEY (`sales_summary_id`);

--
-- Indexes for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  MODIFY `cp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_customer_payment_details`
--
ALTER TABLE `tbl_customer_payment_details`
  MODIFY `cpd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tbl_expense`
--
ALTER TABLE `tbl_expense`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_expense_category`
--
ALTER TABLE `tbl_expense_category`
  MODIFY `expense_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_expense_details`
--
ALTER TABLE `tbl_expense_details`
  MODIFY `expense_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_formulation`
--
ALTER TABLE `tbl_formulation`
  MODIFY `formulation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_formulation_details`
--
ALTER TABLE `tbl_formulation_details`
  MODIFY `formulation_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_job_orders`
--
ALTER TABLE `tbl_job_orders`
  MODIFY `job_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tbl_job_order_details`
--
ALTER TABLE `tbl_job_order_details`
  MODIFY `jo_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tbl_payment_option`
--
ALTER TABLE `tbl_payment_option`
  MODIFY `payment_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_purchase_order`
--
ALTER TABLE `tbl_purchase_order`
  MODIFY `po_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_purchase_order_details`
--
ALTER TABLE `tbl_purchase_order_details`
  MODIFY `po_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  MODIFY `sales_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `tbl_sales_summary`
--
ALTER TABLE `tbl_sales_summary`
  MODIFY `sales_summary_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
