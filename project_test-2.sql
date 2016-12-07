-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2016 at 09:29 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.37

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
  `LogTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EventType` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`EventID`, `EventName`, `LogTime`, `EventType`) VALUES
(1, 'ทุนการศึกษา', '2016-12-05 13:17:18', NULL),
(2, 'Eve02', '2016-12-13 20:06:10', NULL),
(3, 'Eve03', '2016-10-26 13:58:30', NULL),
(4, 'Eve04', '2016-10-26 13:59:14', NULL),
(5, 'Eve05', '2016-10-26 13:59:14', NULL),
(6, 'Eve06', '2016-10-26 13:59:14', NULL);

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

--
-- Dumping data for table `eventdetails`
--

INSERT INTO `eventdetails` (`EventID`, `StudentID`, `AttributeValue`, `AttributeNo`, `AppID`) VALUES
(1, '57070501001', 'ทุนนี้พ่อให้มา', 1, '1'),
(1, NULL, 'ทุนสู้เพื่อแม่', 1, '10'),
(1, NULL, 'ทุนการเรียนตกต่ำ', 1, '2'),
(1, NULL, 'ทุนเรียนดี', 1, '3'),
(1, '57070501001', '500', 2, '1'),
(1, NULL, '10000', 2, '10'),
(1, NULL, '50000', 2, '2'),
(1, NULL, '20000', 2, '3'),
(1, '57070501001', '4 years', 3, '1'),
(1, NULL, '2 years', 3, '10'),
(1, NULL, '1 year', 3, '2'),
(1, NULL, '4 years', 3, '3'),
(2, NULL, 'text1', 1, '11'),
(2, NULL, 'text4', 1, '12'),
(2, NULL, 'text2', 2, '11'),
(2, NULL, 'text5', 2, '12'),
(2, '', 'text3', 3, '11'),
(2, NULL, 'text6', 3, '12');

-- --------------------------------------------------------

--
-- Table structure for table `eventheader`
--

CREATE TABLE `eventheader` (
  `EventID` int(11) NOT NULL,
  `HeaderTitle` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `HeaderNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `eventheader`
--

INSERT INTO `eventheader` (`EventID`, `HeaderTitle`, `HeaderNo`) VALUES
(1, 'ประเภททุน', 1),
(1, 'จำนวนเงิน', 2),
(1, 'ระยะเวลา', 3),
(2, 'Annouce1', 1),
(2, 'Annouce2', 2),
(2, 'Annouce3', 3);

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
  `Semester` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `examroom`
--

INSERT INTO `examroom` (`AppID`, `SubjectID`, `SeatNo`, `Room`, `Time`, `ED_year`, `Semester`) VALUES
('1', 'LNG', 1, 'CB4302', '2016-12-07 07:47:41', '2016', '1'),
('1', 'PHY', 25, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('10', 'LNG', 10, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('10', 'PHY', 2, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('11', 'LNG', 11, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('11', 'PHY', 3, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('12', 'LNG', 12, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('12', 'PHY', 4, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('13', 'LNG', 13, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('13', 'PHY', 5, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('14', 'LNG', 14, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('15', 'LNG', 15, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('2', 'LNG', 2, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('2', 'PHY', 26, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('3', 'LNG', 3, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('3', 'PHY', 27, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('4', 'LNG', 4, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('4', 'PHY', 28, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('5', 'LNG', 5, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('5', 'PHY', 29, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('6', 'LNG', 6, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('6', 'PHY', 30, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('7', 'LNG', 7, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('7', 'PHY', 31, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('8', 'LNG', 8, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('8', 'PHY', 32, 'CB1403', '2016-12-05 02:00:00', '2016', '1'),
('9', 'LNG', 9, 'CB4302', '2016-12-07 07:49:59', '2016', '1'),
('9', 'PHY', 1, 'CB1404', '2016-12-05 02:00:00', '2016', '1');

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
('Admin1', 'Admin1', 1),
('Admin2', 'admin2', 1),
('admin3', 'admin3', 1),
('staff1', 'staff1', 2),
('staff2', 'staff2', 2),
('staff3', 'stff3', 2),
('staff4', 'staff4', 2),
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
('1', '', 'Choky', 'Fisherman', 1, 'Bachelor', '1192834758912', 'CPE01'),
('10', '', 'Abby', 'Database', 2, 'Bachelor', '1234567891234', 'CPE01'),
('11', '57070501001', 'Mon', 'Blackhead', 1, 'Bachelor', '1010101010010', 'CPE01'),
('12', '57070502001', 'kaie', 'Aris', 2, 'Bachelor', '1110001112234', 'CPE01'),
('13', '57070501022', 'Pawin', 'Taechoyotin', 4, 'Bachelor', '1234567876567', 'CPE02'),
('14', '57070501033', 'Frank', 'Lampard', 3, 'Bachelor', '1898767876567', 'CPE01'),
('15', '57070501061', 'Titat', 'Korbariyachit', 4, 'Bachelor', '1234587980000', 'CPE01'),
('2', '', 'Steve', 'Job', 1, 'Bachelor', '1122334455667', 'ENV01'),
('3', '', 'Harmony', 'Potter', 1, 'Bachelor', '1123343445456', 'ME01'),
('4', '', 'Cordelia', 'Monkey', 2, 'Bachelor', '1122112211211', 'PHY01'),
('5', '', 'Alfred', 'Gerrard', 2, 'Bachelor', '1354742202122', 'EE02'),
('6', '', 'Charles', 'Xmen', 3, 'Bachelor', '1102344098000', 'CS01'),
('7', '', 'David', 'Backham', 1, 'Bachelor', '1118887776890', 'CPE01'),
('8', '57070501003', 'Karis', 'Matchaparn', 2, 'Bachelor', '1234567654321', 'CPE01'),
('9', '57070501052', 'Sirapop', 'Wongstapornpat', 2, 'Bachelor', '6789098654323', 'CPE01');

-- --------------------------------------------------------

--
-- Table structure for table `student_course`
--

CREATE TABLE `student_course` (
  `AppID` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `CourseID` varchar(6) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_course`
--

INSERT INTO `student_course` (`AppID`, `CourseID`) VALUES
('1', 'LNG001'),
('1', 'MTH001'),
('1', 'PHY001'),
('10', 'LNG001'),
('10', 'LNG002'),
('10', 'MTH001'),
('11', 'PHY001'),
('13', 'LNG001'),
('13', 'MTH001'),
('13', 'PHY001'),
('15', 'PHY001'),
('2', 'LNG002'),
('2', 'PHY001'),
('3', 'LNG002'),
('3', 'PHY001'),
('4', 'LNG001'),
('5', 'LNG001'),
('5', 'MTH001'),
('6', 'LNG002'),
('6', 'PHY001'),
('7', 'LNG001'),
('7', 'MTH001'),
('8', 'LNG001'),
('8', 'PHY001'),
('9', 'LNG001'),
('9', 'MTH001'),
('9', 'PHY001');

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
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`SubjectID`, `SubjectName`, `ED_year`, `Semester`, `Description`) VALUES
('LNG', 'English', '2016', '1', 'Englishhhhhhhhhhh'),
('MTH', 'Math', '2016', '1', 'Math'),
('PHY', 'Physics', '2016', '1', 'something about physics');

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
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
