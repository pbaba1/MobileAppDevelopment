// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

ProfileUser userFromJson(String str) {
  final jsonData = json.decode(str);
  return ProfileUser.fromMap(jsonData);
}

String userToJson(ProfileUser data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class ProfileUser {
  int id;
  String name;
  String birth_city;
  String birth_country;
  String birth_state;
  DateTime birth_date_time;
  String blood_group;
  String body_type;
  String caste;
  String charan;
  String complexion;
  String education_level;
  String education_qualification;
  String employment_history;
  String gender;
  String income;
  DateTime last_visited_timestamp;
  String contact_city;
  String contact_country;
  String contact_email;
  String contact_phone;
  String contact_state;
  String permanent_address;
  bool manglik;
  String marital_status;
  String nakshatra;
  String occupation;
  bool marry_divorced;
  bool marry_outside_caste;
  bool marry_outside_subcaste;
  String match_education;
  String match_education_qualification;
  bool match_manglik;
  String match_occupation;
  String match_special_characteristics;
  bool drink;
  bool smoke;
  int height;
  int weight;
  List<String> photos;
  String rasi;
  DateTime registered_date;
  String relative_information;
  String subcaste;
  String work_city;

  ProfileUser(
      {required this.id,
      required this.name,
      required this.birth_city,
      required this.birth_country,
      required this.birth_state,
      required this.birth_date_time,
      required this.blood_group,
      required this.body_type,
      required this.caste,
      required this.charan,
      required this.complexion,
      required this.education_level,
      required this.education_qualification,
      required this.employment_history,
      required this.gender,
      required this.income,
      required this.last_visited_timestamp,
      required this.contact_city,
      required this.contact_country,
      required this.contact_email,
      required this.contact_phone,
      required this.contact_state,
      required this.permanent_address,
      required this.marry_divorced,
      required this.marry_outside_caste,
      required this.marry_outside_subcaste,
      required this.match_education,
      required this.match_education_qualification,
      required this.match_manglik,
      required this.match_occupation,
      required this.match_special_characteristics,
      required this.drink,
      required this.smoke,
      required this.height,
      required this.weight,
      required this.manglik,
      required this.marital_status,
      required this.nakshatra,
      required this.occupation,
      required this.photos,
      required this.rasi,
      required this.registered_date,
      required this.relative_information,
      required this.subcaste,
      required this.work_city});

  factory ProfileUser.fromMap(Map<String, dynamic> json) => ProfileUser(
      id: json['id'],
      name: json['name'],
      birth_city: json['birth_city'],
      birth_country: json['birth_country'],
      birth_state: json['birth_state'],
      birth_date_time: json['birth_date_time'],
      blood_group: json['blood_group'],
      body_type: json['body_type'],
      caste: json['caste'],
      charan: json['charan'],
      complexion: json['complexion'],
      education_level: json['education_level'],
      education_qualification: json['education_qualification'],
      employment_history: json['employment_history'],
      gender: json['gender'],
      income: json['income'],
      last_visited_timestamp: json['last_visited_timestamp'],
      contact_city: json['contact_city'],
      contact_country: json['contact_country'],
      contact_email: json['contact_email'],
      contact_phone: json['contact_phone'],
      contact_state: json['contact_state'],
      permanent_address: json['permanent_address'],
      marry_divorced: json['marry_divorced'],
      marry_outside_caste: json['marry_outside_caste'],
      marry_outside_subcaste: json['marry_outside_subcaste'],
      match_education: json['match_education'],
      match_education_qualification: json['match_education_qualification'],
      match_manglik: json['match_manglik'],
      match_occupation: json['match_occupation'],
      match_special_characteristics: json['match_special_characteristics'],
      drink: json['drink'],
      smoke: json['smoke'],
      height: json['height'],
      weight: json['weight'],
      manglik: json['manglik'],
      marital_status: json['marital_status'],
      nakshatra: json['nakshatra'],
      occupation: json['occupation'],
      photos: json['photos'],
      rasi: json['rasi'],
      registered_date: json['registered_date'],
      relative_information: json['relative_information'],
      subcaste: json['subcaste'],
      work_city: json['work_city']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "birth_city": birth_city,
        "birth_country": birth_country,
        "birth_state": birth_state,
        "birth_date_time": birth_date_time,
        "blood_group": blood_group,
        "body_type": body_type,
        "caste": caste,
        "charan": charan,
        "complexion": complexion,
        "education_level": education_level,
        "education_qualification": education_qualification,
        "employment_history": employment_history,
        "gender": gender,
        "income": income,
        "last_visited_timestamp": last_visited_timestamp,
        "contact_city": contact_city,
        "contact_country": contact_country,
        "contact_email": contact_email,
        "contact_phone": contact_phone,
        "contact_state": contact_state,
        "permanent_address": permanent_address,
        "marry_divorced": marry_divorced,
        "marry_outside_caste": marry_outside_caste,
        "marry_outside_subcaste": marry_outside_subcaste,
        "match_education": match_education,
        "match_education_qualification": match_education_qualification,
        "match_manglik": match_manglik,
        "match_occupation": match_occupation,
        "match_special_characteristics": match_special_characteristics,
        "drink": drink,
        "smoke": smoke,
        "height": height,
        "weight": weight,
        "manglik": manglik,
        "marital_status": marital_status,
        "nakshatra": nakshatra,
        "occupation": occupation,
        "photos": photos,
        "rasi": rasi,
        "registered_date": registered_date,
        "relative_information": relative_information,
        "subcaste": subcaste,
        "work_city": work_city
      };
}
