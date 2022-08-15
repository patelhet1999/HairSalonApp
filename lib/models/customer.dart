class Customer{
  int? customer_id;
  String? customer_full_name;
  String? customer_phone_number;
  String? customer_address;
  String? customer_city;
  String? customer_pincode;
  String? customer_profile_picture;

  // Constructor
  Customer.fromMap(Map<dynamic, dynamic> map){
    customer_id = int.parse(map['user_details']['customer_id']);
    customer_full_name = map['user_details']['customer_full_name'];
    customer_phone_number = map['user_details']['customer_phone_number'];
    customer_address = map['user_details']['customer_address'];
    customer_city = map['user_details']['customer_city'];
    customer_pincode = map['user_details']['customer_pincode'];
    customer_profile_picture = map['user_details']['customer_profile_picture'];
  }

}