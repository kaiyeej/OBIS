-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2022 at 03:36 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_address`, `customer_contact_number`, `remarks`, `date_added`, `date_last_modified`) VALUES
(1, 'pepe smith', 'bcd', '0212454', '', '2022-06-06 15:08:10', '2022-06-06 15:08:10');

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
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `tbl_expense`
--
DELIMITER $$
CREATE TRIGGER `delete_expense_details` AFTER DELETE ON `tbl_expense` FOR EACH ROW DELETE FROM tbl_expense_details WHERE expense_id = OLD.expense_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_category`
--

CREATE TABLE `tbl_expense_category` (
  `expense_category_id` int(11) NOT NULL,
  `expense_category` varchar(75) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_expense_category`
--

INSERT INTO `tbl_expense_category` (`expense_category_id`, `expense_category`, `date_added`, `date_last_modified`) VALUES
(1, 'Waterbills', '2022-02-28 14:35:33', '2022-06-09 09:37:28'),
(3, 'Electric Bill', '2022-06-09 09:39:01', '2022-06-09 09:39:30'),
(4, 'Rental Fee', '2022-06-13 14:05:05', '0000-00-00 00:00:00');

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_formulation`
--

CREATE TABLE `tbl_formulation` (
  `formulation_id` int(11) NOT NULL,
  `product_id` int(75) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_formulation`
--

INSERT INTO `tbl_formulation` (`formulation_id`, `product_id`, `remarks`, `date_added`, `date_last_modified`) VALUES
(11, 8, '', '2022-05-02 11:20:37', '0000-00-00 00:00:00'),
(12, 3, '34', '2022-06-23 14:07:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_formulation_details`
--

CREATE TABLE `tbl_formulation_details` (
  `formulation_detail_id` int(11) NOT NULL,
  `formulation_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `qty` decimal(7,2) NOT NULL DEFAULT '0.00'
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
(7, 12, 5, '1.00');

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
  `status` varchar(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_job_orders`
--

INSERT INTO `tbl_job_orders` (`job_order_id`, `reference_number`, `product_id`, `no_of_batches`, `remarks`, `user_id`, `job_order_date`, `status`, `date_added`, `date_last_modified`) VALUES
(7, 'JO-20220624030852', 0, 2, '', 0, '2022-06-24 00:00:00', '', '2022-06-24 09:08:58', '0000-00-00 00:00:00');

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
  `is_package` int(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`product_id`, `product_code`, `product_name`, `product_price`, `product_cost`, `product_img`, `product_category_id`, `remarks`, `is_package`, `date_added`, `date_last_modified`) VALUES
(3, '0002', 'asdasd', '23.00', '0.00', 'viber_image_2022-06-16_09-03-21-539.jpg', 4, 'aqwd\r\n', 1, '2022-02-16 09:43:33', '2022-03-04 17:25:25'),
(4, '0003', 'George', '12.00', '0.00', 'default.jpg', 5, '312', 1, '2022-02-16 11:02:15', '2022-03-04 17:25:28'),
(5, '0004', 'q', '21.00', '0.00', 'default.jpg', 1, 'as', 1, '2022-02-21 15:15:41', '2022-03-04 17:25:31'),
(6, '0005', '3232', '324.00', '0.00', 'default.jpg', 1, 'sdfsf', 1, '2022-02-21 15:15:55', '2022-03-04 17:25:33'),
(8, '000222', 'prod1', '4.00', '0.00', 'default.jpg', 1, 'dadas', 0, '2022-04-22 09:05:43', '2022-04-22 09:48:55'),
(12, '333', 'sample', '3.00', '0.00', 'default.jpg', 1, '', 0, '2022-06-07 10:51:03', '2022-06-07 10:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_categories`
--

CREATE TABLE `tbl_product_categories` (
  `product_category_id` int(11) NOT NULL,
  `product_category` varchar(75) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_categories`
--

INSERT INTO `tbl_product_categories` (`product_category_id`, `product_category`, `remarks`, `date_added`, `date_last_modified`) VALUES
(1, 'Cofffee', '', '2022-02-09 14:41:36', '2022-02-16 09:02:01'),
(2, 'Bread', '', '2022-02-11 14:49:11', '2022-02-16 09:01:42'),
(4, 'Nachos', '', '2022-02-16 09:01:10', '0000-00-00 00:00:00'),
(5, 'Sample New', '', '2022-02-16 09:39:18', '2022-02-16 09:39:27'),
(6, 'A', '', '2022-02-17 13:03:52', '2022-02-17 13:03:59');

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
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_purchase_order`
--

INSERT INTO `tbl_purchase_order` (`po_id`, `reference_number`, `supplier_id`, `po_date`, `remarks`, `status`, `user_id`, `date_added`, `date_last_modified`) VALUES
(11, 'PO-20220622042127', 1, '2022-06-22', '', 'F', 0, '2022-06-22 10:21:31', '2022-06-22 10:21:31'),
(12, 'PO-20220623032701', 1, '2022-06-23', '', '', 0, '2022-06-23 09:27:06', '2022-06-23 09:27:06'),
(13, 'PO-20220623075846', 1, '2022-06-23', '', 'F', 0, '2022-06-23 13:58:52', '2022-06-23 13:58:52');

--
-- Triggers `tbl_purchase_order`
--
DELIMITER $$
CREATE TRIGGER `delete_purchase_order_details` AFTER DELETE ON `tbl_purchase_order` FOR EACH ROW DELETE FROM tbl_purchase_order_details WHERE po_id = OLD.po_id
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
-- Dumping data for table `tbl_purchase_order_details`
--

INSERT INTO `tbl_purchase_order_details` (`po_detail_id`, `po_id`, `product_id`, `qty`, `supplier_price`) VALUES
(18, 11, 4, '1.00', '23.00'),
(19, 11, 8, '12.00', '122.00'),
(20, 13, 3, '2.00', '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `sales_id` int(11) NOT NULL,
  `reference_number` varchar(30) NOT NULL DEFAULT '',
  `customer_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S' COMMENT 'F',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `sales_date` date NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sales`
--

INSERT INTO `tbl_sales` (`sales_id`, `reference_number`, `customer_id`, `status`, `remarks`, `user_id`, `sales_date`, `date_added`, `date_last_modified`) VALUES
(16, 'SLS-20220622051713', 1, 'S', '', 0, '2022-06-22', '2022-06-22 11:17:19', '0000-00-00 00:00:00'),
(17, 'SLS-20220623052825', 1, 'S', '', 0, '2022-06-23', '2022-06-23 11:28:30', '0000-00-00 00:00:00'),
(18, 'SLS-20220623055419', 1, 'S', '', 0, '2022-06-23', '2022-06-23 11:54:24', '0000-00-00 00:00:00'),
(19, 'SLS-20220623072526', 1, 'F', '', 0, '2022-06-23', '2022-06-23 13:25:33', '2022-06-23 13:54:12'),
(20, 'SLS-20220623075447', 1, 'S', '', 0, '2022-06-23', '2022-06-23 13:54:52', '0000-00-00 00:00:00'),
(21, 'SLS-20220623080555', 1, 'S', '', 0, '2022-06-23', '2022-06-23 14:06:00', '0000-00-00 00:00:00');

--
-- Triggers `tbl_sales`
--
DELIMITER $$
CREATE TRIGGER `delete_sales_details` AFTER DELETE ON `tbl_sales` FOR EACH ROW DELETE FROM tbl_sales_details WHERE sales_id = OLD.sales_id
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
-- Dumping data for table `tbl_sales_details`
--

INSERT INTO `tbl_sales_details` (`sales_detail_id`, `sales_id`, `product_id`, `qty`, `cost`, `price`) VALUES
(1, 19, 4, '4.00', '0.00', '12.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_suppliers`
--

CREATE TABLE `tbl_suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_suppliers`
--

INSERT INTO `tbl_suppliers` (`supplier_id`, `supplier_name`, `supplier_address`, `contact_number`, `remarks`, `date_added`, `date_last_modified`) VALUES
(1, 'asdasd', 'sadasd', 'sdfsdf', 'sdfsd', '2022-02-28 15:14:42', '2022-02-28 15:14:42'),
(2, 'a', 'a', 'a', '', '2022-03-07 14:57:17', '2022-03-07 14:57:17'),
(3, '3', '3', '3', '3', '2022-05-24 15:53:57', '2022-05-24 15:53:57');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `user_category` int(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_last_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_fullname`, `user_category`, `username`, `password`, `date_added`, `date_last_modified`) VALUES
(1, 'Kaye Jacildo', 0, 'admin', '0cc175b9c0f1b6a831c399e269772661', '2022-06-13 13:59:32', '2022-06-13 13:59:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customer_id`);

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
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_expense`
--
ALTER TABLE `tbl_expense`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_expense_category`
--
ALTER TABLE `tbl_expense_category`
  MODIFY `expense_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_expense_details`
--
ALTER TABLE `tbl_expense_details`
  MODIFY `expense_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_formulation`
--
ALTER TABLE `tbl_formulation`
  MODIFY `formulation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_formulation_details`
--
ALTER TABLE `tbl_formulation_details`
  MODIFY `formulation_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_job_orders`
--
ALTER TABLE `tbl_job_orders`
  MODIFY `job_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_job_order_details`
--
ALTER TABLE `tbl_job_order_details`
  MODIFY `jo_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_purchase_order`
--
ALTER TABLE `tbl_purchase_order`
  MODIFY `po_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_purchase_order_details`
--
ALTER TABLE `tbl_purchase_order_details`
  MODIFY `po_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  MODIFY `sales_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
