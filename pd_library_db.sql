-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2024 at 01:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pd_library_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_records`
--

CREATE TABLE `account_records` (
  `Account_ID` int(11) NOT NULL,
  `Role` enum('staff','student') NOT NULL DEFAULT 'student',
  `First_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Student_Number` int(11) NOT NULL,
  `Contact_Number` varchar(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_records`
--

INSERT INTO `account_records` (`Account_ID`, `Role`, `First_Name`, `Middle_Name`, `Last_Name`, `Email`, `Student_Number`, `Contact_Number`, `Username`, `Password`) VALUES
(1, 'student', 'Jenel', 'Formentera', 'Esteron', 'mjesteron@tip.edu.ph', 2210292, '09063749610', 'mjesteron', 'password123');

-- --------------------------------------------------------

--
-- Table structure for table `borrow_records`
--

CREATE TABLE `borrow_records` (
  `Borrow_ID` int(11) NOT NULL,
  `PD_Records_PD_ID` int(11) NOT NULL,
  `Acccount_Records_Account_ID` int(11) NOT NULL,
  `Acccount_Records_First_Name` varchar(50) NOT NULL,
  `Acccount_Records_Middle_Name` varchar(50) NOT NULL,
  `Acccount_Records_Last_Name` varchar(50) NOT NULL,
  `Acccount_Records_Email` varchar(50) NOT NULL,
  `Acccount_Records_Student_Number` int(11) NOT NULL,
  `PD_Records_PD_Title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pd_records`
--

CREATE TABLE `pd_records` (
  `PD_ID` int(11) NOT NULL,
  `PD_Title` varchar(100) NOT NULL,
  `PD_Author` varchar(100) NOT NULL,
  `Date_Published` varchar(20) NOT NULL,
  `PD_Abstract` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_records`
--
ALTER TABLE `account_records`
  ADD PRIMARY KEY (`Account_ID`,`Email`,`Student_Number`),
  ADD UNIQUE KEY `First_Name` (`First_Name`,`Middle_Name`,`Last_Name`),
  ADD KEY `Middle_Name` (`Middle_Name`),
  ADD KEY `Last_Name` (`Last_Name`),
  ADD KEY `Email` (`Email`),
  ADD KEY `Student_Number` (`Student_Number`);

--
-- Indexes for table `borrow_records`
--
ALTER TABLE `borrow_records`
  ADD PRIMARY KEY (`Borrow_ID`),
  ADD UNIQUE KEY `Acccount_Records_Middle_Name` (`Acccount_Records_Middle_Name`,`Acccount_Records_Last_Name`),
  ADD KEY `PD_ID` (`PD_Records_PD_ID`),
  ADD KEY `Account_ID` (`Acccount_Records_Account_ID`),
  ADD KEY `First_Name` (`Acccount_Records_First_Name`),
  ADD KEY `Acccount_Records_Middle_Name_2` (`Acccount_Records_Middle_Name`),
  ADD KEY `Acccount_Records_Last_Name` (`Acccount_Records_Last_Name`),
  ADD KEY `Email` (`Acccount_Records_Email`),
  ADD KEY `Student_Number` (`Acccount_Records_Student_Number`),
  ADD KEY `PD_Title` (`PD_Records_PD_Title`);

--
-- Indexes for table `pd_records`
--
ALTER TABLE `pd_records`
  ADD PRIMARY KEY (`PD_ID`,`PD_Title`,`PD_Author`),
  ADD KEY `PD_Title` (`PD_Title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_records`
--
ALTER TABLE `account_records`
  MODIFY `Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `borrow_records`
--
ALTER TABLE `borrow_records`
  MODIFY `Borrow_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pd_records`
--
ALTER TABLE `pd_records`
  MODIFY `PD_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow_records`
--
ALTER TABLE `borrow_records`
  ADD CONSTRAINT `Account_ID` FOREIGN KEY (`Acccount_Records_Account_ID`) REFERENCES `account_records` (`Account_ID`),
  ADD CONSTRAINT `Email` FOREIGN KEY (`Acccount_Records_Email`) REFERENCES `account_records` (`Email`),
  ADD CONSTRAINT `First_Name` FOREIGN KEY (`Acccount_Records_First_Name`) REFERENCES `account_records` (`First_Name`),
  ADD CONSTRAINT `Last_Name` FOREIGN KEY (`Acccount_Records_Last_Name`) REFERENCES `account_records` (`Last_Name`),
  ADD CONSTRAINT `Middle_Name` FOREIGN KEY (`Acccount_Records_Middle_Name`) REFERENCES `account_records` (`Middle_Name`),
  ADD CONSTRAINT `PD_ID` FOREIGN KEY (`PD_Records_PD_ID`) REFERENCES `pd_records` (`PD_ID`),
  ADD CONSTRAINT `PD_Title` FOREIGN KEY (`PD_Records_PD_Title`) REFERENCES `pd_records` (`PD_Title`),
  ADD CONSTRAINT `Student_Number` FOREIGN KEY (`Acccount_Records_Student_Number`) REFERENCES `account_records` (`Student_Number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
