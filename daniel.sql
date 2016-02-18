-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1build0.15.04.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 18, 2016 at 03:10 PM
-- Server version: 5.6.28-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `daniel`
--

-- --------------------------------------------------------

--
-- Table structure for table `central_level_data`
--

CREATE TABLE IF NOT EXISTS `central_level_data` (
`central_level_stock_id` int(25) NOT NULL,
  `supply_agency_id` int(25) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `period` varchar(25) NOT NULL,
  `soh_closing_balance` varchar(20) NOT NULL,
  `funding_agency_id` int(25) NOT NULL,
  `pending_stock_id` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commodity_forecast_data`
--

CREATE TABLE IF NOT EXISTS `commodity_forecast_data` (
`commodity_forecast_data_id` int(25) NOT NULL,
  `forecast_start_date` varchar(15) NOT NULL,
  `forecast_period` int(10) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `forecast_monthly_consumption` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_central_level_data`
--

CREATE TABLE IF NOT EXISTS `contraceptive_central_level_data` (
`central_level_stock_id` int(25) NOT NULL,
  `supply_agency_id` int(25) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `period` varchar(25) NOT NULL,
  `soh_closing_balance` varchar(20) NOT NULL,
  `funding_agency_id` int(25) NOT NULL,
  `pending_stock_id` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_commodities`
--

CREATE TABLE IF NOT EXISTS `contraceptive_commodities` (
  `commodity_id` varchar(25) NOT NULL,
  `commodity_name` varchar(60) NOT NULL,
  `alt_name` varchar(255) NOT NULL,
  `unit_of_measure` varchar(15) NOT NULL,
  `commodity_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_commodity_forecast_data`
--

CREATE TABLE IF NOT EXISTS `contraceptive_commodity_forecast_data` (
`commodity_forecast_data_id` int(25) NOT NULL,
  `forecast_start_date` varchar(15) NOT NULL,
  `forecast_period` int(10) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `forecast_monthly_consumption` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_county_level_data`
--

CREATE TABLE IF NOT EXISTS `contraceptive_county_level_data` (
  `county_drugs_id` int(11) NOT NULL,
  `county_id` varchar(50) NOT NULL,
  `drug_id` varchar(20) NOT NULL,
  `period` varchar(20) NOT NULL,
  `drug_category_id` varchar(20) NOT NULL,
  `drug_value` varchar(15) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_county_level_reporting_rates`
--

CREATE TABLE IF NOT EXISTS `contraceptive_county_level_reporting_rates` (
  `reporting_rate_id` int(11) NOT NULL,
  `reporting_rate_value` varchar(10) NOT NULL,
  `period` varchar(10) NOT NULL,
  `county_id` varchar(50) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_county_level_soh`
--

CREATE TABLE IF NOT EXISTS `contraceptive_county_level_soh` (
  `county` varchar(20) NOT NULL,
  `report_period` varchar(20) NOT NULL,
  `commodity` varchar(30) NOT NULL,
  `pack_size` varchar(20) NOT NULL,
  `agg_adj_consumption` varchar(40) NOT NULL,
  `agg_soh` varchar(30) NOT NULL,
  `mos` varchar(20) NOT NULL,
  `zone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_current_stock`
--

CREATE TABLE IF NOT EXISTS `contraceptive_current_stock` (
  `current_stock_id` int(25) NOT NULL,
  `commodity_id` varchar(255) NOT NULL,
  `quantity_received` int(255) NOT NULL,
  `quantity_issued` int(255) NOT NULL,
  `soh` int(255) NOT NULL,
  `period` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_facility_level_data`
--

CREATE TABLE IF NOT EXISTS `contraceptive_facility_level_data` (
  `central_drugs_id` int(11) NOT NULL,
  `drug_id` varchar(20) NOT NULL,
  `period` varchar(20) NOT NULL,
  `drug_category_id` varchar(20) NOT NULL,
  `drug_value` varchar(20) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_facility_level_reporting_rates`
--

CREATE TABLE IF NOT EXISTS `contraceptive_facility_level_reporting_rates` (
  `reporting_rate_id` int(11) NOT NULL,
  `reporting_rate_value` varchar(10) NOT NULL,
  `period` varchar(10) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_facility_level_soh`
--

CREATE TABLE IF NOT EXISTS `contraceptive_facility_level_soh` (
  `period` varchar(10) NOT NULL,
  `commodity_name` varchar(30) NOT NULL,
  `pack_size` varchar(20) NOT NULL,
  `agg_adj_consumption` varchar(30) NOT NULL,
  `agg_soh` varchar(40) NOT NULL,
  `mos` varchar(20) NOT NULL,
  `zone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_mapping_drugs_category`
--

CREATE TABLE IF NOT EXISTS `contraceptive_mapping_drugs_category` (
  `mapping_drugs_category` int(11) NOT NULL,
  `mapping_id` varchar(20) NOT NULL,
  `mapping_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_pending_shipment_details`
--

CREATE TABLE IF NOT EXISTS `contraceptive_pending_shipment_details` (
  `pending_shipment_id` int(25) NOT NULL,
  `period` int(10) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `funding_agency_id` int(25) NOT NULL,
  `quantity` varchar(25) NOT NULL,
  `expected_time_of_arrival` date NOT NULL,
  `comments` varchar(100) NOT NULL,
  `transaction_status` varchar(20) NOT NULL DEFAULT 'pending',
  `unit_of_measure` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contraceptive_planned_procurement_details`
--

CREATE TABLE IF NOT EXISTS `contraceptive_planned_procurement_details` (
  `planned_procurement_id` int(11) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `unit_of_measure` varchar(15) NOT NULL,
  `quantity` varchar(25) NOT NULL,
  `planned_delivery_date` varchar(15) NOT NULL,
  `funding_agency_id` int(25) NOT NULL,
  `comment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

CREATE TABLE IF NOT EXISTS `counties` (
  `county_id` varchar(20) NOT NULL,
  `county_name` varchar(30) NOT NULL,
  `zone` varchar(20) NOT NULL,
  `comment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `county_level_data`
--

CREATE TABLE IF NOT EXISTS `county_level_data` (
`county_drugs_id` int(11) NOT NULL,
  `county_id` varchar(50) NOT NULL,
  `drug_id` varchar(20) NOT NULL,
  `period` varchar(20) NOT NULL,
  `drug_category_id` varchar(20) NOT NULL,
  `drug_value` varchar(15) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4597 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `county_level_reporting_rates`
--

CREATE TABLE IF NOT EXISTS `county_level_reporting_rates` (
`reporting_rate_id` int(11) NOT NULL,
  `reporting_rate_value` varchar(10) NOT NULL,
  `period` varchar(10) NOT NULL,
  `county_id` varchar(50) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `county_level_soh`
--

CREATE TABLE IF NOT EXISTS `county_level_soh` (
  `county` varchar(20) NOT NULL,
  `report_period` varchar(20) NOT NULL,
  `commodity` varchar(30) NOT NULL,
  `pack_size` varchar(20) NOT NULL,
  `agg_adj_consumption` varchar(40) NOT NULL,
  `agg_soh` varchar(30) NOT NULL,
  `mos` varchar(20) NOT NULL,
  `zone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `current_stock`
--

CREATE TABLE IF NOT EXISTS `current_stock` (
`current_stock_id` int(25) NOT NULL,
  `commodity_id` varchar(255) NOT NULL,
  `quantity_received` int(255) NOT NULL,
  `quantity_issued` int(255) NOT NULL,
  `soh` int(255) NOT NULL,
  `period` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facility_level_data`
--

CREATE TABLE IF NOT EXISTS `facility_level_data` (
`central_drugs_id` int(11) NOT NULL,
  `drug_id` varchar(20) NOT NULL,
  `period` varchar(20) NOT NULL,
  `drug_category_id` varchar(20) NOT NULL,
  `drug_value` varchar(20) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facility_level_reporting_rates`
--

CREATE TABLE IF NOT EXISTS `facility_level_reporting_rates` (
`reporting_rate_id` int(11) NOT NULL,
  `reporting_rate_value` varchar(10) NOT NULL,
  `period` varchar(10) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facility_level_soh`
--

CREATE TABLE IF NOT EXISTS `facility_level_soh` (
  `period` varchar(10) NOT NULL,
  `commodity_name` varchar(30) NOT NULL,
  `pack_size` varchar(20) NOT NULL,
  `agg_adj_consumption` varchar(30) NOT NULL,
  `agg_soh` varchar(40) NOT NULL,
  `mos` varchar(20) NOT NULL,
  `zone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `funding_agencies`
--

CREATE TABLE IF NOT EXISTS `funding_agencies` (
`funding_agency_id` int(25) NOT NULL,
  `funding_agency_name` varchar(60) NOT NULL,
  `comment` varchar(100) NOT NULL COMMENT 'PMI, Global Fund, UNITAID, GoK'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_central_level_data`
--

CREATE TABLE IF NOT EXISTS `lab_central_level_data` (
  `central_level_stock_id` int(25) NOT NULL,
  `supply_agency_id` int(25) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `period` varchar(25) NOT NULL,
  `soh_closing_balance` varchar(20) NOT NULL,
  `funding_agency_id` int(25) NOT NULL,
  `pending_stock_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_commodities`
--

CREATE TABLE IF NOT EXISTS `lab_commodities` (
  `commodity_id` varchar(25) NOT NULL,
  `commodity_name` varchar(60) NOT NULL,
  `alt_name` varchar(255) NOT NULL,
  `unit_of_measure` varchar(15) NOT NULL,
  `commodity_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_commodity_forecast_data`
--

CREATE TABLE IF NOT EXISTS `lab_commodity_forecast_data` (
  `commodity_forecast_data_id` int(25) NOT NULL,
  `forecast_start_date` varchar(15) NOT NULL,
  `forecast_period` int(10) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `forecast_monthly_consumption` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_county_level_data`
--

CREATE TABLE IF NOT EXISTS `lab_county_level_data` (
  `county_drugs_id` int(11) NOT NULL,
  `county_id` varchar(50) NOT NULL,
  `drug_id` varchar(20) NOT NULL,
  `period` varchar(20) NOT NULL,
  `drug_category_id` varchar(20) NOT NULL,
  `drug_value` varchar(15) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_county_level_reporting_rates`
--

CREATE TABLE IF NOT EXISTS `lab_county_level_reporting_rates` (
  `reporting_rate_id` int(11) NOT NULL,
  `reporting_rate_value` varchar(10) NOT NULL,
  `period` varchar(10) NOT NULL,
  `county_id` varchar(50) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_county_level_soh`
--

CREATE TABLE IF NOT EXISTS `lab_county_level_soh` (
  `county` varchar(20) NOT NULL,
  `report_period` varchar(20) NOT NULL,
  `commodity` varchar(30) NOT NULL,
  `pack_size` varchar(20) NOT NULL,
  `agg_adj_consumption` varchar(40) NOT NULL,
  `agg_soh` varchar(30) NOT NULL,
  `mos` varchar(20) NOT NULL,
  `zone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_current_stock`
--

CREATE TABLE IF NOT EXISTS `lab_current_stock` (
  `current_stock_id` int(25) NOT NULL,
  `commodity_id` varchar(255) NOT NULL,
  `quantity_received` int(255) NOT NULL,
  `quantity_issued` int(255) NOT NULL,
  `soh` int(255) NOT NULL,
  `period` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_facility_level_data`
--

CREATE TABLE IF NOT EXISTS `lab_facility_level_data` (
  `central_drugs_id` int(11) NOT NULL,
  `drug_id` varchar(20) NOT NULL,
  `period` varchar(20) NOT NULL,
  `drug_category_id` varchar(20) NOT NULL,
  `drug_value` varchar(20) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_facility_level_reporting_rates`
--

CREATE TABLE IF NOT EXISTS `lab_facility_level_reporting_rates` (
  `reporting_rate_id` int(11) NOT NULL,
  `reporting_rate_value` varchar(10) NOT NULL,
  `period` varchar(10) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_facility_level_soh`
--

CREATE TABLE IF NOT EXISTS `lab_facility_level_soh` (
  `period` varchar(10) NOT NULL,
  `commodity_name` varchar(30) NOT NULL,
  `pack_size` varchar(20) NOT NULL,
  `agg_adj_consumption` varchar(30) NOT NULL,
  `agg_soh` varchar(40) NOT NULL,
  `mos` varchar(20) NOT NULL,
  `zone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_mapping_drugs_category`
--

CREATE TABLE IF NOT EXISTS `lab_mapping_drugs_category` (
  `mapping_drugs_category` int(11) NOT NULL,
  `mapping_id` varchar(20) NOT NULL,
  `mapping_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_pending_shipment_details`
--

CREATE TABLE IF NOT EXISTS `lab_pending_shipment_details` (
  `pending_shipment_id` int(25) NOT NULL,
  `period` int(10) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `funding_agency_id` int(25) NOT NULL,
  `quantity` varchar(25) NOT NULL,
  `expected_time_of_arrival` date NOT NULL,
  `comments` varchar(100) NOT NULL,
  `transaction_status` varchar(20) NOT NULL DEFAULT 'pending',
  `unit_of_measure` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_planned_procurement_details`
--

CREATE TABLE IF NOT EXISTS `lab_planned_procurement_details` (
  `planned_procurement_id` int(11) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `unit_of_measure` varchar(15) NOT NULL,
  `quantity` varchar(25) NOT NULL,
  `planned_delivery_date` varchar(15) NOT NULL,
  `funding_agency_id` int(25) NOT NULL,
  `comment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_commodities`
--

CREATE TABLE IF NOT EXISTS `malaria_commodities` (
  `commodity_id` varchar(25) NOT NULL,
  `commodity_name` varchar(60) NOT NULL,
  `alt_name` varchar(255) NOT NULL,
  `unit_of_measure` varchar(15) NOT NULL,
  `commodity_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_commodity_forecast_data`
--

CREATE TABLE IF NOT EXISTS `malaria_commodity_forecast_data` (
`commodity_forecast_data_id` int(25) NOT NULL,
  `forecast_start_date` varchar(15) NOT NULL,
  `forecast_period` int(10) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `forecast_monthly_consumption` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mapping_drugs_category`
--

CREATE TABLE IF NOT EXISTS `mapping_drugs_category` (
`mapping_drugs_category` int(11) NOT NULL,
  `mapping_id` varchar(20) NOT NULL,
  `mapping_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mos_color_codes`
--

CREATE TABLE IF NOT EXISTS `mos_color_codes` (
  `color_id` int(11) NOT NULL,
  `color` varchar(60) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pending_shipment_details`
--

CREATE TABLE IF NOT EXISTS `pending_shipment_details` (
`pending_shipment_id` int(25) NOT NULL,
  `period` int(10) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `funding_agency_id` int(25) NOT NULL,
  `quantity` varchar(25) NOT NULL,
  `expected_time_of_arrival` date NOT NULL,
  `comments` varchar(100) NOT NULL,
  `transaction_status` varchar(20) NOT NULL DEFAULT 'pending',
  `unit_of_measure` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `planned_procurement_details`
--

CREATE TABLE IF NOT EXISTS `planned_procurement_details` (
`planned_procurement_id` int(11) NOT NULL,
  `commodity_id` varchar(25) NOT NULL,
  `unit_of_measure` varchar(15) NOT NULL,
  `quantity` varchar(25) NOT NULL,
  `planned_delivery_date` varchar(15) NOT NULL,
  `funding_agency_id` int(25) NOT NULL,
  `comment` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supply_chain_agencies`
--

CREATE TABLE IF NOT EXISTS `supply_chain_agencies` (
`supply_chain_agency_id` int(5) NOT NULL,
  `supply_chain_agency` varchar(60) NOT NULL,
  `contact_person` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact_phone` int(55) NOT NULL,
  `comment` varchar(1000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE IF NOT EXISTS `user_table` (
`user_id` int(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `names` varchar(255) NOT NULL,
  `email` varchar(70) NOT NULL,
  `national_id` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE IF NOT EXISTS `zones` (
  `zone` varchar(30) NOT NULL,
  `comment` varchar(100) NOT NULL,
`zone_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `central_level_data`
--
ALTER TABLE `central_level_data`
 ADD PRIMARY KEY (`central_level_stock_id`), ADD KEY `supply_agency_id` (`supply_agency_id`), ADD KEY `commodity_id` (`commodity_id`), ADD KEY `funding_agency_id` (`funding_agency_id`);

--
-- Indexes for table `commodity_forecast_data`
--
ALTER TABLE `commodity_forecast_data`
 ADD PRIMARY KEY (`commodity_forecast_data_id`), ADD KEY `commodity_id` (`commodity_id`), ADD KEY `commodity_id_2` (`commodity_id`);

--
-- Indexes for table `contraceptive_central_level_data`
--
ALTER TABLE `contraceptive_central_level_data`
 ADD PRIMARY KEY (`central_level_stock_id`), ADD KEY `supply_agency_id` (`supply_agency_id`), ADD KEY `commodity_id` (`commodity_id`), ADD KEY `funding_agency_id` (`funding_agency_id`);

--
-- Indexes for table `contraceptive_commodities`
--
ALTER TABLE `contraceptive_commodities`
 ADD PRIMARY KEY (`commodity_id`), ADD KEY `pack_size` (`unit_of_measure`);

--
-- Indexes for table `contraceptive_commodity_forecast_data`
--
ALTER TABLE `contraceptive_commodity_forecast_data`
 ADD PRIMARY KEY (`commodity_forecast_data_id`), ADD KEY `commodity_id` (`commodity_id`), ADD KEY `commodity_id_2` (`commodity_id`);

--
-- Indexes for table `contraceptive_county_level_data`
--
ALTER TABLE `contraceptive_county_level_data`
 ADD PRIMARY KEY (`county_drugs_id`), ADD KEY `county_id` (`county_id`);

--
-- Indexes for table `contraceptive_county_level_reporting_rates`
--
ALTER TABLE `contraceptive_county_level_reporting_rates`
 ADD PRIMARY KEY (`reporting_rate_id`);

--
-- Indexes for table `contraceptive_current_stock`
--
ALTER TABLE `contraceptive_current_stock`
 ADD PRIMARY KEY (`current_stock_id`);

--
-- Indexes for table `contraceptive_facility_level_data`
--
ALTER TABLE `contraceptive_facility_level_data`
 ADD PRIMARY KEY (`central_drugs_id`);

--
-- Indexes for table `contraceptive_facility_level_reporting_rates`
--
ALTER TABLE `contraceptive_facility_level_reporting_rates`
 ADD PRIMARY KEY (`reporting_rate_id`);

--
-- Indexes for table `contraceptive_mapping_drugs_category`
--
ALTER TABLE `contraceptive_mapping_drugs_category`
 ADD PRIMARY KEY (`mapping_drugs_category`);

--
-- Indexes for table `contraceptive_pending_shipment_details`
--
ALTER TABLE `contraceptive_pending_shipment_details`
 ADD PRIMARY KEY (`pending_shipment_id`), ADD KEY `commodity_id` (`commodity_id`), ADD KEY `funding_agency_id` (`funding_agency_id`);

--
-- Indexes for table `contraceptive_planned_procurement_details`
--
ALTER TABLE `contraceptive_planned_procurement_details`
 ADD PRIMARY KEY (`planned_procurement_id`);

--
-- Indexes for table `counties`
--
ALTER TABLE `counties`
 ADD PRIMARY KEY (`county_id`), ADD KEY `county_id` (`county_id`);

--
-- Indexes for table `county_level_data`
--
ALTER TABLE `county_level_data`
 ADD PRIMARY KEY (`county_drugs_id`), ADD KEY `county_id` (`county_id`);

--
-- Indexes for table `county_level_reporting_rates`
--
ALTER TABLE `county_level_reporting_rates`
 ADD PRIMARY KEY (`reporting_rate_id`);

--
-- Indexes for table `current_stock`
--
ALTER TABLE `current_stock`
 ADD PRIMARY KEY (`current_stock_id`);

--
-- Indexes for table `facility_level_data`
--
ALTER TABLE `facility_level_data`
 ADD PRIMARY KEY (`central_drugs_id`);

--
-- Indexes for table `facility_level_reporting_rates`
--
ALTER TABLE `facility_level_reporting_rates`
 ADD PRIMARY KEY (`reporting_rate_id`);

--
-- Indexes for table `funding_agencies`
--
ALTER TABLE `funding_agencies`
 ADD PRIMARY KEY (`funding_agency_id`);

--
-- Indexes for table `malaria_commodities`
--
ALTER TABLE `malaria_commodities`
 ADD PRIMARY KEY (`commodity_id`), ADD KEY `pack_size` (`unit_of_measure`);

--
-- Indexes for table `malaria_commodity_forecast_data`
--
ALTER TABLE `malaria_commodity_forecast_data`
 ADD PRIMARY KEY (`commodity_forecast_data_id`), ADD KEY `commodity_id` (`commodity_id`), ADD KEY `commodity_id_2` (`commodity_id`);

--
-- Indexes for table `mapping_drugs_category`
--
ALTER TABLE `mapping_drugs_category`
 ADD PRIMARY KEY (`mapping_drugs_category`);

--
-- Indexes for table `pending_shipment_details`
--
ALTER TABLE `pending_shipment_details`
 ADD PRIMARY KEY (`pending_shipment_id`), ADD KEY `commodity_id` (`commodity_id`), ADD KEY `funding_agency_id` (`funding_agency_id`);

--
-- Indexes for table `planned_procurement_details`
--
ALTER TABLE `planned_procurement_details`
 ADD PRIMARY KEY (`planned_procurement_id`);

--
-- Indexes for table `supply_chain_agencies`
--
ALTER TABLE `supply_chain_agencies`
 ADD PRIMARY KEY (`supply_chain_agency_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `email` (`email`), ADD UNIQUE KEY `national_id` (`national_id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
 ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `central_level_data`
--
ALTER TABLE `central_level_data`
MODIFY `central_level_stock_id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `commodity_forecast_data`
--
ALTER TABLE `commodity_forecast_data`
MODIFY `commodity_forecast_data_id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `contraceptive_central_level_data`
--
ALTER TABLE `contraceptive_central_level_data`
MODIFY `central_level_stock_id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `contraceptive_commodity_forecast_data`
--
ALTER TABLE `contraceptive_commodity_forecast_data`
MODIFY `commodity_forecast_data_id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `county_level_data`
--
ALTER TABLE `county_level_data`
MODIFY `county_drugs_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4597;
--
-- AUTO_INCREMENT for table `county_level_reporting_rates`
--
ALTER TABLE `county_level_reporting_rates`
MODIFY `reporting_rate_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=472;
--
-- AUTO_INCREMENT for table `current_stock`
--
ALTER TABLE `current_stock`
MODIFY `current_stock_id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `facility_level_data`
--
ALTER TABLE `facility_level_data`
MODIFY `central_drugs_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `facility_level_reporting_rates`
--
ALTER TABLE `facility_level_reporting_rates`
MODIFY `reporting_rate_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `funding_agencies`
--
ALTER TABLE `funding_agencies`
MODIFY `funding_agency_id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `malaria_commodity_forecast_data`
--
ALTER TABLE `malaria_commodity_forecast_data`
MODIFY `commodity_forecast_data_id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mapping_drugs_category`
--
ALTER TABLE `mapping_drugs_category`
MODIFY `mapping_drugs_category` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `pending_shipment_details`
--
ALTER TABLE `pending_shipment_details`
MODIFY `pending_shipment_id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `planned_procurement_details`
--
ALTER TABLE `planned_procurement_details`
MODIFY `planned_procurement_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `supply_chain_agencies`
--
ALTER TABLE `supply_chain_agencies`
MODIFY `supply_chain_agency_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `central_level_data`
--
ALTER TABLE `central_level_data`
ADD CONSTRAINT `central_level_data_ibfk_1` FOREIGN KEY (`funding_agency_id`) REFERENCES `funding_agencies` (`funding_agency_id`),
ADD CONSTRAINT `central_level_data_ibfk_4` FOREIGN KEY (`commodity_id`) REFERENCES `malaria_commodities` (`commodity_id`);

--
-- Constraints for table `contraceptive_central_level_data`
--
ALTER TABLE `contraceptive_central_level_data`
ADD CONSTRAINT `contraceptive_central_level_data_ibfk_1` FOREIGN KEY (`funding_agency_id`) REFERENCES `funding_agencies` (`funding_agency_id`),
ADD CONSTRAINT `contraceptive_central_level_data_ibfk_4` FOREIGN KEY (`commodity_id`) REFERENCES `contraceptive_commodities` (`commodity_id`);

--
-- Constraints for table `contraceptive_pending_shipment_details`
--
ALTER TABLE `contraceptive_pending_shipment_details`
ADD CONSTRAINT `contraceptive_pending_shipment_details_ibfk_1` FOREIGN KEY (`funding_agency_id`) REFERENCES `funding_agencies` (`funding_agency_id`),
ADD CONSTRAINT `contraceptive_pending_shipment_details_ibfk_2` FOREIGN KEY (`commodity_id`) REFERENCES `contraceptive_commodities` (`commodity_id`);

--
-- Constraints for table `pending_shipment_details`
--
ALTER TABLE `pending_shipment_details`
ADD CONSTRAINT `pending_shipment_details_ibfk_1` FOREIGN KEY (`funding_agency_id`) REFERENCES `funding_agencies` (`funding_agency_id`),
ADD CONSTRAINT `pending_shipment_details_ibfk_2` FOREIGN KEY (`commodity_id`) REFERENCES `malaria_commodities` (`commodity_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
