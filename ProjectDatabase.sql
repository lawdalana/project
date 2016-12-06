-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2016 at 05:12 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `apptype`
--

CREATE TABLE `apptype` (
  `AppTypeID` int(255) NOT NULL,
  `AppType` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `apptype`
--

INSERT INTO `apptype` (`AppTypeID`, `AppType`) VALUES
(0, ''),
(1, 'Direct Entrance'),
(2, 'Clearing House'),
(3, 'Active Recruitment'),
(4, 'Admission');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseID` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `CourseName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `CourseDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`, `CourseDescription`) VALUES
('LNG001', 'Basic English 001', 'Basic English for regular students'),
('LNG002', 'Basic English 002', 'Basic English for International Students'),
('MTH001', 'Basic Mathematics', 'Preparing mathematics course for Freshmen '),
('PHY001', 'Basic Physics', 'Preparing physics course for Freshmen ');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `DepartmentName` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `FacultyID` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `FacultyID`) VALUES
('CE', 'Civil Engineering', '1'),
('CHE', 'Chemical Engineering', '1'),
('CHM', 'Chemistry', '2'),
('CPE', 'Computer Engineering', '1'),
('CS', 'Computer Science', '2'),
('EE', 'Electrical Engineering', '1'),
('ENV', 'Environmental Engineering', '1'),
('ME', 'Mechanical Engineering', '1'),
('MIC', 'Microorganism', '2'),
('MTH', 'Mathemetic', '2'),
('PE', 'Production & Mechatronics Engineering', '1'),
('PHY', 'Physics', '2'),
('TME', 'Tool & Material Engineering', '1');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `EventID` int(11) NOT NULL,
  `EventName` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `LogTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventdetails`
--

CREATE TABLE `eventdetails` (
  `EventID` int(11) NOT NULL,
  `StudentID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AttributeValue` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `AttributeNo` int(11) NOT NULL,
  `AppID` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventheader`
--

CREATE TABLE `eventheader` (
  `EventID` int(11) NOT NULL,
  `HeaderTitle` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `HeaderNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examroom`
--

CREATE TABLE `examroom` (
  `AppID` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `SubjectID` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `SeatNo` int(255) NOT NULL,
  `Room` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ED_year` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `Semester` varchar(7) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FacultyID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Faculty` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FacultyID`, `Faculty`, `Phone`, `Address`) VALUES
('1', 'Engineering', '02-123-4567', '45/2 Witwawattana Bangkok 10140'),
('2', 'Science', '02-987-6541', '25/63 ABC Bangkok 10140');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `StaffTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`Username`, `Password`, `StaffTypeID`) VALUES
('titat', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `ProgramID` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `ProgramName` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `DepartmentID` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`ProgramID`, `ProgramName`, `DepartmentID`) VALUES
('CE01', 'Regular', 'CE'),
('CHE01', 'Regular ', 'CHE'),
('CHE02', 'International', 'CHE'),
('CHM01', 'Regular', 'CHM'),
('CPE01', 'Regular', 'CPE'),
('CPE02', 'International', 'CPE'),
('CS01', 'Regular', 'CS'),
('EE01', 'High Voltage', 'EE'),
('EE02', 'Regular', 'EE'),
('ENV01', 'Regular', 'ENV'),
('ME01', 'Regular', 'ME'),
('ME02', 'Energy, Economics, and Environment', 'ME'),
('MIC01', 'Regular', 'MIC'),
('MIC02', 'International', 'MIC'),
('MTH01', 'Regular', 'MTH'),
('MTH02', 'International', 'MTH'),
('PE01', 'Production', 'PE'),
('PE02', 'Mechatronics', 'PE'),
('PHY01', 'Regular', 'PHY'),
('TME01', 'Regular', 'TME');

-- --------------------------------------------------------

--
-- Table structure for table `stafftype`
--

CREATE TABLE `stafftype` (
  `StaffTypeID` int(3) NOT NULL,
  `StaffTypeName` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stafftype`
--

INSERT INTO `stafftype` (`StaffTypeID`, `StaffTypeName`) VALUES
(1, 'Registration Staff'),
(2, 'Faculty Staf');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `AppID` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `StudentID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fName` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `lName` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `AppTypeID` int(255) NOT NULL,
  `Degree` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `NationalID` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `ProgramID` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`AppID`, `StudentID`, `fName`, `lName`, `AppTypeID`, `Degree`, `NationalID`, `ProgramID`) VALUES
('1', '4545', 'Choky', 'ab', 1, 'Bachelor', '1120254202', 'CPE01'),
('2', '5455', 'Steve', 'ssd', 1, 'Bachelor', '1112544222', 'ENV01'),
('3', '55', 'Harmony', 'ccf', 1, 'Bachelor', '7755622222', 'ME01'),
('4', '656', 'Cordelia', 'sf', 2, 'Bachelor', '1320244222', 'PHY01'),
('5', '66', 'Alfred', 'vd', 2, 'Bachelor', '1354742202', 'EE02'),
('6', '777', 'Charles', 'ccf', 3, 'Bachelor', '1325542588', 'CS01');

-- --------------------------------------------------------

--
-- Table structure for table `student_course`
--

CREATE TABLE `student_course` (
  `AppID` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `CourseID` varchar(6) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `SubjectID` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `SubjectName` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ED_year` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `Semester` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(120) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apptype`
--
ALTER TABLE `apptype`
  ADD PRIMARY KEY (`AppTypeID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`,`FacultyID`),
  ADD KEY `FacultyID` (`FacultyID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`EventID`);

--
-- Indexes for table `eventdetails`
--
ALTER TABLE `eventdetails`
  ADD PRIMARY KEY (`EventID`,`AttributeNo`,`AppID`),
  ADD KEY `AppID` (`AppID`);

--
-- Indexes for table `eventheader`
--
ALTER TABLE `eventheader`
  ADD PRIMARY KEY (`EventID`,`HeaderNo`);

--
-- Indexes for table `examroom`
--
ALTER TABLE `examroom`
  ADD PRIMARY KEY (`AppID`,`SubjectID`,`ED_year`,`Semester`),
  ADD KEY `fk_subjectID` (`SubjectID`,`ED_year`,`Semester`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FacultyID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`ProgramID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `stafftype`
--
ALTER TABLE `stafftype`
  ADD PRIMARY KEY (`StaffTypeID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`AppID`),
  ADD KEY `ProgramID` (`ProgramID`),
  ADD KEY `AppTypeID` (`AppTypeID`);

--
-- Indexes for table `student_course`
--
ALTER TABLE `student_course`
  ADD PRIMARY KEY (`AppID`,`CourseID`),
  ADD KEY `fk_course_id` (`CourseID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`SubjectID`,`ED_year`,`Semester`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `stafftype`
--
ALTER TABLE `stafftype`
  MODIFY `StaffTypeID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`);

--
-- Constraints for table `eventdetails`
--
ALTER TABLE `eventdetails`
  ADD CONSTRAINT `eventdetails_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`),
  ADD CONSTRAINT `eventdetails_ibfk_2` FOREIGN KEY (`AppID`) REFERENCES `student` (`AppID`);

--
-- Constraints for table `eventheader`
--
ALTER TABLE `eventheader`
  ADD CONSTRAINT `eventheader_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`);

--
-- Constraints for table `examroom`
--
ALTER TABLE `examroom`
  ADD CONSTRAINT `examroom_ibfk_1` FOREIGN KEY (`AppID`) REFERENCES `student` (`AppID`),
  ADD CONSTRAINT `fk_subjectID` FOREIGN KEY (`SubjectID`,`ED_year`,`Semester`) REFERENCES `subject` (`SubjectID`, `ED_year`, `Semester`);

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ProgramID`) REFERENCES `program` (`ProgramID`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`AppTypeID`) REFERENCES `apptype` (`AppTypeID`);

--
-- Constraints for table `student_course`
--
ALTER TABLE `student_course`
  ADD CONSTRAINT `fk_course_id` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `student_course_ibfk_1` FOREIGN KEY (`AppID`) REFERENCES `student` (`AppID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
