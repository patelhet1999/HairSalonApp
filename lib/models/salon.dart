class Salon{
  int? salon_id;
  String? salon_name;
  String? salon_address;
  String? salon_monday_working_hours;
  String? salon_tuesday_working_hours;
  String? salon_wednesday_working_hours;
  String? salon_thursday_working_hours;
  String? salon_friday_working_hours;
  String? salon_saturday_working_hours;
  String? salon_sunday_working_hours;
  String? salon_phone_number;
  String? salon_website;
  String? salon_gender;
  String? salon_about_us;
  String? salon_picture;
  int? salon_interaction;

  // Constructor
  Salon.fromMap(Map<dynamic, dynamic> map){
    salon_id = int.parse(map['salon_id']);
    salon_name = map['salon_name'];
    salon_address = map['salon_address'];
    salon_monday_working_hours = map['salon_monday_working_hours'];
    salon_tuesday_working_hours = map['salon_tuesday_working_hours'];
    salon_wednesday_working_hours= map['salon_wednesday_working_hours'];
    salon_thursday_working_hours = map['salon_thursday_working_hours'];
    salon_friday_working_hours = map['salon_friday_working_hours'];
    salon_saturday_working_hours = map['salon_saturday_working_hours'];
    salon_sunday_working_hours = map['salon_sunday_working_hours'];
    salon_phone_number = map['salon_phone_number'];
    salon_website = map['salon_website'];
    salon_gender = map['salon_gender'];
    salon_about_us = map['salon_about_us'];
    salon_picture = map['salon_picture'];
    salon_interaction = int.parse(map['salon_interaction']);;
  }

}