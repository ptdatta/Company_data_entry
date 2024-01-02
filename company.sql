-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 24, 2023 at 02:16 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dname` varchar(255) DEFAULT NULL,
  `Dnumber` int(11) NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dname`, `Dnumber`, `Mgr_ssn`, `Mgr_start_date`) VALUES
('R&D', 1, '666778888', '2010-01-20'),
('Finance', 2, '222334444', '1988-11-20'),
('Management', 3, '555667777', '1999-12-05'),
('Research', 4, '999001111', '2000-03-08'),
('Coding', 5, '333445555', '2001-03-02');

-- --------------------------------------------------------

--
-- Stand-in structure for view `departmentmanagerinformation`
-- (See below for the actual view)
--
CREATE TABLE `departmentmanagerinformation` (
`Department_Name` varchar(255)
,`Manager_Name` varchar(511)
,`Manager_Salary` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(255) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`Essn`, `Dependent_name`, `Sex`, `Bdate`, `Relationship`) VALUES
('222334444', 'Pushpal Mukherjee', 'M', '2011-02-12', 'Son'),
('333445555', 'Tunir Sarkar', 'M', '2018-10-02', 'Son'),
('888665555', 'Ankita Das', 'F', '2017-07-01', 'Daughter');

-- --------------------------------------------------------

--
-- Table structure for table `dept_locations`
--

CREATE TABLE `dept_locations` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dept_locations`
--

INSERT INTO `dept_locations` (`Dnumber`, `Dlocation`) VALUES
(1, 'India'),
(2, 'England'),
(3, 'USA'),
(4, 'China'),
(5, 'Russia'),
(6, 'Denmark');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Essn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Fname`, `Lname`, `Essn`, `Bdate`, `Address`, `Sex`, `Salary`, `Mgr_ssn`, `Dno`) VALUES
('Arkadipta', 'Paul', '222334444', '1991-08-25', 'Bengaluru', 'M', 55000.00, '888665555', 1),
('Gaurav', 'Ginodia', '333445555', '1988-03-10', 'New York', 'M', 80000.00, '222334444', 2),
('Parthib', 'Datta', '333445558', '2002-10-26', 'Baruipur Shankaripara,Karkoon Bati', 'M', 30000.00, '333445555', 2),
('Gourav', 'Kundu', '555667777', '1991-07-30', 'St Petersberg', 'M', 75000.00, '333445555', 2),
('Rakhi', 'Mitra', '666778888', '1993-04-05', 'Brooklyn', 'F', 35000.00, '888665555', 3),
('Varun', 'Singh', '777889999', '1990-12-15', 'Bronx', 'M', 20000.00, '666778888', 1),
('Sreeja', 'Das', '888665555', '1995-11-18', 'Kolkata', 'F', 70000.00, '555667777', 1),
('Rani', 'Basu', '888990000', '1994-09-22', 'Hyderabad', 'F', 65000.00, '888665555', 1),
('Aritra', 'Khanra', '999001111', '1992-06-11', 'Delhi', 'M', 32000.00, '222334444', 1),
('Pritwish', 'Dutta', '999111022', '1992-06-11', 'Hyderabad', 'M', 45000.00, '777889999', 4),
('Ankan', 'Mitra', '999111777', '1992-06-11', 'Hyderabad', 'M', 45000.00, '777889999', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `Pname` varchar(255) DEFAULT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(255) DEFAULT NULL,
  `Dnumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`Pname`, `Pnumber`, `Plocation`, `Dnumber`) VALUES
('P_01', 1, 'India', 2),
('P_02', 2, 'USA', 2),
('P_03', 3, 'China', 1),
('P_04', 4, 'England', 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `projectinformation`
-- (See below for the actual view)
--
CREATE TABLE `projectinformation` (
`Project_Name` varchar(255)
,`Controlling_Dept_Name` varchar(255)
,`Employee_count` bigint(21)
,`Total_Hours` decimal(27,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `projectwithmultipleemployees`
-- (See below for the actual view)
--
CREATE TABLE `projectwithmultipleemployees` (
`Project_Name` varchar(255)
,`Controlling_Dept_Name` varchar(255)
,`Num_Employees` bigint(21)
,`Total_Hours_Per_Week` decimal(27,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `researchemployeeinformation`
-- (See below for the actual view)
--
CREATE TABLE `researchemployeeinformation` (
`Employee_Name` varchar(511)
,`Supervisor_Name` varchar(511)
,`Employee_Salary` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pnumber` int(11) NOT NULL,
  `Hours` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`Essn`, `Pnumber`, `Hours`) VALUES
('555667777', 1, 80.00),
('666778888', 3, 45.00),
('777889999', 2, 50.00),
('999001111', 1, 39.00),
('999001111', 4, 50.00);

-- --------------------------------------------------------

--
-- Structure for view `departmentmanagerinformation`
--
DROP TABLE IF EXISTS `departmentmanagerinformation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `departmentmanagerinformation`  AS SELECT `department`.`Dname` AS `Department_Name`, concat(`employee`.`Fname`,' ',`employee`.`Lname`) AS `Manager_Name`, `employee`.`Salary` AS `Manager_Salary` FROM (`department` join `employee` on(`department`.`Mgr_ssn` = `employee`.`Essn`)) ;

-- --------------------------------------------------------

--
-- Structure for view `projectinformation`
--
DROP TABLE IF EXISTS `projectinformation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `projectinformation`  AS SELECT `p`.`Pname` AS `Project_Name`, `d`.`Dname` AS `Controlling_Dept_Name`, count(`w`.`Essn`) AS `Employee_count`, sum(`w`.`Hours`) AS `Total_Hours` FROM ((`project` `p` join `department` `d` on(`p`.`Dnumber` = `d`.`Dnumber`)) left join `works_on` `w` on(`p`.`Pnumber` = `w`.`Pnumber`)) GROUP BY `p`.`Pname`, `d`.`Dname` ;

-- --------------------------------------------------------

--
-- Structure for view `projectwithmultipleemployees`
--
DROP TABLE IF EXISTS `projectwithmultipleemployees`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `projectwithmultipleemployees`  AS SELECT `p`.`Pname` AS `Project_Name`, `d`.`Dname` AS `Controlling_Dept_Name`, count(`w`.`Essn`) AS `Num_Employees`, sum(`w`.`Hours`) AS `Total_Hours_Per_Week` FROM ((`project` `p` join `department` `d` on(`p`.`Dnumber` = `d`.`Dnumber`)) join `works_on` `w` on(`p`.`Pnumber` = `w`.`Pnumber`)) GROUP BY `p`.`Pname`, `d`.`Dname` HAVING count(`w`.`Essn`) > 1 ;

-- --------------------------------------------------------

--
-- Structure for view `researchemployeeinformation`
--
DROP TABLE IF EXISTS `researchemployeeinformation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `researchemployeeinformation`  AS SELECT concat(`e`.`Fname`,' ',`e`.`Lname`) AS `Employee_Name`, concat(`s`.`Fname`,' ',`s`.`Lname`) AS `Supervisor_Name`, `e`.`Salary` AS `Employee_Salary` FROM (`employee` `e` join `employee` `s` on(`e`.`Mgr_ssn` = `s`.`Essn`)) WHERE `e`.`Dno` = (select `department`.`Dnumber` from `department` where `department`.`Dname` = 'Research') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dnumber`),
  ADD KEY `Mgr_ssn` (`Mgr_ssn`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`Essn`,`Dependent_name`);

--
-- Indexes for table `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD PRIMARY KEY (`Dnumber`,`Dlocation`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Essn`),
  ADD KEY `INDEX` (`Mgr_ssn`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Pnumber`),
  ADD KEY `Dnumber` (`Dnumber`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`Essn`,`Pnumber`),
  ADD KEY `Pnumber` (`Pnumber`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Essn`);

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Essn`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Essn`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Essn`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`Pnumber`) REFERENCES `project` (`Pnumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
