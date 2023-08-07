-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 09, 2023 at 04:22 PM
-- Server version: 8.0.32
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventzaade`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cake`
--

CREATE TABLE `Cake` (
  `id` int NOT NULL,
  `name` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Cake`
--

INSERT INTO `Cake` (`id`, `name`) VALUES
(1, 'Victoria Sponge Cake'),
(2, 'Buttenburg Cake'),
(3, 'Fruit Cake'),
(4, 'Dundee Cake');

-- --------------------------------------------------------

--
-- Table structure for table `Contact`
--

CREATE TABLE `Contact` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Decorations`
--

CREATE TABLE `Decorations` (
  `id` int NOT NULL,
  `Name` varchar(512) NOT NULL,
  `description` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Decorations`
--

INSERT INTO `Decorations` (`id`, `Name`, `description`) VALUES
(1, 'Put up a festive flower wall', 'Flower walls are becoming increasingly popular simply because they are so Instagram-worthy! They are pretty to look at on their own and make a perfect photo backdrop. They are especially ideal for events you want to publicize on social media.'),
(2, 'Shout it with neon signs', 'Neon signs aren’t just for restaurants and shops anymore. You can brighten any event with a custom sign that fits the occasion or theme.'),
(3, 'Display a delicious donut wall', 'Dessert walls aren’t only decorative, they take the place of a dessert table, eliminating the need for servers to bring out desserts.');

-- --------------------------------------------------------

--
-- Table structure for table `Events`
--

CREATE TABLE `Events` (
  `id` int NOT NULL,
  `name` varchar(512) NOT NULL,
  `venuesid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Flowers`
--

CREATE TABLE `Flowers` (
  `id` int NOT NULL,
  `Name` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Flowers`
--

INSERT INTO `Flowers` (`id`, `Name`) VALUES
(1, 'SWEET PEAS'),
(2, 'PEONIES'),
(3, 'ROSES'),
(4, 'TULIPS');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int NOT NULL,
  `Location` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `Location`) VALUES
(1, 'London'),
(2, 'Manchester'),
(3, 'EPSOM'),
(4, 'London'),
(5, 'Manchester'),
(6, 'Chelsea'),
(7, 'Arsenal'),
(8, 'Feltham'),
(9, 'Brighton');

-- --------------------------------------------------------

--
-- Table structure for table `RSVP`
--

CREATE TABLE `RSVP` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `count` int NOT NULL,
  `message` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserProfile`
--

CREATE TABLE `UserProfile` (
  `id` int NOT NULL,
  `name` varchar(512) NOT NULL,
  `emailid` varchar(512) NOT NULL,
  `contact` varchar(512) NOT NULL,
  `address` varchar(512) NOT NULL,
  `cakeid` int DEFAULT NULL,
  `decorationsid` int DEFAULT NULL,
  `flowersid` int DEFAULT NULL,
  `venuesid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `UserProfile`
--

INSERT INTO `UserProfile` (`id`, `name`, `emailid`, `contact`, `address`, `cakeid`, `decorationsid`, `flowersid`, `venuesid`) VALUES
(1, 'Bob Doe', 'bobdoe@gmail.com', '447645342267', 'Oak Avenue,TN27 8BT', 3, 1, 2, 5),
(2, 'Jeff Beth', 'jeffbeth@gmail.com', '447867543456', 'Holly House,SW27 8TH', 2, 3, 4, 9),
(3, 'John Fabrikam', 'johnfabrikam@gmail.com', '447356443327', 'Maple Widgets Ltd,DF56 89T', 4, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `email`, `password`) VALUES
(1, 'maria@gmail.com', 'maria'),
(2, 'jibin@gmail.com', 'jibin'),
(3, 'rishi@gmail.com', 'rishi'),
(4, 'sabith@gmail.com', 'sabith'),
(5, 'viji@gmail.com', 'viji'),
(6, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `Venues`
--

CREATE TABLE `Venues` (
  `id` int NOT NULL,
  `Name` varchar(512) NOT NULL,
  `location_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Venues`
--

INSERT INTO `Venues` (`id`, `Name`, `location_id`) VALUES
(1, 'hotel', 1),
(2, 'hotel', 2),
(3, 'hotel', 3),
(4, 'Banquet Hall', 4),
(5, 'Banquet Hall', 5),
(6, 'Banquet Hall', 6),
(7, 'Park/Garden', 7),
(8, 'Park/Garden', 8),
(9, 'Park/Garden', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cake`
--
ALTER TABLE `Cake`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Contact`
--
ALTER TABLE `Contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Decorations`
--
ALTER TABLE `Decorations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Events`
--
ALTER TABLE `Events`
  ADD KEY `venuesid` (`venuesid`);

--
-- Indexes for table `Flowers`
--
ALTER TABLE `Flowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `RSVP`
--
ALTER TABLE `RSVP`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserProfile`
--
ALTER TABLE `UserProfile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CakeID` (`cakeid`),
  ADD KEY `DecorationsID` (`decorationsid`),
  ADD KEY `FlowersID` (`flowersid`),
  ADD KEY `VenuesID` (`venuesid`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Venues`
--
ALTER TABLE `Venues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Contact`
--
ALTER TABLE `Contact`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `RSVP`
--
ALTER TABLE `RSVP`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Events`
--
ALTER TABLE `Events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`venuesid`) REFERENCES `Venues` (`id`);

--
-- Constraints for table `UserProfile`
--
ALTER TABLE `UserProfile`
  ADD CONSTRAINT `userprofile_ibfk_1` FOREIGN KEY (`cakeid`) REFERENCES `Cake` (`id`),
  ADD CONSTRAINT `userprofile_ibfk_2` FOREIGN KEY (`decorationsid`) REFERENCES `Decorations` (`id`),
  ADD CONSTRAINT `userprofile_ibfk_3` FOREIGN KEY (`flowersid`) REFERENCES `Flowers` (`id`),
  ADD CONSTRAINT `userprofile_ibfk_4` FOREIGN KEY (`venuesid`) REFERENCES `Venues` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
