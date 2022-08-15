import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hair_salon_application/server_handler.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../models/customer.dart';

class EditProfileScreen extends StatefulWidget {
  bool isMale;

  EditProfileScreen({Key? key, required this.isMale,}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  String customer_profile_picture = "";
  String customer_full_name = "";
  String customer_phone_number = "";
  String customer_address = "";
  String customer_city = "";
  String customer_pincode = "";
  bool isLoading = false;
  XFile? imageTemporary;
  File? file;
  late FirebaseAuth _auth;
  late User? _user;
  bool isFirstExecution = true;
  late Customer customer;
  bool isImageUpload = false;

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    super.initState();
  }

  void getCustomerInformation(String? phoneNumber) async{
    setState(() {
      isLoading = true;
    });
    customer = await ServerHandler().getTheUserInformation(phoneNumber);
    setState(() {
      isLoading = false;
    });
  }

  Future pickImage(ImageSource imageSource) async{
    try{

      imageTemporary = await ImagePicker().pickImage(source: imageSource);
      file = File(imageTemporary!.path);
      setState(() {

      });

    }
    catch(e){
      print(e.toString());
    }
  }

  Future uploadCustomerImage(file, url) async{

    var request = http.MultipartRequest("POST", Uri.parse(url));

    request.fields['customer_phone_number'] = "${_user!.phoneNumber}";

    request.files.add(await http.MultipartFile.fromPath('customer_profile_picture', file.path));

    var response = await request.send().then((value) => print(value));

  }

  @override
  Widget build(BuildContext context) {

    if(isFirstExecution){
      getCustomerInformation(_user!.phoneNumber);
      isFirstExecution = false;
    }

    return isLoading == true ? Scaffold(body: Center(child: CircularProgressIndicator(),),) : Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector( onTap: (){Navigator.of(context).pop();},child: Icon(Icons.arrow_back, color: Colors.black,size: 28)),
        backgroundColor: Colors.white,
        title: Text("Edit Profile",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 35,bottom: 45,left: 15,right: 15),
                  child: GestureDetector(
                    onTap: (){
                      pickImage(ImageSource.gallery);
                    },
                    child: ClipOval(
                      child: Container(
                        height: 130,
                        width: 130,
                        child: customer.customer_profile_picture == "" ? imageTemporary == null? Image.asset('assets/images/men.jpg',fit: BoxFit.cover,) : Image.file(file!, fit: BoxFit.cover,) : Image.network("https://192.168.125.103/hairsalon/assets/${customer.customer_profile_picture}", fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  child: Text("CONTACT", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black54),),
                ),
              ],
            ),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15,top: 20, bottom: 8),
                      child: Text("Full Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:  Color.fromRGBO(232, 241, 250, 1),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: 362,
                      height: 50,
                      padding: EdgeInsets.only(left: 15,right: 15,),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        child: TextField(
                          onChanged: (value){
                              this.customer_full_name = value;
                          },
                          controller: TextEditingController(text: "${customer.customer_full_name}"),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15,top: 20, bottom: 8),
                      child: Text("Phone Number", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:  Color.fromRGBO(232, 241, 250, 1),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: 362,
                      height: 50,
                      padding: EdgeInsets.only(left: 15,right: 15,),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        child: TextField(
                          onChanged: (value){
                              this.customer_phone_number = value;
                          },
                          readOnly: true,
                          controller: TextEditingController(text: "${customer.customer_phone_number}"),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15,top: 30),
                  child: Text("ADDRESS", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black54),),
                ),
              ],
            ),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15,top: 20, bottom: 8),
                      child: Text("Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:  Color.fromRGBO(232, 241, 250, 1),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: 362,
                      height: 50,
                      padding: EdgeInsets.only(left: 15,right: 15,),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        child: TextField(
                          onChanged: (value){
                              this.customer_address = value;
                          },
                          controller: TextEditingController(text: "${customer.customer_address}"),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15,top: 20, bottom: 8),
                      child: Text("City", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:  Color.fromRGBO(232, 241, 250, 1),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: 362,
                      height: 50,
                      padding: EdgeInsets.only(left: 15,right: 15,),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        child: TextField(
                          onChanged: (value){
                              this.customer_city = value;
                          },
                          controller: TextEditingController(text: "${customer.customer_city}"),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15,top: 20, bottom: 8),
                      child: Text("Pincode", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:  Color.fromRGBO(232, 241, 250, 1),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: 362,
                      height: 50,
                      padding: EdgeInsets.only(left: 15,right: 15,),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        child: TextField(
                          onChanged: (value){
                              this.customer_pincode = value;
                          },
                          controller: TextEditingController(text: "${customer.customer_pincode}"),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Container(
              width: 362,
              height: 50,
              margin: EdgeInsets.only(top: 30,),
              decoration: BoxDecoration(
                gradient:  LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Color.fromARGB(255, 62, 182, 226)
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent) ,
                ),
                onPressed: () async{
                  setState(() {
                    isLoading = true;
                  });
                  var url = "https://192.168.125.103/hairsalon/api/customer/upload_profile_pic";
                  await uploadCustomerImage(file,url);
                 bool isSuccess = await ServerHandler().updateTheUserProfile(customer_full_name, customer_phone_number, customer_address, customer_city, customer_pincode);
                 getCustomerInformation(_user!.phoneNumber);
                 setState(() {
                   isLoading = false;
                 });
                 if(isSuccess){
                  Fluttertoast.showToast(
                    msg: "Updated Sucessfully",
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black12,
                    textColor: Colors.black,
                  );
                 }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Update Profile")
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
