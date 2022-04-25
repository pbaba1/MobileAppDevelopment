import 'package:flutter/material.dart';

var appColor = 0xFFCA0000;

var menuSubOptions = [
  'Search Profiles',
  'Interest Sent',
  'Blocked',
  // 'Melawa Information',
  // 'Gunmilan'
];

var profileIdsDocID = 'hrJcaDnxEFMp8kfwuTvj';

List<DropdownMenuItem<String>> get casteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("All"), value: "All"),
    DropdownMenuItem(child: Text("Jangam"), value: "Jangam"),
    DropdownMenuItem(child: Text("Lad Wani"), value: "Lad Wani"),
    DropdownMenuItem(child: Text("Lingayat"), value: "Lingayat"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get casteDropdownItemsEdit {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Jangam"), value: "Jangam"),
    DropdownMenuItem(child: Text("Lad Wani"), value: "Lad Wani"),
    DropdownMenuItem(child: Text("Lingayat"), value: "Lingayat"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get subcastesOfJangam {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("All"), value: "All"),
    DropdownMenuItem(child: Text("Beda"), value: "Beda"),
    DropdownMenuItem(child: Text("Ghanger"), value: "Ghanger"),
    DropdownMenuItem(child: Text("Jader"), value: "Jader"),
    DropdownMenuItem(child: Text("Kudwakalger"), value: "Kudwakalger"),
    DropdownMenuItem(child: Text("Mala"), value: "Mala"),
    DropdownMenuItem(child: Text("Malgar"), value: "Malgar"),
    DropdownMenuItem(child: Text("Mathapati"), value: "Mathapati"),
    DropdownMenuItem(child: Text("Swami"), value: "Swami"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get subcastesOfJangamEdit {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Beda"), value: "Beda"),
    DropdownMenuItem(child: Text("Ghanger"), value: "Ghanger"),
    DropdownMenuItem(child: Text("Jader"), value: "Jader"),
    DropdownMenuItem(child: Text("Kudwakalger"), value: "Kudwakalger"),
    DropdownMenuItem(child: Text("Mala"), value: "Mala"),
    DropdownMenuItem(child: Text("Malgar"), value: "Malgar"),
    DropdownMenuItem(child: Text("Mathapati"), value: "Mathapati"),
    DropdownMenuItem(child: Text("Swami"), value: "Swami"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get subcastesOfLadWani {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("All"), value: "All"),
    DropdownMenuItem(child: Text("Lad Wani"), value: "Lad Wani"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get subcastesOfLadWaniEdit {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Lad Wani"), value: "Lad Wani"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get subcastesOfLingayat {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("All"), value: "All"),
    DropdownMenuItem(child: Text("Aadi-Banajgar"), value: "Aadi-Banajgar"),
    DropdownMenuItem(child: Text("Aadi-Wani"), value: "Aadi-Wani"),
    DropdownMenuItem(child: Text("Banagar"), value: "Banagar"),
    DropdownMenuItem(child: Text("Banajigi"), value: "Banajigi"),
    DropdownMenuItem(child: Text("Bangar(Rangari)"), value: "Bangar(Rangari)"),
    DropdownMenuItem(child: Text("Bramhan"), value: "Bramhan"),
    DropdownMenuItem(child: Text("Chatur"), value: "Chatur"),
    DropdownMenuItem(child: Text("Chilwant"), value: "Chilwant"),
    DropdownMenuItem(child: Text("Deeksha"), value: "Deeksha"),
    DropdownMenuItem(child: Text("Devang"), value: "Devang"),
    DropdownMenuItem(child: Text("Dikshawant"), value: "Dikshawant"),
    DropdownMenuItem(child: Text("Full Mali"), value: "Full Mali"),
    DropdownMenuItem(child: Text("Ganiga"), value: "Ganiga"),
    DropdownMenuItem(child: Text("Gavali"), value: "Gavali"),
    DropdownMenuItem(child: Text("Gowda"), value: "Gowda"),
    DropdownMenuItem(child: Text("Gurav"), value: "Gurav"),
    DropdownMenuItem(child: Text("Hadpad"), value: "Hadpad"),
    DropdownMenuItem(child: Text("Hatgar-Koshti"), value: "Hatgar-Koshti"),
    DropdownMenuItem(child: Text("Hatgar"), value: "Hatgar"),
    DropdownMenuItem(child: Text("Jadar"), value: "Jadar"),
    DropdownMenuItem(child: Text("Kari Kul Ganiga"), value: "Kari Kul Ganiga"),
    DropdownMenuItem(child: Text("Koshti"), value: "Koshti"),
    DropdownMenuItem(child: Text("Kudwakkaliga"), value: "Kudwakkaliga"),
    DropdownMenuItem(child: Text("Kulwant"), value: "Kulwant"),
    DropdownMenuItem(child: Text("Kumbhar"), value: "Kumbhar"),
    DropdownMenuItem(child: Text("Kuruba"), value: "Kuruba"),
    DropdownMenuItem(child: Text("Kuruhina Shetty"), value: "Kuruhina Shetty"),
    DropdownMenuItem(child: Text("Mitakri-Wani"), value: "Mitakri-Wani"),
    DropdownMenuItem(child: Text("Nhavi/Hadpad"), value: "Nhavi/Hadpad"),
    DropdownMenuItem(child: Text("Pancham"), value: "Pancham"),
    DropdownMenuItem(child: Text("Panchamsali"), value: "Panchamsali"),
    DropdownMenuItem(child: Text("Panchapeeta"), value: "Panchapeeta"),
    DropdownMenuItem(child: Text("Pattsali"), value: "Pattsali"),
    DropdownMenuItem(child: Text("Raswant Wani"), value: "Raswant Wani"),
    DropdownMenuItem(child: Text("Reddy"), value: "Reddy"),
    DropdownMenuItem(child: Text("Sadar/Sadharu"), value: "Sadar/Sadharu"),
    DropdownMenuItem(child: Text("Sajjana"), value: "Sajjana"),
    DropdownMenuItem(child: Text("Shilwant"), value: "Shilwant"),
    DropdownMenuItem(child: Text("Shivshimpi"), value: "Shilwant"),
    DropdownMenuItem(child: Text("Shuddha-shaiv"), value: "Shuddha-shaiv"),
    DropdownMenuItem(child: Text("Tamboli"), value: "Tamboli"),
    DropdownMenuItem(child: Text("Teli"), value: "Teli"),
    DropdownMenuItem(child: Text("Yellam"), value: "Yellam"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get subcastesOfLingayatEdit {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Aadi-Banajgar"), value: "Aadi-Banajgar"),
    DropdownMenuItem(child: Text("Aadi-Wani"), value: "Aadi-Wani"),
    DropdownMenuItem(child: Text("Banagar"), value: "Banagar"),
    DropdownMenuItem(child: Text("Banajigi"), value: "Banajigi"),
    DropdownMenuItem(child: Text("Bangar(Rangari)"), value: "Bangar(Rangari)"),
    DropdownMenuItem(child: Text("Bramhan"), value: "Bramhan"),
    DropdownMenuItem(child: Text("Chatur"), value: "Chatur"),
    DropdownMenuItem(child: Text("Chilwant"), value: "Chilwant"),
    DropdownMenuItem(child: Text("Deeksha"), value: "Deeksha"),
    DropdownMenuItem(child: Text("Devang"), value: "Devang"),
    DropdownMenuItem(child: Text("Dikshawant"), value: "Dikshawant"),
    DropdownMenuItem(child: Text("Full Mali"), value: "Full Mali"),
    DropdownMenuItem(child: Text("Ganiga"), value: "Ganiga"),
    DropdownMenuItem(child: Text("Gavali"), value: "Gavali"),
    DropdownMenuItem(child: Text("Gowda"), value: "Gowda"),
    DropdownMenuItem(child: Text("Gurav"), value: "Gurav"),
    DropdownMenuItem(child: Text("Hadpad"), value: "Hadpad"),
    DropdownMenuItem(child: Text("Hatgar-Koshti"), value: "Hatgar-Koshti"),
    DropdownMenuItem(child: Text("Hatgar"), value: "Hatgar"),
    DropdownMenuItem(child: Text("Jadar"), value: "Jadar"),
    DropdownMenuItem(child: Text("Kari Kul Ganiga"), value: "Kari Kul Ganiga"),
    DropdownMenuItem(child: Text("Koshti"), value: "Koshti"),
    DropdownMenuItem(child: Text("Kudwakkaliga"), value: "Kudwakkaliga"),
    DropdownMenuItem(child: Text("Kulwant"), value: "Kulwant"),
    DropdownMenuItem(child: Text("Kumbhar"), value: "Kumbhar"),
    DropdownMenuItem(child: Text("Kuruba"), value: "Kuruba"),
    DropdownMenuItem(child: Text("Kuruhina Shetty"), value: "Kuruhina Shetty"),
    DropdownMenuItem(child: Text("Mitakri-Wani"), value: "Mitakri-Wani"),
    DropdownMenuItem(child: Text("Nhavi/Hadpad"), value: "Nhavi/Hadpad"),
    DropdownMenuItem(child: Text("Pancham"), value: "Pancham"),
    DropdownMenuItem(child: Text("Panchamsali"), value: "Panchamsali"),
    DropdownMenuItem(child: Text("Panchapeeta"), value: "Panchapeeta"),
    DropdownMenuItem(child: Text("Pattsali"), value: "Pattsali"),
    DropdownMenuItem(child: Text("Raswant Wani"), value: "Raswant Wani"),
    DropdownMenuItem(child: Text("Reddy"), value: "Reddy"),
    DropdownMenuItem(child: Text("Sadar/Sadharu"), value: "Sadar/Sadharu"),
    DropdownMenuItem(child: Text("Sajjana"), value: "Sajjana"),
    DropdownMenuItem(child: Text("Shilwant"), value: "Shilwant"),
    DropdownMenuItem(child: Text("Shivshimpi"), value: "Shilwant"),
    DropdownMenuItem(child: Text("Shuddha-shaiv"), value: "Shuddha-shaiv"),
    DropdownMenuItem(child: Text("Tamboli"), value: "Tamboli"),
    DropdownMenuItem(child: Text("Teli"), value: "Teli"),
    DropdownMenuItem(child: Text("Yellam"), value: "Yellam"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get educationDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("All"), value: "All"),
    DropdownMenuItem(child: Text("Doctorate"), value: "Doctorate"),
    DropdownMenuItem(child: Text("Masters"), value: "Masters"),
    DropdownMenuItem(child: Text("Bachelors"), value: "Bachelors"),
    DropdownMenuItem(child: Text("Diploma"), value: "Diploma"),
    DropdownMenuItem(child: Text("Trade School"), value: "Trade School"),
    DropdownMenuItem(child: Text("High School"), value: "High School"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get educationDropdownItemsEdit {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(
        child: Text("Select any one option"), value: "Select any one option"),
    DropdownMenuItem(child: Text("Doctorate"), value: "Doctorate"),
    DropdownMenuItem(child: Text("Masters"), value: "Masters"),
    DropdownMenuItem(child: Text("Bachelors"), value: "Bachelors"),
    DropdownMenuItem(child: Text("Diploma"), value: "Diploma"),
    DropdownMenuItem(child: Text("Trade School"), value: "Trade School"),
    DropdownMenuItem(child: Text("High School"), value: "High School"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get educationDropdownItemsEditCopy {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(
        child: Text("Select any one option"), value: "Select any one option"),
    DropdownMenuItem(child: Text("Doctorate"), value: "Doctorate"),
    DropdownMenuItem(child: Text("Masters"), value: "Masters"),
    DropdownMenuItem(child: Text("Bachelors"), value: "Bachelors"),
    DropdownMenuItem(child: Text("Diploma"), value: "Diploma"),
    DropdownMenuItem(child: Text("Trade School"), value: "Trade School"),
    DropdownMenuItem(child: Text("High School"), value: "High School"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get urgencyDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(
        child: Text("Select any one option"), value: "Select any one option"),
    DropdownMenuItem(child: Text("Within 3 months"), value: "Within 3 months"),
    DropdownMenuItem(child: Text("Within 6 months"), value: "Within 6 months"),
    DropdownMenuItem(child: Text("Within 1 year"), value: "Within 1 year"),
    DropdownMenuItem(child: Text("Within 2 years"), value: "Within 2 years"),
    DropdownMenuItem(child: Text("No Hurry"), value: "No Hurry"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get occupationDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Any"), value: "Any"),
    DropdownMenuItem(child: Text("Accountant"), value: "Accountant"),
    DropdownMenuItem(child: Text("Administrative"), value: "Administrative"),
    DropdownMenuItem(child: Text("Advertising"), value: "Advertising"),
    DropdownMenuItem(
        child: Text("Agriculture/Farmer"), value: "Agriculture/Farmer"),
    DropdownMenuItem(
        child: Text("Airline Employee"), value: "Airline Employee"),
    DropdownMenuItem(child: Text("Air Hostess"), value: "Air Hostess"),
    DropdownMenuItem(child: Text("Architect"), value: "Architect"),
    DropdownMenuItem(
        child: Text("Banking Services"), value: "Banking Services"),
    DropdownMenuItem(
        child: Text("Beauty, Health & Fitness Professional"),
        value: "Beauty, Health & Fitness Professional"),
    DropdownMenuItem(child: Text("Business"), value: "Business"),
    DropdownMenuItem(
        child: Text("Chartered Accountant"), value: "Chartered Accountant"),
    DropdownMenuItem(child: Text("Civil Engineer"), value: "Civil Engineer"),
    DropdownMenuItem(
        child: Text("Civil Services (IAS/IFS/IPS/IRS/etc.)"),
        value: "Civil Services (IAS/IFS/IPS/IRS/etc.)"),
    DropdownMenuItem(child: Text("Clerical"), value: "Clerical"),
    DropdownMenuItem(
        child: Text("Company Secretary"), value: "Company Secretary"),
    DropdownMenuItem(
        child: Text("Computer Engineer"), value: "Computer Engineer"),
    DropdownMenuItem(
        child: Text("Commercial Pilot"), value: "Commercial Pilot"),
    DropdownMenuItem(child: Text("Consultant"), value: "Consultant"),
    DropdownMenuItem(child: Text("Cost Accountant"), value: "Cost Accountant"),
    DropdownMenuItem(
        child: Text("Defence Services"), value: "Defence Services"),
    DropdownMenuItem(child: Text("Doctor"), value: "Doctor"),
    DropdownMenuItem(child: Text("Engineer"), value: "Engineer"),
    DropdownMenuItem(
        child: Text("Event Management"), value: "Event Management"),
    DropdownMenuItem(child: Text("Executive"), value: "Executive"),
    DropdownMenuItem(
        child: Text("Fashion Designer"), value: "Fashion Designer"),
    DropdownMenuItem(child: Text("Finance"), value: "Finance"),
    DropdownMenuItem(child: Text("Govt. Service"), value: "Govt. Service"),
    DropdownMenuItem(
        child: Text("Hotel Restaurant Professional"),
        value: "Hotel Restaurant Professional"),
    DropdownMenuItem(child: Text("Industrialist"), value: "Industrialist"),
    DropdownMenuItem(
        child: Text("Interior Designer"), value: "Interior Designer"),
    DropdownMenuItem(
        child: Text("IT/Telecommunications"), value: "IT/Telecommunications"),
    DropdownMenuItem(child: Text("Lawyer"), value: "Lawyer"),
    DropdownMenuItem(child: Text("Liaison"), value: "Liaison"),
    DropdownMenuItem(child: Text("Management"), value: "Management"),
    DropdownMenuItem(
        child: Text("Mechanical Engineer"), value: "Mechanical Engineer"),
    DropdownMenuItem(child: Text("Media"), value: "Media"),
    DropdownMenuItem(
        child: Text("Medical Assistant"), value: "Medical Assistant"),
    DropdownMenuItem(
        child: Text("Medical Profession"), value: "Medical Profession"),
    DropdownMenuItem(
        child: Text("Medical Transcription"), value: "Medical Transcription"),
    DropdownMenuItem(child: Text("Merchant Navy"), value: "Merchant Navy"),
    DropdownMenuItem(child: Text("Non-Working"), value: "Non-Working"),
    DropdownMenuItem(child: Text("Nurse"), value: "Nurse"),
    DropdownMenuItem(child: Text("Pharmacist"), value: "Pharmacist"),
    DropdownMenuItem(child: Text("Physiotherapist"), value: "Physiotherapist"),
    DropdownMenuItem(child: Text("Professor"), value: "Professor"),
    DropdownMenuItem(
        child: Text("Project Engineer"), value: "Project Engineer"),
    DropdownMenuItem(child: Text("Private Service"), value: "Private Service"),
    DropdownMenuItem(
        child: Text("Public Relations"), value: "Public Relations"),
    DropdownMenuItem(child: Text("Real Estate"), value: "Real Estate"),
    DropdownMenuItem(
        child: Text("Research Scholar/PhD"), value: "Research Scholar/PhD"),
    DropdownMenuItem(child: Text("Retired"), value: "Retired"),
    DropdownMenuItem(child: Text("Sales/Marketing"), value: "Sales/Marketing"),
    DropdownMenuItem(child: Text("Scientist"), value: "Scientist"),
    DropdownMenuItem(child: Text("Self Employed"), value: "Self Employed"),
    DropdownMenuItem(child: Text("Social Services"), value: "Social Services"),
    DropdownMenuItem(
        child: Text("Software Professional"), value: "Software Professional"),
    DropdownMenuItem(child: Text("Stock Broker"), value: "Stock Broker"),
    DropdownMenuItem(child: Text("Student"), value: "Student"),
    DropdownMenuItem(child: Text("Teacher"), value: "Teacher"),
    DropdownMenuItem(child: Text("Technician"), value: "Technician"),
    DropdownMenuItem(
        child: Text("Travel & Tourism Professional"),
        value: "Travel & Tourism Professional"),
    DropdownMenuItem(child: Text("Writer/Author"), value: "Writer/Author"),
    DropdownMenuItem(child: Text("Others"), value: "Others"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get occupationDropdownItemsEdit {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(
        child: Text("Select Occupation>"), value: "Select Occupation>"),
    DropdownMenuItem(child: Text("Accountant"), value: "Accountant"),
    DropdownMenuItem(child: Text("Administrative"), value: "Administrative"),
    DropdownMenuItem(child: Text("Advertising"), value: "Advertising"),
    DropdownMenuItem(
        child: Text("Agriculture/Farmer"), value: "Agriculture/Farmer"),
    DropdownMenuItem(
        child: Text("Airline Employee"), value: "Airline Employee"),
    DropdownMenuItem(child: Text("Air Hostess"), value: "Air Hostess"),
    DropdownMenuItem(child: Text("Architect"), value: "Architect"),
    DropdownMenuItem(
        child: Text("Banking Services"), value: "Banking Services"),
    DropdownMenuItem(
        child: Text("Beauty, Health & Fitness Professional"),
        value: "Beauty, Health & Fitness Professional"),
    DropdownMenuItem(child: Text("Business"), value: "Business"),
    DropdownMenuItem(
        child: Text("Chartered Accountant"), value: "Chartered Accountant"),
    DropdownMenuItem(child: Text("Civil Engineer"), value: "Civil Engineer"),
    DropdownMenuItem(
        child: Text("Civil Services (IAS/IFS/IPS/IRS/etc.)"),
        value: "Civil Services (IAS/IFS/IPS/IRS/etc.)"),
    DropdownMenuItem(child: Text("Clerical"), value: "Clerical"),
    DropdownMenuItem(
        child: Text("Company Secretary"), value: "Company Secretary"),
    DropdownMenuItem(
        child: Text("Computer Engineer"), value: "Computer Engineer"),
    DropdownMenuItem(
        child: Text("Commercial Pilot"), value: "Commercial Pilot"),
    DropdownMenuItem(child: Text("Consultant"), value: "Consultant"),
    DropdownMenuItem(child: Text("Cost Accountant"), value: "Cost Accountant"),
    DropdownMenuItem(
        child: Text("Defence Services"), value: "Defence Services"),
    DropdownMenuItem(child: Text("Doctor"), value: "Doctor"),
    DropdownMenuItem(child: Text("Engineer"), value: "Engineer"),
    DropdownMenuItem(
        child: Text("Event Management"), value: "Event Management"),
    DropdownMenuItem(child: Text("Executive"), value: "Executive"),
    DropdownMenuItem(
        child: Text("Fashion Designer"), value: "Fashion Designer"),
    DropdownMenuItem(child: Text("Finance"), value: "Finance"),
    DropdownMenuItem(child: Text("Govt. Service"), value: "Govt. Service"),
    DropdownMenuItem(
        child: Text("Hotel Restaurant Professional"),
        value: "Hotel Restaurant Professional"),
    DropdownMenuItem(child: Text("Industrialist"), value: "Industrialist"),
    DropdownMenuItem(
        child: Text("Interior Designer"), value: "Interior Designer"),
    DropdownMenuItem(
        child: Text("IT/Telecommunications"), value: "IT/Telecommunications"),
    DropdownMenuItem(child: Text("Lawyer"), value: "Lawyer"),
    DropdownMenuItem(child: Text("Liaison"), value: "Liaison"),
    DropdownMenuItem(child: Text("Management"), value: "Management"),
    DropdownMenuItem(
        child: Text("Mechanical Engineer"), value: "Mechanical Engineer"),
    DropdownMenuItem(child: Text("Media"), value: "Media"),
    DropdownMenuItem(
        child: Text("Medical Assistant"), value: "Medical Assistant"),
    DropdownMenuItem(
        child: Text("Medical Profession"), value: "Medical Profession"),
    DropdownMenuItem(
        child: Text("Medical Transcription"), value: "Medical Transcription"),
    DropdownMenuItem(child: Text("Merchant Navy"), value: "Merchant Navy"),
    DropdownMenuItem(child: Text("Non-Working"), value: "Non-Working"),
    DropdownMenuItem(child: Text("Nurse"), value: "Nurse"),
    DropdownMenuItem(child: Text("Pharmacist"), value: "Pharmacist"),
    DropdownMenuItem(child: Text("Physiotherapist"), value: "Physiotherapist"),
    DropdownMenuItem(child: Text("Professor"), value: "Professor"),
    DropdownMenuItem(
        child: Text("Project Engineer"), value: "Project Engineer"),
    DropdownMenuItem(child: Text("Private Service"), value: "Private Service"),
    DropdownMenuItem(
        child: Text("Public Relations"), value: "Public Relations"),
    DropdownMenuItem(child: Text("Real Estate"), value: "Real Estate"),
    DropdownMenuItem(
        child: Text("Research Scholar/PhD"), value: "Research Scholar/PhD"),
    DropdownMenuItem(child: Text("Retired"), value: "Retired"),
    DropdownMenuItem(child: Text("Sales/Marketing"), value: "Sales/Marketing"),
    DropdownMenuItem(child: Text("Scientist"), value: "Scientist"),
    DropdownMenuItem(child: Text("Self Employed"), value: "Self Employed"),
    DropdownMenuItem(child: Text("Social Services"), value: "Social Services"),
    DropdownMenuItem(
        child: Text("Software Professional"), value: "Software Professional"),
    DropdownMenuItem(child: Text("Stock Broker"), value: "Stock Broker"),
    DropdownMenuItem(child: Text("Student"), value: "Student"),
    DropdownMenuItem(child: Text("Teacher"), value: "Teacher"),
    DropdownMenuItem(child: Text("Technician"), value: "Technician"),
    DropdownMenuItem(
        child: Text("Travel & Tourism Professional"),
        value: "Travel & Tourism Professional"),
    DropdownMenuItem(child: Text("Writer/Author"), value: "Writer/Author"),
    DropdownMenuItem(child: Text("Others"), value: "Others"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get maritalDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("Never Married"), value: "Never Married"),
    DropdownMenuItem(child: Text("Married"), value: "Married"),
    DropdownMenuItem(child: Text("Divorcee"), value: "Divorcee"),
    DropdownMenuItem(child: Text("Widow"), value: "Widow"),
    DropdownMenuItem(child: Text("Widower"), value: "Widower"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get maritalDropdownItemsEdit {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Never Married"), value: "Never Married"),
    DropdownMenuItem(child: Text("Married"), value: "Married"),
    DropdownMenuItem(child: Text("Divorcee"), value: "Divorcee"),
    DropdownMenuItem(child: Text("Widow"), value: "Widow"),
    DropdownMenuItem(child: Text("Widower"), value: "Widower"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get manglikDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("Manglik"), value: "Manglik"),
    DropdownMenuItem(child: Text("NonManglik"), value: "NonManglik"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get manglikDropdownItemsCopy {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("Manglik"), value: "Manglik"),
    DropdownMenuItem(child: Text("NonManglik"), value: "NonManglik"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get rCasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("No"), value: "No"),
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get rSubcasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("No"), value: "No"),
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get intercasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("No"), value: "No"),
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get intercasteDropdownItemsEdit {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("No"), value: "No"),
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get rIntercasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("No"), value: "No"),
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get tongueDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Please select"), value: "Please select"),
    DropdownMenuItem(child: Text("Assamese"), value: "Assamese"),
    DropdownMenuItem(child: Text("Bengali"), value: "Bengali"),
    DropdownMenuItem(child: Text("English"), value: "English"),
    DropdownMenuItem(child: Text("Gujarati"), value: "Gujarati"),
    DropdownMenuItem(child: Text("Hindi"), value: "Hindi"),
    DropdownMenuItem(child: Text("Kannada"), value: "Kannada"),
    DropdownMenuItem(child: Text("Kashmiri"), value: "Kashmiri"),
    DropdownMenuItem(child: Text("Konkani"), value: "Konkani"),
    DropdownMenuItem(child: Text("Malayalam"), value: "Malayalam"),
    DropdownMenuItem(child: Text("Manipuri"), value: "Manipuri"),
    DropdownMenuItem(child: Text("Marathi"), value: "Marathi"),
    DropdownMenuItem(child: Text("Nepali"), value: "Nepali"),
    DropdownMenuItem(child: Text("Oriya"), value: "Oriya"),
    DropdownMenuItem(child: Text("Punjabi"), value: "Punjabi"),
    DropdownMenuItem(child: Text("Sanskrit"), value: "Sanskrit"),
    DropdownMenuItem(child: Text("Sindhi"), value: "Sindhi"),
    DropdownMenuItem(child: Text("Tamil"), value: "Tamil"),
    DropdownMenuItem(child: Text("Telegu"), value: "Telegu"),
    DropdownMenuItem(child: Text("Urdu"), value: "Urdu"),
    DropdownMenuItem(child: Text("Bodo"), value: "Bodo"),
    DropdownMenuItem(child: Text("Santhili"), value: "Santhili"),
    DropdownMenuItem(child: Text("Maithili"), value: "Maithili"),
    DropdownMenuItem(child: Text("Dogri"), value: "Dogri"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get incomeDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("Under Rs.50,000"), value: "Under Rs.50,000"),
    DropdownMenuItem(
        child: Text("Rs.50,001 - 1,00,000"), value: "Rs.50,001 - 1,00,000"),
    DropdownMenuItem(
        child: Text("Rs.1,00,001 - 2,00,000"), value: "Rs.1,00,001 - 2,00,000"),
    DropdownMenuItem(
        child: Text("Rs.2,00,001 - 3,00,000"), value: "Rs.2,00,001 - 3,00,000"),
    DropdownMenuItem(
        child: Text("Rs.3,00,001 - 4,00,000"), value: "Rs.3,00,001 - 4,00,000"),
    DropdownMenuItem(
        child: Text("Rs.4,00,001 - 5,00,000"), value: "Rs.4,00,001 - 5,00,000"),
    DropdownMenuItem(
        child: Text("Rs.5,00,001 - 7,50,000"), value: "Rs.5,00,001 - 7,00,000"),
    DropdownMenuItem(
        child: Text("Rs.7,50,001 - 10,00,000"),
        value: "Rs.7,50,001 - 10,00,000"),
    DropdownMenuItem(
        child: Text("Rs.10,00,001 - 15,00,000"),
        value: "Rs.10,00,001 - 15,00,000"),
    DropdownMenuItem(
        child: Text("Rs.15,00,001 - 20,00,000"),
        value: "Rs.15,00,001 - 20,00,000"),
    DropdownMenuItem(
        child: Text("Rs.20,00,001 - 25,00,000"),
        value: "Rs.20,00,001 - 25,00,000"),
    DropdownMenuItem(
        child: Text("Rs.25,00,001 - 30,00,000"),
        value: "Rs.25,00,001 - 30,00,000"),
    DropdownMenuItem(
        child: Text("Rs.30,00,001 - 35,00,000"),
        value: "Rs.30,00,001 - 35,00,000"),
    DropdownMenuItem(
        child: Text("Rs.35,00,001 - 40,00,000"),
        value: "Rs.35,00,001 - 40,00,000"),
    DropdownMenuItem(
        child: Text("Rs.40,00,001 - 50,00,000"),
        value: "Rs.40,00,001 - 50,00,000"),
    DropdownMenuItem(
        child: Text("Rs.50,001 and above"), value: "Rs.50,001 and above"),
    DropdownMenuItem(child: Text("Under \$25,000"), value: "Under \$25,000"),
    DropdownMenuItem(
        child: Text("\$25,001 - 50,000"), value: "\$25,001 - 50,000"),
    DropdownMenuItem(
        child: Text("\$50,001 - 75,000"), value: "\$50,001 - 75,000"),
    DropdownMenuItem(
        child: Text("\$75,001 - 100,000"), value: "\$75,001 - 100,000"),
    DropdownMenuItem(
        child: Text("\$100,001 - 150,000"), value: "\$100,001 - 150,000"),
    DropdownMenuItem(
        child: Text("\$150,001 - 200,000"), value: "\$150,001 - 200,000"),
    DropdownMenuItem(
        child: Text("\$200,001 and above"), value: "\$200,001 and above"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get settlingAbroadDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(
        child: Text("Select any one option"), value: "Select any one option"),
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    DropdownMenuItem(child: Text("No"), value: "No"),
    DropdownMenuItem(child: Text("Not Decided"), value: "Not Decided"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get residencyDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(
        child: Text("Select any one option"), value: "Select any one option"),
    DropdownMenuItem(
        child: Text("Permanent Residency"), value: "Permanent Residency"),
    DropdownMenuItem(child: Text("Student Visa"), value: "Student Visa"),
    DropdownMenuItem(child: Text("Work Permit"), value: "Work Permit"),
    DropdownMenuItem(
        child: Text("Green Card Holder"), value: "Green Card Holder"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get countryDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Please select"), value: "Please select"),
    DropdownMenuItem(child: Text("India"), value: "India"),
    DropdownMenuItem(child: Text("Afghanistan"), value: "Afghanistan"),
    DropdownMenuItem(child: Text("Albania"), value: "Albania"),
    DropdownMenuItem(child: Text("Algeria"), value: "Algeria"),
    DropdownMenuItem(child: Text("Angola"), value: "Angola"),
    DropdownMenuItem(child: Text("Argentina"), value: "Argentina"),
    DropdownMenuItem(child: Text("Armenia"), value: "Armenia"),
    DropdownMenuItem(child: Text("Australia"), value: "Australia"),
    DropdownMenuItem(child: Text("Austria"), value: "Austria"),
    DropdownMenuItem(child: Text("Bahamas"), value: "Bahamas"),
    DropdownMenuItem(child: Text("Bahrain"), value: "Bahrain"),
    DropdownMenuItem(child: Text("Bangladesh"), value: "Bangladesh"),
    DropdownMenuItem(child: Text("Belgium"), value: "Belgium"),
    DropdownMenuItem(child: Text("Bermuda"), value: "Bermuda"),
    DropdownMenuItem(child: Text("Bhutan"), value: "Bhutan"),
    DropdownMenuItem(child: Text("Bolivia"), value: "Bolivia"),
    DropdownMenuItem(
        child: Text("Bosnia-Herzegovin"), value: "Bosnia-Herzegovin"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("Brunei"), value: "Brunei"),
    DropdownMenuItem(child: Text("Bulgaria"), value: "Bulgaria"),
    DropdownMenuItem(child: Text("Cambodia"), value: "Cambodia"),
    DropdownMenuItem(child: Text("Cameroon"), value: "Cameroon"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Canary Islands"), value: "Canary Islands"),
    DropdownMenuItem(child: Text("Chile"), value: "Chile"),
    DropdownMenuItem(child: Text("China"), value: "China"),
    DropdownMenuItem(child: Text("Colombia"), value: "Colombia"),
    DropdownMenuItem(child: Text("Congo"), value: "Congo"),
    DropdownMenuItem(child: Text("Costa Rica"), value: "Costa Rica"),
    DropdownMenuItem(child: Text("Croatia"), value: "Croatia"),
    DropdownMenuItem(child: Text("Cuba"), value: "Cuba"),
    DropdownMenuItem(child: Text("Cyprus"), value: "Cyprus"),
    DropdownMenuItem(child: Text("Czech Republic"), value: "Czech Republic"),
    DropdownMenuItem(child: Text("Denmark"), value: "Denmark"),
    DropdownMenuItem(child: Text("Ecuador"), value: "Ecuador"),
    DropdownMenuItem(child: Text("Egypt"), value: "Egypt"),
    DropdownMenuItem(child: Text("El Salvador"), value: "El Salvador"),
    DropdownMenuItem(
        child: Text("Falkland Islands"), value: "Falkland Islands"),
    DropdownMenuItem(child: Text("Fiji"), value: "Fiji"),
    DropdownMenuItem(child: Text("Finland"), value: "Finland"),
    DropdownMenuItem(child: Text("France"), value: "France"),
    DropdownMenuItem(child: Text("Georgia"), value: "Georgia"),
    DropdownMenuItem(child: Text("Germany"), value: "Germany"),
    DropdownMenuItem(child: Text("Ghana"), value: "Ghana"),
    DropdownMenuItem(child: Text("Gibraltar"), value: "Gibraltar"),
    DropdownMenuItem(child: Text("Greece"), value: "Greece"),
    DropdownMenuItem(child: Text("Haiti"), value: "Haiti"),
    DropdownMenuItem(child: Text("Holland"), value: "Holland"),
    DropdownMenuItem(child: Text("Hong Kong"), value: "Hong Kong"),
    DropdownMenuItem(child: Text("Hungary"), value: "Hungary"),
    DropdownMenuItem(child: Text("Iceland"), value: "Iceland"),
    DropdownMenuItem(child: Text("Indonesia"), value: "Indonesia"),
    DropdownMenuItem(child: Text("Iran"), value: "Iran"),
    DropdownMenuItem(child: Text("Iraq"), value: "Iraq"),
    DropdownMenuItem(child: Text("Ireland"), value: "Ireland"),
    DropdownMenuItem(child: Text("Israel"), value: "Israel"),
    DropdownMenuItem(child: Text("Italy"), value: "Italy"),
    DropdownMenuItem(child: Text("Jamaica"), value: "Jamaica"),
    DropdownMenuItem(child: Text("Japan"), value: "Japan"),
    DropdownMenuItem(child: Text("Jordan"), value: "Jordan"),
    DropdownMenuItem(child: Text("Kazakhstan"), value: "Kazakhstan"),
    DropdownMenuItem(child: Text("Kenya"), value: "Kenya"),
    DropdownMenuItem(child: Text("Kuwait"), value: "Kuwait"),
    DropdownMenuItem(child: Text("Kyrygzstan"), value: "Kyrygzstan"),
    DropdownMenuItem(child: Text("Latvia"), value: "Latvia"),
    DropdownMenuItem(child: Text("Lebanon"), value: "Lebanon"),
    DropdownMenuItem(child: Text("Libya"), value: "Libya"),
    DropdownMenuItem(child: Text("Lithuania"), value: "Lithuania"),
    DropdownMenuItem(child: Text("Luxembourg"), value: "Luxembourg"),
    DropdownMenuItem(child: Text("Malaysia"), value: "Malaysia"),
    DropdownMenuItem(child: Text("Maldives"), value: "Maldives"),
    DropdownMenuItem(child: Text("Mali"), value: "Mali"),
    DropdownMenuItem(child: Text("Malta"), value: "Malta"),
    DropdownMenuItem(child: Text("Mauritius"), value: "Mauritius"),
    DropdownMenuItem(child: Text("Mongolia"), value: "Mongolia"),
    DropdownMenuItem(child: Text("Mexico"), value: "Mexico"),
    DropdownMenuItem(child: Text("Morocco"), value: "Morocco"),
    DropdownMenuItem(child: Text("Myanmar"), value: "Myanmar"),
    DropdownMenuItem(child: Text("Namibia"), value: "Namibia"),
    DropdownMenuItem(child: Text("Nepal"), value: "Nepal"),
    DropdownMenuItem(child: Text("Netherlands"), value: "Netherlands"),
    DropdownMenuItem(child: Text("New Zealand"), value: "New Zealand"),
    DropdownMenuItem(child: Text("Nicaragua"), value: "Nicaragua"),
    DropdownMenuItem(child: Text("Nigeria"), value: "Nigeria"),
    DropdownMenuItem(child: Text("North Korea"), value: "North Korea"),
    DropdownMenuItem(child: Text("Norway"), value: "Norway"),
    DropdownMenuItem(child: Text("Oman"), value: "Oman"),
    DropdownMenuItem(child: Text("Pakistan"), value: "Pakistan"),
    DropdownMenuItem(child: Text("Panama"), value: "Panama"),
    DropdownMenuItem(child: Text("Paraguay"), value: "Paraguay"),
    DropdownMenuItem(child: Text("Peru"), value: "Peru"),
    DropdownMenuItem(child: Text("Philippines"), value: "Philippines"),
    DropdownMenuItem(child: Text("Poland"), value: "Poland"),
    DropdownMenuItem(child: Text("Portugal"), value: "Portugal"),
    DropdownMenuItem(child: Text("Puerto Rico"), value: "Puerto Rico"),
    DropdownMenuItem(child: Text("Qatar"), value: "Qatar"),
    DropdownMenuItem(child: Text("Romania"), value: "Romania"),
    DropdownMenuItem(child: Text("Russia"), value: "Russia"),
    DropdownMenuItem(child: Text("Saudi Arabia"), value: "Saudi Arabia"),
    DropdownMenuItem(child: Text("Senegal"), value: "Senegal"),
    DropdownMenuItem(child: Text("Seychelles"), value: "Seychelles"),
    DropdownMenuItem(child: Text("Sierra Leone"), value: "Sierra Leone"),
    DropdownMenuItem(child: Text("Singapore"), value: "Singapore"),
    DropdownMenuItem(child: Text("Slovakia"), value: "Slovakia"),
    DropdownMenuItem(child: Text("Slovenia"), value: "Slovenia"),
    DropdownMenuItem(child: Text("Somalia"), value: "Somalia"),
    DropdownMenuItem(child: Text("South Africa"), value: "South Africa"),
    DropdownMenuItem(child: Text("South Korea"), value: "South Korea"),
    DropdownMenuItem(child: Text("Spain"), value: "Spain"),
    DropdownMenuItem(child: Text("Sri Lanka"), value: "Sri Lanka"),
    DropdownMenuItem(child: Text("Sudan"), value: "Sudan"),
    DropdownMenuItem(child: Text("Sweden"), value: "Sweden"),
    DropdownMenuItem(child: Text("Switzerland"), value: "Switzerland"),
    DropdownMenuItem(child: Text("Syria"), value: "Syria"),
    DropdownMenuItem(child: Text("Tahiti"), value: "Tahiti"),
    DropdownMenuItem(child: Text("Taiwan"), value: "Taiwan"),
    DropdownMenuItem(child: Text("Tajikistan"), value: "Tajikistan"),
    DropdownMenuItem(child: Text("Tanzania"), value: "Tanzania"),
    DropdownMenuItem(child: Text("Thailand"), value: "Thailand"),
    DropdownMenuItem(child: Text("Tunisia"), value: "Tunisia"),
    DropdownMenuItem(child: Text("Turkey"), value: "Turkey"),
    DropdownMenuItem(child: Text("Turkmenistan"), value: "Turkmenistan"),
    DropdownMenuItem(child: Text("Uganda"), value: "Uganda"),
    DropdownMenuItem(child: Text("Ukraine"), value: "Ukraine"),
    DropdownMenuItem(
        child: Text("United Arab Emirates"), value: "United Arab Emirates"),
    DropdownMenuItem(child: Text("United Kingdom"), value: "United Kingdom"),
    DropdownMenuItem(child: Text("Uruguay"), value: "Uruguay"),
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("Uzbekistan"), value: "Uzbekistan"),
    DropdownMenuItem(child: Text("Venezuela"), value: "Venezuela"),
    DropdownMenuItem(child: Text("Vietnam"), value: "Vietnam"),
    DropdownMenuItem(child: Text("Yemen"), value: "Yemen"),
    DropdownMenuItem(child: Text("Yugoslavia"), value: "Yugoslavia"),
    DropdownMenuItem(child: Text("Zambia"), value: "Zambia"),
    DropdownMenuItem(child: Text("Zimbabwe"), value: "Zimbabwe"),
    DropdownMenuItem(child: Text("Other"), value: "Other"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get countryDropdownItemsCopy {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Please select"), value: "Please select"),
    DropdownMenuItem(child: Text("India"), value: "India"),
    DropdownMenuItem(child: Text("Afghanistan"), value: "Afghanistan"),
    DropdownMenuItem(child: Text("Albania"), value: "Albania"),
    DropdownMenuItem(child: Text("Algeria"), value: "Algeria"),
    DropdownMenuItem(child: Text("Angola"), value: "Angola"),
    DropdownMenuItem(child: Text("Argentina"), value: "Argentina"),
    DropdownMenuItem(child: Text("Armenia"), value: "Armenia"),
    DropdownMenuItem(child: Text("Australia"), value: "Australia"),
    DropdownMenuItem(child: Text("Austria"), value: "Austria"),
    DropdownMenuItem(child: Text("Bahamas"), value: "Bahamas"),
    DropdownMenuItem(child: Text("Bahrain"), value: "Bahrain"),
    DropdownMenuItem(child: Text("Bangladesh"), value: "Bangladesh"),
    DropdownMenuItem(child: Text("Belgium"), value: "Belgium"),
    DropdownMenuItem(child: Text("Bermuda"), value: "Bermuda"),
    DropdownMenuItem(child: Text("Bhutan"), value: "Bhutan"),
    DropdownMenuItem(child: Text("Bolivia"), value: "Bolivia"),
    DropdownMenuItem(
        child: Text("Bosnia-Herzegovin"), value: "Bosnia-Herzegovin"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("Brunei"), value: "Brunei"),
    DropdownMenuItem(child: Text("Bulgaria"), value: "Bulgaria"),
    DropdownMenuItem(child: Text("Cambodia"), value: "Cambodia"),
    DropdownMenuItem(child: Text("Cameroon"), value: "Cameroon"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Canary Islands"), value: "Canary Islands"),
    DropdownMenuItem(child: Text("Chile"), value: "Chile"),
    DropdownMenuItem(child: Text("China"), value: "China"),
    DropdownMenuItem(child: Text("Colombia"), value: "Colombia"),
    DropdownMenuItem(child: Text("Congo"), value: "Congo"),
    DropdownMenuItem(child: Text("Costa Rica"), value: "Costa Rica"),
    DropdownMenuItem(child: Text("Croatia"), value: "Croatia"),
    DropdownMenuItem(child: Text("Cuba"), value: "Cuba"),
    DropdownMenuItem(child: Text("Cyprus"), value: "Cyprus"),
    DropdownMenuItem(child: Text("Czech Republic"), value: "Czech Republic"),
    DropdownMenuItem(child: Text("Denmark"), value: "Denmark"),
    DropdownMenuItem(child: Text("Ecuador"), value: "Ecuador"),
    DropdownMenuItem(child: Text("Egypt"), value: "Egypt"),
    DropdownMenuItem(child: Text("El Salvador"), value: "El Salvador"),
    DropdownMenuItem(
        child: Text("Falkland Islands"), value: "Falkland Islands"),
    DropdownMenuItem(child: Text("Fiji"), value: "Fiji"),
    DropdownMenuItem(child: Text("Finland"), value: "Finland"),
    DropdownMenuItem(child: Text("France"), value: "France"),
    DropdownMenuItem(child: Text("Georgia"), value: "Georgia"),
    DropdownMenuItem(child: Text("Germany"), value: "Germany"),
    DropdownMenuItem(child: Text("Ghana"), value: "Ghana"),
    DropdownMenuItem(child: Text("Gibraltar"), value: "Gibraltar"),
    DropdownMenuItem(child: Text("Greece"), value: "Greece"),
    DropdownMenuItem(child: Text("Haiti"), value: "Haiti"),
    DropdownMenuItem(child: Text("Holland"), value: "Holland"),
    DropdownMenuItem(child: Text("Hong Kong"), value: "Hong Kong"),
    DropdownMenuItem(child: Text("Hungary"), value: "Hungary"),
    DropdownMenuItem(child: Text("Iceland"), value: "Iceland"),
    DropdownMenuItem(child: Text("Indonesia"), value: "Indonesia"),
    DropdownMenuItem(child: Text("Iran"), value: "Iran"),
    DropdownMenuItem(child: Text("Iraq"), value: "Iraq"),
    DropdownMenuItem(child: Text("Ireland"), value: "Ireland"),
    DropdownMenuItem(child: Text("Israel"), value: "Israel"),
    DropdownMenuItem(child: Text("Italy"), value: "Italy"),
    DropdownMenuItem(child: Text("Jamaica"), value: "Jamaica"),
    DropdownMenuItem(child: Text("Japan"), value: "Japan"),
    DropdownMenuItem(child: Text("Jordan"), value: "Jordan"),
    DropdownMenuItem(child: Text("Kazakhstan"), value: "Kazakhstan"),
    DropdownMenuItem(child: Text("Kenya"), value: "Kenya"),
    DropdownMenuItem(child: Text("Kuwait"), value: "Kuwait"),
    DropdownMenuItem(child: Text("Kyrygzstan"), value: "Kyrygzstan"),
    DropdownMenuItem(child: Text("Latvia"), value: "Latvia"),
    DropdownMenuItem(child: Text("Lebanon"), value: "Lebanon"),
    DropdownMenuItem(child: Text("Libya"), value: "Libya"),
    DropdownMenuItem(child: Text("Lithuania"), value: "Lithuania"),
    DropdownMenuItem(child: Text("Luxembourg"), value: "Luxembourg"),
    DropdownMenuItem(child: Text("Malaysia"), value: "Malaysia"),
    DropdownMenuItem(child: Text("Maldives"), value: "Maldives"),
    DropdownMenuItem(child: Text("Mali"), value: "Mali"),
    DropdownMenuItem(child: Text("Malta"), value: "Malta"),
    DropdownMenuItem(child: Text("Mauritius"), value: "Mauritius"),
    DropdownMenuItem(child: Text("Mongolia"), value: "Mongolia"),
    DropdownMenuItem(child: Text("Mexico"), value: "Mexico"),
    DropdownMenuItem(child: Text("Morocco"), value: "Morocco"),
    DropdownMenuItem(child: Text("Myanmar"), value: "Myanmar"),
    DropdownMenuItem(child: Text("Namibia"), value: "Namibia"),
    DropdownMenuItem(child: Text("Nepal"), value: "Nepal"),
    DropdownMenuItem(child: Text("Netherlands"), value: "Netherlands"),
    DropdownMenuItem(child: Text("New Zealand"), value: "New Zealand"),
    DropdownMenuItem(child: Text("Nicaragua"), value: "Nicaragua"),
    DropdownMenuItem(child: Text("Nigeria"), value: "Nigeria"),
    DropdownMenuItem(child: Text("North Korea"), value: "North Korea"),
    DropdownMenuItem(child: Text("Norway"), value: "Norway"),
    DropdownMenuItem(child: Text("Oman"), value: "Oman"),
    DropdownMenuItem(child: Text("Pakistan"), value: "Pakistan"),
    DropdownMenuItem(child: Text("Panama"), value: "Panama"),
    DropdownMenuItem(child: Text("Paraguay"), value: "Paraguay"),
    DropdownMenuItem(child: Text("Peru"), value: "Peru"),
    DropdownMenuItem(child: Text("Philippines"), value: "Philippines"),
    DropdownMenuItem(child: Text("Poland"), value: "Poland"),
    DropdownMenuItem(child: Text("Portugal"), value: "Portugal"),
    DropdownMenuItem(child: Text("Puerto Rico"), value: "Puerto Rico"),
    DropdownMenuItem(child: Text("Qatar"), value: "Qatar"),
    DropdownMenuItem(child: Text("Romania"), value: "Romania"),
    DropdownMenuItem(child: Text("Russia"), value: "Russia"),
    DropdownMenuItem(child: Text("Saudi Arabia"), value: "Saudi Arabia"),
    DropdownMenuItem(child: Text("Senegal"), value: "Senegal"),
    DropdownMenuItem(child: Text("Seychelles"), value: "Seychelles"),
    DropdownMenuItem(child: Text("Sierra Leone"), value: "Sierra Leone"),
    DropdownMenuItem(child: Text("Singapore"), value: "Singapore"),
    DropdownMenuItem(child: Text("Slovakia"), value: "Slovakia"),
    DropdownMenuItem(child: Text("Slovenia"), value: "Slovenia"),
    DropdownMenuItem(child: Text("Somalia"), value: "Somalia"),
    DropdownMenuItem(child: Text("South Africa"), value: "South Africa"),
    DropdownMenuItem(child: Text("South Korea"), value: "South Korea"),
    DropdownMenuItem(child: Text("Spain"), value: "Spain"),
    DropdownMenuItem(child: Text("Sri Lanka"), value: "Sri Lanka"),
    DropdownMenuItem(child: Text("Sudan"), value: "Sudan"),
    DropdownMenuItem(child: Text("Sweden"), value: "Sweden"),
    DropdownMenuItem(child: Text("Switzerland"), value: "Switzerland"),
    DropdownMenuItem(child: Text("Syria"), value: "Syria"),
    DropdownMenuItem(child: Text("Tahiti"), value: "Tahiti"),
    DropdownMenuItem(child: Text("Taiwan"), value: "Taiwan"),
    DropdownMenuItem(child: Text("Tajikistan"), value: "Tajikistan"),
    DropdownMenuItem(child: Text("Tanzania"), value: "Tanzania"),
    DropdownMenuItem(child: Text("Thailand"), value: "Thailand"),
    DropdownMenuItem(child: Text("Tunisia"), value: "Tunisia"),
    DropdownMenuItem(child: Text("Turkey"), value: "Turkey"),
    DropdownMenuItem(child: Text("Turkmenistan"), value: "Turkmenistan"),
    DropdownMenuItem(child: Text("Uganda"), value: "Uganda"),
    DropdownMenuItem(child: Text("Ukraine"), value: "Ukraine"),
    DropdownMenuItem(
        child: Text("United Arab Emirates"), value: "United Arab Emirates"),
    DropdownMenuItem(child: Text("United Kingdom"), value: "United Kingdom"),
    DropdownMenuItem(child: Text("Uruguay"), value: "Uruguay"),
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("Uzbekistan"), value: "Uzbekistan"),
    DropdownMenuItem(child: Text("Venezuela"), value: "Venezuela"),
    DropdownMenuItem(child: Text("Vietnam"), value: "Vietnam"),
    DropdownMenuItem(child: Text("Yemen"), value: "Yemen"),
    DropdownMenuItem(child: Text("Yugoslavia"), value: "Yugoslavia"),
    DropdownMenuItem(child: Text("Zambia"), value: "Zambia"),
    DropdownMenuItem(child: Text("Zimbabwe"), value: "Zimbabwe"),
    DropdownMenuItem(child: Text("Other"), value: "Other"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get rasiDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("Mesh"), value: "Mesh"),
    DropdownMenuItem(child: Text("Vrushabh"), value: "Vrushabh"),
    DropdownMenuItem(child: Text("Mithun"), value: "Mithun"),
    DropdownMenuItem(child: Text("Karka"), value: "Karka"),
    DropdownMenuItem(child: Text("Sinha"), value: "Sinha"),
    DropdownMenuItem(child: Text("Kanya"), value: "Kanya"),
    DropdownMenuItem(child: Text("Tula"), value: "Tula"),
    DropdownMenuItem(child: Text("Vruschika"), value: "Vruschika"),
    DropdownMenuItem(child: Text("Dhanu"), value: "Dhanu"),
    DropdownMenuItem(child: Text("Makar"), value: "Makar"),
    DropdownMenuItem(child: Text("Kumbh"), value: "Kumbh"),
    DropdownMenuItem(child: Text("Meen"), value: "Meen"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get nakshatraDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("Ashwini"), value: "Ashwini"),
    DropdownMenuItem(child: Text("Bharni"), value: "Bharni"),
    DropdownMenuItem(child: Text("Krutica"), value: "Krutica"),
    DropdownMenuItem(child: Text("Rohini"), value: "Rohini"),
    DropdownMenuItem(child: Text("Mruga"), value: "Mruga"),
    DropdownMenuItem(child: Text("Anuradha"), value: "Anuradha"),
    DropdownMenuItem(child: Text("Arudra"), value: "Arudra"),
    DropdownMenuItem(child: Text("Punarvase"), value: "Punarvase"),
    DropdownMenuItem(child: Text("Pushya"), value: "Pushya"),
    DropdownMenuItem(child: Text("Ashlesha"), value: "Ashlesha"),
    DropdownMenuItem(child: Text("Uthra Phalguni"), value: "Uthra Phalguni"),
    DropdownMenuItem(child: Text("Hast"), value: "Hast"),
    DropdownMenuItem(child: Text("Chitra"), value: "Chitra"),
    DropdownMenuItem(child: Text("Swati"), value: "Swati"),
    DropdownMenuItem(child: Text("Vishaka"), value: "Vishaka"),
    DropdownMenuItem(child: Text("Dhanishta"), value: "Dhanishta"),
    DropdownMenuItem(child: Text("Jyeshta"), value: "Jyeshta"),
    DropdownMenuItem(child: Text("Mool"), value: "Mool"),
    DropdownMenuItem(child: Text("Magha"), value: "Magha"),
    DropdownMenuItem(child: Text("Poorvashada"), value: "Poorvashada"),
    DropdownMenuItem(child: Text("Uthrashada"), value: "Uthrashada"),
    DropdownMenuItem(child: Text("Sharvan"), value: "Sharvan"),
    DropdownMenuItem(child: Text("Purva Badrapada"), value: "Purva Badrapadha"),
    DropdownMenuItem(child: Text("Purvaphalguni"), value: "Purvaphalguni"),
    DropdownMenuItem(child: Text("Uthra Badrapada"), value: "Uthra Badrapada"),
    DropdownMenuItem(child: Text("Revthi"), value: "Revthi"),
    DropdownMenuItem(child: Text("Shat Taraka"), value: "Shat Taraka"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get charanDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("1"), value: "1"),
    DropdownMenuItem(child: Text("2"), value: "2"),
    DropdownMenuItem(child: Text("3"), value: "3"),
    DropdownMenuItem(child: Text("4"), value: "4"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get nadiDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("Adhya"), value: "Adhya"),
    DropdownMenuItem(child: Text("Madhya"), value: "Madhya"),
    DropdownMenuItem(child: Text("Antya"), value: "Antya"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get ganDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("Dev"), value: "Dev"),
    DropdownMenuItem(child: Text("Manushya"), value: "Manushya"),
    DropdownMenuItem(child: Text("Rakshas"), value: "Rakshas"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get bloodDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Not Applicable"), value: "Not Applicable"),
    DropdownMenuItem(child: Text("A+"), value: "A+"),
    DropdownMenuItem(child: Text("A-"), value: "A-"),
    DropdownMenuItem(child: Text("AB+"), value: "AB+"),
    DropdownMenuItem(child: Text("AB-"), value: "AB-"),
    DropdownMenuItem(child: Text("B+"), value: "B+"),
    DropdownMenuItem(child: Text("B-"), value: "B-"),
    DropdownMenuItem(child: Text("O+"), value: "O+"),
    DropdownMenuItem(child: Text("O-"), value: "O-"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get bodyDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Please select"), value: "Please select"),
    DropdownMenuItem(child: Text("Slim"), value: "Slim"),
    DropdownMenuItem(child: Text("Average"), value: "Average"),
    DropdownMenuItem(child: Text("Athletic"), value: "Athletic"),
    DropdownMenuItem(child: Text("Heavy"), value: "Heavy"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get spectaclesDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    DropdownMenuItem(child: Text("No"), value: "No"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get smokeDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    DropdownMenuItem(child: Text("No"), value: "No"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get drinkDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    DropdownMenuItem(child: Text("No"), value: "No"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get phyDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    DropdownMenuItem(child: Text("No"), value: "No"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get marrySubcasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    DropdownMenuItem(child: Text("No"), value: "No"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get marryCasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    DropdownMenuItem(child: Text("No"), value: "No"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get marryIntercasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    DropdownMenuItem(child: Text("No"), value: "No"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get divorcedDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    DropdownMenuItem(child: Text("No"), value: "No"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get complexionDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Please select"), value: "Please select"),
    DropdownMenuItem(child: Text("Very Fair"), value: "Very Fair"),
    DropdownMenuItem(child: Text("Fair"), value: "Fair"),
    DropdownMenuItem(child: Text("Wheatish"), value: "Wheatish"),
    DropdownMenuItem(child: Text("Wheatish Brown"), value: "Wheatish Brown"),
    DropdownMenuItem(child: Text("Dark"), value: "Dark"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dietDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Please select"), value: "Please select"),
    DropdownMenuItem(child: Text("Vegitarian"), value: "Vegitarian"),
    DropdownMenuItem(child: Text("Non-vegitarian"), value: "Non-vegitarian"),
  ];
  return menuItems;
}

var apiKey = 'AIzaSyDM19z6XKAX3-bodbHGsie0ypMmKwAamts';
var appId = '1:943598611591:android:b390352f441a135aec1c22';
var messagingSenderId = '943598611591';
var projectId = 'veershaiv-lingayat';
var storageBucket = 'veershaiv-lingayat.appspot.com';

var READMODE = 'read';
var EDITMODE = 'edit';
