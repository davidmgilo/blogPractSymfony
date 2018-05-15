-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 15, 2018 at 04:19 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'amor', 'bla bla blah'),
(2, 'mort', 'bla bla blah'),
(5, 'iugiug', 'bla bla blka'),
(6, 'rwf', 'fwfwffw');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `category_id` int(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `status` varchar(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `user_id`, `category_id`, `title`, `content`, `status`, `image`) VALUES
(1, 1, 1, 'Com enamorar a la teva parella', 'blwwwwwwwwwwwwwwwtet', 'public', '1525283674.jpeg'),
(2, 1, 2, 'Com superar una mort', 'bla bla mort bla bla', 'public', '1525285698.png'),
(4, 2, 2, 'usuari no admin', 'usuari no admin usuari no admin usuari no admin', 'public', '1525283123.png'),
(5, 2, 2, 'usuari no admin', 'usuari no admin usuari no admin usuari no admin', 'public', '1525283123.png'),
(6, 2, 2, 'usuari no admin', 'usuari no admin usuari no admin usuari no admin', 'public', '1525283123.png'),
(7, 1, 2, 'Com mort', 'bla bla mort bla bla mort mort mort', 'public', '1525285698.png');

-- --------------------------------------------------------

--
-- Table structure for table `entry_tag`
--

CREATE TABLE `entry_tag` (
  `id` int(255) NOT NULL,
  `entry_id` int(255) NOT NULL,
  `tag_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entry_tag`
--

INSERT INTO `entry_tag` (`id`, `entry_id`, `tag_id`) VALUES
(7, 4, 1),
(8, 4, 12),
(9, 4, 13),
(43, 2, 2),
(44, 2, 4),
(45, 7, 1),
(46, 7, 12),
(47, 7, 13),
(85, 1, 1),
(86, 1, 3),
(87, 1, 14),
(88, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `description`) VALUES
(1, 'tag 1', 'descripcio tag 1'),
(2, 'tag 2', 'descripcio tag 2'),
(3, 'tag3', 'descripcio tag 3'),
(4, 'tag 4', 'descripcio tag 4'),
(11, 'kjhbkjh', 'ggiuiugiug'),
(12, ' tag 2', ' tag 2'),
(13, ' tag3', ' tag3'),
(14, ' tag 4', ' tag 4'),
(15, 'tag 5', 'fdadada');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `surname`, `email`, `password`, `imagen`) VALUES
(1, 'ROLE_ADMIN', 'david', 'martinez', 'davidmgilo@gmail.com', '$2a$04$/Z4D88lJuHy6TLussmJ4jOFXhAbAST.b04Pn.piAmNK7UdJ2ohy9i', NULL),
(2, 'ROLE_USER', 'david', 'mart gilo', 'davidmgilo@hotmail.com', '$2a$04$BOuz5LC9tO5CYoYucZ4w/u1QOvJVkWRe.4/2aflp.HI6D2hP9rwp.', NULL),
(3, 'ROLE_USER', 'vesper', 'vesper', 'vesper@gmail.com', '$2y$04$AZenpu2jS0LJCrTePM0j2.cOCAECJj81Bj8/DsPSjaHrv4CWlXZ2O', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entries_users` (`user_id`),
  ADD KEY `fk_entries_categories` (`category_id`);

--
-- Indexes for table `entry_tag`
--
ALTER TABLE `entry_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entry_tag_entries` (`entry_id`),
  ADD KEY `fk_entry_tag_tags` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `entries`
--
ALTER TABLE `entries`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `entry_tag`
--
ALTER TABLE `entry_tag`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_entries_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `fk_entries_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `entry_tag`
--
ALTER TABLE `entry_tag`
  ADD CONSTRAINT `fk_entry_tag_entries` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`),
  ADD CONSTRAINT `fk_entry_tag_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;