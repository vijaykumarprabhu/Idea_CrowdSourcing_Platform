-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 31, 2015 at 10:56 AM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mygov`
--

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idea` varchar(1000) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT '0',
  `user` varchar(100) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE IF NOT EXISTS `domains` (
  `domain` varchar(100) NOT NULL,
  `incharge` varchar(100) NOT NULL,
  PRIMARY KEY (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE IF NOT EXISTS `replies` (
  `id` int(11) NOT NULL,
  `replyid` int(11) NOT NULL,
  `reply_content` varchar(500) NOT NULL,
  PRIMARY KEY (`id`,`replyid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `fullname` varchar(100) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL,
  `activation_key` varchar(200) NOT NULL,
  PRIMARY KEY (`emailid`),
  UNIQUE KEY `emailid` (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `votetype` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user`),
  KEY `votes` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `watchers`
--

CREATE TABLE IF NOT EXISTS `watchers` (
  `user` varchar(100) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`user`,`id`),
  KEY `watchers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`domain`) REFERENCES `domains` (`domain`);

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`id`) REFERENCES `content` (`id`),
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`emailid`);

--
-- Constraints for table `watchers`
--
ALTER TABLE `watchers`
  ADD CONSTRAINT `watchers_ibfk_2` FOREIGN KEY (`id`) REFERENCES `content` (`id`),
  ADD CONSTRAINT `watchers_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`emailid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
