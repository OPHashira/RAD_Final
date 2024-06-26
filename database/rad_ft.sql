-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 12, 2024 lúc 05:51 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `rad_ft`
--

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `rad_ft`;

-- Switch to the newly created database
USE `rad_ft`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `BrandID` int(11) NOT NULL,
  `brandName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`BrandID`, `brandName`) VALUES
(1, 'Mazda');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `DOB` date DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contactNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CusAccID` int(11) DEFAULT NULL,
  `RentingID` int(11) DEFAULT NULL,
  `PaymentID` int(11) DEFAULT NULL,
  `SupportID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`CustomerID`, `DOB`, `address`, `fullName`, `contactNo`, `CusAccID`, `RentingID`, `PaymentID`, `SupportID`) VALUES
(1, '2003-10-01', 'adadadada', 'Nguyen Van B', '0888888888', 1, NULL, NULL, NULL),
(2, '2024-06-09', 'ada dadasdacac', 'Nguyen Van D', '0777777777', 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customeraccount`
--

CREATE TABLE `customeraccount` (
  `CusAccID` int(11) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `regDate` datetime NOT NULL DEFAULT current_timestamp(),
  `updationDate` datetime DEFAULT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customeraccount`
--

INSERT INTO `customeraccount` (`CusAccID`, `password`, `regDate`, `updationDate`, `ManagerID`, `username`, `email`) VALUES
(1, '123456', '2024-06-08 17:54:55', NULL, 1, '', ''),
(2, '$2y$10$0CvhAk/MuoaJCb8x8FonKOVzdVx1pziyzt.QHYstQEbYCKkMTo1Ee', '2024-06-12 00:45:44', NULL, 1, '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customersupport`
--

CREATE TABLE `customersupport` (
  `SupportID` int(11) NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `startTime` datetime DEFAULT curdate(),
  `endTime` datetime DEFAULT NULL,
  `SupportType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `ManagerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manager`
--

CREATE TABLE `manager` (
  `ManagerID` int(11) NOT NULL,
  `fullName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contactNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `manager`
--

INSERT INTO `manager` (`ManagerID`, `fullName`, `password`, `contactNo`) VALUES
(1, 'Nguyen Lam Duy', '$2y$10$EoZvXjujq2SY6Wnc6rDiBu2GF05meIN6gDXJUiZ3tqE5JIWSvXDf6', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `method` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `RentingID` int(11) DEFAULT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`PaymentID`, `status`, `method`, `amount`, `RentingID`, `ManagerID`, `CustomerID`) VALUES
(1, 'NOT DONE', 'Visa', '100.000 VND', 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `provider`
--

CREATE TABLE `provider` (
  `ProviderID` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contactNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `provider`
--

INSERT INTO `provider` (`ProviderID`, `email`, `address`, `fullName`, `contactNo`) VALUES
(1, 'ProviderA@gmail.com', 'adadafsgdbdv', 'Nguyen Van C', '0777777777');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `renting`
--

CREATE TABLE `renting` (
  `RentingID` int(11) NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `toDate` datetime DEFAULT NULL,
  `userEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rentingNumber` int(11) DEFAULT NULL,
  `fromDate` datetime DEFAULT NULL,
  `totalAmount` int(11) DEFAULT NULL,
  `VehicleID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `renting`
--

INSERT INTO `renting` (`RentingID`, `status`, `toDate`, `userEmail`, `rentingNumber`, `fromDate`, `totalAmount`, `VehicleID`, `CustomerID`) VALUES
(1, 'NOT DONE', '2024-06-13 21:47:19', NULL, NULL, '2024-06-12 21:47:19', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reportdamage`
--

CREATE TABLE `reportdamage` (
  `ReportID` int(11) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` datetime DEFAULT curdate(),
  `reportName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL,
  `ProviderID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specialdeal`
--

CREATE TABLE `specialdeal` (
  `DealID` int(11) NOT NULL,
  `dealName` varchar(255) NOT NULL,
  `expireDate` datetime NOT NULL,
  `priceDiscount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `specialdeal`
--

INSERT INTO `specialdeal` (`DealID`, `dealName`, `expireDate`, `priceDiscount`) VALUES
(1, 'first time', '2024-06-15 00:00:00', 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `fullName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `StaffAccID` int(11) DEFAULT NULL,
  `ReportID` int(11) DEFAULT NULL,
  `RentingID` int(11) DEFAULT NULL,
  `VehicleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`StaffID`, `fullName`, `StaffAccID`, `ReportID`, `RentingID`, `VehicleID`) VALUES
(1, 'Nguyen Van A', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staffaccount`
--

CREATE TABLE `staffaccount` (
  `StaffAccID` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ManagerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `staffaccount`
--

INSERT INTO `staffaccount` (`StaffAccID`, `email`, `password`, `ManagerID`) VALUES
(1, 'staffA@gmail.com', '098765', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle`
--

CREATE TABLE `vehicle` (
  `VehicleID` int(11) NOT NULL,
  `vehiclesTitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pricePerDay` varchar(50) DEFAULT NULL,
  `vehiclesOverview` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `features` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `photoURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `availability` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modelYear` int(11) DEFAULT NULL,
  `BrandID` int(11) DEFAULT NULL,
  `ProviderID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vehicle`
--

INSERT INTO `vehicle` (`VehicleID`, `vehiclesTitle`, `pricePerDay`, `vehiclesOverview`, `features`, `photoURL`, `availability`, `modelYear`, `BrandID`, `ProviderID`) VALUES
(1, 'CX-8', '100.000 VND', NULL, NULL, NULL, 'available', 2017, 1, 1),
(2, 'CX-5', '50.000 VND', NULL, NULL, NULL, 'available', 2012, 1, NULL),
(4, 'CX-3', NULL, 'The Mazda CX-3 is a subcompact crossover SUV (B-se', 'The CX-3 received a minor facelift in 2018 including a new split horizontal chrome grille design, foglamps, tail lamps, minor tweaks to the chassis, added safety features, centre console armrest and replaced the manual handbrake with an electronic parking', 'Screenshot 2024-04-03 143155.png', NULL, 2014, 1, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`BrandID`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `kn_Customer_CustomerAccount` (`CusAccID`);

--
-- Chỉ mục cho bảng `customeraccount`
--
ALTER TABLE `customeraccount`
  ADD PRIMARY KEY (`CusAccID`),
  ADD KEY `kn_CustomerAccount_Manager` (`ManagerID`);

--
-- Chỉ mục cho bảng `customersupport`
--
ALTER TABLE `customersupport`
  ADD PRIMARY KEY (`SupportID`),
  ADD KEY `kn_CustomerSupport_Customer` (`CustomerID`),
  ADD KEY `kn_CustomerSupport_Manager` (`ManagerID`);

--
-- Chỉ mục cho bảng `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`ManagerID`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `kn_Payment_Renting` (`RentingID`),
  ADD KEY `kn_Payment_Manager` (`ManagerID`),
  ADD KEY `kn_Payment_Customer` (`CustomerID`);

--
-- Chỉ mục cho bảng `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`ProviderID`);

--
-- Chỉ mục cho bảng `renting`
--
ALTER TABLE `renting`
  ADD PRIMARY KEY (`RentingID`),
  ADD KEY `kn_Renting_Vehicle` (`VehicleID`),
  ADD KEY `kn_Renting_Customer` (`CustomerID`);

--
-- Chỉ mục cho bảng `reportdamage`
--
ALTER TABLE `reportdamage`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `kn_ReportDamage_Staff` (`StaffID`),
  ADD KEY `kn_ReportDamage_Provider` (`ProviderID`);

--
-- Chỉ mục cho bảng `specialdeal`
--
ALTER TABLE `specialdeal`
  ADD PRIMARY KEY (`DealID`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `kn_Staff_StaffAccount` (`StaffAccID`),
  ADD KEY `kn_Staff_Vehicle` (`VehicleID`),
  ADD KEY `kn_Staff_Renting` (`RentingID`);

--
-- Chỉ mục cho bảng `staffaccount`
--
ALTER TABLE `staffaccount`
  ADD PRIMARY KEY (`StaffAccID`),
  ADD KEY `kn_staffAccount_Manager` (`ManagerID`);

--
-- Chỉ mục cho bảng `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VehicleID`),
  ADD KEY `kn_Vehicle_Brand` (`BrandID`),
  ADD KEY `kn_Vehicle_Provider` (`ProviderID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `BrandID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `customeraccount`
--
ALTER TABLE `customeraccount`
  MODIFY `CusAccID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `customersupport`
--
ALTER TABLE `customersupport`
  MODIFY `SupportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `manager`
--
ALTER TABLE `manager`
  MODIFY `ManagerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `provider`
--
ALTER TABLE `provider`
  MODIFY `ProviderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `renting`
--
ALTER TABLE `renting`
  MODIFY `RentingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `reportdamage`
--
ALTER TABLE `reportdamage`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `specialdeal`
--
ALTER TABLE `specialdeal`
  MODIFY `DealID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `staffaccount`
--
ALTER TABLE `staffaccount`
  MODIFY `StaffAccID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `VehicleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `kn_Customer_CustomerAccount` FOREIGN KEY (`CusAccID`) REFERENCES `customeraccount` (`CusAccID`);

--
-- Các ràng buộc cho bảng `customeraccount`
--
ALTER TABLE `customeraccount`
  ADD CONSTRAINT `kn_CustomerAccount_Manager` FOREIGN KEY (`ManagerID`) REFERENCES `manager` (`ManagerID`);

--
-- Các ràng buộc cho bảng `customersupport`
--
ALTER TABLE `customersupport`
  ADD CONSTRAINT `kn_CustomerSupport_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `kn_CustomerSupport_Manager` FOREIGN KEY (`ManagerID`) REFERENCES `manager` (`ManagerID`);

--
-- Các ràng buộc cho bảng `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `kn_Payment_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `kn_Payment_Manager` FOREIGN KEY (`ManagerID`) REFERENCES `manager` (`ManagerID`),
  ADD CONSTRAINT `kn_Payment_Renting` FOREIGN KEY (`RentingID`) REFERENCES `renting` (`RentingID`);

--
-- Các ràng buộc cho bảng `renting`
--
ALTER TABLE `renting`
  ADD CONSTRAINT `kn_Renting_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `kn_Renting_Vehicle` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`);

--
-- Các ràng buộc cho bảng `reportdamage`
--
ALTER TABLE `reportdamage`
  ADD CONSTRAINT `kn_ReportDamage_Provider` FOREIGN KEY (`ProviderID`) REFERENCES `provider` (`ProviderID`),
  ADD CONSTRAINT `kn_ReportDamage_Staff` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);

--
-- Các ràng buộc cho bảng `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `kn_Staff_Renting` FOREIGN KEY (`RentingID`) REFERENCES `renting` (`RentingID`),
  ADD CONSTRAINT `kn_Staff_StaffAccount` FOREIGN KEY (`StaffAccID`) REFERENCES `staffaccount` (`StaffAccID`),
  ADD CONSTRAINT `kn_Staff_Vehicle` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`);

--
-- Các ràng buộc cho bảng `staffaccount`
--
ALTER TABLE `staffaccount`
  ADD CONSTRAINT `kn_staffAccount_Manager` FOREIGN KEY (`ManagerID`) REFERENCES `manager` (`ManagerID`);

--
-- Các ràng buộc cho bảng `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `kn_Vehicle_Brand` FOREIGN KEY (`BrandID`) REFERENCES `brand` (`BrandID`),
  ADD CONSTRAINT `kn_Vehicle_Provider` FOREIGN KEY (`ProviderID`) REFERENCES `provider` (`ProviderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
