-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 01, 2017 at 05:58 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FinalProject`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Sr` int(4) NOT NULL,
  `QuesName` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Ans1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Ans2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Ans3` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Ans4` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Correct` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(2) NOT NULL,
  `level` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`Sr`, `QuesName`, `Ans1`, `Ans2`, `Ans3`, `Ans4`, `Correct`, `type`, `level`) VALUES
(1, 'All of the following are examples of input devices except which one of the following ?', 'Printer', 'Keyboard', 'Scanner', 'Mouse', 'Printer', 2, 1),
(2, 'Windows Word is an example of ?', 'System Software', 'Platform Software', 'Application Software', 'Opeating System Software', 'Application Software', 2, 1),
(3, 'Which of the following is example of storage devices ?', 'Monitor', 'Hard Disk', 'Keyboard', 'Mouse', 'Hard Disk', 2, 1),
(4, 'Which of the following is the expansion of ALU ?', 'All loves Ups', 'Arithmetic Legal Unit', 'Additional Language Uninterpreted', 'Arithmetic logic unit', 'Arithmetic logic unit', 2, 1),
(5, 'Who is the father of computer ?', 'Writes brother', 'Charles Babbage', 'Denise Ritchie', 'Steve Jobs', 'Charles Babbage', 2, 1),
(6, 'What is the full form of GUI ?', 'Geometrical Ultra Inputs', 'Graph under influence', 'Graphical User Interaction', 'Graphical User Interface', 'Graphical User Interface', 2, 1),
(7, 'DOS is an Operating system originally designed to be operated by using which of the following device', 'Mouse', 'Keyboard', 'Joystick', 'Xbox', 'Keyboard', 2, 1),
(8, 'What do the \'char *scr;\' declaration signify?', 'scr is a pointer to pointer variable', 'scr is a function pointer', 'scr is a pointer to char', 'scr is a member of function pointer', 'scr is a pointer to char', 2, 1),
(9, 'Input/output function prototypes and macros are defined in which header file?', 'conio.h', 'stdlib.h', 'stdio.h', 'dos.h', 'stdlib.h', 2, 1),
(10, 'What do the declaration \'char *arr[10];\' signify?', 'arr is a array of 10 character pointers.', 'arr is a array of function pointer', 'arr is a array of characters', 'arr is a pointer to array of characters', 'arr is a array of 10 character pointers.', 2, 1),
(11, 'What does int *f() signify?\r\n', 'f is a pointer variable of function type', 'f is a function returning pointer to an int', 'f is a function pointer', 'f is a simple declaration of pointer variable', 'f is a function returning pointer to an int', 2, 1),
(12, 'What does HTML stands for?', 'Hyper Text Markup Language', 'Hyperlinks and Text Markup Language', 'Home Tool Markup Language', 'Home Telephone Mark Language', 'Hyper Text Markup Language', 2, 1),
(13, 'Inside which HTML element do we put the JavaScript?', '< script >', '< scripting >', '< javascript >', '< js >', '< script >', 2, 1),
(14, 'How do you write \'Hello World\' in an alert box?', 'alertBox(\'Hello World\');', 'msg(\'Hello World\');', 'alert(\'Hello World\');', 'msgBox(\'Hello World\');', 'alert(\'Hello World\');', 2, 1),
(15, 'How do you call a function named \'myFunction\'?', 'call myFunction()', 'call function myFunction()', 'myFunction()', 'function call myFunction()', 'myFunction()', 2, 1),
(16, 'What does PHP stand for?', 'Private Home Page', 'Private Hypertext Preprocessor', 'Personal Hypertext Processor', 'Personal Home Page', 'Personal Home Page', 2, 1),
(17, 'What does SQL stands for?', 'Strong Question Language', 'Structured Question Language', 'Structured Query Language', 'Simple Query Language', 'Structured Query Language', 2, 1),
(18, 'What does XML stands for?', 'eXtensible Markup Language', 'eXtra Modern Link', 'X-Markup Language', 'Example Markup Language', 'eXtensible Markup Language', 2, 1),
(19, 'What does CSS stand for?', 'Creative Style Sheets', 'Computer Style Sheets', 'Cascading Style Sheets', 'Colorful Style Sheets', 'Cascading Style Sheets', 2, 1),
(20, 'How many bits are equal to 1 Byte', '32', '1024', '8', 'One million', '8', 2, 1),
(21, 'What are the types of linkages?', 'Internal and External', 'External, Internal and None', 'External and None', 'Internal', 'External, Internal and None', 2, 2),
(22, 'Which of the following range is a valid long double (Turbo C in 16 bit DOS OS) ?', '3.4Epow(-4932) to 1.1Epow(+4932)', '3.4Epow(-4932) to 3.4Epow(+4932)', '1.1pow(-4932) to 1.1pow(+4932)', '1.7pow(-4932) to 1.7pow(+4932)', '1.1pow(-4932) to 1.1pow(+4932)', 2, 2),
(23, 'The maximum combined length of the command-line arguments including the spaces between adjacent argu', '128 characters', '256 characters', '67 characters', 'It may vary from one operating system to another', 'It may vary from one operating system to another', 2, 2),
(24, 'Which of the following is the correct usage of conditional operators used in C?', 'a>b ? c=30 : c=40;', 'a>b ? c=30;', 'max = a>b ? a>c?a:c:b>c?b:c', 'return (a>b)?(a:b)', 'max = a>b ? a>c?a:c:b>c?b:c', 2, 2),
(25, 'What function should be used to free the memory allocated by calloc() ?', 'dealloc();', 'malloc(variable_name, 0)', 'free();', 'memalloc(variable_name, 0)', 'free();', 2, 2),
(26, 'What do the declaration \'void *cmp();\' signify?', 'cmp is a pointer to an void type', 'cmp is a void type pointer variable', 'cmp is a function that return a void pointer', 'cmp function returns nothing', 'cmp is a function that return a void pointer', 2, 2),
(27, 'Which of the following cannot be checked in a switch-case statement?', 'Character', 'Integer', 'Float', 'enum', 'Float', 2, 2),
(28, 'The library function used to reverse a string is', 'strstr()', 'strrev()', 'revstr()', 'strreverse()', 'strrev()', 2, 2),
(29, 'Who is making the Web standards?', 'Google', 'IBM', 'World Wide Web Consortium (W3C)', 'Yahoo', 'World Wide Web Consortium (W3C)', 2, 2),
(30, 'Which superglobal variable holds information about headers, paths, and script locations?', '$_SERVER', '$_GET', '$_GLOBALS', '$_SESSION', '$_SERVER', 2, 2),
(31, 'What does DTD stand for?', 'Do The Dance', 'Document Type Definition', 'Direct Type Definition', 'Dynamic Type Definition', 'Document Type Definition', 2, 2),
(32, 'Which of the following function sets first n characters of a string to a given character?', 'strinit()', 'strnset()', 'strset()', 'strcset()', 'strnset()', 2, 2),
(33, 'How many bytes are occupied by near, far and huge pointers (DOS)?', 'near=2 far=4 huge=4', 'near=4 far=8 huge=8', 'near=2 far=4 huge=8', 'near=4 far=4 huge=8', 'near=2 far=4 huge=4', 2, 2),
(34, 'Which header file should be included to use functions like malloc() and calloc()?', 'memory.h', 'stdlib.h', 'string.h', 'dos.h', 'stdlib.h', 2, 2),
(35, 'What is the purpose of fflush() function?', 'flushes all streams and specified streams', 'flushes only specified stream', 'flushes input/output buffer', 'flushes file buffer', 'flushes all streams and specified streams', 2, 2),
(36, 'You need to store elements in a collection that guarantees that no duplicates are stored. Which one ', 'Java.util.Map', 'Java.util.List', 'Java.util.Collection', 'None of the above', 'Java.util.Map', 2, 2),
(37, 'Which collection class allows you to access its elements by associating a key with an element\'s value?', 'java.util.SortedMap', 'java.util.TreeMap', 'java.util.TreeSet', 'java.util.Hashtable', 'java.util.Hashtable', 2, 2),
(38, 'What is the numerical range of char?', '0 to 32767', '0 to 65535', '-256 to 255', '-32768 to 32767', '0 to 65535', 2, 2),
(39, 'Which method must be defined by a class implementing the java.lang.Runnable interface?', 'void run()', 'public void run()', 'public void start()', 'void run(int priority)', 'public void run()', 2, 2),
(40, 'Which interface does java.util.Hashtable implement?', 'Java.util.Map', 'Java.util.List', 'Java.util.HashTable', 'Java.util.Collection', 'Java.util.Map', 2, 2),
(41, 'Every set is a ________ of itself?', 'Improper Subset', 'Proper Subset', 'Both', 'None of the above', 'Improper Subset', 1, 1),
(42, 'Conversion of 0.45 in % is?', '4.5%', '45%', '0.45%', 'None of the above', '45%', 1, 1),
(43, 'A manufacturer wants to earn 25% profit on a shirt that cost 100 dollars , he should charge?', '25 dollars ($25)', '150 dollars ($150)', '125 dollars ($125)', '100 dollars ($100)', '125 dollars ($125)', 1, 1),
(44, '1% of 1000 metre is ?', '1 metre', '10 metre', '100 metre', '1000 metre', '10 metre', 1, 1),
(45, 'Conversion of 0.33 in % is?', '33 percent (33 %)', '333 percent (333 %)', '33.33 percent (33.33 %)', '3.3 percent (3.3 %)', '33 percent (33 %)', 1, 1),
(46, 'What smallest number should be added to 8444 such that the sum is completely divisible by 7?', '5', '4', '6', '3', '5', 1, 1),
(47, 'If a whole number n is divided by 4, we will get 3 as remainder. What will be the remainder if 2n is', '6', '4', '2', '1', '2', 1, 1),
(48, 'Which one of the following is not a prime number ?', '61', '31', '91', '71', '91', 1, 1),
(49, 'Perimeter of shapes is 20, which will have largest area?', 'Square', 'Rectangle', 'Circle', 'All will be same', 'Circle', 1, 1),
(50, 'Which month has the highest percentage of births?', 'January', 'October', 'August', 'July', 'August', 1, 1),
(51, 'Which animal can see both ultraviolet and infrared light?', 'Giraffe', 'Monkeys', 'Starfish', 'Goldfish', 'Goldfish', 1, 1),
(52, 'A person who is pretending to be somebody he is not is called as?', 'Imposter', 'Magician', 'Liar', 'Rogue', 'Imposter', 1, 1),
(53, 'The study of ancient societies is called as?', 'History', 'Archaeology', 'Ethnology', 'Anthropology', 'Archaeology', 1, 1),
(54, 'Teetotaller means what?', 'One who abstains from theft', 'One who abstains from meat', 'One who abstains from malice', 'One who abstains from taking wine', 'One who abstains from taking wine', 1, 1),
(55, 'A person of good understanding knowledge and reasoning power is called as?', 'Literate', 'Snob', 'Intellectual', 'Expert', 'Intellectual', 1, 1),
(56, 'A person who knows many foreign languages is called as?', 'Grammarian', 'Linguist', 'Bilingual', 'Polyglot', 'Linguist', 1, 1),
(57, 'State in which the few govern the many is called as?', 'Plutocracy', 'Monarchy', 'Oligarchy', 'Autocracy', 'Oligarchy', 1, 1),
(58, 'Which force tends to move away from the centre or axis?', 'Centripetal', 'Axiomatic', 'Awry', 'Centrifugal', 'Centrifugal', 1, 1),
(59, 'A C B in mathematics is read as?', 'A is a proper subset of B', 'A is less than B', 'A is a subset of B', 'B is a subset of A', 'A is a proper subset of B', 1, 1),
(60, 'Pick out the scalar quantity.', 'force', 'pressure', 'velocity', 'acceleration', 'pressure', 1, 1),
(61, 'Who discoved one of the first antibiotics: penicillin ?', 'Alexander Shepard', 'Alexander Gosling', 'Alexander Fleming', 'Alexander Wang', 'Alexander Fleming', 1, 2),
(62, 'What does the abbreviation SMS mean?', 'Simple Message Service', 'Short Message Service', 'Send Message Service', 'Simple Message Store', 'Short Message Service', 1, 2),
(63, 'What is the singular of Scampi ?', 'Scampa', 'Scamp', 'Scampo', 'Scampe', 'Scampo', 1, 2),
(64, 'What does the abbreviation GPS mean?', 'Global Positioning Service', 'Google Positioning System', 'Google Positioning Service', 'Global Positioning System', 'Global Positioning System', 1, 2),
(65, 'The great Victoria Desert is located in?', 'Canada', 'West Africa', 'Australia', 'North America', 'Australia', 1, 2),
(66, 'The intersecting lines drawn on maps and globes are', 'latitudes', 'longitudes', 'geographic grids', 'None of the above', 'geographic grids', 1, 2),
(67, '(It is an uphill task but you will have to do it) means?', 'It is very difficult task but you have to do it', 'The work is above the hill and you will have to do it', 'It is a very easy task but you must do it', 'This work is not reserved for you but you will have to do it', 'It is very difficult task but you have to do it', 1, 2),
(68, 'According to Oxford Dictionary the longest word in English consists of how many letters?', '31 letters', '29 letters', '45 letters', '19 letters', '45 letters', 1, 2),
(69, 'Who was the first man to fly around the earth with a spaceship?', 'Letty', 'Gagarin', 'Robert', 'Alan', 'Gagarin', 1, 2),
(70, 'Which unit indicates the light intensity?', 'Balmer', 'Meu', 'Weber', 'Candela', 'Candela', 1, 2),
(71, 'Sobha (father) was 38 years of age when she was born while her mother was 36 years old when her brot', '5 years', '6 years', '3 years', '4 years', '6 years', 1, 2),
(72, 'A person who is not sure of the existence of god is called as?', 'Cynic', 'Atheist', 'Agnostic', 'Theist', 'Agnostic', 1, 2),
(73, 'A child who is born after death of his father is called as?', 'Posthumous', 'Orphan', 'Bastard', 'Progenitor', 'Posthumous', 1, 2),
(74, 'Medical study of skin and its diseases', 'Orthopaedics', 'Endocrinology', 'Gynealogy', 'Dermatology', 'Dermatology', 1, 2),
(75, 'The groundwater can become confined between two impermeable layers. This type of enclosed water is called?', 'artesian', 'artesian well', 'unconfined groundwater', 'confined groundwater', 'artesian', 1, 2),
(76, 'The least explosive type of volcano is called?', 'Basalt plateau', 'Cinder cone', 'Shield volcanoes', 'Composite volcanoes', 'Basalt plateau', 1, 2),
(77, 'The largest fish exporting region in the world is...?', 'the north-east atlantic region', 'the north-east pacific region', 'the north-west pacific region', 'the south-east asian region', 'the north-east atlantic region', 1, 2),
(78, 'The length of the day is determined in', 'solar terms', 'length of the hours', 'astronomical units', 'None of the above', 'astronomical units', 1, 2),
(79, 'The hot, dry wind on the east or leeward side of the Rocky mountains (North America) is called?', 'the Harmattan', 'the Loo', 'the Sirocco', 'the Chinook', 'the Chinook', 1, 2),
(80, 'Who invented the BALLPOINT PEN?', 'Write Brothers', 'Waterman Brothers', 'Biro Brothers', 'Bicc Brothers', 'Biro Brothers', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_level`
--

CREATE TABLE `quiz_level` (
  `ID` int(2) NOT NULL,
  `level` char(8) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quiz_level`
--

INSERT INTO `quiz_level` (`ID`, `level`) VALUES
(1, 'Easy'),
(2, 'Hard');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_type`
--

CREATE TABLE `quiz_type` (
  `ID` int(2) NOT NULL,
  `type` char(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quiz_type`
--

INSERT INTO `quiz_type` (`ID`, `type`) VALUES
(1, 'GK'),
(2, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Firstname` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Lastname` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Contact` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Firstname`, `Lastname`, `Email`, `Password`, `Contact`, `Address`) VALUES
('Anuj', 'Verma', 'anujverrma@gmail.com', '876543', '9815199909', '43 Industrial Area, India'),
('Demi', 'Varma', 'babydaminiverma@gmail.com', '123123', '4337766677', '53 Winstanly Cres. Scarborough ON'),
('Deep', 'Kumiyar', 'deep24kumar24@gmail.com', '000000', '9999999999', '77vyuvuyvjh'),
('Kartik', 'Patel', 'kpatel1989@gmail.com', '456789', '7788699554', '44 Horseley Hill Drive, Scarborough'),
('Rekha', 'Verma', 'rekhaverma@gmail.com', '0000000', '7766544678', 'Rough River Drive, Toronto'),
('Tanish', 'Verma', 'tanishverma@gmail.com', '1111111', '6675544889', 'Markham and Mc Nicol, toronto'),
('Tarsem', 'Verma', 'tarsemverma@gmail.com', '9988776', '6675588554', 'Toronto East, Toronto');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `Date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ID` int(11) NOT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(2) NOT NULL,
  `level` int(2) NOT NULL,
  `score` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`Date`, `ID`, `email`, `type`, `level`, `score`) VALUES
('28th February 2017 10:30 PM', 386, 'babydaminiverma@gmail.com', 1, 1, '10'),
(' 28th February 2017 07:13 PM', 387, 'babydaminiverma@gmail.com', 1, 1, '2/10'),
(' 28th February 2017 09:26 PM', 388, 'deep24kumar24@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 10:02 PM', 389, 'deep24kumar24@gmail.com', 1, 1, ''),
(' 28th February 2017 10:05 PM', 390, 'deep24kumar24@gmail.com', 1, 1, ''),
(' 28th February 2017 10:15 PM', 391, 'babydaminiverma@gmail.com', 1, 1, '1/10'),
(' 28th February 2017 10:17 PM', 392, 'deep24kumar24@gmail.com', 2, 2, '0/10'),
(' 28th February 2017 10:19 PM', 393, 'deep24kumar24@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 10:21 PM', 394, 'deep24kumar24@gmail.com', 2, 1, '0/10'),
(' 28th February 2017 10:32 PM', 395, 'deep24kumar24@gmail.com', 1, 1, ''),
(' 28th February 2017 10:33 PM', 396, 'deep24kumar24@gmail.com', 1, 1, '6/10'),
(' 28th February 2017 10:37 PM', 397, 'deep24kumar24@gmail.com', 2, 1, '6/10'),
(' 28th February 2017 10:38 PM', 398, 'deep24kumar24@gmail.com', 1, 1, '6/10'),
(' 28th February 2017 10:45 PM', 399, 'babydaminiverma@gmail.com', 1, 1, '6/10'),
(' 28th February 2017 10:46 PM', 400, 'deep24kumar24@gmail.com', 1, 1, '7/10'),
(' 28th February 2017 10:47 PM', 401, 'deep24kumar24@gmail.com', 1, 1, '9/10'),
(' 28th February 2017 10:49 PM', 402, 'deep24kumar24@gmail.com', 1, 2, '1/10'),
(' 28th February 2017 10:50 PM', 403, 'deep24kumar24@gmail.com', 2, 1, '0/10'),
(' 28th February 2017 11:06 PM', 404, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:07 PM', 405, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:08 PM', 406, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:08 PM', 407, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:10 PM', 408, 'tanishverma@gmail.com', 2, 1, '0/10'),
(' 28th February 2017 11:14 PM', 409, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:16 PM', 410, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:20 PM', 411, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:20 PM', 412, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:24 PM', 413, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:24 PM', 414, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:26 PM', 415, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:26 PM', 416, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:32 PM', 417, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:33 PM', 418, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:33 PM', 419, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:34 PM', 420, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:35 PM', 421, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:35 PM', 422, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:50 PM', 423, 'tanishverma@gmail.com', 1, 1, '0/10'),
(' 28th February 2017 11:51 PM', 424, 'tanishverma@gmail.com', 1, 1, '0/10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`Sr`),
  ADD KEY `type` (`type`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `quiz_level`
--
ALTER TABLE `quiz_level`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quiz_type`
--
ALTER TABLE `quiz_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `email` (`email`),
  ADD KEY `type` (`type`),
  ADD KEY `level` (`level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Sr` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `quiz_level`
--
ALTER TABLE `quiz_level`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `quiz_type`
--
ALTER TABLE `quiz_type`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`type`) REFERENCES `quiz_type` (`ID`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`level`) REFERENCES `quiz_level` (`ID`);

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`Email`),
  ADD CONSTRAINT `user_details_ibfk_2` FOREIGN KEY (`type`) REFERENCES `quiz_level` (`ID`),
  ADD CONSTRAINT `user_details_ibfk_3` FOREIGN KEY (`type`) REFERENCES `quiz_type` (`ID`),
  ADD CONSTRAINT `user_details_ibfk_4` FOREIGN KEY (`type`) REFERENCES `quiz_type` (`ID`),
  ADD CONSTRAINT `user_details_ibfk_5` FOREIGN KEY (`level`) REFERENCES `quiz_level` (`ID`),
  ADD CONSTRAINT `user_details_ibfk_6` FOREIGN KEY (`level`) REFERENCES `quiz_level` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
