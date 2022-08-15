import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hair_salon_application/models/customer.dart';
import 'package:hair_salon_application/screens/men_women_selection_screen.dart';
import 'package:hair_salon_application/server_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UserDetailsScreen extends StatefulWidget {

  String customerPhoneNumber;
  UserDetailsScreen({Key? key, required this.customerPhoneNumber, }) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {


  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _pincodeController;
  XFile? imageTemporary;
  File? file;
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController(text: widget.customerPhoneNumber);
    _addressController = TextEditingController();
    _cityController = TextEditingController();
    _pincodeController = TextEditingController();
  }

  @override
  void dispose(){
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  Future pickImage(ImageSource imageSource) async{

    try{
      imageTemporary = await ImagePicker().pickImage(source: imageSource);
      file = File(imageTemporary!.path);

      setState(() {

      });
    }
    catch(e){

    }
  }

  Future uploadCustomerImage(file,url) async{

    var request = http.MultipartRequest("POST",Uri.parse(url));

    request.fields['customer_phone_number'] = _phoneNumberController.text;
    request.files.add(await http.MultipartFile.fromPath('customer_profile_picture', file.path));

    var response = request.send().then((value) => print("value"));

  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true? Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Text(""),
        backgroundColor: Colors.white,
        title: Text("Enter Your Details", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
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
                        child: imageTemporary == null? Image.asset('assets/images/men.jpg',fit: BoxFit.cover,) : Image.file(file!, fit: BoxFit.cover,),
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
                          controller: _fullNameController,
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
                          controller: _phoneNumberController,
                          readOnly: true,
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
                          controller: _addressController,
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
                          controller: _cityController,
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
                          controller: _pincodeController,
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
                  setState(() {
                    isLoading = false;
                  });
                  await ServerHandler().registerTheNewcustomer(_fullNameController.text, _phoneNumberController.text, _addressController.text, _cityController.text, _pincodeController.text).then(
                      (value){
                        if(value){
                          Fluttertoast.showToast(
                            msg: "Register Sucessfully",
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black12,
                            textColor: Colors.black,
                          );
                        }
                      });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MenWomenSelectionScreen(),));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Register"),
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
