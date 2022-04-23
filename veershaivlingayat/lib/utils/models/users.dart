class ProfileUser {
  final String name;
  final BirthDetails birth_details;
  final String blood_group;
  final String body_type;
  final String caste;
  final String charan;
  final String complexion;
  final String education_level;
  final String education_qualification;
  final String employment_history;
  final String gender;
  final String income;
  final DateTime last_visited_timestamp;
  final LocationDetails location_details;
  final bool manglik;
  final String marital_status;
  final String nakshatra;
  final String occupation;
  final MatchDetails match_details;
  final PersonalDetails personal_details;
  final List<String> photos;
  final String rasi;
  final DateTime registered_date;
  final String relative_information;
  final String subcaste;
  final String work_city;

  ProfileUser(
      String name,
      BirthDetails birth_details,
      String blood_group,
      String body_type,
      String caste,
      String charan,
      String complexion,
      String education_level,
      String education_qualification,
      String employment_history,
      String gender,
      String income,
      DateTime last_visited_timestamp,
      LocationDetails location_details,
      MatchDetails match_details,
      PersonalDetails personal_details,
      bool manglik,
      String marital_status,
      String nakshatra,
      String occupation,
      List<String> photos,
      String rasi,
      DateTime registered_date,
      String relative_information,
      String subcaste,
      String work_city)
      : this.name = name,
        this.birth_details = birth_details,
        this.blood_group = blood_group,
        this.body_type = body_type,
        this.caste = caste,
        this.charan = charan,
        this.complexion = complexion,
        this.education_level = education_level,
        this.education_qualification = education_qualification,
        this.employment_history = employment_history,
        this.gender = gender,
        this.income = income,
        this.last_visited_timestamp = last_visited_timestamp,
        this.location_details = location_details,
        this.match_details = match_details,
        this.personal_details = personal_details,
        this.manglik = manglik,
        this.marital_status = marital_status,
        this.nakshatra = nakshatra,
        this.occupation = occupation,
        this.photos = photos,
        this.rasi = rasi,
        this.registered_date = registered_date,
        this.relative_information = relative_information,
        this.subcaste = subcaste,
        this.work_city = work_city;
}

// **************************************MINI OBJECTS********************************************
// MATCH DETAILS
class MatchDetails {
  final bool marry_divorced;
  final bool marry_outside_caste;
  final bool marry_outside_subcaste;
  final String match_education;
  final String match_education_qualification;
  final bool match_manglik;
  final String match_occupation;
  final String match_special_characteristics;

  MatchDetails(
      bool marry_divorced,
      bool marry_outside_caste,
      bool marry_outside_subcaste,
      String match_education,
      String match_education_qualification,
      bool match_maglik,
      String match_occupation,
      String match_special_characteristics)
      : this.marry_divorced = marry_divorced,
        this.marry_outside_caste = marry_outside_caste,
        this.marry_outside_subcaste = marry_outside_subcaste,
        this.match_education = match_education,
        this.match_education_qualification = match_education_qualification,
        this.match_manglik = match_maglik,
        this.match_occupation = match_occupation,
        this.match_special_characteristics = match_special_characteristics;
}

// PERSONAL DETAILS
class PersonalDetails {
  final bool drink;
  final bool smoke;
  final int height;
  final int weight;
  PersonalDetails(bool drink, bool smoke, int height, int weight)
      : this.drink = drink,
        this.smoke = smoke,
        this.height = height,
        this.weight = weight;
}

// LOCATION DETAILS
class LocationDetails {
  final String contact_city;
  final String contact_country;
  final String contact_email;
  final String contact_phone;
  final String contact_state;
  final String permanent_address;

  LocationDetails(
      String contact_city,
      String contact_country,
      String contact_email,
      String contact_phone,
      String contact_state,
      String permanent_address)
      : this.contact_city = contact_city,
        this.contact_country = contact_country,
        this.contact_email = contact_email,
        this.contact_phone = contact_phone,
        this.contact_state = contact_state,
        this.permanent_address = permanent_address;
}

// BIRTH DETAILS
class BirthDetails {
  final String birth_city;
  final String birth_country;
  final String birth_state;
  final DateTime birth_date_time;

  BirthDetails(String birth_city, String birth_country, String birth_state,
      DateTime birth_date_time)
      : this.birth_city = birth_city,
        this.birth_country = birth_country,
        this.birth_state = birth_state,
        this.birth_date_time = birth_date_time;
}
