-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 22, 2020 at 06:17 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flask_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT NULL,
  `email` varchar(111) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'Sachin Yadav', '8077705762', 'this is msg', '2020-11-05 19:40:55', 'samtanisen@gmail.com'),
(2, 'Sachin Yadav', '8077705762', 'params', '2020-11-07 23:57:36', 'samtanisen@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(450) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(111) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'extraAAAAA', 'fnsdfn,dmfs,mfnsmfn,smdfn,smnf,s', '13-year-old-boys', 'fmsdf,m,sdmf.,smf.smf,dsm.,mf,s.f', '', '2020-12-22 23:08:59'),
(2, 'Purushottam Laxman Deshpande bio things', 'write by Google to Purushottam Laxman Deshpande', 'second-post', 'The family used to stay at Kenway House, Procter Road in the Grant Road locality in Mumbai. His family then moved to ', 'about-bg.jpg', '2020-11-08 16:12:42'),
(3, 'This is a Films Division documentary in which Pu. La. himself reveals his life journey. It was filmed on occasion of his 60th birthday.\r\n\r\n', 'There are two other documentaries made on Pu La. One by Mukta Rajadhyakshya and Sudhir Moghe called Ya Sama Haa on his 75th birthday, and Pu La Vruttant, made by Dr. Jabbar Patel, in which Pu La himself talked about his life.\r\n\r\n', 'third-post', '\'Namune\', a new serial is arriving on television based on Dehpande\'s literature.In this serial actor Sanjay Mone will play Deshpande\'s role. It will be broadcast ed on \'Sony Sab\' channel on the television. Along with Sanjay Mone there will be various actors from  \r\n\r\nHindi and Marathi film industry.', 'about-bg.jpg', '2020-11-08 04:18:24'),
(4, 'He also worked for some years as a college professor in Rani Parvati Devi College Belgaum, Karnataka and Kirti College, Mumbai.', 'It was this specific period and stays in these countries that his later travelogue \"Apoorvai\" was to be based upon. His other travelogue include \"Poorvaranga\" and \"Jave Tyanchya Desha\"', 'forth-post', 'He also worked for some years as a college professor in Rani Parvati Devi College Belgaum, Karnataka and Kirti College, Mumbai. He also worked for newly founded Doordarshan, the state owned Indian TV. He was the first person to interview the then Prime Minister Jawaharlal Nehru on Indian television. He was seconded to the BBC for a year-long training. After which he spent some time in France and in West Germany. It was this specific period and stays in these countries that his later travelogue \"Apoorvai\" was to be based upon. His other travelogue include \"Poorvaranga\" and \"Jave Tyanchya Desha\"', 'about-bg.jpg', '2020-11-29 18:11:53'),
(5, 'La Deshpande\'s 101st birth anniversary commemorated with Google Doodle designed by artist Sameer Kulavoor', 'Purushottam Laxman Deshpande, or Pu La Deshpande, was born in Mumbai on 8 November 1919. His family had an illustrious literary legacy: Pu La\'s grandfather had translated Rabindranath Tagore\'s Gitanjali into Marathi.', 'new_post', 'The 101st birth anniversary of Purushottam Laxman Deshpande — better known as Pu La Deshpande — has been marked with a Google Doodle designed by the noted Mumbai-based artist Sameer Kulavoor.The doodle depicts the writer, playwright, musician, composer, actor, director, and philanthropist at his harmonium, raising his free hand to underscore a note.\"Being born and brought up in Mumbai/Maharashtra, one comes across Pu La Deshpande\'s name and works constantly in popular culture — music, writing, films, theatre, literature, and more. He was known to be a sharp observer of life, and one can see that in his literary work', 'home-bg.jpg', '2020-11-18 18:16:29'),
(6, 'The biography accompanying Pu La\'s Google Doodle traces his time from earning a Masters\' degree, to working as a college lecturer before switching to a career in music.', ' \"A master of the harmonium, he played as an accompanist for acclaimed vocal artists of the day and released his own hit recordings as well. But music was far from Deshpande’s only creative talent, and in the late 1940s, his writing premiered in Bombay magazine,\" the biography notes.', 'last_post', 'The biography accompanying Pu La\'s Google Doodle traces his time from earning a Masters\' degree, to working as a college lecturer before switching to a career in music. \"A master of the harmonium, he played as an accompanist for acclaimed vocal artists of the day and released his own hit recordings as well. But music was far from Deshpande’s only creative talent, and in the late 1940s, his writing premiered in Bombay magazine,\" the biography notes.Pu La\'s writing spanned various formats — from novels and essays to plays and one-man stage shows. He also acted in, and directed, several films. In 2018, the National Film Archive of India organised an exhibition of his Hindi and Marathi film posters in the run-up to the centenary of his birth. The exhibition also included the original, handwritten copy of the script for Pu La’s cult classic Gulacha Ganpati, provided to NFAI in 2015 by the family members of Rajguru, the film\'s producer.', 'home-bg.jpg', '2020-11-18 14:30:14');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
