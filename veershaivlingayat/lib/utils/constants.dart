import 'package:flutter/material.dart';

var appColor = 0xFFCA0000;

var menuSubOptions = [
  'Search Profiles',
  'Interest Sent/Received',
  'Shortlisted/Blocked',
  'Melawa Information',
  'Gunmilan'
];

List<DropdownMenuItem<String>> get casteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("All"), value: "All"),
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

List<DropdownMenuItem<String>> get subcastesOfLadWani {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("All"), value: "All"),
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

List<DropdownMenuItem<String>> get urgencyDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text(" "), value: " "),
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

List<DropdownMenuItem<String>> get maritalDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("NA"), value: "NA"),
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
    DropdownMenuItem(child: Text("NA"), value: "NA"),
    DropdownMenuItem(child: Text("Manglik"), value: "Manglik"),
    DropdownMenuItem(child: Text("NonManglik"), value: "NonManglik"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get rCasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("NA"), value: "NA"),
    DropdownMenuItem(child: Text("No"), value: "No"),
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get rSubcasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("NA"), value: "NA"),
    DropdownMenuItem(child: Text("No"), value: "No"),
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get intercasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("NA"), value: "NA"),
    DropdownMenuItem(child: Text("No"), value: "No"),
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get rIntercasteDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("NA"), value: "NA"),
    DropdownMenuItem(child: Text("No"), value: "No"),
    DropdownMenuItem(child: Text("Yes"), value: "Yes"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get tongueDropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text(" "), value: " "),
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

var apiKey = 'AIzaSyDM19z6XKAX3-bodbHGsie0ypMmKwAamts';
var appId = '1:943598611591:android:b390352f441a135aec1c22';
var messagingSenderId = '943598611591';
var projectId = 'veershaiv-lingayat';
var storageBucket = 'veershaiv-lingayat.appspot.com';
