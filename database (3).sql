-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2022 at 05:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `bundle`
--

CREATE TABLE `bundle` (
  `prod_code1` int(11) NOT NULL,
  `prod_code2` int(11) NOT NULL,
  `products` text NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bundle`
--

INSERT INTO `bundle` (`prod_code1`, `prod_code2`, `products`, `price`) VALUES
(1, 4, 'This bundle includes the full game of Mario Kart, as well as the DLC that will give access to more karts.', '27.98');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `username`, `address`, `email`, `password`) VALUES
(1, 'Allie Hart', 'Bunnystar', '2433 Duke Lane Asbury Park NJ', 'AllieH@gmail.com', 'AllHart'),
(2, 'Brad Stout', 'Lolki', '4769 Todds Lane San Antonio TX', 'BStout@yahoo.com', 'BradSt'),
(3, 'Charles Gould', 'SuperC', '3510 Big Indian Metairie LA', 'supercharles@outlook.com', 'pass3510'),
(4, 'Devin Bird', 'xpob', '5 Eastland Avenue Jackson MS', 'DeviBird@hotmail.com', 'password5');

-- --------------------------------------------------------

--
-- Table structure for table `dlc`
--

CREATE TABLE `dlc` (
  `product_code` int(11) NOT NULL,
  `dlc_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dlc`
--

INSERT INTO `dlc` (`product_code`, `dlc_name`) VALUES
(4, 'New Karts');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `hours` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `salary`, `hours`) VALUES
(1, 'Gaston Fol', '15.00', '10.00'),
(2, 'Kory Webster', '15.25', '16.00'),
(3, 'Zachery Pena', '16.00', '28.00');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `item_code` int(11) NOT NULL,
  `developer` varchar(30) NOT NULL,
  `publisher` varchar(30) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`item_code`, `developer`, `publisher`, `description`) VALUES
(1, 'Nintendo Games', 'Nintendo Games', 'Mario Kart is a series of racing games where players compete in go-kart races while using various power-up items. It features characters and courses from the Mario series as well as other gaming franchises such as The Legend of Zelda, Animal Crossing, and Splatoon.\r\n'),
(2, 'Riot Games', 'Riot Games', 'Valorant is a 5v5 character-based tactical FPS where precise gunplay meets unique agent abilities. Fight and win together through tactical teamplay.\r\n'),
(3, 'Mojang Studios', 'Sony Interactive Entertainment', 'Prepare for an adventure of limitless possibilities as you build, mine, battle mobs, and explore the ever-changing Minecraft landscape.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `item_code` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`item_code`, `title`, `price`) VALUES
(1, 'Mario Kart', '24.99'),
(2, 'Valorant', '4.99'),
(3, 'Minecraft', '19.99'),
(4, 'Mario Kart DLC - New Karts', '2.99');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `item_code` int(11) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id`, `item_code`, `discount`, `start_date`, `end_date`) VALUES
(1, 4, '0.99', '2022-03-01', '2022-03-08');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `product_code` int(11) NOT NULL,
  `review` text NOT NULL,
  `username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`product_code`, `review`, `username`) VALUES
(1, 'Lovin the game', 'Bunnystar'),
(1, 'Great game to play with the whole family', 'xpob');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `item_code` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`item_code`, `customer_id`, `payment_method`, `amount`, `date`) VALUES
(1, 1, 'Credit Card', '24.99', '2021-11-01'),
(1, 4, 'Credit Card', '24.99', '2021-11-11'),
(3, 3, 'Credit Card', '24.99', '2021-06-13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bundle`
--
ALTER TABLE `bundle`
  ADD KEY `prod_code1` (`prod_code1`),
  ADD KEY `prod_code2` (`prod_code2`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `dlc`
--
ALTER TABLE `dlc`
  ADD PRIMARY KEY (`product_code`,`dlc_name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`item_code`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`item_code`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_code` (`item_code`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD KEY `product_code` (`product_code`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD KEY `item_code` (`item_code`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `item_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bundle`
--
ALTER TABLE `bundle`
  ADD CONSTRAINT `bundle_ibfk_1` FOREIGN KEY (`prod_code1`) REFERENCES `product` (`item_code`),
  ADD CONSTRAINT `bundle_ibfk_2` FOREIGN KEY (`prod_code2`) REFERENCES `product` (`item_code`);

--
-- Constraints for table `dlc`
--
ALTER TABLE `dlc`
  ADD CONSTRAINT `dlc_ibfk_1` FOREIGN KEY (`product_code`) REFERENCES `product` (`item_code`);

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`item_code`) REFERENCES `product` (`item_code`);

--
-- Constraints for table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`item_code`) REFERENCES `product` (`item_code`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product_code`) REFERENCES `game` (`item_code`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`username`) REFERENCES `customer` (`username`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`item_code`) REFERENCES `product` (`item_code`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
