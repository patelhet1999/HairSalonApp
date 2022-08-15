import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hair_salon_application/models/customer.dart';
import 'package:hair_salon_application/models/salon.dart';
import 'package:http/http.dart' as http;



class ServerHandler{

  final String _baseUrl = "https://192.168.125.103/hairsalon/api";

  // Checking whether the phone number is unique or not
  Future<bool> checkPhoneNumberUniqueOrNot(String phoneNumber) async{

    try{
      http.Response response = await http.post(Uri.parse('$_baseUrl/customer/check_unique_phone_number'), body: {'customer_phone_number' : phoneNumber});

      Map<dynamic, dynamic> map = json.decode(response.body);

      if(map['success'] == 1){
        return true;
      }
      else{
        return false;
      }

    }
    catch(e){
      print(e.toString());
      rethrow;
    }
  }

  // Register the new user
  Future<bool> registerTheNewcustomer(String customer_full_name, String customer_phone_number, String customer_address, String customer_city, String customer_pincode) async{
    try{
      http.Response response = await http.post(Uri.parse('$_baseUrl/customer/register_customer'), body: {'customer_full_name': customer_full_name, 'customer_phone_number': customer_phone_number, 'customer_address': customer_address, 'customer_city': customer_city, 'customer_pincode': customer_pincode});
      print(response.body);

      Map<dynamic, dynamic> map = json.decode(response.body);

      if(map['success'] == 1){
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e.toString());
      rethrow;
    }
  }

  // Get the user information using phone number
  Future<Customer> getTheUserInformation(String? phoneNumber) async{

    try{

      http.Response response = await http.post(Uri.parse('$_baseUrl/customer/get_user_all_info'),body: {'customer_phone_number': phoneNumber});

      Map<dynamic, dynamic> map = json.decode(response.body);

      Customer customer = Customer.fromMap(map);

      return customer;
    }
    catch(e){
      print("Server Handler Error : ${e}");
      rethrow;
    }
  }

  // Update user profile
  Future<bool> updateTheUserProfile(String customerFullName, String customerPhoneNumber, String customerAddress, String customerCity, String customerPincode,) async{
    
    try{
      
      http.Response response = await http.post(Uri.parse('$_baseUrl/customer/update_user_profile'),body: {'customer_full_name': customerFullName, 'customer_phone_number': customerPhoneNumber, 'customer_address': customerAddress, 'customer_city': customerCity, 'customer_pincode': customerPincode,});

      Map<dynamic, dynamic> map = json.decode(response.body);

      if(map['success'] == 1){
        return true;
      }
      else{
        return false;
      }
      
    }
    catch(e){
      print("Server Handler Error : ${e}");
      rethrow;
    }
    
    
  }


  Future getPopularSalons() async{
    try{
      List<Salon> salons = [];

      http.Response response = await http.post(Uri.parse('$_baseUrl/salon/find_popular_salons'));

      print(response.body);
      // print(json.decode(response.body)['salon_details'][0]);

      List salonList = (json.decode(response.body))['salon_details'];
      print(salonList.toString());
      for(Map m in salonList){
        salons.add(Salon.fromMap(m));
      }

      return salons;
    }
    catch(e){
      print('Server Handler Error' + e.toString());
      rethrow;
    }
  }

}